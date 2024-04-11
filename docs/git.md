# Git branch descriptions

Add and show descriptions on Git branches
## Set description
`git branch --edit-description`

## Show for master
`git config branch.master.description`

## Make a script to show for all

```bash
width=4
for branch_name in $(git branch --format="%(refname:short)"); do
    lenght=${#branch_name}
    ((lenght > width)) && width=$lenght
done
for branch_name in $(git branch --format="%(refname:short)"); do
    description=$(git config branch.$branch_name.description)
	changed=$(git show -s --format=%cd --date=format:'%Y-%m-%d' $branch_name)
	printf "%-${width}s  %s  %s\n" "$branch_name" "$changed" "$description"
done
```
## Alias the script
https://git-scm.com/book/en/v2/Git-Basics-Git-Aliases

```bash
git config --global alias.br '!
width=4
for branch_name in $(git branch --format="%(refname:short)"); do
    lenght=${#branch_name}
    ((lenght > width)) && width=$lenght
done
for branch_name in $(git branch --format="%(refname:short)"); do
    description=$(git config branch.$branch_name.description)
	changed=$(git show -s --format=%cd --date=format:'%Y-%m-%d' $branch_name)
	printf "%-${width}s  %s  %s\n" "$branch_name" "$changed" "$description"
done'
```
## External script
`git config --global alias.br !some-file.sh`


