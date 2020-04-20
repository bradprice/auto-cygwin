# AUTO Cygwin

This powershelll script will install the [Cygwin](https://www.cygwin.com/) tools

## Windows Execution Policy

PowerShell execution policy values are as follows:

* **AllSigned**. Requires that all scripts and configuration files are signed by a trusted publisher, including scripts written on the local computer.
* **Bypass**. Nothing is blocked and there are no warnings or prompts.
* **RemoteSigned**. Requires that all scripts and configuration files downloaded from the Internet are signed by a trusted publisher. The default execution policy for Windows server computers.
* **Restricted**. Doesn't load configuration files or run scripts. The default execution policy Windows client computers.
* **Undefined**. No execution policy is set for the scope. Removes an assigned execution policy from a scope that is not set by a Group Policy. If the execution policy in all scopes is Undefined, the effective execution policy is Restricted.
* **Unrestricted**. Beginning in PowerShell 6.0, this is the default execution policy for non-Windows computers and can't be changed. Loads all configuration files and runs all scripts. If you run an unsigned script that was downloaded from the internet, you're prompted for permission before it runs.

The defualt execution policy for Windows clients is set to **Restricted**.

To configure the execution policy to run PowerShell scripts set the execution policy to **RemoteSigned** with the following command.

```powershell
set-executionpolicy remotesigned
```
