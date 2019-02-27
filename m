From: Jolly Shah <jolly.shah@xilinx.com>
Subject: [PATCH 2/2] dt-bindings: xilinx: Separate clock binding from firmware doc
Date: Wed, 27 Feb 2019 12:51:10 -0800
Message-ID: <1551300670-6949-3-git-send-email-jollys@xilinx.com>
References: <1551300670-6949-1-git-send-email-jollys@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551300670-6949-1-git-send-email-jollys@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org
Cc: michal.simek@xilinx.com, rajanv@xilinx.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rajan Vaja <rajan.vaja@xilinx.com>, Jolly Shah <jollys@xilinx.com>
List-Id: devicetree@vger.kernel.org

From: Rajan Vaja <rajan.vaja@xilinx.com>

Clock description is part of firmware doc. Move clock description
in separate doc.

Signed-off-by: Rajan Vaja <rajan.vaja@xilinx.com>
Signed-off-by: Jolly Shah <jollys@xilinx.com>
---
 .../devicetree/bindings/clock/xlnx,zynqmp-clk.txt  | 63 ++++++++++++++++++++++
 .../firmware/xilinx/xlnx,zynqmp-firmware.txt       | 54 +------------------
 2 files changed, 64 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.txt

diff --git a/Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.txt b/Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.txt
new file mode 100644
index 0000000..391ee1a6
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.txt
@@ -0,0 +1,63 @@
+--------------------------------------------------------------------------
+Device Tree Clock bindings for the Zynq Ultrascale+ MPSoC controlled using
+Zynq MPSoC firmware interface
+--------------------------------------------------------------------------
+The clock controller is a h/w block of Zynq Ultrascale+ MPSoC clock
+tree. It reads required input clock frequencies from the devicetree and acts
+as clock provider for all clock consumers of PS clocks.
+
+See clock_bindings.txt for more information on the generic clock bindings.
+
+Required properties:
+ - #clock-cells:	Must be 1
+ - compatible:		Must contain:	"xlnx,zynqmp-clk"
+ - clocks:		List of clock specifiers which are external input
+			clocks to the given clock controller. Please refer
+			the next section to find the input clocks for a
+			given controller.
+ - clock-names:		List of clock names which are exteral input clocks
+			to the given clock controller. Please refer to the
+			clock bindings for more details.
+
+Input clocks for zynqmp Ultrascale+ clock controller:
+
+The Zynq UltraScale+ MPSoC has one primary and four alternative reference clock
+inputs. These required clock inputs are:
+ - pss_ref_clk (PS reference clock)
+ - video_clk (reference clock for video system )
+ - pss_alt_ref_clk (alternative PS reference clock)
+ - aux_ref_clk
+ - gt_crx_ref_clk (transceiver reference clock)
+
+The following strings are optional parameters to the 'clock-names' property in
+order to provide an optional (E)MIO clock source:
+ - swdt0_ext_clk
+ - swdt1_ext_clk
+ - gem0_emio_clk
+ - gem1_emio_clk
+ - gem2_emio_clk
+ - gem3_emio_clk
+ - mio_clk_XX		# with XX = 00..77
+ - mio_clk_50_or_51	#for the mux clock to gem tsu from 50 or 51
+
+
+Output clocks are registered based on clock information received
+from firmware. Output clocks indexes are mentioned in
+include/dt-bindings/clock/xlnx-zynqmp-clk.h.
+
+-------
+Example
+-------
+
+firmware {
+	zynqmp_firmware: zynqmp-firmware {
+		compatible = "xlnx,zynqmp-firmware";
+		method = "smc";
+		zynqmp_clk: clock-controller {
+			#clock-cells = <1>;
+			compatible = "xlnx,zynqmp-clk";
+			clocks = <&pss_ref_clk>, <&video_clk>, <&pss_alt_ref_clk>, <&aux_ref_clk>, <&gt_crx_ref_clk>;
+			clock-names = "pss_ref_clk", "video_clk", "pss_alt_ref_clk","aux_ref_clk", "gt_crx_ref_clk";
+		};
+	};
+};
diff --git a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt
index 45d259c..a4fe136 100644
--- a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt
+++ b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt
@@ -17,53 +17,6 @@ Required properties:
 		  - "smc" : SMC #0, following the SMCCC
 		  - "hvc" : HVC #0, following the SMCCC
 
---------------------------------------------------------------------------
-Device Tree Clock bindings for the Zynq Ultrascale+ MPSoC controlled using
-Zynq MPSoC firmware interface
---------------------------------------------------------------------------
-The clock controller is a h/w block of Zynq Ultrascale+ MPSoC clock
-tree. It reads required input clock frequencies from the devicetree and acts
-as clock provider for all clock consumers of PS clocks.
-
-See clock_bindings.txt for more information on the generic clock bindings.
-
-Required properties:
- - #clock-cells:	Must be 1
- - compatible:		Must contain:	"xlnx,zynqmp-clk"
- - clocks:		List of clock specifiers which are external input
-			clocks to the given clock controller. Please refer
-			the next section to find the input clocks for a
-			given controller.
- - clock-names:		List of clock names which are exteral input clocks
-			to the given clock controller. Please refer to the
-			clock bindings for more details.
-
-Input clocks for zynqmp Ultrascale+ clock controller:
-
-The Zynq UltraScale+ MPSoC has one primary and four alternative reference clock
-inputs. These required clock inputs are:
- - pss_ref_clk (PS reference clock)
- - video_clk (reference clock for video system )
- - pss_alt_ref_clk (alternative PS reference clock)
- - aux_ref_clk
- - gt_crx_ref_clk (transceiver reference clock)
-
-The following strings are optional parameters to the 'clock-names' property in
-order to provide an optional (E)MIO clock source:
- - swdt0_ext_clk
- - swdt1_ext_clk
- - gem0_emio_clk
- - gem1_emio_clk
- - gem2_emio_clk
- - gem3_emio_clk
- - mio_clk_XX		# with XX = 00..77
- - mio_clk_50_or_51	#for the mux clock to gem tsu from 50 or 51
-
-
-Output clocks are registered based on clock information received
-from firmware. Output clocks indexes are mentioned in
-include/dt-bindings/clock/xlnx-zynqmp-clk.h.
-
 -------
 Example
 -------
@@ -72,11 +25,6 @@ firmware {
 	zynqmp_firmware: zynqmp-firmware {
 		compatible = "xlnx,zynqmp-firmware";
 		method = "smc";
-		zynqmp_clk: clock-controller {
-			#clock-cells = <1>;
-			compatible = "xlnx,zynqmp-clk";
-			clocks = <&pss_ref_clk>, <&video_clk>, <&pss_alt_ref_clk>, <&aux_ref_clk>, <&gt_crx_ref_clk>;
-			clock-names = "pss_ref_clk", "video_clk", "pss_alt_ref_clk","aux_ref_clk", "gt_crx_ref_clk";
-		};
+		...
 	};
 };
-- 
2.7.4
