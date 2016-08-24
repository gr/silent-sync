This is simplest, easy  vim plugin to rsync directory.  
Put .sync file to the project root directory 
    
.sync example:  
REMOTE_HOST=test  
REMOTE_BASE_DIR=/home/&lt;username&gt;  
  
Hope you configure ssh settings of host via .ssh/config.  

Depends on  
Plugin 'rosenfeld/conque-term'          " Consoles as buffers  
  
&lt;F5&gt; - Toggle bash  
&lt;F6&gt; - Toggle remote bash  
&lt;F7&gt; - Sync project  
  
So, just   
* Develop the project  
* Add .sync with credentials to the project root
* Also add .gitignore file
* Press &lt;F7&gt; to sync the project  
* Press &lt;F6&gt; to get a bash on remote server and execute script  

