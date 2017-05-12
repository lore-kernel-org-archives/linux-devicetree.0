From: Philippe CORNU <philippe.cornu@st.com>
Subject: [PATCH v1 2/3] dt-bindings: display: Add STM32 DSI host driver
Date: Fri, 12 May 2017 16:56:28 +0200
Message-ID: <1494600989-13507-3-git-send-email-philippe.cornu@st.com>
References: <1494600989-13507-1-git-send-email-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1494600989-13507-1-git-send-email-philippe.cornu@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexandre Torgue <alexandre.torgue@st.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Yannick Fertre <yannick.fertre@st.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, kernel@stlinux.com, Philippe Cornu <philippe.cornu@st.com>, Fabien Dessenne <fabien.dessenne@st.com>, dri-devel@lists.freedesktop.org, Mickael Reulier <mickael.reulier@st.com>, Vincent Abriou <vincent.abriou@st.com>, Gabriel Fernandez <gabriel.fernandez@st.com>, Ludovic Barre <ludovic.barre@st.com>
List-Id: devicetree@vger.kernel.org

This patch adds documentation of device tree bindings for the STM32
DSI host driver based on the Synopsys DW MIPI DSI driver from Rockchip.

Signed-off-by: Philippe CORNU <philippe.cornu@st.com>
---
 .../devicetree/bindings/display/st,stm32-ltdc.txt  | 92 +++++++++++++++++++++-
 1 file changed, 90 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt b/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt
index 8e14769..a61381b 100644
--- a/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt
+++ b/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt
@@ -1,7 +1,6 @@
 * STMicroelectronics STM32 lcd-tft display controller
 
 - ltdc: lcd-tft display controller host
-  must be a sub-node of st-display-subsystem
   Required properties:
   - compatible: "st,stm32-ltdc"
   - reg: Physical base address of the IP registers and length of memory mapped region.
@@ -13,8 +12,25 @@
   Required nodes:
     - Video port for RGB output.
 
-Example:
+* STMicroelectronics STM32 specific extensions to Synopsys Designware MIPI DSI
+(similar to "rockchip/dw_mipi_dsi_rockchip.txt")
 
+Required properties:
+- #address-cells: Should be <1>.
+- #size-cells: Should be <0>.
+- compatible: "st,stm32-dsi_host".
+- reg: Represent the physical address range of the controller.
+- clocks, clock-names: Phandles to the controller's pll reference
+  clock(ref) and APB clock(pclk). As described in [1].
+- ports: contain a port node with endpoint definitions as defined in [2].
+- resets: list of phandle + reset specifier pairs, as described in [3].
+- reset-names: string reset name, must be "apb".
+
+[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
+[2] Documentation/devicetree/bindings/media/video-interfaces.txt
+[3] Documentation/devicetree/bindings/reset/reset.txt
+
+Example 1: RGB panel
 / {
 	...
 	soc {
@@ -34,3 +50,75 @@ Example:
 		};
 	};
 };
+
+Example 2: DSI panel
+
+/ {
+	...
+	soc {
+	...
+		ltdc: display-controller@40016800 {
+			compatible = "st,stm32-ltdc";
+			reg = <0x40016800 0x200>;
+			interrupts = <88>, <89>;
+			resets = <&rcc STM32F4_APB2_RESET(LTDC)>;
+			clocks = <&rcc 1 CLK_LCD>;
+			clock-names = "lcd";
+
+			port {
+				ltdc_out_dsi_host: endpoint {
+					remote-endpoint = <&dsi_host_in>;
+				};
+			};
+		};
+
+
+		dsi_host: dsi_host@40016C00 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-dsi_host";
+			reg = <0x40016C00 0x800>;
+			clocks = <&rcc 1 CLK_F469_DSI>, <&clk_hse>;
+			clock-names = "ref", "pclk";
+			resets = <&rcc STM32F4_APB2_RESET(DSI)>;
+			reset-names = "apb";
+			status = "okay";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dsi_host_in: endpoint {
+						remote-endpoint = <&ltdc_out_dsi_host>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					dsi_host_out_panel: endpoint {
+						remote-endpoint = <&dsi_host_in_panel>;
+					};
+				};
+
+			};
+
+			panel-dsi@0 {
+				reg = <0>; /* dsi virtual channel (0..3) */
+				compatible = ...;
+				enable-gpios = ...;
+				status = "okay";
+
+				port {
+					dsi_host_in_panel: endpoint {
+						remote-endpoint = <&dsi_host_out_panel>;
+					};
+				};
+
+			};
+
+		};
+
+	};
+};
-- 
1.9.1
