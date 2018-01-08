slave = hudson.model.Hudson.instance.slaves.find { slave -> slave.nodeName.equals(args[0]) }
def cur_lab = slave.labelString.replaceAll(/  +/,' ').trim()
def new_lab = args[1]
if (new_lab != cur_lab)
{
  slave.setLabelString(new_lab)
  println "Changing labels: "+cur_lab+"->"+new_lab 
}