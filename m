From: Luis Araneda <luaraneda@gmail.com>
Subject: [PATCH v3 6/6] dt-bindings: xilinx: zynq: Add missing boards
Date: Thu, 12 Jul 2018 00:10:24 -0400
Message-ID: <20180712041024.20583-7-luaraneda@gmail.com>
References: <20180712041024.20583-1-luaraneda@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180712041024.20583-1-luaraneda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michal Simek <michal.simek@xilinx.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Luis Araneda <luaraneda@gmail.com>
List-Id: devicetree@vger.kernel.org

The bindings were missing when the device-tree
files were added

Signed-off-by: Luis Araneda <luaraneda@gmail.com>
---
 .../devicetree/bindings/arm/xilinx.txt          | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/xilinx.txt b/Documentation/devicetree/bindings/arm/xilinx.txt
index d1a6deac90b5..26fe5ecc4332 100644
--- a/Documentation/devicetree/bindings/arm/xilinx.txt
+++ b/Documentation/devicetree/bindings/arm/xilinx.txt
@@ -11,12 +11,29 @@ Additional compatible strings:
 - Adapteva Parallella board
   "adapteva,parallella"
 
+- Avnet MicroZed board
+  "avnet,zynq-microzed"
+  "xlnx,zynq-microzed"
+
+- Avnet ZedBoard board
+  "avnet,zynq-zed"
+  "xlnx,zynq-zed"
+
+- Digilent Zybo board
+  "digilent,zynq-zybo"
+
 - Digilent Zybo Z7 board
   "digilent,zynq-zybo-z7"
 
 - Xilinx CC108 internal board
   "xlnx,zynq-cc108"
 
+- Xilinx ZC702 internal board
+  "xlnx,zynq-zc702"
+
+- Xilinx ZC706 internal board
+  "xlnx,zynq-zc706"
+
 - Xilinx ZC770 internal board, with different FMC cards
   "xlnx,zynq-zc770-xm010"
   "xlnx,zynq-zc770-xm011"
-- 
2.18.0
