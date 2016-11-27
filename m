From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: vf610-zii-dev-rev-b: Add missing newline
Date: Sun, 27 Nov 2016 22:17:27 +0100
Message-ID: <20161127211727.GB13318@lunn.ch>
References: <1480276484-5482-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1480276484-5482-1-git-send-email-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "David S . Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Nov 27, 2016 at 08:54:44PM +0100, Andreas Färber wrote:
> Found while reviewing Marvell dsa bindings usage.

Hi Andreas

It is good practice to put the maintainer you expect to accept the
patch on the To: line. You have at least two different maintainers on
Cc: so it is currently ambiguous. And these lists can be high volume,
so without a copy in the maintainers inbox, patches can be overlooked.

> Fixes: f283745b3caf ("arm: vf610: zii devel b: Add support for switch interrupts")
> Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
> Cc: David S. Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
> Signed-off-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>

Reviewed-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>

    Andrew


> ---
>  arch/arm/boot/dts/vf610-zii-dev-rev-b.dts | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/vf610-zii-dev-rev-b.dts b/arch/arm/boot/dts/vf610-zii-dev-rev-b.dts
> index 7ea617e47fe4..958b4c42d320 100644
> --- a/arch/arm/boot/dts/vf610-zii-dev-rev-b.dts
> +++ b/arch/arm/boot/dts/vf610-zii-dev-rev-b.dts
> @@ -153,7 +153,8 @@
>  					switch0phy1: switch1phy0@1 {
>  						reg = <1>;
>  						interrupt-parent = <&switch0>;
> -						interrupts = <1 IRQ_TYPE_LEVEL_HIGH>;					};
> +						interrupts = <1 IRQ_TYPE_LEVEL_HIGH>;
> +					};
>  					switch0phy2: switch1phy0@2 {
>  						reg = <2>;
>  						interrupt-parent = <&switch0>;
> -- 
> 2.6.6
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
