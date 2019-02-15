From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH] ARM: dts: rockchip: add chosen node on veyron chromebooks
Date: Fri, 15 Feb 2019 12:51:50 +0100
Message-ID: <20190215115150.32299-1-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, kernel@collabora.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

In order to use earlycon, the stdout-path property needs to be set
in the chosen node.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

 arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi b/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi
index b54746df3661..8890967ed572 100644
--- a/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi
+++ b/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi
@@ -62,6 +62,10 @@
 		pwm-off-delay-ms = <10>;
 	};
 
+	chosen {
+		stdout-path = "serial2:115200n8";
+	};
+
 	gpio-charger {
 		compatible = "gpio-charger";
 		charger-type = "mains";
-- 
2.20.1
