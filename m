From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH v2 1/8] dt-bindings: xilinx: Add description for ZynqMP
Date: Fri, 23 Feb 2018 15:40:23 +0100
Message-ID: <0bff485b7ad09c0f1e23e82464382b43a918b84d.1519396753.git.michal.simek@xilinx.com>
References: <cover.1519396753.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1519396753.git.michal.simek@xilinx.com>
In-Reply-To: <cover.1519396753.git.michal.simek@xilinx.com>
References: <cover.1519396753.git.michal.simek@xilinx.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, monstr@monstr.eu, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Record xlnx,zynqmp compatible string.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

Changes in v2:
- New patch in this series

 Documentation/devicetree/bindings/arm/xilinx.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/xilinx.txt b/Documentation/devicetree/bindings/arm/xilinx.txt
index 1f7995357888..549e70a022cb 100644
--- a/Documentation/devicetree/bindings/arm/xilinx.txt
+++ b/Documentation/devicetree/bindings/arm/xilinx.txt
@@ -5,3 +5,13 @@ shall have the following properties.
 
 Required root node properties:
     - compatible = "xlnx,zynq-7000";
+
+---------------------------------------------------------------
+
+Xilinx Zynq UltraScale+ MPSoC Platforms Device Tree Bindings
+
+Boards with ZynqMP SOC based on an ARM Cortex A53 processor
+shall have the following properties.
+
+Required root node properties:
+    - compatible = "xlnx,zynqmp";
-- 
1.9.1
