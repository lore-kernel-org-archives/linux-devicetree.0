From: Yash Shah <yash.shah@sifive.com>
Subject: [PATCH 1/2] RISC-V: Add DT documentation for SiFive L2 Cache Controller
Date: Thu, 25 Apr 2019 11:24:55 +0530
Message-ID: <1556171696-7741-2-git-send-email-yash.shah@sifive.com>
References: <1556171696-7741-1-git-send-email-yash.shah@sifive.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556171696-7741-1-git-send-email-yash.shah@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, palmer@sifive.com
Cc: paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, mark.rutland@arm.com, robh+dt@kernel.org, sachin.ghadi@sifive.com, Yash Shah <yash.shah@sifive.com>
List-Id: devicetree@vger.kernel.org

Add device tree bindings for SiFive FU540 L2 cache controller driver

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 .../devicetree/bindings/riscv/sifive-l2-cache.txt  | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt

diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
new file mode 100644
index 0000000..15132e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
@@ -0,0 +1,53 @@
+SiFive L2 Cache Controller
+--------------------------
+The SiFive Level 2 Cache Controller is used to provide access to fast copies
+of memory for masters in a Core Complex. The Level 2 Cache Controller also
+acts as directory-based coherency manager.
+
+Required Properties:
+--------------------
+- compatible: Should be "sifive,fu540-c000-ccache"
+
+- cache-block-size: Specifies the block size in bytes of the cache
+
+- cache-level: Should be set to 2 for a level 2 cache
+
+- cache-sets: Specifies the number of associativity sets of the cache
+
+- cache-size: Specifies the size in bytes of the cache
+
+- cache-unified: Specifies the cache is a unified cache
+
+- interrupt-parent: Must be core interrupt controller
+
+- interrupts: Must contain 3 entries (DirError, DataError and DataFail signals)
+
+- reg: Physical base address and size of L2 cache controller registers map
+
+- reg-names: Should be "control"
+
+Optional Properties:
+--------------------
+- next-level-cache: phandle to the next level cache if present.
+
+- memory-region: reference to the reserved-memory for the L2 Loosely Integrated
+  Memory region. The reserved memory node should be defined as per the bindings
+  in reserved-memory.txt
+
+
+Example:
+
+	cache-controller@2010000 {
+		compatible = "sifive,fu540-c000-ccache";
+		cache-block-size = <0x40>;
+		cache-level = <0x2>;
+		cache-sets = <0x400>;
+		cache-size = <0x100000>;
+		cache-unified;
+		interrupt-parent = <&plic0>;
+		interrupts = <1 2 3>;
+		reg = <0x0 0x2010000 0x0 0x1000>;
+		reg-names = "control";
+		next-level-cache = <&L25 &L40 &L36>;
+		memory-region = <&l2_lim>;
+	};
-- 
1.9.1
