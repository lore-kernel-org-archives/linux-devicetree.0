From: Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>
Subject: Re: [PATCH 1/2] ubi: mount partitions specified in device tree
Date: Sun, 19 Jun 2016 10:53:42 +0200
Message-ID: <57665D96.1070804@nod.at>
References: <1466277476-14853-1-git-send-email-hauke@hauke-m.de>
 <5765A14F.6020201@nod.at> <48242f26-7812-6957-6bf5-c12989b875b4@hauke-m.de>
 <20160618232054.GB29476@makrotopia.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160618232054.GB29476-g5gK2j5usbvCyp4qypjU+w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Golle <daniel-g5gK2j5usbvCyp4qypjU+w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Cc: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am 19.06.2016 um 01:20 schrieb Daniel Golle:
> In MBR there used to be an 'active' flag stored for each partition.
> Maybe it'd be nice to introduce something similar to mark UBI volumes
> to be the default rootfs.
> Currently we solve this issue by convention: If a volume is named
> 'rootfs' it is automatically mounted during boot. Depending on the
> filesystem in use a ubiblock device has to be created as well.
> This is mostly just the continuation of the existing naming convention
> of mtd partitions, a patch OpenWrt is carrying around for a long
> while already.
> To support the same on UBI, another set of patches was made.

Sorry, I still have troubles to understand your use case.
Both of you seem to hate the kernel command line for reasons
I don't fully understand so far.

> I agree that there should be a way to pass this through the of_node
> of the mtd partition which is defined in the device tree.
> Selecting to-be-ubi-attached mtd partitions in device-tree would
> replace patch:
> 
> https://git.lede-project.org/?p=source.git;a=blob;f=target/linux/generic/patches-4.4/490-ubi-auto-attach-mtd-device-named-ubi-or-data-on-boot.patch

What is the need of this? Use use the kernel command line to tell UBI from which MTD to attach.

> To auto-select the rootfs, we currently carry another bunch of patches
> 
> https://git.lede-project.org/?p=source.git;a=blob;f=target/linux/generic/patches-4.4/491-ubi-auto-create-ubiblock-device-for-rootfs.patch

Same question here.

> https://git.lede-project.org/?p=source.git;a=blob;f=target/linux/generic/patches-4.4/492-try-auto-mounting-ubi0-rootfs-in-init-do_mounts.c.patch

Ditto.

> https://git.lede-project.org/?p=source.git;a=blob;f=target/linux/generic/patches-4.4/493-ubi-set-ROOT_DEV-to-ubiblock-rootfs-if-unset.patch

Ditto.

> This is more or less filesystem-agnostic and works fine as long as
> there is only one volume called 'rootfs' and this volume is always
> used as rootfs.
> 
> Dual-boot setups will need some way to pass the active rootfs volume to
> the kernel. While I agree that this is possible by appending or
> prepending to the cmdline string passed to the kernel, this either
> limits the users' ability to manually specify the rootfs using the
> cmdline or becomes a more complex task to only append/prepend the
> cmdline in case the user-defined string doesn't already contain
> relevant parameters...

Sorry, but this is just a tooling problem and not to be addressed in the kernel.
There is also the possibility to use an initramfs (either as file or embedded in the kernel)
if the mount/attach logic becomes *really* complicated...

> Thus it'd be nicer to flag the default rootfs volume via the device-
> tree.

As I said, as far I'm informed device tree is for configuring Linux, it describes
the hardware. We also don't have LVM, DM or iSCSI bindings in DT. ;)
Maybe device tree folks will tell more...

Thanks,
//richard
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
