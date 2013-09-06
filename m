From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 05/11] usb: usb: dsps: update code according to the
 binding document
Date: Fri, 6 Sep 2013 16:01:41 +0100
Message-ID: <20130906150141.GY18206@e106331-lin.cambridge.arm.com>
References: <1377016553-26478-1-git-send-email-bigeasy@linutronix.de>
 <1377016553-26478-6-git-send-email-bigeasy@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1377016553-26478-6-git-send-email-bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 20, 2013 at 05:35:47PM +0100, Sebastian Andrzej Siewior wrote:
> This relfects the code and dts requires changes due to recent .dts
> binding updates:
> - use mg prefix for the Metor Graphics specific attributes
> - use power in mA not in mA/2 as specifed in the USB2.0 specification
> - remove the child node for USB. This is driver specific on won't be
>   reflected in the device tree
> - use the "mentor" prefix instead of "mg".
> - use "dr_mode" istead of "mg,port-mode" for the port mode. The former
>   is used by a few other drivers.
> 
> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> Cc: Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/am335x-bone.dts  |  2 +-
>  arch/arm/boot/dts/am335x-evm.dts   |  6 ++--
>  arch/arm/boot/dts/am335x-evmsk.dts |  2 +-
>  arch/arm/boot/dts/am33xx.dtsi      | 67 +++++++++++++++-----------------------
>  drivers/usb/musb/musb_dsps.c       | 54 ++++++++++++++++++++----------
>  5 files changed, 67 insertions(+), 64 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/am335x-bone.dts b/arch/arm/boot/dts/am335x-bone.dts
> index a8907b5..e8447a7 100644
> --- a/arch/arm/boot/dts/am335x-bone.dts
> +++ b/arch/arm/boot/dts/am335x-bone.dts
> @@ -127,7 +127,7 @@
>  				status = "okay";
>  			};
>  
> -			phy@47401300 {
> +			usb-phy@47401300 {
>  				status = "okay";
>  			};
>  
> diff --git a/arch/arm/boot/dts/am335x-evm.dts b/arch/arm/boot/dts/am335x-evm.dts
> index c26c16c..648a67e 100644
> --- a/arch/arm/boot/dts/am335x-evm.dts
> +++ b/arch/arm/boot/dts/am335x-evm.dts
> @@ -178,11 +178,11 @@
>  				status = "okay";
>  			};
>  
> -			phy@47401300 {
> +			usb-phy@47401300 {
>  				status = "okay";
>  			};
>  
> -			phy@47401b00 {
> +			usb-phy@47401b00 {
>  				status = "okay";
>  			};
>  
> @@ -194,7 +194,7 @@
>  				status = "okay";
>  			};
>  
> -			dma@07402000  {
> +			dma-controller@07402000  {
>  				status = "okay";
>  			};
>  		};
> diff --git a/arch/arm/boot/dts/am335x-evmsk.dts b/arch/arm/boot/dts/am335x-evmsk.dts
> index e92446c..a6c5033 100644
> --- a/arch/arm/boot/dts/am335x-evmsk.dts
> +++ b/arch/arm/boot/dts/am335x-evmsk.dts
> @@ -214,7 +214,7 @@
>  				status = "okay";
>  			};
>  
> -			phy@47401300 {
> +			usb-phy@47401300 {
>  				status = "okay";
>  			};
>  
> diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
> index a38f8d3..f9c5da9 100644
> --- a/arch/arm/boot/dts/am33xx.dtsi
> +++ b/arch/arm/boot/dts/am33xx.dtsi
> @@ -354,7 +354,7 @@
>  				status = "disabled";
>  			};
>  
> -			usb0_phy: phy@47401300 {
> +			usb0_phy: usb-phy@47401300 {
>  				compatible = "ti,am335x-usb-phy";
>  				reg = <0x47401300 0x100>;
>  				reg-names = "phy";
> @@ -364,25 +364,19 @@
>  
>  			usb0: usb@47401000 {
>  				compatible = "ti,musb-am33xx";
> -				ranges;
> -				#address-cells = <1>;
> -				#size-cells = <1>;
> -				reg = <0x47401000 0x200>;
> -				reg-names = "control";
>  				status = "disabled";
> -
> -				musb0: usb@47401400 {
> -					compatible = "mg,musbmhdrc";
> -					reg = <0x47401400 0x400>;
> -					reg-names = "mc";
> -					interrupts = <18>;
> -					interrupt-names = "mc";
> -					multipoint = <1>;
> -					num-eps = <16>;
> -					ram-bits = <12>;
> -					port-mode = <3>;
> -					power = <250>;
> -					phys = <&usb0_phy>;
> +				reg = <0x47401400 0x400
> +					0x47401000 0x200>;
> +				reg-names = "mc", "control";
> +
> +				interrupts = <18>;
> +				interrupt-names = "mc";
> +				dr_mode = "otg";
> +				mentor,multipoint = <1>;
> +				mentor,num-eps = <16>;
> +				mentor,ram-bits = <12>;
> +				mentor,power = <500>;
> +				phys = <&usb0_phy>;
>  
>  				dmas = <&cppi41dma  0 0 &cppi41dma  1 0
>  					&cppi41dma  2 0 &cppi41dma  3 0
> @@ -406,10 +400,9 @@
>  					"tx1", "tx2", "tx3", "tx4", "tx5", "tx6", "tx7",
>  					"tx8", "tx9", "tx10", "tx11", "tx12", "tx13",
>  					"tx14", "tx15";
> -				};
>  			};
>  
> -			usb1_phy: phy@47401b00 {
> +			usb1_phy: usb-phy@47401b00 {
>  				compatible = "ti,am335x-usb-phy";
>  				reg = <0x47401b00 0x100>;
>  				reg-names = "phy";
> @@ -419,25 +412,18 @@
>  
>  			usb1: usb@47401800 {
>  				compatible = "ti,musb-am33xx";
> -				ranges;
> -				#address-cells = <1>;
> -				#size-cells = <1>;
> -				reg = <0x47401800 0x200>;
> -				reg-names = "control";
>  				status = "disabled";
> -
> -				musb1: usb@47401c00 {
> -					compatible = "mg,musbmhdrc";
> -					reg = <0x47401c00 0x400>;
> -					reg-names = "mc";
> -					interrupts = <19>;
> -					interrupt-names = "mc";
> -					multipoint = <1>;
> -					num-eps = <16>;
> -					ram-bits = <12>;
> -					port-mode = <3>;
> -					power = <250>;
> -					phys = <&usb1_phy>;
> +				reg = <0x47401c00 0x400
> +					0x47401800 0x200>;
> +				reg-names = "mc", "control";
> +				interrupts = <19>;
> +				interrupt-names = "mc";
> +				dr_mode = "otg";
> +				mentor,multipoint = <1>;
> +				mentor,num-eps = <16>;
> +				mentor,ram-bits = <12>;
> +				mentor,power = <500>;
> +				phys = <&usb1_phy>;
>  
>  				dmas = <&cppi41dma 15 0 &cppi41dma 16 0
>  					&cppi41dma 17 0 &cppi41dma 18 0
> @@ -461,10 +447,9 @@
>  					"tx1", "tx2", "tx3", "tx4", "tx5", "tx6", "tx7",
>  					"tx8", "tx9", "tx10", "tx11", "tx12", "tx13",
>  					"tx14", "tx15";
> -				};
>  			};
>  
> -			cppi41dma: dma@07402000 {
> +			cppi41dma: dma-controller@07402000 {
>  				compatible = "ti,am3359-cppi41";
>  				reg =  <0x47400000 0x1000
>  					0x47402000 0x1000
> diff --git a/drivers/usb/musb/musb_dsps.c b/drivers/usb/musb/musb_dsps.c
> index 4ffbaac..5b007d1 100644
> --- a/drivers/usb/musb/musb_dsps.c
> +++ b/drivers/usb/musb/musb_dsps.c
> @@ -44,6 +44,7 @@
>  #include <linux/of_device.h>
>  #include <linux/of_address.h>
>  #include <linux/of_irq.h>
> +#include <linux/usb/of.h>
>  
>  #include "musb_core.h"
>  
> @@ -425,35 +426,51 @@ static int get_int_prop(struct device_node *dn, const char *s)
>  	return val;
>  }
>  
> +static int get_musb_port_mode(struct device *dev)
> +{
> +	enum usb_dr_mode mode;
> +
> +	mode = of_usb_get_dr_mode(dev->of_node);
> +	switch (mode) {
> +	case USB_DR_MODE_HOST:
> +		return MUSB_PORT_MODE_HOST;
> +
> +	case USB_DR_MODE_PERIPHERAL:
> +		return MUSB_PORT_MODE_GADGET;
> +
> +	case USB_DR_MODE_UNKNOWN:
> +	case USB_DR_MODE_OTG:
> +	default:
> +		return MUSB_PORT_MODE_DUAL_ROLE;
> +	};
> +}
> +
>  static int dsps_create_musb_pdev(struct dsps_glue *glue,
>  		struct platform_device *parent)
>  {
>  	struct musb_hdrc_platform_data pdata;
>  	struct resource	resources[2];
> +	struct resource	*res;
>  	struct device *dev = &parent->dev;
>  	struct musb_hdrc_config	*config;
>  	struct platform_device *musb;
>  	struct device_node *dn = parent->dev.of_node;
> -	struct device_node *child_node;
>  	int ret;
>  
> -	child_node = of_get_child_by_name(dn, "usb");
> -	if (!child_node)
> -		return -EINVAL;
> -
>  	memset(resources, 0, sizeof(resources));
> -	ret = of_address_to_resource(child_node, 0, &resources[0]);
> -	if (ret) {
> +	res = platform_get_resource_byname(parent, IORESOURCE_MEM, "mc");
> +	if (!res) {
>  		dev_err(dev, "failed to get memory.\n");
> -		return ret;
> +		return -EINVAL;
>  	}
> +	resources[0] = *res;
>  
> -	ret = of_irq_to_resource(child_node, 0, &resources[1]);
> -	if (ret == 0) {
> +	res = platform_get_resource_byname(parent, IORESOURCE_IRQ, "mc");
> +	if (!res) {
>  		dev_err(dev, "failed to get irq.\n");
> -		ret = -EINVAL;
> -		return ret;
> +		return -EINVAL;
>  	}
> +	resources[1] = *res;
>  
>  	/* allocate the child platform device */
>  	musb = platform_device_alloc("musb-hdrc", PLATFORM_DEVID_AUTO);
> @@ -465,7 +482,7 @@ static int dsps_create_musb_pdev(struct dsps_glue *glue,
>  	musb->dev.parent		= dev;
>  	musb->dev.dma_mask		= &musb_dmamask;
>  	musb->dev.coherent_dma_mask	= musb_dmamask;
> -	musb->dev.of_node		= of_node_get(child_node);
> +	musb->dev.of_node		= of_node_get(dn);
>  
>  	glue->musb = musb;
>  
> @@ -485,11 +502,12 @@ static int dsps_create_musb_pdev(struct dsps_glue *glue,
>  	pdata.config = config;
>  	pdata.platform_ops = &dsps_ops;
>  
> -	config->num_eps = get_int_prop(child_node, "num-eps");
> -	config->ram_bits = get_int_prop(child_node, "ram-bits");
> -	pdata.mode = get_int_prop(child_node, "port-mode");
> -	pdata.power = get_int_prop(child_node, "power");
> -	config->multipoint = of_property_read_bool(child_node, "multipoint");
> +	config->num_eps = get_int_prop(dn, "mentor,num-eps");
> +	config->ram_bits = get_int_prop(dn, "mentor,ram-bits");
> +	pdata.mode = get_musb_port_mode(dev);
> +	/* DT keeps this entry in mA, musb expects it as per USB spec */
> +	pdata.power = get_int_prop(dn, "mentor,power") / 2;

Surely this will break existing DTs (the driver will decide they operate
at half the mA the old dt described)?

Thanks,
Mark.

> +	config->multipoint = of_property_read_bool(dn, "mentor,multipoint");

So this is a boolean property, as I asked in my last reply.

In DTs this can be:

	mentor,multipoint;

Rather than:

	mentor,multipoint = <1>;

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
