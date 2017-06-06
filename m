From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 00/10] irqchip: sunxi-nmi: Cleanups and fix A31 R_INTC
 register offset
Date: Tue, 6 Jun 2017 16:32:12 +0100
Message-ID: <5b984efe-100c-67f9-4ff4-e03ab5366182@arm.com>
References: <20170606055932.22548-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170606055932.22548-1-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/06/17 06:59, Chen-Yu Tsai wrote:
> Hi everyone,
> 
> This is an alternative to Icenowy's recent A64 R_INTC patches.
> 
> This is a two part series. The first four patches clean up the existing
> sunxi-nmi driver. Patches five and six add a new "sun6i-a31-r-intc"
> compatible, which mainly adjusts or removes the awkward register region
> offset the old "sun6i-a31-sc-nmi" compatible needed. The remaining
> patches fix or add device nodes for SoC's having this hardware.
> 
> Using "sun6i-a31-r-intc" introduced in this series, instead of Icenowy's
> "sun50i-a64-r-intc" is preferred. This follows our policy of naming
> hardware blocks and compatibles after their first occurrence.
> 
> The first six patches should go through the irqchip tree, while we
> (sunxi) can take the device tree changes after the driver has been
> merged, to avoid breaking linux-next as a whole.

So should I drop the original two patches and take those six instead?

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
