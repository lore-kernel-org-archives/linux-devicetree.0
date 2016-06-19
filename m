From: Daniel Golle <daniel-g5gK2j5usbvCyp4qypjU+w@public.gmane.org>
Subject: Re: [PATCH 1/2] ubi: mount partitions specified in device tree
Date: Sun, 19 Jun 2016 16:09:53 +0200
Message-ID: <20160619140952.GC820@makrotopia.org>
References: <1466277476-14853-1-git-send-email-hauke@hauke-m.de>
 <5765A14F.6020201@nod.at>
 <48242f26-7812-6957-6bf5-c12989b875b4@hauke-m.de>
 <20160618232054.GB29476@makrotopia.org>
 <57665D96.1070804@nod.at>
 <20160619112510.GA820@makrotopia.org>
 <576689CC.3030809@nod.at>
 <20160619130514.GB820@makrotopia.org>
 <57669BEA.5030306@nod.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <57669BEA.5030306-/L3Ra7n9ekc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Richard,


On Sun, Jun 19, 2016 at 03:19:38PM +0200, Richard Weinberger wrote:
> Daniel,
> 
> Am 19.06.2016 um 15:05 schrieb Daniel Golle:
> >>> The same kernel gets used on many devices having different $vendor
> >>> mtd-partition layouts. A way other than the kernel cmdline allows
> >>> to specify the default behaviour without restricting the user to
> >>> manually use those cmdline options.
> >>
> >> You can put the cmdline into the per-device device tree.
> >> This is the concept of a multi-device kernel. One kernel and
> >> many device trees.
> > 
> > Exactly true. However, as the mtd partitions are defined in the tree
> > itself rather than using 'mtdparts=...' in the cmdline built-into the
> > device-tree, it'd be nice to also select that a specific partition
> > should be ubiattached.
> 
> DT already offer all you need and nothing hinders you from
> using mtdparts=.

I know. However, it's much nicer to define partitions for a specific
flash chip inside the device tree (I've sent a link to the DTS of the
BTHOMEHUBV2B to illustrate that, please have a look at it and tell
me if you'd really like that partitioning currently stored as
device-tree nodes to be migrated back to 'mtdparts=...'.)


> 
> >>
> >>>>
> >>>>> To auto-select the rootfs, we currently carry another bunch of patches
> >>>>>
> >>>>> https://git.lede-project.org/?p=source.git;a=blob;f=target/linux/generic/patches-4.4/491-ubi-auto-create-ubiblock-device-for-rootfs.patch
> >>>>
> >>>> Same question here.
> >>>>
> >>>>> https://git.lede-project.org/?p=source.git;a=blob;f=target/linux/generic/patches-4.4/492-try-auto-mounting-ubi0-rootfs-in-init-do_mounts.c.patch
> >>>>
> >>>> Ditto.
> >>>>
> >>>>> https://git.lede-project.org/?p=source.git;a=blob;f=target/linux/generic/patches-4.4/493-ubi-set-ROOT_DEV-to-ubiblock-rootfs-if-unset.patch
> >>>>
> >>>> Ditto.
> >>>>
> >>>
> >>> Same arguments as above. In addition, we do not want to hard-code the
> >>> filesystem type used for the rootfs volume, as it can either be UBIFS
> >>> or a read-only filesystem needing a ubiblock device. Thus we would
> >>> need the bootloader to know which filesystem *type* is being used and
> >>> then decide wether to pass 'rootfs=ubiX:Y' or
> >>> 'ubiblock=... rootfs=/dev/ubiblock0'.
> >>
> >> What is wrong with having a very minimal initramfs to do such an
> >> auto discovery logic?
> > 
> > Sorry, but we are not talking about traditional desktop or server
> > systems. OpenWrt/LEDE runs on devices with as little as 32 MB of RAM
> > and 4 MB of Flash. Devices with UBI will typically have at least
> > 32 MB of NAND Flash, but still not necessarily a lot of RAM.
> > Have a look at
> > https://git.lede-project.org/?p=source.git;a=blob;f=target/linux/lantiq/dts/BTHOMEHUBV2B.dts
> > for a good example of the type of hardware we are talking about.
> 
> I didn't recommend adding glibc+systemd in the initramfs. It can be very, very small
> and trivial.

Again, please understand that the whole production firmware can be as
small as 3.5 megs for kernel and rootfs. Of course we never use glibc
or systemd anywhere.
What you imagine to be the ways to make a initramfs really small is
what we already do for *all* our system, ie. we use busybox on top of
a very tiny libc.

> At least it would be much more clean than your pile of not so fancy MTD/UBI patches.
> 

In the end, do_mounts.c is already running in user-space, just the
source-code happens to be part of the kernel tree. Sure, that could
become a seperate executable binary which mounts the rootfs and then
passes control to /sbin/init. On the other hand that would add quite
some redundant infrastructure, because we already got ROOT_DEV and lots
of automagic mounting going on in the kernel.


> > Apart from that we already automatically generate initramfs-based
> > images for devices to be used in situations where you cannot or don't
> > want to touch the devices' flash.
> 
> The initramfs can be part of the kernel image. No additional file needed.

That's excatctly what we've already been doing for initramfs-only
images, see e.g.
http://downloads.lede-project.org/snapshots/targets/lantiq/xway/lede-lantiq-xway-BTHOMEHUBV2B-uImage-initramfs

So if we need an initramfs to mount the on-flash rootfs and *another*
initfamfs containing the whole system for other cases, things become
even more fishy on our side. But yes, I'm aware that this would be
possible.


> 
> >> This is something you need to discuss wit DT folks.
> >> I'm not per se against UBI DT bindings it just does not feel right
> >> and contradicts my understanding of it.
> > 
> > I agree with your view when it comes to describing UBI volumes
> > in the device tree. That's wrong just as it would be wrong to add
> > DT bindings for LVM2.
> > As said previously, the situation is different for flash chips having
> > partitions defined for use with UBI on some boards.
> 
> Everything can be done with the existing framework. DT binding maybe be nice
> for your use case but I fear it is not applicable.

Yes, it can be done. But you would have to define your flash chips in
device-tree, you may define the mtd partitions either in DT or by using
mtdparts=... in the cmdline. Now to define which MTD device to
ubiattach you will have to use ubi.mtd=X on the cmdline. If you defined
your partitions inside the of_node of the flash chip, changes there
(which do happen) may change the index of the partition you want to
ubi-attach. C'mon. This *is* messy. Just having a compatible-flag to
attach the partition would already greatly improve things.

Hauke: Maybe we should discuss the two patches individually, as I feel
that ubiattaching specific mtd partitions flagged in DT is quite
straight forward, while specifying volumes inside the ubi device might
be out-of-scope.


Cheers


Daniel



> 
> Thanks,
> //richard
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
