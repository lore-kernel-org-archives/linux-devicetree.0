From: Christoph Muellner <christoph.muellner@theobroma-systems.com>
Subject: [PATCH v2 3/4] arm64: dts: rockchip: Define drive-impedance-ohm for RK3399's emmc-phy.
Date: Thu,  7 Mar 2019 09:41:55 +0100
Message-ID: <20190307084159.25236-3-christoph.muellner@theobroma-systems.com>
References: <20190307084159.25236-1-christoph.muellner@theobroma-systems.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190307084159.25236-1-christoph.muellner@theobroma-systems.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, heiko@sntech.de, shawn.lin@rock-chips.com
Cc: Christoph Muellner <christoph.muellner@theobroma-systems.com>, Philipp Tomsich <philipp.tomsich@theobroma-systems.com>, Kishon Vijay Abraham I <kishon@ti.com>, Klaus Goger <klaus.goger@theobroma-systems.com>, Brian Norris <briannorris@chromium.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Douglas Anderson <dianders@chromium.org>, Viresh Kumar <viresh.kumar@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, Shunqian Zheng <zhengsq@rock-chips.com>, Vicente Bergas <vicencb@gmail.com>, Randy Li <ayaka@soulik.info>, Tony Xie <tony.xie@rock-chips.com>, Ezequiel Garcia <ezequiel@collabora.com>, Lin Huang <hl@rock-chips.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradea
List-Id: devicetree@vger.kernel.org

A previous patch introduced the property 'drive-impedance-ohm'
for the RK3399's emmc phy node. This patch sets this value
explicitly to the default value of 50 Ohm.

Signed-off-by: Christoph Muellner <christoph.muellner@theobroma-systems.com>
Signed-off-by: Philipp Tomsich <philipp.tomsich@theobroma-systems.com>
---
 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 6cc1c9fa4ea6..b875364a7709 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -1450,6 +1450,7 @@
 			clock-names = "refclk";
 			#phy-cells = <1>;
 			resets = <&cru SRST_PCIEPHY>;
+			drive-impedance-ohm = <50>;
 			reset-names = "phy";
 			status = "disabled";
 		};
-- 
2.11.0
