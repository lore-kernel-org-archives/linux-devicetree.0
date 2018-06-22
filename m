From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v4 3/5] dt-binding: mtd: denali_dt: document clock property
Date: Sat, 23 Jun 2018 01:06:36 +0900
Message-ID: <1529683598-25783-4-git-send-email-yamada.masahiro@socionext.com>
References: <1529683598-25783-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1529683598-25783-1-git-send-email-yamada.masahiro@socionext.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

Commit 30f9f2fb7ba0 ("mtd: denali: add a DT driver") supported the
clock enablement, but did not document it in the DT binding.

In addition to the existing clock, this commit adds more clocks based
on the IP specification.

According to the Denali User's Guide, this IP needs three clocks:

 - clk: controller core clock

 - clk_x: bus interface clock

 - ecc_clk: clock at which ECC circuitry is run

The driver should accept the current single clock for the backward
compatibility, but the DT binding should represent the real hardware,
and future platforms must follow this.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v4:
  - split into a separate patch


 Documentation/devicetree/bindings/mtd/denali-nand.txt | 5 +++++
 1 file changed, 5 insertions(+)

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
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
