From: Jacob Chen <jacob-chen@iotwrt.com>
Subject: [PATCH v4 15/16] arm64: dts: rockchip: add rx0 mipi-phy for rk3399
Date: Mon, 18 Dec 2017 20:14:44 +0800
Message-ID: <20171218121445.6086-12-jacob-chen@iotwrt.com>
References: <20171218121445.6086-1-jacob-chen@iotwrt.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171218121445.6086-1-jacob-chen@iotwrt.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mchehab@kernel.org, linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, hans.verkuil@cisco.com, tfiga@chromium.org, zhengsq@rock-chips.com, laurent.pinchart@ideasonboard.com, zyc@rock-chips.com, eddie.cai.linux@gmail.com, jeffy.chen@rock-chips.com, allon.huang@rock-chips.com, devicetree@vger.kernel.org, heiko@sntech.de, robh+dt@kernel.org, Joao.Pinto@synopsys.com, Luis.Oliveira@synopsys.com, Jose.Abreu@synopsys.com, Jacob Chen <jacob2.chen@rock-chips.com>
List-Id: devicetree@vger.kernel.org

From: Shunqian Zheng <zhengsq@rock-chips.com>

It's a Designware MIPI D-PHY, used for ISP0 in rk3399.

Signed-off-by: Shunqian Zheng <zhengsq@rock-chips.com>
Signed-off-by: Jacob Chen <jacob2.chen@rock-chips.com>
---
 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 66a912fab5dd..8ef321f03010 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -1292,6 +1292,16 @@
 			status = "disabled";
 		};
 
+		mipi_dphy_rx0: mipi-dphy-rx0 {
+			compatible = "rockchip,rk3399-mipi-dphy";
+			clocks = <&cru SCLK_MIPIDPHY_REF>,
+				<&cru SCLK_DPHY_RX0_CFG>,
+				<&cru PCLK_VIO_GRF>;
+			clock-names = "dphy-ref", "dphy-cfg", "grf";
+			power-domains = <&power RK3399_PD_VIO>;
+			status = "disabled";
+		};
+
 		u2phy0: usb2-phy@e450 {
 			compatible = "rockchip,rk3399-usb2phy";
 			reg = <0xe450 0x10>;
-- 
2.15.1
