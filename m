From: Rostislav Lisovy <lisovy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/2] ARM: i.MX53: voipac-dmm-668 Devicetree
Date: Wed, 27 Nov 2013 00:53:14 +0100
Message-ID: <1385509996-17769-1-git-send-email-lisovy@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: pisa-/N2ztlQkxE7Ub/6JBqosbQ@public.gmane.org, Rostislav Lisovy <lisovy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset adds NAND controller and USB host controller support
for Voipac x53-dmm-668 module.

This patchset applies to linux-next (since the Voipac devicetree
support is not present in any other trees).

Rostislav Lisovy (2):
  ARM: i.MX53: dts: NAND flash controller
  ARM: i.MX53: dts: USB host controller

 arch/arm/boot/dts/imx53-voipac-dmm-668.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
