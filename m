From: Andrew Bresticker <abrestic@chromium.org>
Subject: [PATCH V2 3/5] MIPS: Document Pistachio boot protocol and device-tree bindings
Date: Fri, 13 Mar 2015 15:54:07 -0700
Message-ID: <1426287249-27185-4-git-send-email-abrestic@chromium.org>
References: <1426287249-27185-1-git-send-email-abrestic@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426287249-27185-1-git-send-email-abrestic@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Andrew Bresticker <abrestic@chromium.org>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The Pistachio SoC boots only with device-tree.  Document the required
properties and nodes as well as the boot protocol between the bootlaoder
and the kernel.

Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
---
Changes from v1:
 - switched to MIPS UHI hand-off protocol
---
 .../devicetree/bindings/mips/img/pistachio.txt     | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/img/pistachio.txt

diff --git a/Documentation/devicetree/bindings/mips/img/pistachio.txt b/Documentation/devicetree/bindings/mips/img/pistachio.txt
new file mode 100644
index 0000000..a736d88
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/img/pistachio.txt
@@ -0,0 +1,42 @@
+Imagination Pistachio SoC
+=========================
+
+Required properties:
+--------------------
+ - compatible: Must include "img,pistachio".
+
+CPU nodes:
+----------
+A "cpus" node is required.  Required properties:
+ - #address-cells: Must be 1.
+ - #size-cells: Must be 0.
+A CPU sub-node is also required for at least CPU 0.  Since the topology may
+be probed via CPS, it is not necessary to specify secondary CPUs.  Required
+propertis:
+ - device_type: Must be "cpu".
+ - compatible: Must be "mti,interaptiv".
+ - reg: CPU number.
+ - clocks: Must include the CPU clock.  See ../../clock/clock-bindings.txt for
+   details on clock bindings.
+Example:
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "mti,interaptiv";
+			reg = <0>;
+			clocks = <&clk_core CLK_MIPS>;
+		};
+	};
+
+
+Boot protocol:
+--------------
+In accordance with the MIPS UHI specification[1], the bootloader must pass the
+following arguments to the kernel:
+ - $a0: -2.
+ - $a1: KSEG0 address of the flattened device-tree blob.
+
+[1] http://prplfoundation.org/wiki/MIPS_documentation
-- 
2.2.0.rc0.207.ga3a616c
