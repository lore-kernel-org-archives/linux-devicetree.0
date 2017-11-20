From: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
Subject: [RESEND PATCH v3 0/2] dt: add pinctrl driver for Meson-AXG SoC
Date: Mon, 20 Nov 2017 18:23:52 +0800
Message-ID: <20171120102354.5354-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, Xingyu Chen <xingyu.chen-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is DT part patchset for adding pinctrl support for
the Amlogic's Meson-AXG SoC.
  
Changes since v2 at [2]:
  -- Resend this patch series due to fail to send patch [2/2]

Changes since v1 at [1]:
  -- Separate DT part patches
  -- Add Neil Armstrong's Ack

[2]
http://lists.infradead.org/pipermail/linux-amlogic/2017-November/005390.html

[1] 
http://lists.infradead.org/pipermail/linux-amlogic/2017-November/005270.html
http://lists.infradead.org/pipermail/linux-amlogic/2017-November/005271.html
http://lists.infradead.org/pipermail/linux-amlogic/2017-November/005272.html
http://lists.infradead.org/pipermail/linux-amlogic/2017-November/005273.html
http://lists.infradead.org/pipermail/linux-amlogic/2017-November/005274.html

Xingyu Chen (2):
  documentation: Add compatibles for Amlogic Meson AXG pin controllers
  ARM64: dts: meson-axg: add pinctrl DT info for Meson-AXG SoC

 .../devicetree/bindings/pinctrl/meson,pinctrl.txt  |  2 +
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi         | 44 ++++++++++++++++++++++
 2 files changed, 46 insertions(+)

-- 
2.15.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
