From: Christoph Muellner <christoph.muellner@theobroma-systems.com>
Subject: [PATCH v3 2/4] dt-bindings: phy: Add a new property
 drive-impedance-ohm for RK's emmc PHY
Date: Fri, 22 Mar 2019 12:34:51 +0100
Message-ID: <20190322113456.16324-2-christoph.muellner@theobroma-systems.com>
References: <20190322113456.16324-1-christoph.muellner@theobroma-systems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190322113456.16324-1-christoph.muellner@theobroma-systems.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, heiko@sntech.de, shawn.lin@rock-chips.com
Cc: devicetree@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>, Viresh Kumar <viresh.kumar@linaro.org>, Jeffy Chen <jeffy.chen@rock-chips.com>, Douglas Anderson <dianders@chromium.org>, Vicente Bergas <vicencb@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, linux-rockchip@lists.infradead.org, Tony Xie <tony.xie@rock-chips.com>, Klaus Goger <klaus.goger@theobroma-systems.com>, linux-arm-kernel@lists.infradead.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Randy Li <ayaka@soulik.info>, Philipp Tomsich <philipp.tomsich@theobroma-systems.com>, Ezequiel Garcia <ezequiel@collabora.com>, linux-kernel@vger.kernel.org, Christoph Muellner <christoph.muellner@theobroma-systems.com>
List-Id: devicetree@vger.kernel.org

This patch documents the new proprty drive-impedance-ohm for
Rockchip's eMMC PHY node.

Signed-off-by: Christoph Muellner <christoph.muellner@theobroma-systems.com>
Signed-off-by: Philipp Tomsich <philipp.tomsich@theobroma-systems.com>
---
 Documentation/devicetree/bindings/phy/rockchip-emmc-phy.txt | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/rockchip-emmc-phy.txt b/Documentation/devicetree/bindings/phy/rockchip-emmc-phy.txt
index e3ea55763b0a..e728786f21e0 100644
--- a/Documentation/devicetree/bindings/phy/rockchip-emmc-phy.txt
+++ b/Documentation/devicetree/bindings/phy/rockchip-emmc-phy.txt
@@ -7,12 +7,15 @@ Required properties:
  - reg: PHY register address offset and length in "general
    register files"
 
-Optional clocks using the clock bindings (see ../clock/clock-bindings.txt),
-specified by name:
+Optional properties:
  - clock-names: Should contain "emmcclk".  Although this is listed as optional
 		(because most boards can get basic functionality without having
 		access to it), it is strongly suggested.
+		See ../clock/clock-bindings.txt for details.
  - clocks: Should have a phandle to the card clock exported by the SDHCI driver.
+ - drive-impedance-ohm: Specifies the drive impedance in Ohm.
+                        Possible values are 33, 40, 50, 66 and 100.
+                        If not set, the default value of 50 will be applied.
 
 Example:
 
@@ -29,6 +32,7 @@ grf: syscon@ff770000 {
 		reg = <0xf780 0x20>;
 		clocks = <&sdhci>;
 		clock-names = "emmcclk";
+		drive-impedance-ohm = <50>;
 		#phy-cells = <0>;
 	};
 };
-- 
2.11.0
