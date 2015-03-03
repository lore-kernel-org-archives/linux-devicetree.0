From: Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 03/10] ARM: bcm2835: Add the mailbox to the device tree.
Date: Tue, 3 Mar 2015 08:34:24 +0000
Message-ID: <20150303083424.GH6976@x1>
References: <1425329684-23968-1-git-send-email-eric@anholt.net>
 <1425329684-23968-4-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1425329684-23968-4-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 02 Mar 2015, Eric Anholt wrote:

> Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
> ---
>  arch/arm/boot/dts/bcm2835.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)

Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>


> diff --git a/arch/arm/boot/dts/bcm2835.dtsi b/arch/arm/boot/dts/bcm2835.dtsi
> index 3342cb1..6b5c3a1 100644
> --- a/arch/arm/boot/dts/bcm2835.dtsi
> +++ b/arch/arm/boot/dts/bcm2835.dtsi
> @@ -60,6 +60,13 @@
>  			reg = <0x7e104000 0x10>;
>  		};
>  
> +		mailbox: mailbox@7e00b800 {
> +			compatible = "brcm,bcm2835-mbox";
> +			reg = <0x7e00b880 0x40>;
> +			interrupts = <0 1>;
> +			#mbox-cells = <1>;
> +		};
> +
>  		gpio: gpio@7e200000 {
>  			compatible = "brcm,bcm2835-gpio";
>  			reg = <0x7e200000 0xb4>;
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
