From: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/7] [DTS] enable hardware for Nanopi M1 & Nanopi M1 Plus
Date: Wed, 30 Aug 2017 05:01:03 +0200
Message-ID: <1504062070-13523-1-git-send-email-embed3d@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

This Patchseries enables the IR controller and the dwmac-sun8i
on the Friendlyarm Nanopi M1 and Friendlyarm Nanopi M1 Plus boards.
On the Nanopi M1 Plus additionally the BT/Wifi module is activated.

Philipp Rossak (7):
  ARM: dts: sun8i: h3: nanopi-m1: Enable IR controller
  ARM: dts: sun8i: h3: nanopi-m1-plus: Enable IR controller
  ARM: dts: sun8i: h3: Enable dwmac-sun8i on the Nanopi M1 Plus
  ARM: dts: sun8i: h3: Enable AP6212 WiFi on mmc1 on Nanopi M1 Plus
  ARM: dts: sun8i: h3: Enable dwmac-sun8i on the Nanopi M1
  ARM: dts: sun8i: h3: Adding UART3 RTS and CTS Pins
  ARM: dts: sun8i: h3: Enable AP6212 BT on uart3 on Nanopi M1 Plus

 arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts | 80 +++++++++++++++++++++++++++
 arch/arm/boot/dts/sun8i-h3-nanopi-m1.dts      | 17 ++++++
 arch/arm/boot/dts/sunxi-h3-h5.dtsi            |  5 ++
 3 files changed, 102 insertions(+)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
