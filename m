From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: [PATCH v2] Documentation: arm: Fixed typo in socfpga fpga mgr example
Date: Fri, 30 Oct 2015 09:51:27 -0700
Message-ID: <1446223887-3144-1-git-send-email-moritz.fischer@ettus.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org
Cc: pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, atull@opensource.altera.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Moritz Fischer <moritz.fischer@ettus.com>
List-Id: devicetree@vger.kernel.org

Addresses should not be prefixed contain '0x' in nodes.

Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
---
 Documentation/devicetree/bindings/fpga/altera-socfpga-fpga-mgr.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/fpga/altera-socfpga-fpga-mgr.txt b/Documentation/devicetree/bindings/fpga/altera-socfpga-fpga-mgr.txt
index 9b027a6..d52f334 100644
--- a/Documentation/devicetree/bindings/fpga/altera-socfpga-fpga-mgr.txt
+++ b/Documentation/devicetree/bindings/fpga/altera-socfpga-fpga-mgr.txt
@@ -9,7 +9,7 @@ Required properties:
 
 Example:
 
-	hps_0_fpgamgr: fpgamgr@0xff706000 {
+	hps_0_fpgamgr: fpgamgr@ff706000 {
 		compatible = "altr,socfpga-fpga-mgr";
 		reg = <0xFF706000 0x1000
 		       0xFFB90000 0x1000>;
-- 
2.6.2
