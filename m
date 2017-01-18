From: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: DTS: Fix register map for virt-capable GIC
Date: Wed, 18 Jan 2017 11:57:40 +0000
Message-ID: <aa0cb86e-ede2-432b-6248-92679fc06578@arm.com>
References: <1484736811-24002-1-git-send-email-marc.zyngier@arm.com>
 <1484736811-24002-3-git-send-email-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1484736811-24002-3-git-send-email-marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tsahee Zidenberg <tsahee-IEYhy/pPZWng2XuLRlxkFAC/G2K4zDHf@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre>
List-Id: devicetree@vger.kernel.org

On 18/01/17 10:53, Marc Zyngier wrote:
> Since everybody copied my own mistake from the DT binding example,
> let's address all the offenders in one swift go.
> 
> Most of them got the CPU interface size wrong (4kB, while it should
> be 8kB), except for both keystone platforms which got the control
> interface wrong (4kB instead of 8kB).
> 
> In the couple of cases were I knew for sure what implementation

                         where

> was used, I've added the "arm,gic-400" compatible string. I'm 99%
> sure that this is what everyong is using, but short of having the

                         everyone

> TRM for all the other SoCs, I've let them alone.
> 
> Signed-off-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
> ---
[...]
> diff --git a/arch/arm/boot/dts/keystone-k2g.dtsi b/arch/arm/boot/dts/keystone-k2g.dtsi
> index 63c7cf0..07bf300 100644
> --- a/arch/arm/boot/dts/keystone-k2g.dtsi
> +++ b/arch/arm/boot/dts/keystone-k2g.dtsi
> @@ -45,7 +45,7 @@
>  		interrupt-controller;
>  		reg = <0x0 0x02561000 0x0 0x1000>,
>  		      <0x0 0x02562000 0x0 0x2000>,
> -		      <0x0 0x02564000 0x0 0x1000>,
> +		      <0x0 0x02564000 0x0 0x2000>,
>  		      <0x0 0x02566000 0x0 0x2000>;
>  		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) |
>  				IRQ_TYPE_LEVEL_HIGH)>;
> diff --git a/arch/arm/boot/dts/keystone.dtsi b/arch/arm/boot/dts/keystone.dtsi
> index 02708ba..aaff6816 100644
> --- a/arch/arm/boot/dts/keystone.dtsi
> +++ b/arch/arm/boot/dts/keystone.dtsi
> @@ -35,7 +35,7 @@
>  		interrupt-controller;
>  		reg = <0x0 0x02561000 0x0 0x1000>,
>  		      <0x0 0x02562000 0x0 0x2000>,
> -		      <0x0 0x02564000 0x0 0x1000>,
> +		      <0x0 0x02564000 0x0 0x2000>,
>  		      <0x0 0x02566000 0x0 0x2000>;
>  		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) |
>  				IRQ_TYPE_LEVEL_HIGH)>;

FWIW I happen to have some public Keystone TRMs handy from my DMA offset
investigations, and both K2G and K2H explicitly say it's a GIC-400 too.

Robin.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
