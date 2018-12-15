From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH 2/7] dt-bindings: riscv: sifive: add documentation for the SiFive FU540
Date: Fri, 14 Dec 2018 21:21:49 -0800
Message-ID: <20181215052154.24347-3-paul.walmsley@sifive.com>
References: <20181215052154.24347-1-paul.walmsley@sifive.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181215052154.24347-1-paul.walmsley@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, Paul Walmsley <paul@pwsan.com>
List-Id: devicetree@vger.kernel.org

Add DT binding documentation for the SiFive FU540 SoC.  This
SoC is documented at:

https://static.dev.sifive.com/FU540-C000-v1.0.pdf

This file is originally based on
Documentation/devicetree/bindings/arm/ti/k3.txt.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: devicetree@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Paul Walmsley <paul@pwsan.com>
---
 .../devicetree/bindings/riscv/sifive/fu540.txt     | 14 ++++++++++++++
 MAINTAINERS                                        |  9 +++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/sifive/fu540.txt

diff --git a/Documentation/devicetree/bindings/riscv/sifive/fu540.txt b/Documentation/devicetree/bindings/riscv/sifive/fu540.txt
new file mode 100644
index 000000000000..b5cf2b9f9a75
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/sifive/fu540.txt
@@ -0,0 +1,14 @@
+SiFive FU540 SoC architecture device tree bindings
+--------------------------------------------------
+
+Platforms based on the SiFive FU540 RISC-V SoC should follow the
+scheme described below:
+
+SoCs
+----
+
+Each device tree root node must specify one of the following
+compatible-string values:
+
+- Freedom Unleashed 540 rev. C000, or "FU540"
+  compatible = "sifive,fu540-c000", "sifive,fu540"
diff --git a/MAINTAINERS b/MAINTAINERS
index 8119141a926f..dee555ceb175 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13626,6 +13626,15 @@ S:	Supported
 K:	sifive
 N:	sifive
 
+SIFIVE FU540 SYSTEM-ON-CHIP
+M:	Paul Walmsley <paul.walmsley@sifive.com>
+M:	Palmer Dabbelt <palmer@sifive.com>
+L:	linux-riscv@lists.infradead.org
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pjw/sifive.git
+S:	Supported
+K:	fu540
+N:	fu540
+
 SILEAD TOUCHSCREEN DRIVER
 M:	Hans de Goede <hdegoede@redhat.com>
 L:	linux-input@vger.kernel.org
-- 
2.20.0
