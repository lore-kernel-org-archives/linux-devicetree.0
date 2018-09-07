From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] mtd: rawnand: denali: add DT property to specify skipped
 bytes in OOB
Date: Fri,  7 Sep 2018 19:56:23 +0900
Message-ID: <1536317783-4942-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Marek Vasut <marek.vasut@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

NAND devices need additional data area (OOB) for error correction,
but it is also used for Bad Block Marker (BBM).  In many cases, the
first byte in OOB is used for BBM, but the location actually depends
on chip vendors.  The NAND controller should preserve the precious
BBM to keep track of bad blocks.

In Denali IP, the SPARE_AREA_SKIP_BYTES register is used to specify
the number of bytes to skip from the start of OOB.  The ECC engine
will automatically skip the specified number of bytes when it gets
access to OOB area.

The same value for SPARE_AREA_SKIP_BYTES should be used between
firmware and the operating system if you intend to use the NAND
device across the control hand-off.

In fact, the current denali.c code expects firmware to have already
set the SPARE_AREA_SKIP_BYTES register, then reads the value out.

If no firmware (or bootloader) has initialized the controller, the
register value is zero, which is the default after power-on-reset.

In other words, the Linux driver cannot initialize the controller
by itself.  You cannot support the reset control either because
resetting the controller will get register values lost.

This commit adds a way to specify it via DT.  If the property
"denali,oob-skip-bytes" exists, the value will be set to the register.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

I thought this feature was common enough, but I could not find
any relevant property.

I added "denali," vendor prefix.  If you have a better property name
(or a better way to specify the value), please suggest it.


 Documentation/devicetree/bindings/mtd/denali-nand.txt |  3 +++
 drivers/mtd/nand/raw/denali.c                         | 14 +++++++++-----
 drivers/mtd/nand/raw/denali_dt.c                      |  6 ++++++
 3 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
index f33da87..453faca 100644
--- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
@@ -22,6 +22,9 @@ Optional properties:
       8, 16, 24  for "socionext,uniphier-denali-nand-v5a"
       8, 16      for "socionext,uniphier-denali-nand-v5b"
   - nand-ecc-maximize: see nand.txt for details
+  - denali,oob-skip-bytes: number of bytes to reserve from the start of OOB.
+    The reserved bytes should not be used for ECC or any other purpose.
+    It is generally intended to preserve bad block markers.
 
 The device tree may optionally contain sub-nodes describing partitions of the
 address space. See partition.txt for more detail.
diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index d1ae968..3ef3f0d 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -1050,12 +1050,16 @@ static void denali_hw_init(struct denali_nand_info *denali)
 		denali->revision = swab16(ioread32(denali->reg + REVISION));
 
 	/*
-	 * tell driver how many bit controller will skip before
-	 * writing ECC code in OOB, this register may be already
-	 * set by firmware. So we read this value out.
-	 * if this value is 0, just let it be.
+	 * If oob_skip_bytes is specified (e.g. by DT property), set it to the
+	 * reigster. Otherwise, read the value out that may be set by firmware.
 	 */
-	denali->oob_skip_bytes = ioread32(denali->reg + SPARE_AREA_SKIP_BYTES);
+	if (denali->oob_skip_bytes)
+		iowrite32(denali->oob_skip_bytes,
+			  denali->reg + SPARE_AREA_SKIP_BYTES);
+	else
+		denali->oob_skip_bytes = ioread32(denali->reg +
+						  SPARE_AREA_SKIP_BYTES);
+
 	denali_detect_max_banks(denali);
 	iowrite32(0x0F, denali->reg + RB_PIN_ENABLED);
 	iowrite32(CHIP_EN_DONT_CARE__FLAG, denali->reg + CHIP_ENABLE_DONT_CARE);
diff --git a/drivers/mtd/nand/raw/denali_dt.c b/drivers/mtd/nand/raw/denali_dt.c
index 7c6a8a4..bc93675 100644
--- a/drivers/mtd/nand/raw/denali_dt.c
+++ b/drivers/mtd/nand/raw/denali_dt.c
@@ -78,6 +78,7 @@ static int denali_dt_probe(struct platform_device *pdev)
 	struct denali_dt *dt;
 	const struct denali_dt_data *data;
 	struct denali_nand_info *denali;
+	u32 oob_skip;
 	int ret;
 
 	dt = devm_kzalloc(dev, sizeof(*dt), GFP_KERNEL);
@@ -155,6 +156,11 @@ static int denali_dt_probe(struct platform_device *pdev)
 		denali->clk_x_rate = 200000000;
 	}
 
+	ret = of_property_read_u32(dev->of_node, "denali,oob-skip-bytes",
+				   &oob_skip);
+	if (!ret)
+		denali->oob_skip_bytes = oob_skip;
+
 	ret = denali_init(denali);
 	if (ret)
 		goto out_disable_clk_ecc;
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
