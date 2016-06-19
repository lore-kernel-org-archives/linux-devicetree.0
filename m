From: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 1/2] ubi: mount partitions specified in device tree
Date: Sun, 19 Jun 2016 15:19:38 +0200
Message-ID: <57669BEA.5030306@nod.at>
References: <1466277476-14853-1-git-send-email-hauke@hauke-m.de>
 <5765A14F.6020201@nod.at> <48242f26-7812-6957-6bf5-c12989b875b4@hauke-m.de>
 <20160618232054.GB29476@makrotopia.org> <57665D96.1070804@nod.at>
 <20160619112510.GA820@makrotopia.org> <576689CC.3030809@nod.at>
 <20160619130514.GB820@makrotopia.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20160619130514.GB820@makrotopia.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Daniel Golle <daniel@makrotopia.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, dedekind1@gmail.com, Hauke Mehrtens <hauke@hauke-m.de>, robh+dt@kernel.org, linux-mtd@lists.infradead.org, computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: devicetree@vger.kernel.org

Daniel,

Am 19.06.2016 um 15:05 schrieb Daniel Golle:
>>> The same kernel gets used on many devices having different $vendor
>>> mtd-partition layouts. A way other than the kernel cmdline allows
>>> to specify the default behaviour without restricting the user to
>>> manually use those cmdline options.
>>
>> You can put the cmdline into the per-device device tree.
>> This is the concept of a multi-device kernel. One kernel and
>> many device trees.
> 
> Exactly true. However, as the mtd partitions are defined in the tree
> itself rather than using 'mtdparts=...' in the cmdline built-into the
> device-tree, it'd be nice to also select that a specific partition
> should be ubiattached.

DT already offer all you need and nothing hinders you from
using mtdparts=.

>>
>>>>
>>>>> To auto-select the rootfs, we currently carry another bunch of patches
>>>>>
>>>>> https://git.lede-project.org/?p=source.git;a=blob;f=target/linux/generic/patches-4.4/491-ubi-auto-create-ubiblock-device-for-rootfs.patch
>>>>
>>>> Same question here.
>>>>
>>>>> https://git.lede-project.org/?p=source.git;a=blob;f=target/linux/generic/patches-4.4/492-try-auto-mounting-ubi0-rootfs-in-init-do_mounts.c.patch
>>>>
>>>> Ditto.
>>>>
>>>>> https://git.lede-project.org/?p=source.git;a=blob;f=target/linux/generic/patches-4.4/493-ubi-set-ROOT_DEV-to-ubiblock-rootfs-if-unset.patch
>>>>
>>>> Ditto.
>>>>
>>>
>>> Same arguments as above. In addition, we do not want to hard-code the
>>> filesystem type used for the rootfs volume, as it can either be UBIFS
>>> or a read-only filesystem needing a ubiblock device. Thus we would
>>> need the bootloader to know which filesystem *type* is being used and
>>> then decide wether to pass 'rootfs=ubiX:Y' or
>>> 'ubiblock=... rootfs=/dev/ubiblock0'.
>>
>> What is wrong with having a very minimal initramfs to do such an
>> auto discovery logic?
> 
> Sorry, but we are not talking about traditional desktop or server
> systems. OpenWrt/LEDE runs on devices with as little as 32 MB of RAM
> and 4 MB of Flash. Devices with UBI will typically have at least
> 32 MB of NAND Flash, but still not necessarily a lot of RAM.
> Have a look at
> https://git.lede-project.org/?p=source.git;a=blob;f=target/linux/lantiq/dts/BTHOMEHUBV2B.dts
> for a good example of the type of hardware we are talking about.

I didn't recommend adding glibc+systemd in the initramfs. It can be very, very small
and trivial.
At least it would be much more clean than your pile of not so fancy MTD/UBI patches.

> Apart from that we already automatically generate initramfs-based
> images for devices to be used in situations where you cannot or don't
> want to touch the devices' flash.

The initramfs can be part of the kernel image. No additional file needed.

>> This is something you need to discuss wit DT folks.
>> I'm not per se against UBI DT bindings it just does not feel right
>> and contradicts my understanding of it.
> 
> I agree with your view when it comes to describing UBI volumes
> in the device tree. That's wrong just as it would be wrong to add
> DT bindings for LVM2.
> As said previously, the situation is different for flash chips having
> partitions defined for use with UBI on some boards.

Everything can be done with the existing framework. DT binding maybe be nice
for your use case but I fear it is not applicable.

Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
