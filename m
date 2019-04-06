From: Rob Herring <robh@kernel.org>
Subject: Re: Using device tree overlays in Linux
Date: Sat, 06 Apr 2019 01:07:16 -0500
Message-ID: <5ca84216.1c69fb81.3205c.592c@mx.google.com>
References: <71fb0ff289e84c55bd92ecd96bc9aa76@svr-chch-ex1.atlnz.lc>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <71fb0ff289e84c55bd92ecd96bc9aa76@svr-chch-ex1.atlnz.lc>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: "pantelis.antoniou@konsulko.com" <pantelis.antoniou@konsulko.com>, "frowand.list@gmail.com" <frowand.list@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hamish Martin <Hamish.Martin@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 04, 2019 at 01:50:20AM +0000, Chris Packham wrote:
> Hi,
> 
> I'm implementing support for some modular Linux based systems using 
> device tree overlays. The code is working but it seems a little more 
> fiddly that than it should be so I'm wondering if I'm doing it right.
> 
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
> 
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
> 
> 
> The first issue is that I need to add -@ to the DTC_FLAGS for my board 
> dtb. I kind of understand that I only need -@ if my overlay targets 
> something symbolic so I might not need it but I was surprised that there 
> wasn't a Kconfig option that makes this happen automatically.

Whether overlays make sense or are needed are per board.

You could add a kconfig entry that drivers which depend on overlays 
select, but turning on '-@' has to be per board (or SoC family if the 
SoC maintainer is okay with that).

> externing things in C files makes checkpatch.pl complain. I see the 
> of/unittests.c and rcar_du_of.c hide this with a macro. I was again 
> surprised that there wasn't a common macro to declare these.

Feel free to propose something. There just aren't that many cases that 
anyone has cared what checkpatch says.

Rob
