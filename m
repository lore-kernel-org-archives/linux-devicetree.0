From: Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH] ARM: dts: rockchip: rk3288: fix missing grf reference in
 tsadc node
Date: Sun, 24 Feb 2019 21:52:00 +0000
Message-ID: <AM3PR03MB0966E8AA93CC1B7CA355CECEAC790@AM3PR03MB0966.eurprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>
List-Id: devicetree@vger.kernel.org

The following message can be seen during boot:

  rockchip-thermal ff280000.tsadc: Missing rockchip,grf property

Fix this by adding rockchip,grf property to tsadc node.

Fixes: b67d6bc38823 ("ARM: dts: rockchip: add main thermal info to rk3288")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 arch/arm/boot/dts/rk3288.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index ca7d52daa8fb..b577f3e41811 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -569,6 +569,7 @@
 		pinctrl-1 = <&otp_out>;
 		pinctrl-2 = <&otp_gpio>;
 		#thermal-sensor-cells = <1>;
+		rockchip,grf = <&grf>;
 		rockchip,hw-tshut-temp = <95000>;
 		status = "disabled";
 	};
-- 
2.17.1
