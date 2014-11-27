From: Stefan Roese <sr@denx.de>
Subject: [PATCH] mtd: gpmi: Remove "We support only one NAND chip" from
 bindings doc
Date: Thu, 27 Nov 2014 15:18:49 +0100
Message-ID: <1417097929-17832-1-git-send-email-sr@denx.de>
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
Cc: devicetree@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, Huang Shijie <b32955@freescale.com>
List-Id: devicetree@vger.kernel.org

This sentence "We support only one NAND chip now" is not true any more.
Multiple chips are supported. So lets remove this sentence to not
confuse anyone.

Signed-off-by: Stefan Roese <sr@denx.de>
Cc: Huang Shijie <b32955@freescale.com>
Cc: Brian Norris <computersforpeace@gmail.com>
---
 Documentation/devicetree/bindings/mtd/gpmi-nand.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
index a011fdf..d02acaf 100644
--- a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
@@ -1,7 +1,7 @@
 * Freescale General-Purpose Media Interface (GPMI)
 
 The GPMI nand controller provides an interface to control the
-NAND flash chips. We support only one NAND chip now.
+NAND flash chips.
 
 Required properties:
   - compatible : should be "fsl,<chip>-gpmi-nand"
-- 
2.2.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
