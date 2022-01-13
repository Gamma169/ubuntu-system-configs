# Windows Learnings

## Custom Commands

1. Create a new `/bin` folder in your home folder
2. Add the `/bin` to the path
    - https://docs.oracle.com/en/database/oracle/machine-learning/oml4r/1.5.1/oread/creating-and-modifying-environment-variables-on-windows.html#GUID-DD6F9982-60D5-48F6-8270-A27EC53807D0
    - right-click windows-> system
    - Related settings -> Advanced System Settings
    - Update User PATH with bin folder
    - Click Ok
3. Add file to `/bin` folder ending in `.cmd`


### Inline Windows Env Var Command

I was having difficulties with some stuff not picking up inline env vars.  I could do it in two steps `set ENV_VAR=var` and then command, but I don't want to do that.  Would like one command.

I found this online, and using the above way to create a custom command, created the `env` command.
https://superuser.com/a/1079369

`env.cmd`:
```
echo off
setlocal
for %%f in (%*) do (
  echo %%f|find "=" >nul:
  if errorlevel 1 goto DoCmd
  set %%f
  shift
)
:DoCmd
%1 %2 %3 %4 %5 %6 %7 %8 %9
endlocal
```

#### Usage

`env "EDITOR=vim" command [up to 8 parameters]`
