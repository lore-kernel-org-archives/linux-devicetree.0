From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: [PATCH 4/4] Update device tree Synopsys DW DMAC documentation
Date: Wed, 16 Nov 2016 16:56:55 +0300
Message-ID: <1479304615-11360-5-git-send-email-Eugeniy.Paltsev@synopsys.com>
References: <1479304615-11360-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1479304615-11360-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com, vireshk@kernel.org, dan.j.williams@intel.com, vinod.koul@intel.com, dmaengine@vger.kernel.org, linux-snps-arc@lists.infradead.org, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
List-Id: devicetree@vger.kernel.org

 * Rename is_private to is-private as ordered by DT policy.
 The change leaves the support for the old format.

 * Add is-memcpu property, so it is possible to
 enable memory-to-memory transfers support via DT.

 * Add hw-llp property, so it is possible to enable
 hardware multi block transfers support via DT.

 Fix white spaces.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 Documentation/devicetree/bindings/dma/snps-dma.txt | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/snps-dma.txt b/Documentation/devicetree/bindings/dma/snps-dma.txt
index 0f55832..d41d960 100644
--- a/Documentation/devicetree/bindings/dma/snps-dma.txt
+++ b/Documentation/devicetree/bindings/dma/snps-dma.txt
@@ -20,13 +20,19 @@ Required properties:
 Deprecated properties:
 - data_width: Maximum data width supported by hardware per AHB master
   (0 - 8bits, 1 - 16bits, ..., 5 - 256bits)
+- is_private: The device channels should be marked as private and not for by the
+  general purpose DMA channel allocator. False if not passed.
 
 
 Optional properties:
 - interrupt-parent: Should be the phandle for the interrupt controller
   that services interrupts for this device
-- is_private: The device channels should be marked as private and not for by the
+- is-private: The device channels should be marked as private and not for by the
   general purpose DMA channel allocator. False if not passed.
+- is-memcpu: The device channels do support memory-to-memory transfers. False
+  if not passed.
+- hw-llp: Multi block transfers supported by hardware per AHB master.
+  0 (default): not supported, 1: supported.
 
 Example:
 
@@ -56,7 +62,7 @@ The four cells in order are:
 4. Peripheral master for transfers on allocated channel
 
 Example:
-	
+
 	serial@e0000000 {
 		compatible = "arm,pl011", "arm,primecell";
 		reg = <0xe0000000 0x1000>;
-- 
2.5.5
