From: Jacob Chen <jacob-chen@iotwrt.com>
Subject: [PATCH v2 08/11] ARM: dts: rockchip: add rx0 mipi-phy for rk3288
Date: Fri, 24 Nov 2017 10:37:03 +0800
Message-ID: <20171124023706.5702-9-jacob-chen@iotwrt.com>
References: <20171124023706.5702-1-jacob-chen@iotwrt.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171124023706.5702-1-jacob-chen@iotwrt.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mchehab@kernel.org, linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, hans.verkuil@cisco.com, tfiga@chromium.org, zhengsq@rock-chips.com, laurent.pinchart@ideasonboard.com, zyc@rock-chips.com, eddie.cai.linux@gmail.com, jeffy.chen@rock-chips.com, allon.huang@rock-chips.com, devicetree@vger.kernel.org, heiko@sntech.de, robh+dt@kernel.org, Jacob Chen <jacob-chen@iotwrt.com>
List-Id: devicetree@vger.kernel.org

It's a Designware MIPI D-PHY, used by ISP in rk3288.

Signed-off-by: Jacob Chen <jacob-chen@iotwrt.com>
---
 arch/arm/boot/dts/rk3288.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 30677a0167fe..8b7d5a9b521f 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -864,6 +864,13 @@
 			status = "disabled";
 		};
 
+		mipi_phy_rx0: mipi-phy-rx0 {
+			compatible = "rockchip,rk3288-mipi-dphy";
+			clocks = <&cru SCLK_MIPIDSI_24M>, <&cru PCLK_MIPI_CSI>;
+			clock-names = "dphy-ref", "pclk";
+			status = "disabled";
+		};
+
 		io_domains: io-domains {
 			compatible = "rockchip,rk3288-io-voltage-domain";
 			status = "disabled";
-- 
2.15.0
