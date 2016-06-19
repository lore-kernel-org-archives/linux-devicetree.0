From: Daniel Golle <daniel-g5gK2j5usbvCyp4qypjU+w@public.gmane.org>
Subject: Re: [PATCH 1/2] ubi: mount partitions specified in device tree
Date: Sun, 19 Jun 2016 15:05:15 +0200
Message-ID: <20160619130514.GB820@makrotopia.org>
References: <1466277476-14853-1-git-send-email-hauke@hauke-m.de>
 <5765A14F.6020201@nod.at>
 <48242f26-7812-6957-6bf5-c12989b875b4@hauke-m.de>
 <20160618232054.GB29476@makrotopia.org>
 <57665D96.1070804@nod.at>
 <20160619112510.GA820@makrotopia.org>
 <576689CC.3030809@nod.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <576689CC.3030809-/L3Ra7n9ekc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Richard,

On Sun, Jun 19, 2016 at 02:02:20PM +0200, Richard Weinberger wrote:
> Daniel,
> 
> Am 19.06.2016 um 13:25 schrieb Daniel Golle:
> > Hi Richard,
> > 
> > On Sun, Jun 19, 2016 at 10:53:42AM +0200, Richard Weinberger wrote:
> >> Am 19.06.2016 um 01:20 schrieb Daniel Golle:
> >>> In MBR there used to be an 'active' flag stored for each partition.
> >>> Maybe it'd be nice to introduce something similar to mark UBI volumes
> >>> to be the default rootfs.
> >>> Currently we solve this issue by convention: If a volume is named
> >>> 'rootfs' it is automatically mounted during boot. Depending on the
> >>> filesystem in use a ubiblock device has to be created as well.
> >>> This is mostly just the continuation of the existing naming convention
> >>> of mtd partitions, a patch OpenWrt is carrying around for a long
> >>> while already.
> >>> To support the same on UBI, another set of patches was made.
> >>
> >> Sorry, I still have troubles to understand your use case.
> >> Both of you seem to hate the kernel command line for reasons
> >> I don't fully understand so far.
> > 
> > I like the kernel command line a lot :)
> > And *being the end-user* I like to be the one defining and modifying it
> > according to my current needs. For that reason I do *not* like firmware
> > bootloaders to prepend/append or even overwrite the cmdline for things
> > like selecting the rootfs, because usually that restricts the use of
> > the relevant parameters by device owners.
> > Imagine: The device runs a bootloader which already sets rootfs= or
> > overwrites the cmdline of the stock firmware. How will an end-user
> > who cannot change the bootloader use an alternative OS which uses e.g.
> > a USB pendrive as it's rootfs? This is why we end up with things like
> > renaming kernel cmdline parameters in alternative firmware projects,
> > e.g. rootfs2=...., so end-users can re-gain access to cmdline
> > parameters augmented by the bootloader.
> 
> So, the use case is being able to use a custom OS on a "locked"
> device where the bootloader hates you?

At least that's a valid use-case which should be considered, but not
the only. Some people also just don't want to modify the bootloader
(especially on headless systems) so they don't risk to brick it.
Many devices offer some rescue firmware flashing methods through
TFTP -- however, you cannot change bootloader environment variables
like the cmdline in that way and even if you could, the loader might
still patch the root=... parameter in the way needed for their stock
firmware.

> 
> But you still can override the cmdline supplied by the bootloader
> by adding your cmdline into the device tree, right?
> 
> > For that reason I believe that using the cmdline to pass
> > *non-user-defined* details from the bootloader to the kernel is just
> > not such a nice thing to do.
> 
> Well, this is not how the cmdline works. We don't have such
> an separation.
> Some distros use hacks such as "showopts" to have such a split.

/me researching 'showopts' which I had never heard of before.
Ok, this is for grub running interactively on x86, probably not the
best reference if it comes to small headless embedded systems...
There is no such a thing as a proprietary board-specific version
of grub, so on x86 the whole problem just doesn't exist and showopts
is really just cosmetics. However, on most ARM, MIPS or PPC based
boards users may not have the option or may not want to change the
bootloader. As the whole reason why some distro-kernels then decide
to override the bootloader cmdline is *because* $vendor decided to
make her bootloader pass the root=... and similar basic options and
that screws up the rootfs of the 3rd-party Linux.
Thus I believe we shouldn't encourage the use of the kernel cmdline
in places the user cannot influence it (like in most $vendor variants
of U-Boot where the cmdline is patched somewhere behind the scenes
rather than just using the environment variable).


