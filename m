From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: Using device tree overlays in Linux
Date: Tue, 9 Apr 2019 20:47:24 +0000
Message-ID: <1cb50710b4d34ef2b8961cc9c43748f0@svr-chch-ex1.atlnz.lc>
References: <71fb0ff289e84c55bd92ecd96bc9aa76@svr-chch-ex1.atlnz.lc>
 <61185ee9-4bee-eec3-f0d0-6d6760595845@gmail.com>
 <224942bd629e41eaa23ab327b015134e@svr-chch-ex1.atlnz.lc>
 <78fc3196-c45b-230d-6bf8-0d8572bd3044@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>, "pantelis.antoniou@konsulko.com" <pantelis.antoniou@konsulko.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hamish Martin <Hamish.Martin@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

On 10/04/19 7:33 AM, Frank Rowand wrote:=0A=
> On 4/7/19 6:27 PM, Chris Packham wrote:=0A=
>> Hi Frank,=0A=
>>=0A=
>> On 8/04/19 1:05 PM, Frank Rowand wrote:=0A=
>>> Hi Chris,=0A=
>>>=0A=
>>> On 4/3/19 6:50 PM, Chris Packham wrote:=0A=
>>>> Hi,=0A=
>>>>=0A=
>>>> I'm implementing support for some modular Linux based systems using=0A=
>>>> device tree overlays. The code is working but it seems a little more=
=0A=
>>>> fiddly that than it should be so I'm wondering if I'm doing it right.=
=0A=
>>>=0A=
>>> Let me start by saying that I strongly discourage using device tree=0A=
>>> overlays in the Linux kernel until the support is more baked.  For=0A=
>>> some info on how unbaked overlays are, see:=0A=
>>>=0A=
>>>      https://elinux.org/Frank%27s_Evolving_Overlay_Thoughts=0A=
>>>=0A=
>>> You should consider applying overlays in the Linux kernel to be=0A=
>>> fragile at best.=0A=
>>>=0A=
>>> If you can not figure out how to solve your needs without using=0A=
>>> overlays, then having the boot loader apply the overlay instead=0A=
>>> of the kernel applying the overlay avoids most of the issues.=0A=
>>>=0A=
>>=0A=
>> Consider us beta-testers :).=0A=
>>=0A=
>> We've got a few modular systems that have miscellaneous devices that we=
=0A=
>> want to be hot-swapping at run time. For the most part the devices in=0A=
>> question are i2c based. We want to use overlays as it saves manually=0A=
>> instantiating devices and avoids needing specific knowledge of the base=
=0A=
>> platform.=0A=
> =0A=
> I want to make sure we are using a common vocabulary.=0A=
> =0A=
> By hot-swap, do you mean physically plugging in or removing the device=0A=
> _while the kernel is booted_?=0A=
=0A=
Yes that's what I mean. The modules can be physically changed while the =0A=
kernel is running. The more common term might be hot-plug but for =0A=
whatever reason hot-swap has stuck as a term from our pre-linux days.=0A=
=0A=
If you don't mind the advertising this is the kind of system I'm talking =
=0A=
about:=0A=
=0A=
https://www.alliedtelesis.com/products/switches/x908-gen2=0A=
=0A=
Those modules can be replaced at run time and have various i2c and mdio =0A=
connections running to the base unit.=0A=
=0A=
=0A=
> If this is the case, then my suggestion of using the boot loader to=0A=
> apply the devicetree overlay is not sufficient.=0A=
=0A=
Correct. We did have another system that was still modular but not =0A=
hot-swappable (basically a late binding assembly). For that having the =0A=
bootloader manipulate the DTS before booting the kernel worked quite well.=
=0A=
=0A=
>>>> An example of what I'm doing is=0A=
>>>>=0A=
>>>>=0A=
>>>> arch/arm/boot/dts/Makefile:=0A=
>>>> DTC_FLAGS_myboard +=3D -@=0A=
>>>>=0A=
>>>> drivers/foo/Makefile:=0A=
>>>> obj-y +=3D myplugin.dtb.o=0A=
>>>> obj-y +=3D mydriver.o=0A=
>>>>=0A=
>>>> drivers/foo/myplugin.dts:=0A=
>>>> /dts-v1/;=0A=
>>>> /plugin/;=0A=
>>>> /{=0A=
>>>> 	fragment@0 {=0A=
>>>> 		target =3D <&i2c0>;=0A=
>>>> 		__overlay__ {=0A=
>>>> 			gpio@74 {=0A=
>>>> 				compatible =3D "nxp,pca9539";=0A=
>>>> 				reg =3D <0x74>=0A=
>>>> 			};=0A=
>>>> 		};=0A=
>>>> 	};=0A=
>>>> };=0A=
>>>=0A=
>>> The fragment and __overlay__ nodes are implementation, subject to=0A=
>>> change, and should not be hand coded.  The dtc compiler has added=0A=
>>> features to allow a more generic source code.  The above should be:=0A=
>>>=0A=
>>> // SPDX-License-Identifier: GPL-2.0=0A=
>>> /dts-v1/;=0A=
>>> /plugin/;=0A=
>>>=0A=
>>> &i2c0 {=0A=
>>> 	gpio@74 {=0A=
>>> 		compatible =3D "nxp,pca9539";=0A=
>>> 		reg =3D <0x74>;=0A=
>>> 	};=0A=
>>> };=0A=
>>>=0A=
>>> (Not compiled, not tested.)=0A=
>>>=0A=
>>> The rcar overlay sources were merged before dtc was updated to=0A=
>>> handle this new syntax, so they are not a good example for=0A=
>>> how to write an overlay.=0A=
>>=0A=
>> OK thanks. I suspected as much. I'll update my code based on your exampl=
e.=0A=
>>=0A=
=0A=
That worked quite well thanks. I'd be happy to add something to the =0A=
documentation as an example if you'd like.=0A=
=0A=
>>>> drivers/foo/mydriver.c:=0A=
>>>> extern uint8_t __dtb_myplugin_begin[];=0A=
>>>> extern uint8_t __dtb_myplugin_end[];=0A=
>>>>=0A=
>>>> int mydriver_probe(struct platform_device *pdev)=0A=
>>>> {=0A=
>>>> 	u32 size =3D __dtb_myplugin_end - __dtb_myplugin_begin;=0A=
>>>> 	int overlay_id;=0A=
>>>> 	int ret;=0A=
>>>> 	=0A=
>>>> 	ret =3D of_overlay_fdt_apply(__dtb_myplugin_begin,=0A=
>>>> 				   size, &overlay_id);=0A=
>>>> 	return ret;=0A=
>>>> }=0A=
>>>=0A=
>>> I'm guessing that you have simplified your use case to make it easier t=
o=0A=
>>> describe (thank you for that).  But that also makes it harder to unders=
tand=0A=
>>> the use case, and whether this is a good solution.  Can you describe yo=
ur=0A=
>>> use case in some more detail?=0A=
>>=0A=
>> As I said above we have a few different modular systems we're trying to=
=0A=
>> support. But they all do basically the same thing.=0A=
>>=0A=
>> The insertion of a module is detected based on a gpio line being asserte=
d.=0A=
>>=0A=
>> Then we identify what was just inserted, the details vary a little per=
=0A=
>> platform but in one instance we load an overlay that has instantiates an=
=0A=
>> i2c eeprom identifying the module.=0A=
>>=0A=
>> Once we know which specific module has been inserted based on the data=
=0A=
>> in the eeprom we load another overlay that instantiates the rest of the=
=0A=
>> devices on that module.=0A=
> =0A=
> As an alternate solution, could nodes for all of the possible modules be=
=0A=
> included in the devicetree, but disabled?  Then as modules are detected, =
the=0A=
> appropriate nodes could be enabled.  (This is a conceptual proposal - the=
=0A=
> implementation details might encounter issues, some of which are similar=
=0A=
> to the issues overlays face.)=0A=
=0A=
That is what I've ended up doing for the eeprom. It means I only have to =
=0A=
juggle one overlay.=0A=
=0A=
Having all the possible nodes is doable but it becomes as complicated as =
=0A=
manually instantiating the devices, either way you have to know about =0A=
what devices are there and where they fit on the base platform.=0A=
=0A=
>>>> The first issue is that I need to add -@ to the DTC_FLAGS for my board=
=0A=
>>>> dtb. I kind of understand that I only need -@ if my overlay targets=0A=
>>>> something symbolic so I might not need it but I was surprised that the=
re=0A=
>>>> wasn't a Kconfig option that makes this happen automatically.=0A=
>>>>=0A=
>>>> externing things in C files makes checkpatch.pl complain. I see the=0A=
>>>> of/unittests.c and rcar_du_of.c hide this with a macro. I was again=0A=
>>>> surprised that there wasn't a common macro to declare these.=0A=
>>>=0A=
>>> unittests.c should not be used as a model of how to code for devicetree=
.=0A=
>>> There are some hacks that are needed to be able to test, but should not=
=0A=
>>> be used by normal drivers.=0A=
>>>=0A=
>>> The rcar use of overlays is a temporary hack to provide backward=0A=
>>> compatibility.  The intent is to drop this code once the backward=0A=
>>> compatibility window ends.=0A=
>>=0A=
>> Yes I suspected as much.=0A=
>>=0A=
>>> The long-term intent (once enough of the overlay code is in place) is=
=0A=
>>> to provide an overlay loader than can apply an overlay .dtb from a file=
.=0A=
>>=0A=
>> Would that be a kernel helper or driven via udev?=0A=
> =0A=
> The implementation is TBD.  I would prefer to defer the implementation=0A=
> discussion until we are closer to being willing to accept a loader.=0A=
> =0A=
> -Frank=0A=
> =0A=
> =0A=
=0A=
