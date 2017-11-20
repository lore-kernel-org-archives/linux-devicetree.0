From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: RFC: Copying Device Tree File into reserved area of VMLINUX
 before deployment
Date: Sun, 19 Nov 2017 23:32:24 -0500
Message-ID: <fe7925f3-30d4-ec03-a6c5-61a8644dcdfe@gmail.com>
References: <0b31e22b-202f-6fca-28f2-e16e6af6c6b7@emagii.com>
 <a0f9d598-04af-fddd-58ad-09db10ec19da@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a0f9d598-04af-fddd-58ad-09db10ec19da-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-AoFPY8dbyRPQT0dZR+AlfA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Ulf,


On 11/19/17 23:23, Frank Rowand wrote:
> adding devicetree list, devicetree maintainers
> 
> On 11/18/17 12:59, Ulf Samuelsson wrote:
>> I noticed when checking out the OpenWRT support for the board that they have a method to avoid having to pass the device tree address to the kernel, and can thus boot device tree based kernels with U-boots that
>> does not support device trees.
>>
>> Is this something that would be considered useful for including in mainstream:
>>
>> BACKGROUND:
>> Trying to load a yocto kernel into a MIPS target (MT7620A based),
>> and the U-Boot is more than stupid.
>> Does not support the "run" command as an example.
>> They modified the U-Boot MAGIC Word to complicate things.
>> The U-Boot is not configured to use device tree files.
>> The board runs a 2.6 kernel right now.
>>
>> Several attempts by me a and others to rebuild U-Boot according to
>> the H/W vendors source code and build instructions results in a
>> bricked unit. Bricked units cannot be recovered.

Hopefully you have brought this to the attention of the vendor.  U-Boot
is GPL v2 (or in some ways possibly GPL v2 or later), so if you can not
build U-Boot that is equivalent to the binary U-Boot they shipped, the
vendor may want to ensure that they are shipping the proper source and
build instructions.


>> Not my choice of H/W, so I cannot change it.
>>
>>
>> ===================================================================
>> OPENWRT:
>> I noticed when checking out the OpenWRT support for the board that
>> they have a method to avoid having to pass the device tree address
>> to the kernel, and can thus boot device tree based kernels with
>> U-boots that does not support device trees.
>> 
>> What they do is to reserve 16 kB of kernel space, and tag it with
>> an ASCII string "OWRTDTB:". After the kernel and dtb is built, a
>> utility "patch-dtb" will update the vmlinux binary, copying in the
>> device tree file.
>>
>> ===================================================================
>> It would be useful to me, and I could of course patch the
>> mainstream kernel, but first I would like to check if this is of
>> interest for mainstream.

Not in this form.  Hard coding a fixed size area in the boot image
to contain the FDT (aka DTB) is a non-starter.

And again, I would first approach the H/W vendor before trying to
come up with a work around like this.


>> I envisage the support would look something like:
>>
>> ============
>> Kconfig.
>> config MIPS
>>     select    HAVE_IMAGE_DTB
>>
>> config    HAVE_IMAGE_DTB
>>     bool
>>
>> if HAVE_IMAGE_DTB
>> config     IMAGE_DTB
>>     bool    "Allocated space for DTB within image
>>
>> config    DTB_SIZE
>>     int    "DTB space (kB)
>>
>> config    DTB_TAG
>>     string    "DTB space tag"
>>     default    "OWRTDTB:"
>> endif
>>
>> ============
>> Some Makefile
>> obj-$(CONFIG_INCLUDE_DTB) += image_dtb.o
>>
>> ============
>> image_dtb.S:
>>     .text
>>     .align    5
>>     .ascii    CONFIG_DTB_TAG
>>     EXPORT(__image_dtb)
>>     .fill    DTB_SIZE * 1024
>>
>> ===================
>> arch/mips/xxx/of.c:
>>
>> #if    defined(CONFIG_IMAGE_DTB)
>>     if (<conditions to boot from dtb_space>)
>>         __dt_setup_arch(__dtb_start);
>>     else
>>         __dt_setup_arch(&__image_dtb);
>> #else
>>     __dt_setup_arch(__dtb_start);
>> #endif
>>
>> I imagine that if the support is enabled for a target, it should
>> be possible to override it with a CMDLINE argument
>>     
>>     
>> They do something similar for the CMDLINE; copying it into the vmlinux, to allow a smaller boot
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
