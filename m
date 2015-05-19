From: Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: [PATCH V2 0/2] ARM: dts: use simple-panel for nitrogen6x and sabrelite
Date: Tue, 19 May 2015 08:50:14 -0700
Message-ID: <1432050616-11465-1-git-send-email-eric.nelson@boundarydevices.com>
References: <20150518075844.7e1b5916@ipc1.ka-ro>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150518075844.7e1b5916-VjFSrY7JcPWvSplVBqRQBQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org, Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Patch originated with informal submission by Philipp Zabel:
	http://lists.infradead.org/pipermail/linux-arm-kernel/2015-April/337115.html

Update the LVDS0 configuration for imx6qdl-nitrogen6x and imx6qdl-sabrelite
to use simple panel to allow the connection of backlights and simplify the
process of (re)configuring displays.

A U-Boot script to configure the displays based on detection of the
touch controller is available for reference here:

	https://github.com/boundarydevices/u-boot-imx6/blob/staging/board/boundary/nitrogen6x/6x_bootscript-mainline.txt

Addition of panel hannstar,hsd100pxn1 is queued for 4.2:
	https://patchwork.kernel.org/patch/6212451/

Eric Nelson (2):
  ARM: dts: nitrogen6x: use simple-panel instead of display-timings for
    LVDS0
  ARM: dts: sabrelite: use simple-panel instead of display-timings for
    LVDS0

V2 changes commit messages to use proper name of 'label' instead of 'alias'

 arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi | 30 +++++++++++++++++-------------
 arch/arm/boot/dts/imx6qdl-sabrelite.dtsi  | 30 +++++++++++++++++-------------
 2 files changed, 34 insertions(+), 26 deletions(-)

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
