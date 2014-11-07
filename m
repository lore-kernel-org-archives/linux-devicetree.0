From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 03/13] ARM: STi: DT: STiH416: Add DT nodes for the ehci and ohci usb controllers.
Date: Fri, 07 Nov 2014 13:08:57 +0100
Message-ID: <2945908.5UNg8NaKcc@wuerfel>
References: <1415361475-6218-1-git-send-email-peter.griffin@linaro.org> <1415361475-6218-4-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415361475-6218-4-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 07 November 2014 11:57:45 Peter Griffin wrote:
> diff --git a/arch/arm/boot/dts/stih416.dtsi b/arch/arm/boot/dts/stih416.dtsi
> index 0f3019a..6238d9e 100644
> --- a/arch/arm/boot/dts/stih416.dtsi
> +++ b/arch/arm/boot/dts/stih416.dtsi
> @@ -325,5 +325,149 @@
>                         clock-names = "osc_phy";
>  
>                 };
> +
> +               ehci0: usb@0xfe1ffe00 {

Please drop the '0x' from the unit address in all instances.

> +                       compatible = "st,st-ehci-300x";
> +                       reg = <0xfe1ffe00 0x100>;
> +                       interrupts = <GIC_SPI 148 IRQ_TYPE_NONE>;
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&pinctrl_usb0>;
> +                       clocks = <&clk_s_a1_ls 0>,
> +                                <&clockgen_b0 0>;
> +                       clock-names = "ic", "clk48";
> +
> +                       phys = <&usb2_phy>;
> +                       phy-names = "usb";
> +                       status = "okay";

No need to list 'status="okay"', it's the default. It might
make sense to change this to 'status="disabled"' though, if the ports
might be unused on some boards.

>                 mmc0: sdhci@fe81e000 {
>                         bus-width = <8>;
>                 };
> +
> +               usb0: usb@fe100000 {
> +                       status = "okay";
> +               };
> +
> +               usb1: usb@fe200000 {
> +                       status = "okay";
> +               };
> +
> +               usb2: usb@fe300000 {
> +                       status = "okay";
> +               };

I don't understand this part: why do you add extra nodes here that only
contain a status property?

Note that if you add the devices to the per-soc file instead of the
per-board file, you can just access the nodes by label.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
