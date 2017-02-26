From: matthew.gerlach@linux.intel.com
Subject: [PATCH v2 3/4] fpga dt: bindings for Altera Partial Reconfiguration IP.
Date: Sun, 26 Feb 2017 08:35:47 -0800
Message-ID: <1488126948-9466-4-git-send-email-matthew.gerlach@linux.intel.com>
References: <1488126948-9466-1-git-send-email-matthew.gerlach@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1488126948-9466-1-git-send-email-matthew.gerlach@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: atull@opensource.altera.com, moritz.fischer@ettus.com, linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Matthew Gerlach <matthew.gerlach@linux.intel.com>
List-Id: devicetree@vger.kernel.org

From: Matthew Gerlach <matthew.gerlach@linux.intel.com>

Device Tree bindings for Altera Partial Reconfiguration IP.

v2: s/Reconfiguraion/Reconfiguration/
====================

Signed-off-by: Matthew Gerlach <matthew.gerlach@linux.intel.com>
---
 Documentation/devicetree/bindings/fpga/altera-pr-ip.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fpga/altera-pr-ip.txt

diff --git a/Documentation/devicetree/bindings/fpga/altera-pr-ip.txt b/Documentation/devicetree/bindings/fpga/altera-pr-ip.txt
new file mode 100644
index 0000000..ada821f
--- /dev/null
+++ b/Documentation/devicetree/bindings/fpga/altera-pr-ip.txt
@@ -0,0 +1,12 @@
+Altera Partial Reconfiguration IP
+
+Required properties:
+- compatible : should contain "altr,pr-ip"
+- reg        : base address and size for memory mapped io.
+
+Example:
+
+	fpga_mgr: fpga-mgr@ff20c000 {
+		compatible = "altr,pr-ip";
+		reg = <0xff20c000 0x10>;
+	};
-- 
2.7.4
