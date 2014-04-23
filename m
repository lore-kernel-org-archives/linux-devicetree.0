From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] sysfs, device-tree: aid for debugging device tree boot
 problems
Date: Wed, 23 Apr 2014 12:54:18 +0100
Message-ID: <20140423115418.A8C0EC40969@trevor.secretlab.ca>
References: <53571685.5060403@gmail.com> <20140423032044.GA26233@kroah.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140423032044.GA26233-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 22 Apr 2014 20:20:44 -0700, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> wrote:
> On Tue, Apr 22, 2014 at 06:25:25PM -0700, Frank Rowand wrote:
> > Create some infrastructure to aid trouble shooting device tree related
> > boot issues.
> > 
> > Add a %driver_name file to each device tree node sysfs directory which has had
> > a driver bound to it.  This allows detecting device tree nodes which failed
> > to be bound to any driver.
> 
> Why is this needed, shouldn't there already be a "driver" symlink in
> sysfs for these devices when a driver binds to them?  The rest of the
> driver model works that way, why is of devices any different?
> 

Because it hasn't been added yet! I only just committed the change to
convert device_nodes into kobjects in v3.14. The next step is to add
driver symlinks.

That said, the devicetree node is already exposed in the uevent for a
device. It should already be possible to find all device tree nodes that
don't have a device, or devices without a driver:

To get a list of all nodes:

find /proc/device-tree/ -type d | sed -e 's/\/proc\/device-tree//'

or a little more nuanced, only choosing nodes with a compatible property:

for k in `find /proc/device-tree/ -name compatible`; do
	echo $(dirname $k) | sed -e 's/\/proc\/device-tree//'
done | sort

It can get even more refined than that if need be.

To get a list of all nodes with a device that has been created:

for k in `find devices -name uevent`; do
	grep '^OF_FULLNAME' $k | sed -e 's/OF_FULLNAME=//'
done | sort

To get a list of all nodes with a device that has been bound to a driver:

for k in `find devices -name uevent`; do
	if [[ -d $(dirname $k)/driver ]]; then
		grep '^OF_FULLNAME' $k | sed -e 's/OF_FULLNAME=//'
	fi
done | sort


The suggestions you have below would be the anything in the first list
that isn't in the second or third:

bound=$(for k in `find /sys/devices -name uevent`; do
		if [[ -d $(dirname $k)/driver ]]; then
			grep '^OF_FULLNAME' $k | sed -e 's/OF_FULLNAME=//'
		fi
	done)

nodes=$(for k in `find /proc/device-tree/ -name compatible`; do
		echo $(dirname $k) | sed -e 's/\/proc\/device-tree//'
	done | sort)

for n in $nodes; do
	if ! echo $bound | grep -q "$n"; then
		echo $n $(cat /proc/device-tree/$n/compatible)
	fi
done



> > Examples of using the %driver_name file (note that /proc/device-tree is a
> > link to the base of the device tree sysfs tree):
> > 
> > 
> >   1) To find list of device tree nodes with no driver:
> > 
> >   # A few false positives may be reported.  For example,
> >   #   node_full_path of "." is the board.
> >   #
> >   # output is: node_full_path compatible_string
> >   #
> >   cd /proc/device-tree
> >   for k in `find . -type d`; do
> >      if [[ -f ${k}/compatible && ! -f ${k}/%driver_name ]] ; then
> >         if [[ "`cat ${k}/compatible`" != "simple-bus" ]] ; then
> >            echo `echo ${k} | sed -e 's|./||'` `cat ${k}/compatible`
> >         fi
> >      fi
> >   done | sort
> > 
> > 
> >   2) To find list of device tree nodes with a bound driver:
> > 
> >   # output is:  node_full_path driver_name
> >   #
> >   cd /proc/device-tree
> >   for k in `find . -name %driver_name` ; do
> >      echo `echo ${k} | sed -e 's|./||' -e 's|/%driver_name$||'` `cat ${k}`
> >   done | sort
> > 
> > 
> >   3) To find list of device tree nodes with a bound driver:
> > 
> >   # output is:  driver_name node_full_path
> >   #
> >   cd /proc/device-tree
> >   for k in `find . -name %driver_name` ; do
> >      echo `cat ${k}` `echo ${k} | sed -e 's|./||' -e 's|/%driver_name$||'`
> >   done | sort
> 
> If we take this patch, these examples should be somewhere in the
> documentation to make it easy for others.
> 
> > Signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> 
> Minor nit, your From: line doesn't match this signed-off-by: so
> something has to change (or add a new From: line, like SubmittingPatches
> decribes how to do.)
> 
> thanks,
> 
> greg k-h

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
