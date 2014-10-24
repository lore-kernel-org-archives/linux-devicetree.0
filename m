From: Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] bcm2835: add VideoCore Mailbox to the device tree
Date: Fri, 24 Oct 2014 16:53:22 +0100
Message-ID: <20141024155321.GF10395@x1>
References: <1414156805-30253-1-git-send-email-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1414156805-30253-1-git-send-email-lkundrak-NGH9Lh4a5iE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 24 Oct 2014, Lubomir Rintel wrote:

> Follows the generic Mailbox Controller bindings as documented in
> Documentation/devicetree/bindings/mailbox/mailbox.txt.
> 
> Signed-off-by: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
> Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> ---
>  arch/arm/boot/dts/bcm2835.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/bcm2835.dtsi b/arch/arm/boot/dts/bcm2835.dtsi
> index 3342cb1..bd046a9 100644
> --- a/arch/arm/boot/dts/bcm2835.dtsi
> +++ b/arch/arm/boot/dts/bcm2835.dtsi
> @@ -50,6 +50,13 @@
>  			#interrupt-cells = <2>;
>  		};
>  
> +		mailbox: mailbox@0x7e00b880 {

Remove the 0x.

> +			compatible = "brcm,bcm2835-mbox";
> +			reg = <0x7e00b880 0x40>;
> +			interrupts = <0 1>;

2 interrupts one cell right?  No flags?

> +			#mbox-cells = <1>;
> +		};
> +
>  		watchdog@7e100000 {
>  			compatible = "brcm,bcm2835-pm-wdt";
>  			reg = <0x7e100000 0x28>;
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
