From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] ARM: imx: temporarily remove CONFIG_SOC_FSL from LS1021A
Date: Wed, 12 Nov 2014 12:04:57 +0100
Message-ID: <3302008.ezqrZf1odh@wuerfel>
References: <1414746073-12394-1-git-send-email-jingchang.lu@freescale.com> <1727581.y25NQPsRIm@wuerfel> <20141112104239.GJ2704@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141112104239.GJ2704@dragon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 12 November 2014 18:42:41 Shawn Guo wrote:
> 
> I noticed the issue from 0-DAY testing and was trying to drop the patch.
> Jingchang said someone is trying to fixing the issues from driver code.
> But it seems to take some time.  So I agree with this partial reverting.
> 
> Patch applied.  Thanks Arnd.

Thanks a lot!

Jingchang, can you say which of the drivers that are currently depending
on FSL_SOC are reused on LS1021A? I see these ones in the source tree:

drivers/ata/sata_fsl.c
drivers/crypto/caam/
drivers/crypto/talitos.c
drivers/dma/fsldma.c
drivers/memory/fsl_ifc.c
drivers/misc/carma/
drivers/mtd/nand/fsl_ifc_nand.c
drivers/net/ethernet/freescale/fsl_pq_mdio.c
drivers/net/ethernet/freescale/gianfar*
drivers/net/ethernet/freescale/xgmac_mdio.c
drivers/spi/spi-fsl-cpm.c
drivers/spi/spi-fsl-dspi.c
drivers/spi/spi-fsl-espi.c
drivers/usb/host/ehci-fsl.c
drivers/video/fbdev/fsl-diu-fb.c
drivers/virt/fsl_hypervisor.c
sound/soc/fsl/mpc*

I suspect that you only want a small subset of these, but I have no idea
which.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
