From: Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCHi 3/3] arm64: dts: rockchip: add ir-receiver node on
 rk3328-rock64
Date: Sat, 2 Mar 2019 17:03:14 +0000
Message-ID: <AM3PR03MB0966D9984EDA595D2888DC25AC770@AM3PR03MB0966.eurprd03.prod.outlook.com>
References: <20190302165641.10905-1-jonas@kwiboo.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190302165641.10905-1-jonas@kwiboo.se>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>
List-Id: devicetree@vger.kernel.org

Add ir-receiver node to enable on-board IR on Rock64.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 arch/arm64/boot/dts/rockchip/rk3328-rock64.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts b/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
index c4031b7718fc..25d0f57254fb 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
@@ -79,6 +79,13 @@
 		};
 	};
 
+	ir-receiver {
+		compatible = "gpio-ir-receiver";
+		gpios = <&gpio2 RK_PA2 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&ir_int>;
+		pinctrl-names = "default";
+	};
+
 	sound {
 		compatible = "audio-graph-card";
 		label = "rockchip,rk3328";
@@ -297,6 +304,12 @@
 };
 
 &pinctrl {
+	ir {
+		ir_int: ir-int {
+			rockchip,pins = <2 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	pmic {
 		pmic_int_l: pmic-int-l {
 			rockchip,pins = <2 RK_PA6 RK_FUNC_GPIO &pcfg_pull_up>;
-- 
2.17.1
