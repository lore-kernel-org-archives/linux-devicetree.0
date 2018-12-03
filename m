From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 33/34] dt-bindings: arm: Add missing Xilinx boards
Date: Mon,  3 Dec 2018 15:32:22 -0600
Message-ID: <20181203213223.16986-34-robh@kernel.org>
References: <20181203213223.16986-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203213223.16986-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sean Hudson <darknighte@darknighte.com>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Grant Likely <grant.likely@arm.com>, Kumar Gala <kumar.gala@linaro.org>, arm@kernel.org, Michal Simek <michal.simek@xilinx.com>
List-Id: devicetree@vger.kernel.org

From: Michal Simek <michal.simek@xilinx.com>

Add missing description for Ultra96, zcu104, zcu106 and zcu111.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/arm/xilinx.yaml       | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/xilinx.yaml b/Documentation/devicetree/bindings/arm/xilinx.yaml
index 64cd21b737af..c73b1f5c7f49 100644
--- a/Documentation/devicetree/bindings/arm/xilinx.yaml
+++ b/Documentation/devicetree/bindings/arm/xilinx.yaml
@@ -70,6 +70,14 @@ properties:
           - const: xlnx,zynqmp-zcu100
           - const: xlnx,zynqmp
 
+      - description: Xilinx 96boards compatible board Ultra96
+        items:
+          - const: avnet,ultra96-rev1
+          - const: avnet,ultra96
+          - const: xlnx,zynqmp-zcu100-revC
+          - const: xlnx,zynqmp-zcu100
+          - const: xlnx,zynqmp
+
       - description: Xilinx evaluation board zcu102
         items:
           - enum:
@@ -79,4 +87,28 @@ properties:
           - const: xlnx,zynqmp-zcu102
           - const: xlnx,zynqmp
 
+      - description: Xilinx evaluation board zcu104
+        items:
+          - enum:
+              - xlnx,zynqmp-zcu104-revA
+              - xlnx,zynqmp-zcu104-rev1.0
+          - const: xlnx,zynqmp-zcu104
+          - const: xlnx,zynqmp
+
+      - description: Xilinx evaluation board zcu106
+        items:
+          - enum:
+              - xlnx,zynqmp-zcu106-revA
+              - xlnx,zynqmp-zcu106-rev1.0
+          - const: xlnx,zynqmp-zcu106
+          - const: xlnx,zynqmp
+
+      - description: Xilinx evaluation board zcu111
+        items:
+          - enum:
+              - xlnx,zynqmp-zcu111-revA
+              - xlnx,zynqmp-zcu11-rev1.0
+          - const: xlnx,zynqmp-zcu111
+          - const: xlnx,zynqmp
+
 ...
-- 
2.19.1
