# Github Snippets

## Create New Repo
```
echo “#test2">>README.md
git init
git add .
git commit -m "first commit"
git remote add origin https://github.com/jrchintu/repo_name.git
git remote -v
git push -u origin master
```

## ssh
```
ssh-keygen -o -a 100 -t ed25519 -N '' -f ~/.ssh/id_ed25519 <<< y
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
ssh -T git@github.com
```

## Push Commit
```
git checkout corvus-a11 # change branch
git fetch
git add -p
git commit -m "<message>" 
git push
```

## Cherry-Pick
- From public repo
`git cherry-pick -x <commit-hash>`

- From-To
`git notes copy <from>..^<to>`

- Merge
`git cherry-pick -m 1 <merge_hash>`

#### NOTE 
- You may need to fix problems in code
- <***> This means put commit hash here without symbols 

## Merge tags
```
git fetch https://source.codeaurora.org/quic/la/platform/hardware/qcom/display/ LA.UM.9.6.2.r1-03800-89xx.0
git merge FETCH_HEAD
git add .
git commit && git push
```

## Delete branch
// delete branch locally
`git branch -d localBranchName`

// delete branch remotely
`git push origin --delete remoteBranchName`

## Git revert
git revert --no-commit HEAD~3.. #3 is no.of old head commits

## Sparse Checkout (clone single folder)
- 1. Copy an empty repo
```
git clone --no-checkout https://github.com/supabase/supabase
```
- 2. Move into the empty repo
```
cd supabase
```
- 3. Initialize sparse-checkout
```
git sparse-checkout init --cone
```
- 4. Checkout the folder
```
git sparse-checkout set examples/slack-clone-basic
```

## Git Extended Log

- --format='%ai %an <%ae> %h %f'
- %ai: author date
- %an: author name
- %ae: author email
- %h: commit hash (small)
- %f: commit subject (sanitized)

```
git log --branches --tags --remotes --full-history --date-order --format='%ai %an <%ae> %h %f'
```
## COnvert bare to normal repo
```
mkdir .git
mv {HEAD,info,packed-refs,refs,objects,config} .git
git config --local --bool core.bare false
git config --local http.postBuffer 524288000 #FORFASTSPEED
git config remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*'
git checkout msm8953_baseline
git reset --hard
```
