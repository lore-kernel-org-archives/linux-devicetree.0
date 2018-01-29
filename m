From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/4] rtc: isl1208: add support for isl1219 with hwmon for
 tamper detection
Date: Mon, 29 Jan 2018 17:41:46 -0600
Message-ID: <20180129234146.73hvclxohhme5i2w@rob-hp-laptop>
References: <20180123121801.4214-1-m.grzeschik@pengutronix.de>
 <20180123121801.4214-5-m.grzeschik@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180123121801.4214-5-m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, jdelvare-IBi9RG/b67k@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Denis.Osterland-85mDkmTllUAAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 23, 2018 at 01:18:01PM +0100, Michael Grzeschik wrote:
> We add support for the ISL1219 chip that got an integrated tamper
> detection function. This patch implements the feature by using an hwmon
> interface.
> 
> The ISL1219 can also describe the timestamp of the intrusion
> event. For this we add the documentation of the new interface
> intrusion[0-*]_timestamp.
> 
> The devicetree documentation for the ISL1219 device tree
> binding is added with an short example.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: Denis Osterland <Denis.Osterland-85mDkmTllUAAvxtiuMwx3w@public.gmane.org>
> ---
>  .../rtc/{intersil,isl1208.txt => isil,isl1208.txt} |  18 +-
>  Documentation/hwmon/sysfs-interface                |   7 +
>  drivers/rtc/rtc-isl1208.c                          | 190 +++++++++++++++++++--
>  3 files changed, 201 insertions(+), 14 deletions(-)
>  rename Documentation/devicetree/bindings/rtc/{intersil,isl1208.txt => isil,isl1208.txt} (57%)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/intersil,isl1208.txt b/Documentation/devicetree/bindings/rtc/isil,isl1208.txt
> similarity index 57%
> rename from Documentation/devicetree/bindings/rtc/intersil,isl1208.txt
> rename to Documentation/devicetree/bindings/rtc/isil,isl1208.txt
> index a54e99feae1ca..d549699e1cfc4 100644
> --- a/Documentation/devicetree/bindings/rtc/intersil,isl1208.txt
> +++ b/Documentation/devicetree/bindings/rtc/isil,isl1208.txt
> @@ -1,14 +1,21 @@
> -Intersil ISL1208, ISL1218 I2C RTC/Alarm chip
> +Intersil ISL1208, ISL1218, ISL1219 I2C RTC/Alarm chip
>  
>  ISL1208 is a trivial I2C device (it has simple device tree bindings,
>  consisting of a compatible field, an address and possibly an interrupt
>  line).
>  
> +ISL1219 supports tamper detection user space representation through
> +case intrusion hwmon sensor.

User space and hwmon are Linux details not relevant to the binding. Just 
describe the h/w.

> +ISL1219 has additional pins EVIN and #EVDET for tamper detection.
> +I2C devices support only one irq. #IRQ and #EVDET are open-drain active low,
> +so it is possible layout them to one SoC pin with pull-up.
> +
>  Required properties supported by the device:
>  
>   - "compatible": must be one of
>  	"isil,isl1208"
>  	"isil,isl1218"
> +	"isil,isl1219"
>   - "reg": I2C bus address of the device
>  
>  Optional properties:
> @@ -33,3 +40,12 @@ Example isl1208 node with #IRQ pin connected to SoC gpio1 pin 12:
>  		interrupt-parent = <&gpio1>;
>  		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
>  	};
> +
> +Example isl1219 node with #IRQ pin and #EVDET pin connected to SoC gpio1 pin 12:
> +
> +	isl1219: isl1219@68 {
> +		compatible = "intersil,isl1219";
> +		reg = <0x68>;
> +		interrupts-extended = <&gpio1 12 IRQ_TYPE_EDGE_FALLING>;

With 2 interrupts, you should have 2 values. If they are connected 
together, just repeat the connection. Otherwise, you can't tell if EVDET 
is a no connect.

There's not much point in having an example for every compatible. This 
binding is simple enough, one should be enough.

> +	};
> +
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
