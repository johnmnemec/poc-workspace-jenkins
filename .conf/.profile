 # This is a sample zOS USS .profile for a DevOps POC (IBM)  ghav3 model v0.1
#    - Review and update based on the smp/e install paths 

# Path of the zdevops repo cloned in USS. 
   export ZDEVOPS_HOME=/u/ibmuser/zdevops            
   export zScripts=$ZDEVOPS_HOME/scripts    
   export ZDEVOPS_ARCH=jenkv1

   # this enables internal tracing of build variables usinf the groovy/EnVar script 
   export traceVars=true            # set to none to disable or null the var out with a cmt 
   


#Java 11
   export JAVA_HOME=/usr/lpp/java/java11/current_64   
   export PATH=$JAVA_HOME/bin

# Wazi-deploy  v3+  
    #ZOAU
    export ZOAU_HOME=/usr/lpp/IBM/zoautil    
    export PATH=$ZOAU_HOME/bin:$PATH
    export LIBPATH=$ZOAU_HOME/lib:$LIBPATH
    
    #Python 
    export PATH=/usr/lpp/IBM/cyp/v3r11/pyz/bin:$PATH
    export LIBPATH=/usr/lpp/IBM/cyp/v3r11/pyz/lib:$LIBPATH
   
# DBB  v3+ 
    export DBB_HOME=/u/ibmuser/dbbv3       # This is a test path. Chg to your installation path
    export DBB_CONF=$ZDEVOPS_HOME/conf/build
    export DBB_BUILD=$ZDEVOPS_HOME/conf/build

    export PATH=$DBB_HOME/bin:$PATH    
    export LIBPATH=$LIBPATH:$DBB_HOME/lib    

    # classpath for dbb/zbuilder simpleLogger (..)
    export ZDEVOPS_DBB_SIMPLELOGGER=$ZDEVOPS_HOME/conf/build/logging                                              
    export CLASSPATH=$ZDEVOPS_HOME/build/logging:$CLASSPATH
    
    # add db2 classes for DBB metadata schema
    export CLASSPATH=/usr/lpp/db2d10/jdbc/classes/db2jcc4.jar:$CLASSPATH      
    export CLASSPATH=/usr/lpp/db2d10/jdbc/classes/db2jcc_license_cisuz.jar:$CLASSPATH
    
    
    # Groovy   - shutting down  for basic config testing 
    ##export GROOVY_HOME=$DBB_HOME/groovy
    ##export GROOVY_CONF=$GROOVY_HOME/conf/groovy-starter.conf
    ##export PATH=$GROOVY_HOME/bin:$PATH 
             
# Rocket Git v2.42   
    export PATH=$PATH:/rsusr/ported/bin    
    export LIBPATH=$LIBPATH:/rsusr/ported/lib
    export LIBPATH=$LIBPATH:/rsusr/ported/lib/perl5/5.24.0/s390/CORE
    
#Common Vars:  
    # common encoding  
    export _BPXK_AUTOCVT=ON
    export _CEE_RUNOPTS='FILETAG(AUTOCVT,AUTOTAG) POSIX(ON)'
    export _TAG_REDIR_ERR=txt
    export _TAG_REDIR_IN=txt
    export _TAG_REDIR_OUT=txt    
    export PATH=.:/usr/bin:/bin:/usr/sbin:$PATH # This is a sample zOS USS .profile for a DevOps POC (IBM)
