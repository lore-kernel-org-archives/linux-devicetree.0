From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: Using device tree overlays in Linux
Date: Tue, 9 Apr 2019 12:33:28 -0700
Message-ID: <78fc3196-c45b-230d-6bf8-0d8572bd3044@gmail.com>
References: <71fb0ff289e84c55bd92ecd96bc9aa76@svr-chch-ex1.atlnz.lc>
 <61185ee9-4bee-eec3-f0d0-6d6760595845@gmail.com>
 <224942bd629e41eaa23ab327b015134e@svr-chch-ex1.atlnz.lc>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <224942bd629e41eaa23ab327b015134e@svr-chch-ex1.atlnz.lc>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>, "pantelis.antoniou@konsulko.com" <pantelis.antoniou@konsulko.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hamish Martin <Hamish.Martin@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

On 4/7/19 6:27 PM, Chris Packham wrote:
> Hi Frank,
> 
> On 8/04/19 1:05 PM, Frank Rowand wrote:
>> Hi Chris,
>>
>> On 4/3/19 6:50 PM, Chris Packham wrote:
>>> Hi,
>>>
>>> I'm implementing support for some modular Linux based systems using
>>> device tree overlays. The code is working but it seems a little more
>>> fiddly that than it should be so I'm wondering if I'm doing it right.
>>
>> Let me start by saying that I strongly discourage using device tree
>> overlays in the Linux kernel until the support is more baked.  For
>> some info on how unbaked overlays are, see:
>>
>>     https://elinux.org/Frank%27s_Evolving_Overlay_Thoughts
>>
>> You should consider applying overlays in the Linux kernel to be
>> fragile at best.
>>
>> If you can not figure out how to solve your needs without using
>> overlays, then having the boot loader apply the overlay instead
>> of the kernel applying the overlay avoids most of the issues.
>>
> 
> Consider us beta-testers :).
> 
> We've got a few modular systems that have miscellaneous devices that we 
> want to be hot-swapping at run time. For the most part the devices in 
> question are i2c based. We want to use overlays as it saves manually 
> instantiating devices and avoids needing specific knowledge of the base 
> platform.

I want to make sure we are using a common vocabulary.

By hot-swap, do you mean physically plugging in or removing the device
_while the kernel is booted_?

If this is the case, then my suggestion of using the boot loader to
apply the devicetree overlay is not sufficient.


>>> An example of what I'm doing is
>>>
>>>
>>> arch/arm/boot/dts/Makefile:
>>> DTC_FLAGS_myboard += -@
>>>
>>> drivers/foo/Makefile:
>>> obj-y += myplugin.dtb.o
>>> obj-y += mydriver.o
>>>
>>> drivers/foo/myplugin.dts:
>>> /dts-v1/;
>>> /plugin/;
>>> /{
>>> 	fragment@0 {
>>> 		target = <&i2c0>;
>>> 		__overlay__ {
>>> 			gpio@74 {
>>> 				compatible = "nxp,pca9539";
>>> 				reg = <0x74>
>>> 			};
>>> 		};
>>> 	};
>>> };
>>
>> The fragment and __overlay__ nodes are implementation, subject to
>> change, and should not be hand coded.  The dtc compiler has added
>> features to allow a more generic source code.  The above should be:
>>
>> // SPDX-License-Identifier: GPL-2.0
>> /dts-v1/;
>> /plugin/;
>>
>> &i2c0 {
>> 	gpio@74 {
>> 		compatible = "nxp,pca9539";
>> 		reg = <0x74>;
>> 	};
>> };
>>
>> (Not compiled, not tested.)
>>
>> The rcar overlay sources were merged before dtc was updated to
>> handle this new syntax, so they are not a good example for
>> how to write an overlay.
> 
> OK thanks. I suspected as much. I'll update my code based on your example.
> 
>>> drivers/foo/mydriver.c:
>>> extern uint8_t __dtb_myplugin_begin[];
>>> extern uint8_t __dtb_myplugin_end[];
>>>
>>> int mydriver_probe(struct platform_device *pdev)
>>> {
>>> 	u32 size = __dtb_myplugin_end - __dtb_myplugin_begin;
>>> 	int overlay_id;
>>> 	int ret;
>>> 	
>>> 	ret = of_overlay_fdt_apply(__dtb_myplugin_begin,
>>> 				   size, &overlay_id);
>>> 	return ret;
>>> }
>>
>> I'm guessing that you have simplified your use case to make it easier to
>> describe (thank you for that).  But that also makes it harder to understand
>> the use case, and whether this is a good solution.  Can you describe your
>> use case in some more detail?
> 
> As I said above we have a few different modular systems we're trying to 
> support. But they all do basically the same thing.
> 
> The insertion of a module is detected based on a gpio line being asserted.
> 
> Then we identify what was just inserted, the details vary a little per 
> platform but in one instance we load an overlay that has instantiates an 
> i2c eeprom identifying the module.
> 
> Once we know which specific module has been inserted based on the data 
> in the eeprom we load another overlay that instantiates the rest of the 
> devices on that module.

As an alternate solution, could nodes for all of the possible modules be
included in the devicetree, but disabled?  Then as modules are detected, the
appropriate nodes could be enabled.  (This is a conceptual proposal - the
implementation details might encounter issues, some of which are similar
to the issues overlays face.)


>>> The first issue is that I need to add -@ to the DTC_FLAGS for my board
>>> dtb. I kind of understand that I only need -@ if my overlay targets
>>> something symbolic so I might not need it but I was surprised that there
>>> wasn't a Kconfig option that makes this happen automatically.
>>>
>>> externing things in C files makes checkpatch.pl complain. I see the
>>> of/unittests.c and rcar_du_of.c hide this with a macro. I was again
>>> surprised that there wasn't a common macro to declare these.
>>
>> unittests.c should not be used as a model of how to code for devicetree.
>> There are some hacks that are needed to be able to test, but should not
>> be used by normal drivers.
>>
>> The rcar use of overlays is a temporary hack to provide backward
>> compatibility.  The intent is to drop this code once the backward
>> compatibility window ends.
> 
> Yes I suspected as much.
> 
>> The long-term intent (once enough of the overlay code is in place) is
>> to provide an overlay loader than can apply an overlay .dtb from a file.
> 
> Would that be a kernel helper or driven via udev?

The implementation is TBD.  I would prefer to defer the implementation
discussion until we are closer to being willing to accept a loader.

-Frank
