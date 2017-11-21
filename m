From: Ulf Samuelsson <linux-kernel-AoFPY8dbyRPQT0dZR+AlfA@public.gmane.org>
Subject: Re: RFC: Copying Device Tree File into reserved area of VMLINUX
 before deployment
Date: Tue, 21 Nov 2017 13:02:07 +0100
Message-ID: <e8bd1d93-6893-1db5-c92c-d9f6e2a72336@emagii.com>
References: <0b31e22b-202f-6fca-28f2-e16e6af6c6b7@emagii.com>
 <a0f9d598-04af-fddd-58ad-09db10ec19da@gmail.com>
 <fe7925f3-30d4-ec03-a6c5-61a8644dcdfe@gmail.com>
 <ee33abcc-8d23-8b4c-e3ef-7adce8495ef3@emagii.com>
 <0e54f9f0-1226-7f2e-3143-ea4e450058e6@gmail.com>
 <872e81dc-82ba-f838-c4f8-88d2208d23d2@emagii.com>
 <4d2f0bf4-d49a-27bc-75aa-11c78bc074fa@emagii.com>
Reply-To: linux-kernel-AoFPY8dbyRPQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4d2f0bf4-d49a-27bc-75aa-11c78bc074fa-AoFPY8dbyRPQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 2017-11-21 07:19, Ulf Samuelsson wrote:
> 
> 
> On 2017-11-21 00:09, Ulf Samuelsson wrote:
>>
>>
>> On 2017-11-20 22:39, Frank Rowand wrote:
>>> Hi Ulf, Rob,
>>>
>>> On 11/20/17 15:19, Ulf Samuelsson wrote:
>>>>
>>>>
>>>> On 2017-11-20 05:32, Frank Rowand wrote:
>>>>> Hi Ulf,
>>>>>
>>>>>
>>>>> On 11/19/17 23:23, Frank Rowand wrote:
>>>>>> adding devicetree list, devicetree maintainers
>>>>>>
>>>>>> On 11/18/17 12:59, Ulf Samuelsson wrote:
>>>>>>> I noticed when checking out the OpenWRT support for the board 
>>>>>>> that they have a method to avoid having to pass the device tree 
>>>>>>> address to the kernel, and can thus boot device tree based 
>>>>>>> kernels with U-boots that
>>>>>>> does not support device trees.
>>>>>>>
>>>>>>> Is this something that would be considered useful for including 
>>>>>>> in mainstream:
>>>>>>>
>>>>>>> BACKGROUND:
>>>>>>> Trying to load a yocto kernel into a MIPS target (MT7620A based),
>>>>>>> and the U-Boot is more than stupid.
>>>>>>> Does not support the "run" command as an example.
>>>>>>> They modified the U-Boot MAGIC Word to complicate things.
>>>>>>> The U-Boot is not configured to use device tree files.
>>>>>>> The board runs a 2.6 kernel right now.
>>>>>>>
>>>>>>> Several attempts by me a and others to rebuild U-Boot according to
>>>>>>> the H/W vendors source code and build instructions results in a
>>>>>>> bricked unit. Bricked units cannot be recovered.
>>>>>
>>>>> Hopefully you have brought this to the attention of the vendor.  
>>>>> U-Boot
>>>>> is GPL v2 (or in some ways possibly GPL v2 or later), so if you can 
>>>>> not
>>>>> build U-Boot that is equivalent to the binary U-Boot they shipped, the
>>>>> vendor may want to ensure that they are shipping the proper source and
>>>>> build instructions.
>>>>>
>>>>
>>>> I am not the one in contact with the H/W vendor.
>>>> The U-boot is pretty old, and from comments from those
>>>> in contact with them, the U-Boot knowledge at the H/W vendor
>>>> is minimal at best.
>>>> It might even be that they program an U-boot where the upgrade of 
>>>> the U-boot is broken...
>>>>
>>>>
>>>>>
>>>>>>> Not my choice of H/W, so I cannot change it.
>>>>>>>
>>>>>>>
>>>>>>> ===================================================================
>>>>>>> OPENWRT:
>>>>>>> I noticed when checking out the OpenWRT support for the board that
>>>>>>> they have a method to avoid having to pass the device tree address
>>>>>>> to the kernel, and can thus boot device tree based kernels with
>>>>>>> U-boots that does not support device trees.
>>>>>>>
>>>>>>> What they do is to reserve 16 kB of kernel space, and tag it with
>>>>>>> an ASCII string "OWRTDTB:". After the kernel and dtb is built, a
>>>>>>> utility "patch-dtb" will update the vmlinux binary, copying in the
>>>>>>> device tree file.
>>>>>>>
>>>>>>> ===================================================================
>>>>>>> It would be useful to me, and I could of course patch the
>>>>>>> mainstream kernel, but first I would like to check if this is of
>>>>>>> interest for mainstream.
>>>>>
>>>>> Not in this form.  Hard coding a fixed size area in the boot image
>>>>> to contain the FDT (aka DTB) is a non-starter.
>>>>
>>>> OK, Is it the fixed size, which is a problem?
>>>
>>> Yes, it is the fixed size which is a problem.
>>
>> The size can of course be changed, by setting the size configuration 
>> option (DTB_SIZE).
>> OpenWRT does not support that, but I think it needs to be there for a 
>> generic option (but You have to recompile the kernel to increase the 
>> size).
>>
>> One problem is that you normally compile and link the kernel before you
>> compile the dtbs, so you do not know what size is until afterwards.
>>
> Found this link:    https://csl.name/post/embedding-binary-data/
> 
> =======================================
> ...
> Let's say you have an image target.dtb and want to embed it into your 
> application. You can create an object file with
> 
> 
> image_dtb.o:    <target dtb>
>      mv <target dtb>   image_dtb
>      ld -r -b binary image_dtb -o image_dtb.o
> 
> The object file will have three symbols in it,
> 
> $ nm cat.o
> 0000000000000512 D _binary_image_dtb_end
> 0000000000000512 A _binary_image_dtb_size
> 0000000000000000 D _binary_image_dtb_start
> =======================================
> 
> This assumes that the dtbs are built before the kernel is linked.
> The copy step is neccessary, since the generated names are
> taken from the name of the "in file".
> (Would have been better, if they used the "out file")
> 
> Otherwise you can create an assembler file which "incbin's" the dtb file.
> 

