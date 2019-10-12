From: Xingyu Chen <xingyu.chen@amlogic.com>
Subject: [PATCH 4/4] arm64: dts: a1: add secure watchdog controller
Date: Sat, 12 Oct 2019 18:05:21 +0800
Message-ID: <1570874721-36077-5-git-send-email-xingyu.chen@amlogic.com>
References: <1570874721-36077-1-git-send-email-xingyu.chen@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1570874721-36077-1-git-send-email-xingyu.chen@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
Cc: Xingyu Chen <xingyu.chen@amlogic.com>, Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, Qianggui Song <qianggui.song@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, linux-watchdog@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Enable secure watchdog controller for Meson-A1 SoC

Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index 7210ad0..047c323 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -93,6 +93,12 @@
 				clock-names = "xtal", "pclk", "baud";
 				status = "disabled";
 			};
+
+			watchdog {
+				compatible = "amlogic,meson-sec-wdt";
+				secure-monitor = <&sm>;
+				status = "okay";
+			};
 		};
 
 		gic: interrupt-controller@ff901000 {
-- 
2.7.4
