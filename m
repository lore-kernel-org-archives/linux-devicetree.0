From: Dirk Behme <dirk.behme@de.bosch.com>
Subject: [PATCH] clk: renesas: r8a7795: Move MODEMR to DT
Date: Thu, 28 Apr 2016 08:08:37 +0200
Message-ID: <1461823717-22517-1-git-send-email-dirk.behme@de.bosch.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, linux-renesas-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Oleksij Rempel <linux@rempel-privat.de>, Pooya Keshavarzi <Pooya.Keshavarzi@de.bosch.com>, Oleksij Rempel <fixed-term.Oleksij.Rempel@de.bosch.com>, Dirk Behme <dirk.behme@de.bosch.com>
List-Id: devicetree@vger.kernel.org

From: Oleksij Rempel <linux@rempel-privat.de>

Map the Mode Monitor Register via the device tree instead of
hard coding it in the code. This makes the mapping known to the
device tree.

Signed-off-by: Pooya Keshavarzi <Pooya.Keshavarzi@de.bosch.com>
Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>
Signed-off-by: Oleksij Rempel <fixed-term.Oleksij.Rempel@de.bosch.com>
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
 .../devicetree/bindings/clock/renesas,cpg-mssr.txt |  9 ++++++---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           |  4 +++-
 drivers/clk/renesas/r8a7795-cpg-mssr.c             | 22 +++-------------------
 drivers/clk/renesas/renesas-cpg-mssr.c             | 19 ++++++++++++++-----
 drivers/clk/renesas/renesas-cpg-mssr.h             |  2 +-
 5 files changed, 27 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
index fefb802..7984485 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
@@ -15,8 +15,10 @@ Required Properties:
   - compatible: Must be one of:
       - "renesas,r8a7795-cpg-mssr" for the r8a7795 SoC
 
-  - reg: Base address and length of the memory resource used by the CPG/MSSR
-    block
+  - reg:
+    - 0: Base address and length of the memory resource used by the CPG/MSSR
+         block.
+    - 1: Mode Monitor Register.
 
   - clocks: References to external parent clocks, one entry for each entry in
     clock-names
@@ -46,7 +48,8 @@ Examples
 
 	cpg: clock-controller@e6150000 {
 		compatible = "renesas,r8a7795-cpg-mssr";
-		reg = <0 0xe6150000 0 0x1000>;
+		reg = <0 0xe6150000 0 0x1000>,
+		      <0 0xe6160060 0 0x4>;
 		clocks = <&extal_clk>, <&extalr_clk>;
 		clock-names = "extal", "extalr";
 		#clock-cells = <2>;
diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 8be9424..3e5d5b0 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -305,7 +305,9 @@
 
 		cpg: clock-controller@e6150000 {
 			compatible = "renesas,r8a7795-cpg-mssr";
-			reg = <0 0xe6150000 0 0x1000>;
+			reg = <0 0xe6150000 0 0x1000>,
+			      /* MODEMR - Mode Monitor Register */
+			      <0 0xe6160060 0 0x4>;
 			clocks = <&extal_clk>, <&extalr_clk>;
 			clock-names = "extal", "extalr";
 			#clock-cells = <2>;
diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index 6af7f5b..ac34c11 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -612,26 +612,10 @@ struct clk * __init r8a7795_cpg_clk_register(struct device *dev,
 					 __clk_get_name(parent), 0, mult, div);
 }
 
-/*
- * Reset register definitions.
- */
-#define MODEMR	0xe6160060
-
-static u32 rcar_gen3_read_mode_pins(void)
-{
-	void __iomem *modemr = ioremap_nocache(MODEMR, 4);
-	u32 mode;
-
-	BUG_ON(!modemr);
-	mode = ioread32(modemr);
-	iounmap(modemr);
-
-	return mode;
-}
-
-static int __init r8a7795_cpg_mssr_init(struct device *dev)
+static int __init r8a7795_cpg_mssr_init(struct device *dev,
+					void __iomem *modemr_base)
 {
-	u32 cpg_mode = rcar_gen3_read_mode_pins();
+	u32 cpg_mode = ioread32(modemr_base);
 
 	cpg_pll_config = &cpg_pll_configs[CPG_PLL_CONFIG_INDEX(cpg_mode)];
 	if (!cpg_pll_config->extal_div) {
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 1f2dc362..b455b14 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -107,6 +107,7 @@ static const u16 srcr[] = {
 struct cpg_mssr_priv {
 	struct device *dev;
 	void __iomem *base;
+	void __iomem *modemr_base; /* Mode Monitor Register */
 	spinlock_t mstp_lock;
 
 	struct clk **clks;
@@ -529,17 +530,25 @@ static int __init cpg_mssr_probe(struct platform_device *pdev)
 	int error;
 
 	info = of_match_node(cpg_mssr_match, np)->data;
-	if (info->init) {
-		error = info->init(dev);
-		if (error)
-			return error;
-	}
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
 	priv->dev = dev;
+
+	if (info->init) {
+		/* get Mode Monitor Register */
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+		priv->modemr_base = devm_ioremap_resource(dev, res);
+		if (IS_ERR(priv->modemr_base))
+			return PTR_ERR(priv->modemr_base);
+
+		error = info->init(dev, priv->modemr_base);
+		if (error)
+			return error;
+	}
+
 	spin_lock_init(&priv->mstp_lock);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.h b/drivers/clk/renesas/renesas-cpg-mssr.h
index 0d1e3e8..3ec7e2d 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.h
+++ b/drivers/clk/renesas/renesas-cpg-mssr.h
@@ -123,7 +123,7 @@ struct cpg_mssr_info {
 	unsigned int num_core_pm_clks;
 
 	/* Callbacks */
-	int (*init)(struct device *dev);
+	int (*init)(struct device *dev, void __iomem *modemr_base);
 	struct clk *(*cpg_clk_register)(struct device *dev,
 					const struct cpg_core_clk *core,
 					const struct cpg_mssr_info *info,
-- 
2.8.0
