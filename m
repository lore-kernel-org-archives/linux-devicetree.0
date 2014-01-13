From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/2] Fix SSI audio function regression when using ROM
 firmware
Date: Mon, 13 Jan 2014 14:52:26 +0530
Message-ID: <20140113092226.GE25466@intel.com>
References: <1389170756-22351-1-git-send-email-Guangyu.Chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1389170756-22351-1-git-send-email-Guangyu.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolin Chen <Guangyu.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 08, 2014 at 04:45:54PM +0800, Nicolin Chen wrote:
> Previously we added dual-fifo script support for SSI and SDMA, meanwhile, we
> switched the default script in DT to this new script. However, there're still
> quite a few people using the old version or even ROM firmware which means they
> don't provide any firmware to SDMA driver. In these cases, the SDMA driver'd
> fail to load essential script then the audio function broken.
> 
> This series of patches mainly fix this issue by assigning a default script
> number for ROM firmware case and reverting the default script in DT so that
> all kinds of users would continue to run it with or without firmware.
> 
> We might later need to figure out a better solution to ensure both SDMA driver
> and SSI driver could adaptively switch the new script to the old one when V2
> firmware isn't provided.

Applied both,

Thanks

--
~Vinod
> 
> This series of patches are based on Vinod's repository.
> 
> Nicolin Chen (2):
>   Revert "ARM: dts: imx: use dual-fifo sdma script for ssi"
>   dma: imx-sdma: Assign a default script number for ROM firmware cases
> 
>  arch/arm/boot/dts/imx51.dtsi   |  4 ++--
>  arch/arm/boot/dts/imx53.dtsi   |  4 ++--
>  arch/arm/boot/dts/imx6qdl.dtsi | 12 ++++++------
>  arch/arm/boot/dts/imx6sl.dtsi  | 12 ++++++------
>  drivers/dma/imx-sdma.c         |  4 ++++
>  5 files changed, 20 insertions(+), 16 deletions(-)
> 
> -- 
> 1.8.4
> 
> 

-- 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
