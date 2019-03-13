From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v5 03/12] dt-bindings: mtd: ingenic: Use standard ecc-engine
 property
Date: Wed, 13 Mar 2019 23:22:50 +0100
Message-ID: <20190313222259.28704-3-paul@crapouillou.net>
References: <20190313222259.28704-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20190313222259.28704-1-paul@crapouillou.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Harvey Hunt <harveyhuntnexus@gmail.com>
Cc: devicetree@vger.kernel.org, Mathieu Malaterre <malat@debian.org>, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, od@zcrc.me, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The 'ingenic,bch-controller' property is now deprecated and the
'ecc-engine' property should be used instead.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v5: New patch

 Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
index 5a45cc54f46d..c02259353327 100644
--- a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
@@ -14,7 +14,7 @@ Required NAND controller device properties:
   an offset of 0 and a size of 0x1000000 (i.e. the whole NEMC bank).
 
 Optional NAND controller device properties:
-- ingenic,bch-controller: To make use of the hardware ECC controller, this
+- ecc-engine: To make use of the hardware ECC controller, this
   property must contain a phandle for the ECC controller node. The required
   properties for this node are described below. If this is not specified,
   software ECC will be used instead.
@@ -48,7 +48,7 @@ nemc: nemc@13410000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		ingenic,bch-controller = <&bch>;
+		ecc-engine = <&bch>;
 
 		nand@1 {
 			reg = <1>;
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
