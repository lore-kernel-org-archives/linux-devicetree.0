From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/2] dt/bindings: mips: Document Ingenic SoCs binding
Date: Mon, 22 Jul 2019 13:55:47 -0400
Message-ID: <20190722175548.18434-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: od@zcrc.me, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

Document the available properties for the root node and the cpu nodes of
the devicetree for the Ingenic SoCs.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../devicetree/bindings/mips/ingenic-socs.txt      | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/ingenic-socs.txt

diff --git a/Documentation/devicetree/bindings/mips/ingenic-socs.txt b/Documentation/devicetree/bindings/mips/ingenic-socs.txt
new file mode 100644
index 000000000000..fea2e6ec10a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/ingenic-socs.txt
@@ -0,0 +1,14 @@
+Bindings for Ingenic JZ47xx family of SoCs
+
+Required properties for root node:
+- compatible: One of:
+  * ingenic,jz4740
+  * ingenic,jz4725b
+  * ingenic,jz4770
+  * ingenic,jz4780
+
+Required properties for CPU nodes:
+- compatible: One of:
+  * ingenic,xburst-d0
+  * ingenic,xburst-d1
+  * ingenic,xburst-e1
-- 
2.21.0.593.g511ec345e18
