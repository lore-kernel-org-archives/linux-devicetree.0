From: Luis Araneda <luaraneda@gmail.com>
Subject: [PATCH v3 3/6] dt-bindings: xilinx: zynq: Improve boards description
Date: Thu, 12 Jul 2018 00:10:21 -0400
Message-ID: <20180712041024.20583-4-luaraneda@gmail.com>
References: <20180712041024.20583-1-luaraneda@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180712041024.20583-1-luaraneda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michal Simek <michal.simek@xilinx.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Luis Araneda <luaraneda@gmail.com>
List-Id: devicetree@vger.kernel.org

Change the description of some boards to make it similar
to the value of the model property from their respective
device-tree, using the format "<manufacturer> <model>"

Signed-off-by: Luis Araneda <luaraneda@gmail.com>
---
 Documentation/devicetree/bindings/arm/xilinx.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/xilinx.txt b/Documentation/devicetree/bindings/arm/xilinx.txt
index b9043bc35c14..4f1759b2bea7 100644
--- a/Documentation/devicetree/bindings/arm/xilinx.txt
+++ b/Documentation/devicetree/bindings/arm/xilinx.txt
@@ -8,10 +8,10 @@ Required root node properties:
 
 Additional compatible strings:
 
-- Xilinx internal board cc108
+- Xilinx CC108 internal board
   "xlnx,zynq-cc108"
 
-- Xilinx internal board zc770 with different FMC cards
+- Xilinx ZC770 internal board, with different FMC cards
   "xlnx,zynq-zc770-xm010"
   "xlnx,zynq-zc770-xm011"
   "xlnx,zynq-zc770-xm012"
-- 
2.18.0
