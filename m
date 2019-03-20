From: Yash Shah <yash.shah@sifive.com>
Subject: [PATCH 1/2] edac: sifive: Add DT documentation for SiFive EDAC driver and subcomponent
Date: Wed, 20 Mar 2019 17:22:07 +0530
Message-ID: <1553082728-9232-2-git-send-email-yash.shah@sifive.com>
References: <1553082728-9232-1-git-send-email-yash.shah@sifive.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1553082728-9232-1-git-send-email-yash.shah@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-riscv@lists.infradead.org, linux-edac@vger.kernel.org, palmer@sifive.com, paul.walmsley@sifive.com
Cc: linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, aou@eecs.berkeley.edu, bp@alien8.de, mchehab@kernel.org, devicetree@vger.kernel.org, sachin.ghadi@sifive.com, Yash Shah <yash.shah@sifive.com>
List-Id: devicetree@vger.kernel.org

DT documentation for EDAC driver added.
DT documentation for subcomponent L2 cache controller also added.

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 .../devicetree/bindings/edac/sifive-edac.txt       | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/sifive-edac.txt

diff --git a/Documentation/devicetree/bindings/edac/sifive-edac.txt b/Documentation/devicetree/bindings/edac/sifive-edac.txt
new file mode 100644
index 0000000..c0e3ac7
--- /dev/null
+++ b/Documentation/devicetree/bindings/edac/sifive-edac.txt
@@ -0,0 +1,40 @@
+SiFive ECC Manager
+This driver uses the EDAC framework to implement the SiFive ECC Manager.
+
+Required Properties:
+- compatible : Should be "sifive,ecc-manager"
+- #address-cells: must be 2
+- #size-cells: must be 2
+- ranges : standard definition, should translate from local addresses
+
+Subcomponents:
+
+L2 Cache ECC
+Required Properties:
+- compatible: Should be "sifive,<chip>-ccache" and "sifive,ccache<version>".
+  Supported compatible strings are:
+  "sifive,fu540-c000-ccache" for the SiFive cache controller v0 as integrated
+  onto the SiFive FU540 chip, and "sifive,ccache0" for the SiFive
+  cache controller v0 IP block with no chip integration tweaks.
+  Please refer to sifive-blocks-ip-versioning.txt for details
+- interrupt-parent: Must be core interrupt controller
+- interrupts: Must contain 3 entries (DirError, DataError and DataFail signals
+- reg: Physical base address and size of L2 cache controller registers map
+  A second range can indicate L2 Loosely Integrated Memory
+
+Example:
+
+eccmgr: eccmgr {
+	compatible = "sifive,ecc-manager";
+	#address-cells = <2>;
+	#size-cells = <2>;
+	ranges;
+
+	l2-ecc@2010000 {
+		compatible = "sifive,fu540-c000-ccache", "sifive,ccache0";
+		interrupt-parent = <&plic0>;
+		interrupts = <1 2 3>;
+		reg = <0x0 0x2010000 0x0 0x1000 0x0 0x8000000 0x0 0x2000000>;
+	};
+};
+
-- 
1.9.1
