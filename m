From: Yash Shah <yash.shah@sifive.com>
Subject: [PATCH 1/2] edac: sifive: Add DT documentation for SiFive L2 cache Controller
Date: Tue, 12 Mar 2019 14:51:00 +0530
Message-ID: <1552382461-13051-2-git-send-email-yash.shah@sifive.com>
References: <1552382461-13051-1-git-send-email-yash.shah@sifive.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552382461-13051-1-git-send-email-yash.shah@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-riscv@lists.infradead.org, linux-edac@vger.kernel.org, palmer@sifive.com, paul.walmsley@sifive.com
Cc: linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, aou@eecs.berkeley.edu, bp@alien8.de, mchehab@kernel.org, devicetree@vger.kernel.org, Yash Shah <yash.shah@sifive.com>
List-Id: devicetree@vger.kernel.org

DT documentation for L2 cache controller added.

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 .../devicetree/bindings/edac/sifive-edac-l2.txt    | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/sifive-edac-l2.txt

diff --git a/Documentation/devicetree/bindings/edac/sifive-edac-l2.txt b/Documentation/devicetree/bindings/edac/sifive-edac-l2.txt
new file mode 100644
index 0000000..abce09f
--- /dev/null
+++ b/Documentation/devicetree/bindings/edac/sifive-edac-l2.txt
@@ -0,0 +1,31 @@
+SiFive L2 Cache EDAC driver device tree bindings
+-------------------------------------------------
+This driver uses the EDAC framework to report L2 cache controller ECC errors.
+
+- compatible: Should be "sifive,<chip>-ccache" and "sifive,ccache<version>".
+  Supported compatible strings are:
+  "sifive,fu540-c000-ccache" for the SiFive cache controller v0 as integrated
+  onto the SiFive FU540 chip, and "sifive,ccache0" for the SiFive
+  cache controller v0 IP block with no chip integration tweaks.
+  Please refer to sifive-blocks-ip-versioning.txt for details
+
+- interrupts: Must contain 3 entries for FU540 (DirError, DataError, and
+  DataFail signals) or 4 entries for other chips (DirError, DirFail, DataError,
+  and DataFail signals)
+
+- interrupt-parent: Must be core interrupt controller
+
+- reg: Physical base address and size of L2 cache controller registers map
+  A second range can indicate L2 Loosely Integrated Memory
+
+- reg-names: Names for the cells of reg, must contain "control" and "sideband"
+
+Example:
+
+cache-controller@2010000 {
+	compatible = "sifive,fu540-c000-ccache", "sifive,ccache0";
+	interrupt-parent = <&plic>;
+	interrupts = <1 2 3>;
+	reg = <0x0 0x2010000 0x0 0x1000 0x0 0x8000000 0x0 0x2000000>;
+	reg-names = "control", "sideband";
+};
-- 
1.9.1
