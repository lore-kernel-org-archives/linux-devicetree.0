From: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v5 0/2] meson: saradc: drop the sana clock
Date: Thu, 16 Nov 2017 17:01:13 +0800
Message-ID: <20171116090115.29915-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, Xingyu Chen <xingyu.chen-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is a rework for the patch [v4 4/4] of previous series,
which mean this will make the patch [1] obsolete.

Changes since v4:
 * separate DTS for ARM(32bit) vs ARM64
 * add ACK from Martin

[1] [PATCH v4 4/4] ARM64: dts: meson: drop "sana" clock from SAR ADC
http://lists.infradead.org/pipermail/linux-amlogic/2017-November/005266.html

Xingyu Chen (2):
  ARM64: dts: meson: drop "sana" clock from SAR ADC
  ARM: dts: meson: drop "sana" clock from SAR ADC

 arch/arm/boot/dts/meson8.dtsi               | 5 ++---
 arch/arm/boot/dts/meson8b.dtsi              | 5 ++---
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 3 +--
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 3 +--
 4 files changed, 6 insertions(+), 10 deletions(-)

-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
