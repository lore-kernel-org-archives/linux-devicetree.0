From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] of: overlay: user space synchronization
Date: Mon, 15 Oct 2018 11:09:50 -0700
Message-ID: <e69685d5-e09f-5f7d-2ff0-7ead12500371@gmail.com>
References: <1539567282-1326-1-git-send-email-frowand.list@gmail.com>
 <CAMuHMdXad2g5zEZ8=XzzVgfijcatKYj5AjwVQg=W-by_rHfcAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXad2g5zEZ8=XzzVgfijcatKYj5AjwVQg=W-by_rHfcAQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alan Tull <atull@kernel.org>
List-Id: devicetree@vger.kernel.org

On 10/15/18 01:24, Geert Uytterhoeven wrote:
> Hi Frank,
> 
> On Mon, Oct 15, 2018 at 3:36 AM <frowand.list@gmail.com> wrote:
>> From: Frank Rowand <frank.rowand@sony.com>
>>
>> When an overlay is applied or removed, the live devicetree visible in
>> /proc/device-tree/, aka /sys/firmware/devicetree/base/, reflects the
>> changes.  There is no method for user space to determine whether the
>> live devicetree was modified by overlay actions.
>>
>> Provide a sysfs file, /sys/firmware/devicetree/tree_version,  to allow
>> user space to determine if the live devicetree has remained unchanged
>> while a series of one or more accesses of /proc/device-tree/ occur.
> 
> Thanks for your patch!
> 
>> The use of both dynamic devicetree modifications and overlay apply and
>> removal are not supported during the same boot cycle.  Thus non-overlay
>> dynamic modifications are not reflected in the value of tree_version.
> 
> What does this mean exactly, for users?
> I am used to applying and removing overlays at run time (still
> carrying Pantelis'
> overlay configfs patches), but when would I use non-overlay dynamic
> modifications?

To find some examples, 'git grep of_add_property'.  (This is not a
comprehensive list, there are other similar functions.)

Some Powerpc systems use dynamic modifications of device trees, for
example adding and removing cpus.

Kexec uses dynamic modifications just before booting a new
kernel (so no interference with overlays).  Devicetree
unittest uses it, with no interference with overlays.

There are also a few places platform code or a driver uses dynamic
modification.  Possible conflicts with overlays are:
   arch/arm/mach-mvebu/coherency.c
   arch/arm/mach-omap2/timer.c

rcar_du_of.c is a known use that is grandfathered in.  It currently
is not compatible with overlays.

drivers/macintosh/smu.c should not be an issue because I don't
expect any macintosh overlay.

Some of the reasons for not supporting both overlays and other
dynamic modifications on the same system might be possible to
resolve with additional code, but some might be difficult or
impossible to resolve.  So that restriction might be loosened
or removed in the future.  Some of the reasons are:

  - dynamic modifications do not use the same locking mechanism
    as overlay apply and removal, thus the devicetree could be
    corrupted

  - dynamic modifications of portions of the devicetree that
    are the result of applying an overlay will (may?) cause
    removal of the overlay to fail (or devicetree corruption?)

  - (future concern: ) static validation of an overlay (or set
    of overlays) against a specific base devicetree would not
    be valid if the base devicetree is further modified by
    dynamic modifications - this is theoretical since validation
    is a currently under development feature and we do not know
    what the final feature will look like

The plan for overlays has been to add specific use models (or
functionality or features) in a limited fashion initially, to
ensure that each feature is implemented to a sufficient degree
(in other words is not a hack that only works in limited
circumstances, such as the correct phase of the moon), works
robustly and is maintainable.  Then as each feature or set
of features is found to be good enough, add more features.

I suspect that dynamic modification in general will remain not
compatible with overlays, with limited exceptions.  Possible
exceptions would require stringent review and auditing, and
could incude devicetree unittest (even this one makes me
nervous) and some platform code (especially early boot code).


>> --- a/Documentation/ABI/testing/sysfs-firmware-ofw
>> +++ b/Documentation/ABI/testing/sysfs-firmware-ofw
>>
>> +What:          /sys/firmware/devicetree/tree_version
>> +Date:          October 2018
>> +KernelVersion: 4.20
>> +Contact:       Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
>> +Description:
>> +               When an overlay is applied or removed, the live devicetree
>> +               visible in /proc/device-tree/, aka
>> +               /sys/firmware/devicetree/base/, reflects the changes.
>> +
>> +               tree_version provides a way for user space to determine if the
>> +               live devicetree has remained unchanged while a series of one
>> +               or more accesses of /proc/device-tree/ occur.
>> +
>> +               The use of both dynamic devicetree modifications and overlay
>> +               apply and removal are not supported during the same boot
>> +               cycle.  Thus non-overlay dynamic modifications are not
>> +               reflected in the value of tree_version.
>> +
>> +               Example shell use of tree_version:
>> +
>> +               done=1
>> +
>> +               while [ $done = 1 ] ; do
>> +
>> +                  pre_version=$(cat /sys/firmware/devicetree/tree_version)
>> +                  version=$pre_version
>> +                  while [ $(( ${version} & 1 )) != 0 ] ; do
>> +                     # echo is optional, sleep value can be tuned
>> +                     echo "${version}  sleeping"
>> +                     sleep 2;
>> +                     pre_version=$(cat /sys/firmware/devicetree/tree_version)
>> +                     version=${pre_version}
>> +                  done
>> +
>> +                  # 'critical region'
>> +                  # access /proc/device-tree/ one or more times
>> +
>> +                  post_version=$(cat /sys/firmware/devicetree/tree_version)
>> +
>> +                  if [ ${post_version} = ${pre_version} ] ; then
>> +                     done=0
>> +                  fi
>> +
>> +               done
> 
> Please say explicitly that tree_version contains a 32-bit unsigned
> decimal number, which is incremented before and after every change.
> I had to deduce that from the code.

Good point.  I'll add that.


> 
> IMHO that is more important than having the sample script here.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
