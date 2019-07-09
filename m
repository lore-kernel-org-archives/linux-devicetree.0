Return-Path: <SRS0=cJxD=VG=linux.intel.com=thor.thayer@kernel.org>
From: thor.thayer@linux.intel.com
Subject: [PATCH 1/3] Documentation: dt: edac: Add reg to S10 SDRAM node
Date: Tue,  9 Jul 2019 17:24:48 -0500
Message-Id: <1562711090-900-2-git-send-email-thor.thayer@linux.intel.com>
In-Reply-To: <1562711090-900-1-git-send-email-thor.thayer@linux.intel.com>
References: <1562711090-900-1-git-send-email-thor.thayer@linux.intel.com>
To: bp@alien8.de, mchehab@kernel.org, james.morse@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, dinguyen@kernel.org
Cc: devicetree@vger.kernel.org, linux-edac@vger.kernel.org, Thor Thayer <thor.thayer@linux.intel.com>
List-ID: <devicetree@vger.kernel.org>

From: Thor Thayer <thor.thayer@linux.intel.com>

Include the register offset and size in the Stratix10 SDRAM node
to be consistent with other ECC modules.
Previously had to follow the phandle to get the register size/offset.

Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
 Documentation/devicetree/bindings/edac/socfpga-eccmgr.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/edac/socfpga-eccmgr.txt b/Documentation/devicetree/bindings/edac/socfpga-eccmgr.txt
index 8f52206cfd2a..dd6ba6c020a7 100644
--- a/Documentation/devicetree/bindings/edac/socfpga-eccmgr.txt
+++ b/Documentation/devicetree/bindings/edac/socfpga-eccmgr.txt
@@ -256,6 +256,7 @@ Subcomponents:
 SDRAM ECC
 Required Properties:
 - compatible : Should be "altr,sdram-edac-s10"
+- reg        : Address and size for ECC block registers.
 - interrupts : Should be single bit error interrupt.
 
 On-Chip RAM ECC
@@ -313,8 +314,9 @@ Example:
 		#interrupt-cells = <2>;
 		ranges;
 
-		sdramedac {
+		sdramedac@0xf8011100 {
 			compatible = "altr,sdram-edac-s10";
+			reg = <0xf8011100 0xc0>;
 			interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-- 
2.7.4
