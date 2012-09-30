import vim
import os
#--------------------------------------------------
# cmd = "!python -i 'exec('%s')'" % ('\n'.join(vim.buffers[0][:]))
# print cmd
# vim.command(cmd)
#-------------------------------------------------- 
#--------------------------------------------------
# stuff = "\"%s\"" % ('\\\n'.join(vim.current.buffer[:]))
# print stuff
# #vim.command('!python -ic "exec(%s)"' % (stuff))
#-------------------------------------------------- 
#--------------------------------------------------
# code = '\n'.join(vim.buffers[0][:])
# f = compile(code,'vim','single')
#-------------------------------------------------- 
fnam = os.tempnam('./','vim')
f = open(fnam,'w')
#f.write('\n'.join(vim.buffers[0][:]))
f.write('\n'.join(vim.current.buffer[:]))
f.close()
vim.command('!python -it %s' % fnam)
os.system('rm %s' % fnam)
#--------------------------------------------------
# vim.command('split tmpfile')
# vim.buffers[1].append(os.popen3('python -c %s' %('\n'.join(vim.buffers[0][:])))[1].read())
# rm = os.popen3('rm tmp.py')
# 
#-------------------------------------------------- 
