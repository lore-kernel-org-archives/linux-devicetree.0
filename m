From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] sysfs, device-tree: aid for debugging device tree boot
 problems
Date: Wed, 23 Apr 2014 15:45:11 -0700
Message-ID: <53584277.7000405@gmail.com>
References: <53571685.5060403@gmail.com> <20140423032044.GA26233@kroah.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140423032044.GA26233-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 4/22/2014 8:20 PM, Greg Kroah-Hartman wrote:
> On Tue, Apr 22, 2014 at 06:25:25PM -0700, Frank Rowand wrote:
>> Create some infrastructure to aid trouble shooting device tree related
>> boot issues.
>>
>> Add a %driver_name file to each device tree node sysfs directory which has had
>> a driver bound to it.  This allows detecting device tree nodes which failed
>> to be bound to any driver.
> 
> Why is this needed, shouldn't there already be a "driver" symlink in
> sysfs for these devices when a driver binds to them?  The rest of the
> driver model works that way, why is of devices any different?

Yes, the devices do have a "driver" symlink in sysfs.

The problem I had was that I could not deterministically determine the
device name in /sysfs that was associated with a device tree node that
the device was created for.  And I couldn't find a link from the device
tree entries to the device tree node.

Grant's reply to your email provided the solution to my problem; the
device uevents file contains the full device tree path of the associated
device tree node.

Grant's reply removes the need for my patch.

> 
>> Examples of using the %driver_name file (note that /proc/device-tree is a
>> link to the base of the device tree sysfs tree):
>>
>>
>>   1) To find list of device tree nodes with no driver:
>>
>>   # A few false positives may be reported.  For example,
>>   #   node_full_path of "." is the board.
>>   #
>>   # output is: node_full_path compatible_string
>>   #
>>   cd /proc/device-tree
>>   for k in `find . -type d`; do
>>      if [[ -f ${k}/compatible && ! -f ${k}/%driver_name ]] ; then
>>         if [[ "`cat ${k}/compatible`" != "simple-bus" ]] ; then
>>            echo `echo ${k} | sed -e 's|./||'` `cat ${k}/compatible`
>>         fi
>>      fi
>>   done | sort
>>
>>
>>   2) To find list of device tree nodes with a bound driver:
>>
>>   # output is:  node_full_path driver_name
>>   #
>>   cd /proc/device-tree
>>   for k in `find . -name %driver_name` ; do
>>      echo `echo ${k} | sed -e 's|./||' -e 's|/%driver_name$||'` `cat ${k}`
>>   done | sort
>>
>>
>>   3) To find list of device tree nodes with a bound driver:
>>
>>   # output is:  driver_name node_full_path
>>   #
>>   cd /proc/device-tree
>>   for k in `find . -name %driver_name` ; do
>>      echo `cat ${k}` `echo ${k} | sed -e 's|./||' -e 's|/%driver_name$||'`
>>   done | sort
> 
> If we take this patch, these examples should be somewhere in the
> documentation to make it easy for others.

That is a good idea.  I'll package up the equivalent shell code from
Grant's email.  Any suggestions on location?

  scripts/debug/devicetree/
  scripts/devicetree/debug/
  Documentation/devicetree/scripts/

If there is no good location in the kernel tree, then I will put them
either on the devicetree wiki, or the devicetree section of the
elinux wiki.

> 
>> Signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> 
> Minor nit, your From: line doesn't match this signed-off-by: so
> something has to change (or add a new From: line, like SubmittingPatches
> decribes how to do.)

Oops, thanks for pointing that out.

> 
> thanks,
> 
> greg k-h

-Frank

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
