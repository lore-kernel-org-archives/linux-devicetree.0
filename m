From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v7 3/4] ARM: mediatek: Add sysirq in mt6589/mt8135/mt8127 dtsi
Date: Wed, 19 Nov 2014 17:49:49 +0000
Message-ID: <87d28jaxmq.fsf@approximate.cambridge.arm.com>
References: <1416406451-4578-1-git-send-email-yingjoe.chen@mediatek.com>
	<1416406451-4578-4-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416406451-4578-4-git-send-email-yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
	(Yingjoe Chen's message of "Wed, 19 Nov 2014 14:14:10 +0000")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "hc.yen@mediatek.com" <hc.yen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "srv_heupstream@mediatek.com" <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "yh.chen@mediatek.com" <yh.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-kernel@vger.kernel.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "grant.likely@linaro.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yijing Wang <wangyijing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "nathan.chung@mediatek.com" <nathan.chung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "yingjoe.chen@gmail.com" <yingjoe.chen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "eddie.huang@mediatek.com" <eddie.huang@me>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 19 2014 at  2:14:10 pm GMT, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> Add sysirq settings for mt6589/mt8135/mt8127
> This also correct timer interrupt flag. The old setting works
> because boot loader already set polarity for timer interrupt.
> Without intpol support, the setting was not changed so gic
> can get the irq correctly.
>
> Signed-off-by: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm/boot/dts/mt6589.dtsi | 14 ++++++++++++--
>  arch/arm/boot/dts/mt8127.dtsi | 14 ++++++++++++--
>  arch/arm/boot/dts/mt8135.dtsi | 14 ++++++++++++--
>  3 files changed, 36 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm/boot/dts/mt6589.dtsi b/arch/arm/boot/dts/mt6589.dtsi
> index e3c7600..c91b2a9 100644
> --- a/arch/arm/boot/dts/mt6589.dtsi
> +++ b/arch/arm/boot/dts/mt6589.dtsi
> @@ -19,7 +19,7 @@
>  
>  / {
>  	compatible = "mediatek,mt6589";
> -	interrupt-parent = <&gic>;
> +	interrupt-parent = <&sysirq>;

This worries me a bit. Your sysirq cannot handle PPIs, and yet you make
it the top-level interrupt controller, without amending any PPI.

Does it mean you do not use *any* PPI? No per-cpu timer, nothing?

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
