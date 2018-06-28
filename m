From: Luis Araneda <luaraneda@gmail.com>
Subject: [RFC PATCH 2/5] dt-bindings: xilinx: Add missing zynq boards
Date: Thu, 28 Jun 2018 01:42:02 -0400
Message-ID: <20180628054205.17737-3-luaraneda@gmail.com>
References: <20180628054205.17737-1-luaraneda@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180628054205.17737-1-luaraneda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michal Simek <michal.simek@xilinx.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Luis Araneda <luaraneda@gmail.com>
List-Id: devicetree@vger.kernel.org

The bindings were missing when adding the device-tree files
Also, improve description of existing boards

Signed-off-by: Luis Araneda <luaraneda@gmail.com>
---
 .../devicetree/bindings/arm/xilinx.txt        | 22 +++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/xilinx.txt b/Documentation/devicetree/bindings/arm/xilinx.txt
index b9043bc35..f1e911058 100644
--- a/Documentation/devicetree/bindings/arm/xilinx.txt
+++ b/Documentation/devicetree/bindings/arm/xilinx.txt
@@ -8,15 +8,33 @@ Required root node properties:
 
 Additional compatible strings:
 
-- Xilinx internal board cc108
+- Xilinx CC108 board
   "xlnx,zynq-cc108"
 
-- Xilinx internal board zc770 with different FMC cards
+- Avnet MicroZed board
+  "avnet,zynq-microzed"
+
+- Adapteva Parallella board
+  "adapteva,parallella"
+
+- Xilinx ZC702 board
+  "xlnx,zynq-zc702"
+
+- Xilinx ZC706 board
+  "xlnx,zynq-zc706"
+
+- Xilinx ZC770 board, with different FMC cards
   "xlnx,zynq-zc770-xm010"
   "xlnx,zynq-zc770-xm011"
   "xlnx,zynq-zc770-xm012"
   "xlnx,zynq-zc770-xm013"
 
+- Avnet ZedBoard board
+  "avnet,zynq-zed"
+
+- Digilent Zybo board
+  "digilent,zynq-zybo"
+
 - Digilent Zybo Z7 board
   "digilent,zynq-zybo-z7"
 
-- 
2.18.0
