From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH 6/7] dt-binding: riscv: sifive: add documentation for FU540-based boards
Date: Fri, 14 Dec 2018 21:21:53 -0800
Message-ID: <20181215052154.24347-7-paul.walmsley@sifive.com>
References: <20181215052154.24347-1-paul.walmsley@sifive.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181215052154.24347-1-paul.walmsley@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, Paul Walmsley <paul@pwsan.com>
List-Id: devicetree@vger.kernel.org

Add DT binding documentation for boards based on the SiFive FU540 SoC.
The first board, the HiFive Unleashed A00 (FU540), is described here:

https://static.dev.sifive.com/HiFive-Unleashed-Getting-Started-Guide-v1p1.pdf

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
 .../devicetree/bindings/riscv/sifive/fu540.txt         | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/sifive/fu540.txt b/Documentation/devicetree/bindings/riscv/sifive/fu540.txt
index b5cf2b9f9a75..20119cc54964 100644
--- a/Documentation/devicetree/bindings/riscv/sifive/fu540.txt
+++ b/Documentation/devicetree/bindings/riscv/sifive/fu540.txt
@@ -12,3 +12,13 @@ compatible-string values:
 
 - Freedom Unleashed 540 rev. C000, or "FU540"
   compatible = "sifive,fu540-c000", "sifive,fu540"
+
+Boards
+------
+
+Boards based on the FU540 SoC should specify the following
+compatible-string values:
+
+- HiFive-Unleashed rev. A00 board
+  compatible = "sifive,hifive-unleashed-a00-fu540",
+	       "sifive,hifive-unleashed-fu540"
-- 
2.20.0
