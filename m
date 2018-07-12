From: Luis Araneda <luaraneda@gmail.com>
Subject: [PATCH v3 4/6] dt-bindings: xilinx: zynq: Sort entries alphabetically
Date: Thu, 12 Jul 2018 00:10:22 -0400
Message-ID: <20180712041024.20583-5-luaraneda@gmail.com>
References: <20180712041024.20583-1-luaraneda@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180712041024.20583-1-luaraneda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michal Simek <michal.simek@xilinx.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Luis Araneda <luaraneda@gmail.com>
List-Id: devicetree@vger.kernel.org

Sort additional compatible strings (boards) alphabetically
by their manufacturer and model number

This will help when finding a board because they
will be grouped by their manufacturer

Signed-off-by: Luis Araneda <luaraneda@gmail.com>
---
 Documentation/devicetree/bindings/arm/xilinx.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/xilinx.txt b/Documentation/devicetree/bindings/arm/xilinx.txt
index 4f1759b2bea7..a8e70a794d2e 100644
--- a/Documentation/devicetree/bindings/arm/xilinx.txt
+++ b/Documentation/devicetree/bindings/arm/xilinx.txt
@@ -8,6 +8,9 @@ Required root node properties:
 
 Additional compatible strings:
 
+- Digilent Zybo Z7 board
+  "digilent,zynq-zybo-z7"
+
 - Xilinx CC108 internal board
   "xlnx,zynq-cc108"
 
@@ -17,9 +20,6 @@ Additional compatible strings:
   "xlnx,zynq-zc770-xm012"
   "xlnx,zynq-zc770-xm013"
 
-- Digilent Zybo Z7 board
-  "digilent,zynq-zybo-z7"
-
 ---------------------------------------------------------------
 
 Xilinx Zynq UltraScale+ MPSoC Platforms Device Tree Bindings
-- 
2.18.0