> 
> 
> >>
> >>> I agree that there should be a way to pass this through the of_node
> >>> of the mtd partition which is defined in the device tree.
> >>> Selecting to-be-ubi-attached mtd partitions in device-tree would
> >>> replace patch:
> >>>
> >>> https://git.lede-project.org/?p=source.git;a=blob;f=target/linux/generic/patches-4.4/490-ubi-auto-attach-mtd-device-named-ubi-or-data-on-boot.patch
> >>
> >> What is the need of this? Use use the kernel command line to tell UBI from which MTD to attach.
> > 
> > The same kernel gets used on many devices having different $vendor
> > mtd-partition layouts. A way other than the kernel cmdline allows
> > to specify the default behaviour without restricting the user to
> > manually use those cmdline options.
> 
> You can put the cmdline into the per-device device tree.
> This is the concept of a multi-device kernel. One kernel and
> many device trees.

Exactly true. However, as the mtd partitions are defined in the tree
itself rather than using 'mtdparts=...' in the cmdline built-into the
device-tree, it'd be nice to also select that a specific partition
should be ubiattached.

> 
> >>
> >>> To auto-select the rootfs, we currently carry another bunch of patches
> >>>
> >>> https://git.lede-project.org/?p=source.git;a=blob;f=target/linux/generic/patches-4.4/491-ubi-auto-create-ubiblock-device-for-rootfs.patch
> >>
> >> Same question here.
> >>
> >>> https://git.lede-project.org/?p=source.git;a=blob;f=target/linux/generic/patches-4.4/492-try-auto-mounting-ubi0-rootfs-in-init-do_mounts.c.patch
> >>
> >> Ditto.
> >>
> >>> https://git.lede-project.org/?p=source.git;a=blob;f=target/linux/generic/patches-4.4/493-ubi-set-ROOT_DEV-to-ubiblock-rootfs-if-unset.patch
> >>
> >> Ditto.
> >>
> > 
> > Same arguments as above. In addition, we do not want to hard-code the
> > filesystem type used for the rootfs volume, as it can either be UBIFS
> > or a read-only filesystem needing a ubiblock device. Thus we would
> > need the bootloader to know which filesystem *type* is being used and
> > then decide wether to pass 'rootfs=ubiX:Y' or
> > 'ubiblock=... rootfs=/dev/ubiblock0'.
> 
> What is wrong with having a very minimal initramfs to do such an
> auto discovery logic?

Sorry, but we are not talking about traditional desktop or server
systems. OpenWrt/LEDE runs on devices with as little as 32 MB of RAM
and 4 MB of Flash. Devices with UBI will typically have at least
32 MB of NAND Flash, but still not necessarily a lot of RAM.
Have a look at
https://git.lede-project.org/?p=source.git;a=blob;f=target/linux/lantiq/dts/BTHOMEHUBV2B.dts
for a good example of the type of hardware we are talking about.

Apart from that we already automatically generate initramfs-based
images for devices to be used in situations where you cannot or don't
want to touch the devices' flash.
As there wasn't a need to embed a initramfs for anything as simple
as mounting the rootfs, I reckon it would be hard to argue that we
should have an initramfs for all systems potentially using UBI just
so we won't need those ~ 100 lines of C code added to the kernel to
auto-select the root device *and* filesystem for both MTD and UBI.


> 
> > 
> >>> This is more or less filesystem-agnostic and works fine as long as
> >>> there is only one volume called 'rootfs' and this volume is always
> >>> used as rootfs.
> >>>
> >>> Dual-boot setups will need some way to pass the active rootfs volume to
> >>> the kernel. While I agree that this is possible by appending or
> >>> prepending to the cmdline string passed to the kernel, this either
> >>> limits the users' ability to manually specify the rootfs using the
> >>> cmdline or becomes a more complex task to only append/prepend the
> >>> cmdline in case the user-defined string doesn't already contain
> >>> relevant parameters...
> >>
> >> Sorry, but this is just a tooling problem and not to be addressed in the kernel.
> >> There is also the possibility to use an initramfs (either as file or embedded in the kernel)
> >> if the mount/attach logic becomes *really* complicated...
> >>
> >>> Thus it'd be nicer to flag the default rootfs volume via the device-
> >>> tree.
> >>
> >> As I said, as far I'm informed device tree is for configuring Linux, it describes
> >> the hardware. We also don't have LVM, DM or iSCSI bindings in DT. ;)
> >> Maybe device tree folks will tell more...
> > 
> > But we do have MTD and MTD partitions in DT. To me it'd feel more
> > consistent if MTD devices, partitioning and which MTD partition(s) to
> > use as UBI would be defined in the same place.
> 
> This is something you need to discuss wit DT folks.
> I'm not per se against UBI DT bindings it just does not feel right
> and contradicts my understanding of it.

I agree with your view when it comes to describing UBI volumes
in the device tree. That's wrong just as it would be wrong to add
DT bindings for LVM2.
As said previously, the situation is different for flash chips having
partitions defined for use with UBI on some boards.



Cheers


Daniel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
