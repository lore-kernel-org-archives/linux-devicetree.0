From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] mtd: denali: fix property name for Denali DT binding
Date: Mon,  8 Feb 2016 16:31:42 +0900
Message-ID: <1454916702-20982-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: Dinh Nguyen <dinguyen@altera.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

The property "dma-mask" is used in the Examples section of this
document as well as drivers/mtd/nand/denali_dt.c, so I assume the
correct property name is "dma-mask", not "dm-mask"

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Documentation/devicetree/bindings/mtd/denali-nand.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
index b04d03a..785b825 100644
--- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
@@ -5,7 +5,7 @@ Required properties:
   - reg : should contain registers location and length for data and reg.
   - reg-names: Should contain the reg names "nand_data" and "denali_reg"
   - interrupts : The interrupt number.
-  - dm-mask : DMA bit mask
+  - dma-mask : DMA bit mask
 
 The device tree may optionally contain sub-nodes describing partitions of the
 address space. See partition.txt for more detail.
-- 
1.9.1
