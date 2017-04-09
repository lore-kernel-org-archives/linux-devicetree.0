From: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v5] dt-bindings: fpga: Add bindings document for Xilinx LogiCore PR Decoupler
Date: Sun,  9 Apr 2017 10:10:31 -0700
Message-ID: <1491757831-10510-1-git-send-email-mdf@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds the binding documentation for the Xilinx LogiCORE PR
Decoupler soft core.

Signed-off-by: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Acked-by: Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sören Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---

Changes from v4:
- Ssubject line
- Replaced 'or' by 'followed by' as suggested by Rob

Changes from v3:
- Addressed Michal's comments
- Addressed Alan's Comments
- Added Alan's Acked-by

Changes from v2:
- Added refence to generic fpga-region bindings
- Fixed up reg property in example
- Added fallback to "xlnx,pr-decoupler" without version

Changes from v1:
- Added clock names & clock to example
- Merged some of the description from Michal's version

---
 .../bindings/fpga/xilinx-pr-decoupler.txt          | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fpga/xilinx-pr-decoupler.txt

diff --git a/Documentation/devicetree/bindings/fpga/xilinx-pr-decoupler.txt b/Documentation/devicetree/bindings/fpga/xilinx-pr-decoupler.txt
new file mode 100644
index 0000000..b2c58fb
--- /dev/null
+++ b/Documentation/devicetree/bindings/fpga/xilinx-pr-decoupler.txt
@@ -0,0 +1,36 @@
+Xilinx LogiCORE Partial Reconfig Decoupler Softcore
+
+The Xilinx LogiCORE Partial Reconfig Decoupler manages one or more
+decouplers / fpga bridges.
+The controller can decouple/disable the bridges which prevents signal
+changes from passing through the bridge.  The controller can also
+couple / enable the bridges which allows traffic to pass through the
+bridge normally.
+
+The Driver supports only MMIO handling. A PR region can have multiple
+PR Decouplers which can be handled independently or chained via decouple/
+decouple_status signals.
+
+Required properties:
+- compatible		: Should contain "xlnx,pr-decoupler-1.00" followed by
+                          "xlnx,pr-decoupler"
+- regs			: base address and size for decoupler module
+- clocks		: input clock to IP
+- clock-names		: should contain "aclk"
+
+Optional properties:
+- bridge-enable		: 0 if driver should disable bridge at startup
+			  1 if driver should enable bridge at startup
+			  Default is to leave bridge in current state.
+
+See Documentation/devicetree/bindings/fpga/fpga-region.txt for generic bindings.
+
+Example:
+	fpga-bridge@100000450 {
+		compatible = "xlnx,pr-decoupler-1.00",
+			     "xlnx-pr-decoupler";
+		regs = <0x10000045 0x10>;
+		clocks = <&clkc 15>;
+		clock-names = "aclk";
+		bridge-enable = <0>;
+	};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
