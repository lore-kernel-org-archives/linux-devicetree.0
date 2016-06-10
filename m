From: Han Xu <han.xu@nxp.com>
Subject: [PATCH v2 6/6] mtd: nand: gpmi: document the new supported chip in DT
Date: Fri, 10 Jun 2016 12:01:34 -0500
Message-ID: <1465578094-8816-7-git-send-email-han.xu@nxp.com>
References: <1465578094-8816-1-git-send-email-han.xu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1465578094-8816-1-git-send-email-han.xu@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: han.xu@nxp.com, boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

listed all supported chips in DT.

Signed-off-by: Han Xu <han.xu@nxp.com>
---
 Documentation/devicetree/bindings/mtd/gpmi-nand.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
index c8d0e2f..ed48f69 100644
--- a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
@@ -4,7 +4,8 @@ The GPMI nand controller provides an interface to control the
 NAND flash chips.
 
 Required properties:
-  - compatible : should be "fsl,<chip>-gpmi-nand"
+  - compatible : should be "fsl,<chip>-gpmi-nand", the chip should be imx23,
+    imx28, imx6q, imx6qp, imx6sx, imx6ul or imx7d.
   - reg : should contain registers location and length for gpmi and bch.
   - reg-names: Should contain the reg names "gpmi-nand" and "bch"
   - interrupts : BCH interrupt number.
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
