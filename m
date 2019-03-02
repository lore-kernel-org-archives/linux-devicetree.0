From: Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 2/3] arm64: dts: rockchip: add leds node on rk3328-rock64
Date: Sat, 2 Mar 2019 17:00:25 +0000
Message-ID: <AM3PR03MB0966B42785AF2CF8A5CB39BCAC770@AM3PR03MB0966.eurprd03.prod.outlook.com>
References: <20190302165641.10905-1-jonas@kwiboo.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190302165641.10905-1-jonas@kwiboo.se>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jonas Karlman <jonas@kwiboo.se>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Add led nodes on Rock64.
Use heartbeat trigger for the red standby led and
use mmc0 trigger for the white power led.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 arch/arm64/boot/dts/rockchip/rk3328-rock64.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts b/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
index 8f3e4b7d55c9..c4031b7718fc 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
@@ -65,6 +65,20 @@
 		regulator-max-microvolt = <5000000>;
 	};
 
+	leds {
+		compatible = "gpio-leds";
+
+		standby {
+			gpios = <&rk805 0 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		power {
+			gpios = <&rk805 1 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "mmc0";
+		};
+	};
+
 	sound {
 		compatible = "audio-graph-card";
 		label = "rockchip,rk3328";
@@ -157,6 +171,8 @@
 		interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
 		#clock-cells = <1>;
 		clock-output-names = "xin32k", "rk805-clkout2";
+		gpio-controller;
+		#gpio-cells = <2>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pmic_int_l>;
 		rockchip,system-power-controller;
-- 
2.17.1
