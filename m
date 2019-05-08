From: Wen He <wen.he_1@nxp.com>
Subject: [v1 1/4] dt-bindings: display: Add DT bindings for LS1028A HDP-TX PHY.
Date: Wed, 8 May 2019 10:00:11 +0000
Message-ID: <20190508100136.7009-1-wen.he_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: Wen He <wen.he_1@nxp.com>, Leo Li <leoyang.li@nxp.com>
List-Id: devicetree@vger.kernel.org

Add DT bindings documentmation for the HDP-TX PHY controller. The describes
which could be found on NXP Layerscape ls1028a platform.

Signed-off-by: Wen He <wen.he_1@nxp.com>
---
 .../devicetree/bindings/display/fsl,hdp.txt   | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/fsl,hdp.txt

diff --git a/Documentation/devicetree/bindings/display/fsl,hdp.txt b/Documentation/devicetree/bindings/display/fsl,hdp.txt
new file mode 100644
index 000000000000..36b5687a1261
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/fsl,hdp.txt
@@ -0,0 +1,56 @@
+NXP Layerscpae ls1028a HDP-TX PHY Controller
+============================================
+
+The following bindings describe the Cadence HDP TX PHY on ls1028a that
+offer multi-protocol support of standars such as eDP and Displayport,
+supports for 25-600MHz pixel clock and up to 4k2k at 60MHz resolution.
+The HDP transmitter is a Cadence HDP TX controller IP with a companion
+PHY IP.
+
+Required properties:
+  - compatible:   Should be "fsl,ls1028a-dp" for ls1028a.
+  - reg:          Physical base address and size of the block of registers used
+  by the processor.
+  - interrupts:   HDP hotplug in/out detect interrupt number
+  - clocks:       A list of phandle + clock-specifier pairs, one for each entry
+  in 'clock-names'
+  - clock-names:  A list of clock names. It should contain:
+      - "clk_ipg": inter-Integrated circuit clock
+      - "clk_core": for the Main Display TX controller clock
+      - "clk_pxl": for the pixel clock feeding the output PLL of the processor
+      - "clk_pxl_mux": for the high PerfPLL bypass clock
+      - "clk_pxl_link": for the link rate pixel clock
+      - "clk_apb": for the APB interface clock
+      - "clk_vif": for the Video pixel clock
+
+Required sub-nodes:
+  - port: The HDP connection to an encoder output port. The connection
+    is modelled using the OF graph bindings specified in
+    Documentation/devicetree/bindings/graph.txt
+
+
+Example:
+
+/ {
+        ...
+
+	hdp: display@f200000 {
+                compatible = "fsl,ls1028a-dp";
+		reg = <0x0 0xf1f0000 0x0 0xffff>,
+		    <0x0 0xf200000 0x0 0xfffff>;
+                interrupts = <0 221 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&sysclk>, <&hdpclk>, <&dpclk>,
+                         <&dpclk>, <&dpclk>, <&pclk>, <&dpclk>;
+		clock-names = "clk_ipg", "clk_core", "clk_pxl",
+                              "clk_pxl_mux", "clk_pxl_link", "clk_apb",
+                              "clk_vif";
+
+		port {
+			dp1_output: endpoint {
+				remote-endpoint = <&dp0_input>;
+			};
+		};
+        };
+
+        ...
+};
-- 
2.17.1
