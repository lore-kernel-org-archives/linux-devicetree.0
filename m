From: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: [PATCH v2 0/2] ARM: dts: add Okaya LCD panel for Nitrogen and Sabrelite
Date: Fri, 29 May 2015 09:56:54 +0200
Message-ID: <1432886216-2717-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1432314867-30888-1-git-send-email-gary.bisson@boundarydevices.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432314867-30888-1-git-send-email-gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org, Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds the Okaya 7" LCD support as a simple panel for both Nitrogen
and Sabrelite.

It requires a patch from Philipp that adds panel support to the imx parallel
display driver.
https://patchwork.kernel.org/patch/6438311/

Also requires the patch that adds the Okaya display support to the simple
panel driver.
https://patchwork.kernel.org/patch/6503261/

A U-Boot script to configure the displays based on detection of the
touch controller is available for reference here:
https://github.com/boundarydevices/u-boot-imx6/blob/staging/board/boundary/nitrogen6x/6x_bootscript-mainline.txt

Gary Bisson (2):
  ARM: dts: imx6qdl-nitrogen6x: add Okaya LCD panel
  ARM: dts: imx6qdl-sabrelite: add Okaya LCD panel

 arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi | 76 ++++++++++++++++++++++++++++++-
 arch/arm/boot/dts/imx6qdl-sabrelite.dtsi  | 76 ++++++++++++++++++++++++++++++-
 2 files changed, 150 insertions(+), 2 deletions(-)

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
