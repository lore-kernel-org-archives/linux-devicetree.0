From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: Using device tree overlays in Linux
Date: Sun, 7 Apr 2019 18:05:15 -0700
Message-ID: <61185ee9-4bee-eec3-f0d0-6d6760595845@gmail.com>
References: <71fb0ff289e84c55bd92ecd96bc9aa76@svr-chch-ex1.atlnz.lc>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <71fb0ff289e84c55bd92ecd96bc9aa76@svr-chch-ex1.atlnz.lc>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>, "pantelis.antoniou@konsulko.com" <pantelis.antoniou@konsulko.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hamish Martin <Hamish.Martin@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

Hi Chris,

On 4/3/19 6:50 PM, Chris Packham wrote:
> Hi,
> 
> I'm implementing support for some modular Linux based systems using 
> device tree overlays. The code is working but it seems a little more 
> fiddly that than it should be so I'm wondering if I'm doing it right.

Let me start by saying that I strongly discourage using device tree
overlays in the Linux kernel until the support is more baked.  For
some info on how unbaked overlays are, see:

   https://elinux.org/Frank%27s_Evolving_Overlay_Thoughts

You should consider applying overlays in the Linux kernel to be
fragile at best.

If you can not figure out how to solve your needs without using
overlays, then having the boot loader apply the overlay instead
of the kernel applying the overlay avoids most of the issues.


> An example of what I'm doing is
> 
> 
> arch/arm/boot/dts/Makefile:
> DTC_FLAGS_myboard += -@
> 
> drivers/foo/Makefile:
> obj-y += myplugin.dtb.o
> obj-y += mydriver.o
> 
> drivers/foo/myplugin.dts:
> /dts-v1/;
> /plugin/;
> /{
> 	fragment@0 {
> 		target = <&i2c0>;
> 		__overlay__ {
> 			gpio@74 {
> 				compatible = "nxp,pca9539";
> 				reg = <0x74>
> 			};
> 		};
> 	};
> };

The fragment and __overlay__ nodes are implementation, subject to
change, and should not be hand coded.  The dtc compiler has added
features to allow a more generic source code.  The above should be:

// SPDX-License-Identifier: GPL-2.0
/dts-v1/;
/plugin/;

&i2c0 {
	gpio@74 {
		compatible = "nxp,pca9539";
		reg = <0x74>;
	};
};

(Not compiled, not tested.)

The rcar overlay sources were merged before dtc was updated to
handle this new syntax, so they are not a good example for
how to write an overlay.


> drivers/foo/mydriver.c:
> extern uint8_t __dtb_myplugin_begin[];
> extern uint8_t __dtb_myplugin_end[];
> 
> int mydriver_probe(struct platform_device *pdev)
> {
> 	u32 size = __dtb_myplugin_end - __dtb_myplugin_begin;
> 	int overlay_id;
> 	int ret;
> 	
> 	ret = of_overlay_fdt_apply(__dtb_myplugin_begin,
> 				   size, &overlay_id);
> 	return ret;
> }

I'm guessing that you have simplified your use case to make it easier to
describe (thank you for that).  But that also makes it harder to understand
the use case, and whether this is a good solution.  Can you describe your
use case in some more detail?


> The first issue is that I need to add -@ to the DTC_FLAGS for my board 
> dtb. I kind of understand that I only need -@ if my overlay targets 
> something symbolic so I might not need it but I was surprised that there 
> wasn't a Kconfig option that makes this happen automatically.
> 
> externing things in C files makes checkpatch.pl complain. I see the 
> of/unittests.c and rcar_du_of.c hide this with a macro. I was again 
> surprised that there wasn't a common macro to declare these.

unittests.c should not be used as a model of how to code for devicetree.
There are some hacks that are needed to be able to test, but should not
be used by normal drivers.

The rcar use of overlays is a temporary hack to provide backward
compatibility.  The intent is to drop this code once the backward
compatibility window ends.

The long-term intent (once enough of the overlay code is in place) is
to provide an overlay loader than can apply an overlay .dtb from a file.

-Frank
