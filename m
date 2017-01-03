From: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: [PATCH 0/2] ARM: dts: boundary: fix sgtl5000 pinctrl init
Date: Tue,  3 Jan 2017 12:22:45 +0100
Message-ID: <20170103112247.4563-1-gary.bisson@boundarydevices.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Shawn, all,

While testing other features, I realized that the sound card wouldn't
probe on Nitrogen6_MAX. This is because the pinctrl node was under the
sound driver node whereas it should be under the codec one.

This caused GPIO_0 not to be set as CLKO1 and therefore the codec probing
was failing. The pinctrl node is just moved around to fix it.

Also making the same patch for our SOM2 although it was working, the
reason is that U-Boot is setting GPIO_0 in U-Boot for SOM2 and not MAX.

Regards,
Gary

Gary Bisson (2):
  ARM: dts: imx6qdl-nitrogen6_max: fix sgtl5000 pinctrl init
  ARM: dts: imx6qdl-nitrogen6_som2: fix sgtl5000 pinctrl init

 arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi  | 4 ++--
 arch/arm/boot/dts/imx6qdl-nitrogen6_som2.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
