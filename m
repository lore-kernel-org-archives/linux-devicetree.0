From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 5/8] ARM: l2x0: add marvell,ecc-enable property for
 aurora
Date: Fri, 19 Jan 2018 15:28:36 -0600
Message-ID: <20180119212836.r76seqe5dx6xim3w@rob-hp-laptop>
References: <20180112012755.20495-1-chris.packham@alliedtelesis.co.nz>
 <20180112012755.20495-6-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180112012755.20495-6-chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Cc: linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 12, 2018 at 02:27:52PM +1300, Chris Packham wrote:
> The aurora cache on the Marvell Armada-XP SoC supports ECC protection
> for the L2 data arrays. Add a "marvell,ecc-enable" device tree property
> which can be used to enable this.
> 
> Signed-off-by: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
> [jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org: use aurora specific define AURORA_ACR_ECC_EN]
> Signed-off-by: Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/l2c2x0.txt | 2 ++
>  arch/arm/mm/cache-l2x0.c                         | 7 +++++++
>  2 files changed, 9 insertions(+)

The Calxeda PL310 has ECC too so maybe shouldn't have a vendor prefix, 
but I don't think anyone will ever care to change it at this point.

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
