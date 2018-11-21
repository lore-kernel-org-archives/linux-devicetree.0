Return-Path: <SRS0=2x8e=OA=grinn-global.com=m.niestroj@kernel.org>
From: Marcin Niestroj <m.niestroj@grinn-global.com>
Subject: [PATCH] ARM: dts: am335x-chiliboard: Add stdout-path property
Date: Wed, 21 Nov 2018 22:05:15 +0100
Message-Id: <20181121210515.22182-1-m.niestroj@grinn-global.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Tony Lindgren <tony@atomide.com>
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, Marcin Niestroj <m.niestroj@grinn-global.com>
List-ID: <devicetree@vger.kernel.org>

Add stdout-path property in /chosen node so that earlycon can be
used by just adding earlycon in bootargs.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 arch/arm/boot/dts/am335x-chiliboard.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/am335x-chiliboard.dts b/arch/arm/boot/dts/am335x-chiliboard.dts
index 9c2a947aacf5..b50d5d2e71ff 100644
--- a/arch/arm/boot/dts/am335x-chiliboard.dts
+++ b/arch/arm/boot/dts/am335x-chiliboard.dts
@@ -14,6 +14,10 @@
 	compatible = "grinn,am335x-chiliboard", "grinn,am335x-chilisom",
 		     "ti,am33xx";
 
+	chosen {
+		stdout-path = &uart0;
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
-- 
2.19.1
