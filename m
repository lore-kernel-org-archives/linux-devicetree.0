From: Yash Shah <yash.shah@sifive.com>
Subject: [PATCH 1/3] macb: bindings doc: update sifive fu540-c000 binding
Date: Fri, 19 Jul 2019 16:40:29 +0530
Message-ID: <1563534631-15897-1-git-send-email-yash.shah@sifive.com>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: davem@davemloft.net, robh+dt@kernel.org, paul.walmsley@sifive.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: mark.rutland@arm.com, palmer@sifive.com, aou@eecs.berkeley.edu, nicolas.ferre@microchip.com, ynezz@true.cz, sachin.ghadi@sifive.com, Yash Shah <yash.shah@sifive.com>
List-Id: devicetree@vger.kernel.org

As per the discussion with Nicolas Ferre, rename the compatible property
to a more appropriate and specific string.
LINK: https://lkml.org/lkml/2019/7/17/200

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 Documentation/devicetree/bindings/net/macb.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/macb.txt b/Documentation/devicetree/bindings/net/macb.txt
index 63c73fa..0b61a90 100644
--- a/Documentation/devicetree/bindings/net/macb.txt
+++ b/Documentation/devicetree/bindings/net/macb.txt
@@ -15,10 +15,10 @@ Required properties:
   Use "atmel,sama5d4-gem" for the GEM IP (10/100) available on Atmel sama5d4 SoCs.
   Use "cdns,zynq-gem" Xilinx Zynq-7xxx SoC.
   Use "cdns,zynqmp-gem" for Zynq Ultrascale+ MPSoC.
-  Use "sifive,fu540-macb" for SiFive FU540-C000 SoC.
+  Use "sifive,fu540-c000-gem" for SiFive FU540-C000 SoC.
   Or the generic form: "cdns,emac".
 - reg: Address and length of the register set for the device
-	For "sifive,fu540-macb", second range is required to specify the
+	For "sifive,fu540-c000-gem", second range is required to specify the
 	address and length of the registers for GEMGXL Management block.
 - interrupts: Should contain macb interrupt
 - phy-mode: See ethernet.txt file in the same directory.
-- 
1.9.1
