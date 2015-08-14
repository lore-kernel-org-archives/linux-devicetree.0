From: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: [PATCH v3 0/2] ARM: dts: add Okaya LCD display for Nitrogen and Sabrelite
Date: Fri, 14 Aug 2015 14:51:05 +0200
Message-ID: <1439556667-3424-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1432314867-30888-1-git-send-email-gary.bisson@boundarydevices.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432314867-30888-1-git-send-email-gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds the Okaya 7" LCD support as a simple panel for both Nitrogen
and Sabrelite.

This v3 updates the series as the compatible name has been changed from
"okaya,rs800480t_7x0gp" to "okaya,rs800480t-7x0gp" when the drm patch has been
merged into linux-next branch.
http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/?id=ec9000c

Also note that Philipp Zabel's patch that enables the parallel-display driver
to work with a simple panel has been merged.
http://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/commit/?id=553a59f

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
2.4.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