Just checked the kernel source, and it appears that the discussion is 
somewhat redundant, since the support is already in the linux kernel
for some MIPS boards

arch/mips/Kconfig:
	config MIPS_ELF_APPENDED_DTB
		bool "vmlinux"
		help
		  With this option, the boot code will look for a device tree binary
		  DTB) included in the vmlinux ELF section .appended_dtb. By default
		  it is empty and the DTB can be appended using binutils command
		  objcopy:

		    objcopy --update-section .appended_dtb=<filename>.dtb vmlinux

		  This is meant as a backward compatiblity convenience for those
		  systems with a bootloader that can't be upgraded to accommodate
		  the documented boot protocol using a device tree.

arch/mips/kernel/setup.c:
#ifdef CONFIG_MIPS_ELF_APPENDED_DTB
const char __section(.appended_dtb) __appended_dtb[0x100000];
#endif /* CONFIG_MIPS_ELF_APPENDED_DTB */

arch/mips/bmips/setup.c

#ifdef CONFIG_MIPS_ELF_APPENDED_DTB
	if (!fdt_check_header(&__appended_dtb))
		dtb = (void *)&__appended_dtb;
	else
#endif




> 
> 
> 
>>
>>>
>>>> Is generally combining an image with a DTB into a single file also a 
>>>> non-starter?
>>>
>>> Can you jump in here Rob?  My understanding is that 
>>> CONFIG_ARM_APPENDED_DTB,
>>> which is the ARM based solution that Mark mentioned, was envisioned as a
>>> temporary stop gap until boot loaders could add devicetree support.  
>>> I don't
>>> know if there is a desire to limit this approach or to remove it in the
>>> future.
>>>
>>> I'm not sure why this feature should not be permanently supported. 
>>> I'm being
>>> cautious, just in case I'm overlooking or missing an important issue, 
>>> thus
>>> asking for Rob's input.  I do know that this feature does not advance 
>>> the
>>> desires of people who want a single kernel (single boot image?) that 
>>> runs on
>>> many different systems, instead of a boot image that is unique to each
>>> target platform.  But I don't see why that desire precludes also having
>>> an option to have a target specific boot image.
>> The main reason to keep it is when you are really constrained for memory.
>> The U-Boot on the board is 96 kB, which is just a fraction of a more 
>> normal U-Boot.
>> Also, the u-boot is old.
>>
>>
>>>
>>> -Frank
>>>
>>>
>>>>>
>>>>> And again, I would first approach the H/W vendor before trying to
>>>>> come up with a work around like this.
>>>>>
>>>>>
>>>>>>> I envisage the support would look something like:
>>>>>>>
>>>>>>> ============
>>>>>>> Kconfig.
>>>>>>> config MIPS
>>>>>>>       select    HAVE_IMAGE_DTB
>>>>>>>
>>>>>>> config    HAVE_IMAGE_DTB
>>>>>>>       bool
>>>>>>>
>>>>>>> if HAVE_IMAGE_DTB
>>>>>>> config     IMAGE_DTB
>>>>>>>       bool    "Allocated space for DTB within image
>>>>>>>
>>>>>>> config    DTB_SIZE
>>>>>>>       int    "DTB space (kB)
>>>>>>>
>>>>>>> config    DTB_TAG
>>>>>>>       string    "DTB space tag"
>>>>>>>       default    "OWRTDTB:"
>>>>>>> endif
>>>>>>>
>>>>>>> ============
>>>>>>> Some Makefile
>>>>>>> obj-$(CONFIG_INCLUDE_DTB) += image_dtb.o
>>>>>>>
>>>>>>> ============
>>>>>>> image_dtb.S:
>>>>>>>       .text
>>>>>>>       .align    5
>>>>>>>       .ascii    CONFIG_DTB_TAG
>>>>>>>       EXPORT(__image_dtb)
>>>>>>>       .fill    DTB_SIZE * 1024
>>>>>>>
>>>>>>> ===================
>>>>>>> arch/mips/xxx/of.c:
>>>>>>>
>>>>>>> #if    defined(CONFIG_IMAGE_DTB)
>>>>>>>       if (<conditions to boot from dtb_space>)
>>>>>>>           __dt_setup_arch(__dtb_start);
>>>>>>>       else
>>>>>>>           __dt_setup_arch(&__image_dtb);
>>>>>>> #else
>>>>>>>       __dt_setup_arch(__dtb_start);
>>>>>>> #endif
>>>>>>>
>>>>>>> I imagine that if the support is enabled for a target, it should
>>>>>>> be possible to override it with a CMDLINE argument
>>>>>>>            They do something similar for the CMDLINE; copying it 
>>>>>>> into the vmlinux, to allow a smaller boot
>>>>
>>>
>>
> 

-- 
Best Regards
Ulf Samuelsson
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
