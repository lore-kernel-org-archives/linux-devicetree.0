From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v2 2/3] phy: rockchip-emmc: should be a child device of the GRF
Date: Thu, 24 Mar 2016 22:29:02 +0100
Message-ID: <1458854943-17388-2-git-send-email-heiko@sntech.de>
References: <1458854943-17388-1-git-send-email-heiko@sntech.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1458854943-17388-1-git-send-email-heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: kishon@ti.com
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, shawn.lin@rock-chips.com, ykk@rock-chips.com, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

The emmc-phy is fully enclosed in the general register files (GRF).
Therefore as seen from the device-tree it shouldn't be a separate platform-
device but instead a sub-device of the GRF - using the simply-mfd mechanism.

The driver entered the kernel in the current merge-window, so we can still
adapt the binding without needing a fallback, as the binding hasn't been
released with a full kernel yet.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
Hi Shawn, Kishon,

I didn't see this new phy driver until now, so I'd really like to get
this sorted before the old binding solidifies :-).

I'll convert the usbphy as well, but that has to have the fallback for
the old binding, so is not as urgent as these two.

As mentioned in the patch description above, this is meant as a fixup for
kernel 4.6.


changes in v2: drop forgotten rockchip,grf from example


 .../devicetree/bindings/phy/rockchip-emmc-phy.txt     | 19 ++++++++++++-------
 drivers/phy/phy-rockchip-emmc.c                       |  5 ++++-
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/rockchip-emmc-phy.txt b/Documentation/devicetree/bindings/phy/rockchip-emmc-phy.txt
index 61916f1..d711259 100644
--- a/Documentation/devicetree/bindings/phy/rockchip-emmc-phy.txt
+++ b/Documentation/devicetree/bindings/phy/rockchip-emmc-phy.txt
@@ -3,17 +3,21 @@ Rockchip EMMC PHY
 
 Required properties:
  - compatible: rockchip,rk3399-emmc-phy
- - rockchip,grf : phandle to the syscon managing the "general
-   register files"
  - #phy-cells: must be 0
  - reg: PHY configure reg address offset in "general
    register files"
 
 Example:
 
-emmcphy: phy {
-	compatible = "rockchip,rk3399-emmc-phy";
-	rockchip,grf = <&grf>;
-	reg = <0xf780>;
-	#phy-cells = <0>;
+
+grf: syscon@ff770000 {
+	compatible = "rockchip,rk3399-grf", "syscon", "simple-mfd";
+
+...
+
+	emmcphy: phy@f780 {
+		compatible = "rockchip,rk3399-emmc-phy";
+		reg = <0xf780>;
+		#phy-cells = <0>;
+	};
 };
diff --git a/drivers/phy/phy-rockchip-emmc.c b/drivers/phy/phy-rockchip-emmc.c
index 887b4c2..6ebcf3e 100644
--- a/drivers/phy/phy-rockchip-emmc.c
+++ b/drivers/phy/phy-rockchip-emmc.c
@@ -176,7 +176,10 @@ static int rockchip_emmc_phy_probe(struct platform_device *pdev)
 	struct regmap *grf;
 	unsigned int reg_offset;
 
-	grf = syscon_regmap_lookup_by_phandle(dev->of_node, "rockchip,grf");
+	if (!dev->parent || !dev->parent->of_node)
+		return -ENODEV;
+
+	grf = syscon_node_to_regmap(dev->parent->of_node);
 	if (IS_ERR(grf)) {
 		dev_err(dev, "Missing rockchip,grf property\n");
 		return PTR_ERR(grf);
-- 
2.7.0
