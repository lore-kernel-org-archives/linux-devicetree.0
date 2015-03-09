From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 0/3] imx: add max7310 and usb support for imx6qdl sabreauto
Date: Mon, 9 Mar 2015 17:28:05 +0800
Message-ID: <1425893288-1517-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Shawn,

In this series, two functions are added for imx6qdl sabreauto board.

- In the 1st patch, the i2c interface gpio expendor max7310 is added
- In the 2nd patch, the USB support is added
- In the 3rd patch, the driver for max7310 is added

Peter Chen (3):
  ARM: imx6qdl-sabreauto.dtsi: add max7310 support
  ARM: imx6qdl-sabreauto.dtsi: enable USB support
  ARM: imx_v6_v7_defconfig: Add CONFIG_GPIO_PCA953X

 arch/arm/boot/dts/imx6qdl-sabreauto.dtsi | 87 ++++++++++++++++++++++++++++++++
 arch/arm/configs/imx_v6_v7_defconfig     |  1 +
 2 files changed, 88 insertions(+)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
