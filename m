From: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] ARM: sun8i: Add Parrot Board DTS
Date: Mon, 13 Jun 2016 12:15:30 +0200
Message-ID: <1465812931-22824-1-git-send-email-quentin.schulz@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

The Parrot Board is an evaluation board with an Allwinner R16 (assumed
to be close to an Allwinner A33), 4GB of NAND, 512MB of RAM, USB host
and OTG, a WiFi/Bluetooth combo chip, a micro SD Card reader, 2
controllable buttons, an LVDS port with separated backlight and
capacitive touch panel ports, an audio/microphone jack, a camera CSI
port, 2 sets of 22 GPIOs and an accelerometer.

This patch requires patches named "[v3] regulator: axp20x: Add support
for the (external) drivebus regulator" and "[PATCH 3/4] ARM: dts:
axp22x.dtsi: Add reg_drivebus node" from Hans de Goede or the micro USB
port would not be powered.

Quentin Schulz (1):
  ARM: sun8i: Add Parrot Board DTS

 arch/arm/boot/dts/Makefile             |   1 +
 arch/arm/boot/dts/sun8i-r16-parrot.dts | 333 +++++++++++++++++++++++++++++++++
 2 files changed, 334 insertions(+)
 create mode 100644 arch/arm/boot/dts/sun8i-r16-parrot.dts

-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
