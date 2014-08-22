From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 4/6] powerpc/85xx: Change vendor prefix for Intersil
 Corporation to isil
Date: Thu, 21 Aug 2014 22:12:47 -0500
Message-ID: <CAL_JsqK3Wi9b=7w=Npu3HN8SSkyFgVT0Qoc48LUyoiEaBjSCTA@mail.gmail.com>
References: <1408524184-31928-1-git-send-email-p.zabel@pengutronix.de> <1408524184-31928-5-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1408524184-31928-5-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 20, 2014 at 3:43 AM, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> Currently there is a wild mixture of isl, isil, and intersil
> compatibles in the kernel. At this point, changing the vendor
> symbol to the most often used variant, which is equal to the
> NASDAQ symbol, isil, should not hurt, since the isl1208 driver
> doesn't care either way.
>
> Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  arch/powerpc/boot/dts/ppa8548.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/boot/dts/ppa8548.dts b/arch/powerpc/boot/dts/ppa8548.dts
> index 27b0699..000262b 100644
> --- a/arch/powerpc/boot/dts/ppa8548.dts
> +++ b/arch/powerpc/boot/dts/ppa8548.dts
> @@ -89,7 +89,7 @@
>  &soc {
>         i2c@3000 {
>                 rtc@6f {
> -                       compatible = "intersil,isl1208";
> +                       compatible = "isil,isl1208";

This is a mature platform. You cannot change it. You can add the new
string, but the dts and kernel need both strings.

I would just leave it all alone and add the new prefix and mark the
others deprecated.

Rob

>                         reg = <0x6f>;
>                 };
>         };
> --
> 2.1.0.rc1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
