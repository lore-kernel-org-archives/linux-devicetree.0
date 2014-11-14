From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] ARM: imx: temporarily remove CONFIG_SOC_FSL from LS1021A
Date: Fri, 14 Nov 2014 11:56:35 +0100
Message-ID: <3531768.l2njma3NbB@wuerfel>
References: <1414746073-12394-1-git-send-email-jingchang.lu@freescale.com> <3302008.ezqrZf1odh@wuerfel> <7b9de442bdd34acbb4398efe92a64a4f@BN3PR0301MB1236.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7b9de442bdd34acbb4398efe92a64a4f-CEkquS/Gb818MjqJKlOTwZwN6zqB+hSMnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 14 November 2014 09:31:42 Jingchang Lu wrote:
>  Yes, only a subset of these drivers are shared between our ARM and PPC
> platforms. Since there will be allmodconfig breaking fault due to the
> FSL_SOC configuration, we will try to fix this or select another dependency,
> I will also inform our driver owners about this.
>  
> Below drivers are shared on LS1021A platform currently:
> 
> drivers/crypto/caam/
> drivers/memory/fsl_ifc.c
> drivers/mtd/nand/fsl_ifc_nand.c
> drivers/net/ethernet/freescale/fsl_pq_mdio.c
> drivers/net/ethernet/freescale/gianfar*
> drivers/spi/spi-fsl-dspi.c

Ok, since this is only a small subset of the FSL_SOC drivers, I'd
suggest you make these depend on (FSL_SOC || ARCH_IMX) after
verifying that they build without warnings on ARM.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
