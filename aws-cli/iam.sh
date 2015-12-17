#! /bin/bash
#set -x
location=`pwd`
function create_group()
{
 aws iam create-group --group-name $group  2>> awslog.txt
    if [[ $? == 0 ]]; 
        then
        echo "group created successfully"
        create_user
    else
        echo "error while creating the group, check log file"
        exit 1
    fi 
}
function create_user()
{
 aws iam create-user --user-name $user 2>>  awslog.txt 
   if [[ $? == 0 ]]; 
        then
        echo "user created successfully"
        add_user_group
    else
        echo "error while creating the user, check log file"
        exit 1
    fi 
}
function add_user_group()
{
 aws iam add-user-to-group --user-name $user --group-name $group 2>> awslog.txt
   if [[ $? == 0 ]]; 
        then
        echo "added user successfully"
        exit 0
    else
        echo "error while adding the user, check log file"
        exit 1
    fi  
}
function policy()
{
    aws iam put-user-policy --user-name user --policy-name $user --policy-document file://$file 2>> awslog.txt
    aws iam put-user-policy --user-name user --policy-name $user --policy-document file://$file1 2>> awslog.txt
    aws iam list-user-policies --user-name $user 2>> awslog.txt
    if [[ $? == 0 ]]; 
        then
        echo "policy applied successfully"
        user_password
    else
        echo "error while applying policy, check log file"
        exit 1
    fi 
}
function user_password()
{
    aws iam create-login-profile --user-name user --password $passwd 2>> awslog.txt
    if [[ $? == 0 ]]; 
        then
        echo "password applied successfully"       
    else
        echo "error while applying password, check log file"
        exit 1
    fi 
}

function main()
{
read -p "Create a new group, enter group-name:" group
read -p "Enter the username to add in $group :" user
read -s -p "Assign password to $user:" passwd
read -p "Enter the absolute path of RDS policy file:" file
read -p "Enter the absolute path of BEANStack policy file:" file1
create_group
}
main
