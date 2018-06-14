From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 2/3] mtd: rawnand: denali_dt: add more clocks based on IP
 datasheet
Date: Thu, 14 Jun 2018 14:11:06 +0900
Message-ID: <1528953067-24324-3-git-send-email-yamada.masahiro@socionext.com>
References: <1528953067-24324-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1528953067-24324-1-git-send-email-yamada.masahiro@socionext.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Brian Norris <computersforpeace@gmail.com>, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Philipp Rosenberger <p.rosenberger@linutronix.de>, Richard Weinberger <richard@sigma-star.at>, David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>
List-Id: devicetree@vger.kernel.org

According to the Denali User's Guide, this IP needs three clocks:

 - clk: controller core clock

 - clk_x: bus interface clock

 - ecc_clk: clock at which ECC circuitry is run

Currently, denali_dt.c requires a single anonymous clock and its
frequency.  However, the driver needs to get the frequency of "clk_x"
not "clk".  This is confusing because people tend to assume the
anonymous clock means the core clock.

Instead of the cheesy implementation, the clocks in the real hardware
should be represented in the driver and the DT-binding.

However, adding new clocks would break the existing platforms.  For the
backward compatibility, the driver still accepts a single clock just as
before.  If clk_x is missing, clk_x_rate is set to a hardcoded value.
It is fine because both Altera (Intel) SOCFPGA and Socionext UniPhier
use 200 MHz for the bus interface clock.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: split into sensible chunks

 .../devicetree/bindings/mtd/denali-nand.txt        |  5 +++
 drivers/mtd/nand/raw/denali_dt.c                   | 49 ++++++++++++++++++++--
 2 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
index 0ee8edb..f33da87 100644
--- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
@@ -8,6 +8,9 @@ Required properties:
   - reg : should contain registers location and length for data and reg.
   - reg-names: Should contain the reg names "nand_data" and "denali_reg"
   - interrupts : The interrupt number.
+  - clocks: should contain phandle of the controller core clock, the bus
+    interface clock, and the ECC circuit clock.
+  - clock-names: should contain "nand", "nand_x", "ecc"
 
 Optional properties:
   - nand-ecc-step-size: see nand.txt for details.  If present, the value must be
@@ -31,5 +34,7 @@ nand: nand@ff900000 {
 	compatible = "altr,socfpga-denali-nand";
 	reg = <0xff900000 0x20>, <0xffb80000 0x1000>;
 	reg-names = "nand_data", "denali_reg";
+	clocks = <&nand_clk>, <&nand_x_clk>, <&nand_ecc_clk>;
+	clock-names = "nand", "nand_x", "ecc";
 	interrupts = <0 144 4>;
 };
diff --git a/drivers/mtd/nand/raw/denali_dt.c b/drivers/mtd/nand/raw/denali_dt.c
index d923cfa..afaae37 100644
--- a/drivers/mtd/nand/raw/denali_dt.c
+++ b/drivers/mtd/nand/raw/denali_dt.c
@@ -27,7 +27,9 @@
 
 struct denali_dt {
 	struct denali_nand_info	denali;
-	struct clk		*clk;
+	struct clk *clk;	/* core clock */
+	struct clk *clk_x;	/* bus interface clock */
+	struct clk *clk_ecc;	/* ECC circuit clock */
 };
 
 struct denali_dt_data {
@@ -115,24 +117,61 @@ static int denali_dt_probe(struct platform_device *pdev)
 	if (IS_ERR(denali->host))
 		return PTR_ERR(denali->host);
 
-	dt->clk = devm_clk_get(dev, NULL);
+	/*
+	 * A single anonymous clock is supported for the backward compatibility.
+	 * New platforms should support all the named clocks.
+	 */
+	dt->clk = devm_clk_get(dev, "nand");
+	if (IS_ERR(dt->clk))
+		dt->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(dt->clk)) {
 		dev_err(dev, "no clk available\n");
 		return PTR_ERR(dt->clk);
 	}
+
+	dt->clk_x = devm_clk_get(dev, "nand_x");
+	if (IS_ERR(dt->clk_x))
+		dt->clk_x = NULL;
+
+	dt->clk_ecc = devm_clk_get(dev, "ecc");
+	if (IS_ERR(dt->clk_ecc))
+		dt->clk_ecc = NULL;
+
 	ret = clk_prepare_enable(dt->clk);
 	if (ret)
 		return ret;
 
-	denali->clk_x_rate = clk_get_rate(dt->clk);
+	ret = clk_prepare_enable(dt->clk_x);
+	if (ret)
+		goto out_disable_clk;
+
+	ret = clk_prepare_enable(dt->clk_ecc);
+	if (ret)
+		goto out_disable_clk_x;
+
+	if (dt->clk_x) {
+		denali->clk_x_rate = clk_get_rate(dt->clk_x);
+	} else {
+		/*
+		 * Hardcode the clock rates for the backward compatibility.
+		 * This works for both SOCFPGA and UniPhier.
+		 */
+		dev_notice(dev,
+			   "necessary clock is missing. default clock rates are used.\n");
+		denali->clk_x_rate = 200000000;
+	}
 
 	ret = denali_init(denali);
 	if (ret)
-		goto out_disable_clk;
+		goto out_disable_clk_ecc;
 
 	platform_set_drvdata(pdev, dt);
 	return 0;
 
+out_disable_clk_ecc:
+	clk_disable_unprepare(dt->clk_ecc);
+out_disable_clk_x:
+	clk_disable_unprepare(dt->clk_x);
 out_disable_clk:
 	clk_disable_unprepare(dt->clk);
 
@@ -144,6 +183,8 @@ static int denali_dt_remove(struct platform_device *pdev)
 	struct denali_dt *dt = platform_get_drvdata(pdev);
 
 	denali_remove(&dt->denali);
+	clk_disable_unprepare(dt->clk_ecc);
+	clk_disable_unprepare(dt->clk_x);
 	clk_disable_unprepare(dt->clk);
 
 	return 0;
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
