From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2] dt-bindings: nand: denali: reduce the register space in
 the example
Date: Fri, 22 Sep 2017 14:58:23 +0900
Message-ID: <1506059903-15552-1-git-send-email-yamada.masahiro@socionext.com>
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
To: linux-mtd@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, Oleksij Rempel <o.rempel@pengutronix.de>, Boris Brezillon <boris.brezillon@free-electrons.com>, Dinh Nguyen <dinguyen@kernel.org>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>
List-Id: devicetree@vger.kernel.org

This example allocates much more than needed for address regions.

As for "denali_reg", as you see in drivers/mtd/nand/denali.h, all
registers fit in 0x1000.

As for "nand_data", this IP is generally configured to use Indexed
Addressing mode, where there are only two registers in the address
translation module (CTRL: 0x00, DATA: 0x10).  Altera SOCFPGA is
also this case.  So, 0x20 is enough.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Acked-by: Rob Herring <robh@kernel.org>
---

Changes in v2:
  - Add a little more explanation for rationale of this patch

 Documentation/devicetree/bindings/mtd/denali-nand.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
index 504291d..0ee8edb 100644
--- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
@@ -29,7 +29,7 @@ nand: nand@ff900000 {
 	#address-cells = <1>;
 	#size-cells = <1>;
 	compatible = "altr,socfpga-denali-nand";
-	reg = <0xff900000 0x100000>, <0xffb80000 0x10000>;
+	reg = <0xff900000 0x20>, <0xffb80000 0x1000>;
 	reg-names = "nand_data", "denali_reg";
 	interrupts = <0 144 4>;
 };
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
