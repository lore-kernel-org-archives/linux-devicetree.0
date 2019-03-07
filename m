From: Christoph Muellner <christoph.muellner@theobroma-systems.com>
Subject: [PATCH v2 2/4] dt-bindings: phy: Add a new property drive-impedance-ohm for RK's emmc PHY
Date: Thu,  7 Mar 2019 09:41:54 +0100
Message-ID: <20190307084159.25236-2-christoph.muellner@theobroma-systems.com>
References: <20190307084159.25236-1-christoph.muellner@theobroma-systems.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190307084159.25236-1-christoph.muellner@theobroma-systems.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, heiko@sntech.de, shawn.lin@rock-chips.com
Cc: Christoph Muellner <christoph.muellner@theobroma-systems.com>, Philipp Tomsich <philipp.tomsich@theobroma-systems.com>, Kishon Vijay Abraham I <kishon@ti.com>, Brian Norris <briannorris@chromium.org>, Klaus Goger <klaus.goger@theobroma-systems.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Douglas Anderson <dianders@chromium.org>, Viresh Kumar <viresh.kumar@linaro.org>, Ezequiel Garcia <ezequiel@collabora.com>, Lin Huang <hl@rock-chips.com>, Randy Li <ayaka@soulik.info>, Tony Xie <tony.xie@rock-chips.com>, Vicente Bergas <vicencb@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch documents the new proprty drive-impedance-ohm for
Rockchip's eMMC PHY node.

Signed-off-by: Christoph Muellner <christoph.muellner@theobroma-systems.com>
Signed-off-by: Philipp Tomsich <philipp.tomsich@theobroma-systems.com>
---
 Documentation/devicetree/bindings/phy/rockchip-emmc-phy.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rockchip-emmc-phy.txt b/Documentation/devicetree/bindings/phy/rockchip-emmc-phy.txt
index e3ea55763b0a..5f5d999dacc3 100644
--- a/Documentation/devicetree/bindings/phy/rockchip-emmc-phy.txt
+++ b/Documentation/devicetree/bindings/phy/rockchip-emmc-phy.txt
@@ -13,6 +13,9 @@ specified by name:
 		(because most boards can get basic functionality without having
 		access to it), it is strongly suggested.
  - clocks: Should have a phandle to the card clock exported by the SDHCI driver.
+ - drive-impedance-ohm: Specifies the drive impedance in Ohm.
+                        Possible values are 33, 40, 50, 66 and 100.
+                        If not set, the default value of 50 will be applied.
 
 Example:
 
-- 
2.11.0
