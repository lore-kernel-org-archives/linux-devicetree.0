From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 4/5] pinctrl: dt-binding: Extend meson documentation
 with GPIO IRQs support
Date: Mon, 23 Nov 2015 17:47:20 -0600
Message-ID: <20151123234720.GA879@rob-hp-laptop>
References: <1448273816-11290-1-git-send-email-carlo@caione.org>
 <1448273816-11290-5-git-send-email-carlo@caione.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1448273816-11290-5-git-send-email-carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, drake-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, jerry.cao-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, victor.wan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 23, 2015 at 11:16:55AM +0100, Carlo Caione wrote:
> From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
> 
> Extend the pinctrl binding documentation with the support for external
> GPIO interrupts.
> 
> Signed-off-by: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
> index 3f6a524..56743eb 100644
> --- a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
> @@ -3,6 +3,12 @@
>  Required properties for the root node:
>   - compatible: "amlogic,meson8-pinctrl" or "amlogic,meson8b-pinctrl"
>   - reg: address and size of registers controlling irq functionality
> + - reg-names: should be "irq"

You don't really need names when there is only one. Otherwise:

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> + - interrupt-controller: marks the device node as an interrupt controller
> + - #interrupt-cells: should be 2. The first cell is the GPIO number. The
> +		     second cell is used to specify trigger type.
> + - interrupts: specifies the GPIO IRQ numbers on the GIC (GPIO_IRQ#)
> + - interrupt-parent: specifies the parent interrupt controller.
>  
>  === GPIO sub-nodes ===
>  
> @@ -46,7 +52,13 @@ pinctrl-bindings.txt
>  
>  	pinctrl: pinctrl@c1109880 {
>  		compatible = "amlogic,meson8-pinctrl";
> +		reg-names = "irq";
>  		reg = <0xc1109880 0x10>;
> +		interrupt-parent = <&gic>;
> +		interrupts = <0 64 1>, <0 65 1>, <0 66 1>, <0 67 1>,
> +			     <0 68 1>, <0 69 1>, <0 70 1>, <0 71 1>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		ranges;
> -- 
> 2.5.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
