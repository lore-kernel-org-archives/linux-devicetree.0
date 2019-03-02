From: Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH] arm64: dts: rockchip: enable HDMI CEC on rk3328
Date: Sat, 2 Mar 2019 16:37:09 +0000
Message-ID: <AM3PR03MB0966D220C0FEB19CBAE0D913AC770@AM3PR03MB0966.eurprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>
List-Id: devicetree@vger.kernel.org

This patch enables HDMI CEC on RK3328 devices

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
index 81cc3c996e2a..fcb196212e8c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
@@ -657,9 +657,11 @@
 		interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru PCLK_HDMI>,
-			 <&cru SCLK_HDMI_SFC>;
+			 <&cru SCLK_HDMI_SFC>,
+			 <&cru SCLK_RTC32K>;
 		clock-names = "iahb",
-			      "isfr";
+			      "isfr",
+			      "cec";
 		phys = <&hdmiphy>;
 		phy-names = "hdmi";
 		pinctrl-names = "default";
-- 
2.17.1
