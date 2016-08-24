This is simplest, easy  vim plugin to rsync directory.
Put .sync file to the root of the directory, 
and vim will automatically sync your project with remote host.

Depends on 
Plugin 'rosenfeld/conque-term'          " Consoles as buffers

.sync example:
REMOTE_HOST=test
REMOTE_BASE_DIR=/home/<username>

Hope you configure ssh settings of host via .ssh/config.

<F5> - Toggle bash
<F6> - Toggle remote bash
<F7> - Sync project

So, just 
* Develop the project
* Add .sync with credentials
* Press <F7> to sync th project
* Press <F6> to get a bash on remote server and execute script

