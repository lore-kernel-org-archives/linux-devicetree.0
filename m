From: thor.thayer@linux.intel.com
Subject: [PATCHv2 1/5] Documentation: dt: edac: Fix Stratix10 IRQ bindings
Date: Wed, 27 Feb 2019 11:27:21 -0600
Message-ID: <1551288445-22335-2-git-send-email-thor.thayer@linux.intel.com>
References: <1551288445-22335-1-git-send-email-thor.thayer@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551288445-22335-1-git-send-email-thor.thayer@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bp@alien8.de, dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org
Cc: thor.thayer@linux.intel.com, devicetree@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <thor.thayer@linux.intel.com>

Fix Stratix10 ECC bindings to specify only the single
bit error. On Stratix10 double bit errors are handled
as SErrors instead of interrupts.
Indicate the differences between the ARM64 and ARM32
EDAC architecture in the bindings.

Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
v2 No change
---
 .../devicetree/bindings/edac/socfpga-eccmgr.txt    | 23 +++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/edac/socfpga-eccmgr.txt b/Documentation/devicetree/bindings/edac/socfpga-eccmgr.txt
index 5626560a6cfd..a0ac50e15912 100644
--- a/Documentation/devicetree/bindings/edac/socfpga-eccmgr.txt
+++ b/Documentation/devicetree/bindings/edac/socfpga-eccmgr.txt
@@ -236,33 +236,42 @@ Stratix10 SoCFPGA ECC Manager
 The Stratix10 SoC ECC Manager handles the IRQs for each peripheral
 in a shared register similar to the Arria10. However, ECC requires
 access to registers that can only be read from Secure Monitor with
-SMC calls. Therefore the device tree is slightly different.
+SMC calls. Therefore the device tree is slightly different. Note that
+only 1 interrupt is sent because the double bit errors are treated as
+SErrors instead of IRQ.
 
 Required Properties:
 - compatible : Should be "altr,socfpga-s10-ecc-manager"
-- interrupts : Should be single bit error interrupt, then double bit error
-	interrupt.
+- altr,sysgr-syscon : phandle to Stratix10 System Manager Block
+	              containing the ECC manager registers.
+- interrupts : Should be single bit error interrupt.
 - interrupt-controller : boolean indicator that ECC Manager is an interrupt controller
 - #interrupt-cells : must be set to 2.
+- #address-cells: must be 1
+- #size-cells: must be 1
+- ranges : standard definition, should translate from local addresses
 
 Subcomponents:
 
 SDRAM ECC
 Required Properties:
 - compatible : Should be "altr,sdram-edac-s10"
-- interrupts : Should be single bit error interrupt, then double bit error
-	interrupt, in this order.
+- interrupts : Should be single bit error interrupt.
 
 Example:
 
 	eccmgr {
 		compatible = "altr,socfpga-s10-ecc-manager";
-		interrupts = <0 15 4>, <0 95 4>;
+		altr,sysmgr-syscon = <&sysmgr>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupts = <0 15 4>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
+		ranges;
 
 		sdramedac {
 			compatible = "altr,sdram-edac-s10";
-			interrupts = <16 4>, <48 4>;
+			interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
 		};
 	};
-- 
2.7.4
