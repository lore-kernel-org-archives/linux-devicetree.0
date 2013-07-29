Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:43280 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754600Ab3G2V7a (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Mon, 29 Jul 2013 17:59:30 -0400
Message-ID: <51F6E5BE.3080400@wwwdotorg.org>
Date: Mon, 29 Jul 2013 15:59:26 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [RFC] binding for nvec mfd device
References: <1416005.VvfEeGuSWa@ax5200p>
In-Reply-To: <1416005.VvfEeGuSWa@ax5200p>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Marc Dietrich <marvin24@gmx.de>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-tegra@vger.kernel.org, Andrey Danin <danindrey@mail.ru>, Ian Campbell <ian.campbell@citrix.com>, Mark Rutland <Mark.Rutland@arm.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>
List-ID: <devicetree@vger.kernel.org>

(Also Cc'ing the DT binding maintainers and hence quoting this in full)

On 07/27/2013 07:23 AM, Marc Dietrich wrote:
> Hi,
> 
> this is an RFC for an mfd device introduced here [1]. I didn't got much 
> response, except from Stephen, but that bothered me enough already ;-)
> 
> I'm going describe the hw again shortly, for a more complete description, see 
> [1]. What we have here is an EC which communicates to the host cpu (NVIDIA 
> Tegra) via I2C. The unusual part is that the EC is I2C master while the host 
> cpu is the slave. The EC has several ports to connect peripherals like 
> keyboard, mouse, ... and also to control some system states (suspend, low bat, 
> power key, ...). Ok, so much for the hardware description, now the binding. I 
> think I integrated all comments made by Stephen in [2].
> 
> i2c-slave@7000c500 { 
> 	compatible = "nvidia,tegra20-i2c-slave", "simple-bus";

Thinking more about this, I don't think simple-bus is appropriate here,
for the same reasons that i2c-master bindings don't specify simple-bus here.

"simple-bus" is usually used in a case where the node in question is
pretty much just a simple aggregation of some child nodes, and the child
nodes are the same "type" of node as the node that is the simple-bus.
For example, when grouping a variety of memory-mapped peripherals
together to provide some structure to a larger memory-mapped bus,
perhaps with a "ranges" property etc. to do some remapping. In this
case, the child nodes are basically independent of the simple-bus node,
just relying on it for a bit of DT parsing, but not at run-time.

In this case, the child nodes are a different type of object, and we
really need the driver for the i2c-slave node to know how to handle the
child nodes; we can't just go an instantiate them
directly/independently, and plug the devices into the bus that contains
the i2c-slave.

One question I have here: There is a single I2C HW module on Tegra that
can act either as a master or a slave. I don't think it can do both at
once. Should we:

a) Have a different compatible property for each use-case

b) Use the same compatible property (after all, the same HW module is
there in either case), yet have some kind of flag which tells the driver
whether to act as a master or slave. This flag could be standardized and
used by any binding for a "dual role" I2C controller.

I think it's reasonable to go with a separate compatible value in this
case, but I wonder if anyone wants to argue against it?

> 	reg = <0x7000c500 0x100>; 
> 	interrupts = <0 92 0x04>; 
> 	#address-cells = <1>; 
> 	#size-cells = <0>; 
> 	clock-frequency = <80000>; 
> 	clocks = <&tegra_car 67>, <&tegra_car 124>; 
> 	clock-names = "div-clk", "fast-clk"; 
> 
> 	nvec@87 { 
> 		compatible = "nvidia,nvec", "simple-bus"; 

Similarly here, I would drop simple-bus.

> 		reg = <0x87>;
> 		request-gpios = <&gpio 170 0>; /* gpio PV2 */ 

Nit: We should s/170/TEGRA_GPIO(V, 2)/ in the final *.dts file, and then
we can drop that comment.

> 		keyboard { 
> 			compatible = "nvidia,nvec-keyboard";
> 			...
> 			<insert key mappings here>
> 			...
> 		}; 
> 
> 		ps2 {
> 			compatible = "nvidia,nvec-ps2";
> 			packet-size = 6; /* for the ac100 tp */
> 		};
> 
> 		events {
> 			compatible = "nvidia,nvec-events";
> 			...
> 			<add some system events here, 
> 				e.g. lid switch, power button>
> 			...
> 		};
> 
> 		charger: ac {
> 			compatible = "nvidia,nvec-ac";
> 		};
> 
> 		battery {
> 			compatible = "nvidia,nvec-battery";
> 			charger = <&charger>;
>        	};
> 
> 		oem {
> 			compatible = "compal,nvec-paz00";
> 			/* ac100 specific extentions to the protocol */
> 		};
> 	}; 
> }; 

To me, this seems like a reasonable binding.

> For multi-slave capable SoCs, there can be more than one master connected to 
> the i2c slave controller of the host cpu. Therefore I added "simple-bus" 
> property here. Does "simple-bus" imply bus addresses?

This binding doesn't describe the external masters, so I'm not sure how
the presence or lack of them affects the binding at all. I argue against
using simple-bus above; the bus is not "simple".

> The EC registers with
> the slave controller by supplying the protocol (e.g. smbus or i2c) and an 
> optional gpio.

I don't think "the EC registers ...", but rather "the driver for the EC
protocol registers ..."

I don't think the optional GPIO would be provided to the I2C slave
controller in any way; handling of the GPIO is purely part of the NVEC
protocol driver, not the I2C slave driver.

> I left out the binding description for now because the properties are pretty 
> much self-describing. The current driver is in staging so everything is still 
> in flux.
> 
> Marc
> 
> [1] http://www.mail-archive.com/devicetree-
> discuss@lists.ozlabs.org/msg35636.html
> [2] http://u-boot.10912.n7.nabble.com/PATCH-0-3-ARM-tegra-add-nvec-keyboard-
> support-for-paz00-td159690.html

