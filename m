From: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v5 06/11] Documentation: dt-bindings: Add bindings for DW MIPI
 DSI
Date: Thu, 26 Nov 2015 15:50:20 +0800
Message-ID: <1448524225-5489-7-git-send-email-zyw@rock-chips.com>
References: <1448524225-5489-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1448524225-5489-1-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Liu Ying <Ying.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Liu Ying <Ying.liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

This patch adds device tree bindings for Synopsys DesignWare MIPI DSI
host controller DRM bridge driver.

Signed-off-by: Liu Ying <Ying.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

---

Changes in v5: None
Changes in v4:
- remove the cfg clk
- remove gpr property from example, since it is noused now.
- add the description about ports

Changes in v3:
- move the dw_mipi_dsi.txt to Documentation/devicetree/bindings/display/bridge

Changes in v2: None

 .../bindings/display/bridge/dw_mipi_dsi.txt        | 74 ++++++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt b/Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt
new file mode 100644
index 0000000..2e1d197
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt
@@ -0,0 +1,74 @@
+Device-Tree bindings for Synopsys DesignWare MIPI DSI host controller
+
+The controller is a digital core that implements all protocol functions
+defined in the MIPI DSI specification, providing an interface between
+the system and the MIPI DPHY, and allowing communication with a MIPI DSI
+compliant display.
+
+Required properties:
+ - #address-cells: Should be <1>.
+ - #size-cells: Should be <0>.
+ - compatible: The first compatible string should be "fsl,imx6q-mipi-dsi"
+   for i.MX6q/sdl SoCs.  For other SoCs, please refer to their specific
+   device tree binding documentations.  A common compatible string
+   "snps,dw-mipi-dsi" should be appended for all SoCs.
+ - reg: Represent the physical address range of the controller.
+ - interrupts: Represent the controller's interrupt to the CPU(s).
+ - clocks, clock-names: Phandles to the controller's pll reference
+   clock(ref) and APB clock(pclk), as described in [1].
+ - port@[X]: SoC specific port nodes with endpoint definitions as defined
+   in Documentation/devicetree/bindings/media/video-interfaces.txt,
+   please refer to the SoC specific binding document:
+    * Documentation/devicetree/bindings/display/rockchip/dw_mipi_dsi-rockchip.txt
+
+
+For more required properties, please refer to relevant device tree binding
+documentations which describe the controller embedded in specific SoCs.
+
+Required sub-nodes:
+ - A node to represent a DSI peripheral as described in [2].
+
+For more required sub-nodes, please refer to relevant device tree binding
+documentations which describe the controller embedded in specific SoCs.
+
+[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
+[2] Documentation/devicetree/bindings/display/mipi-dsi-bus.txt
+
+example:
+	mipi_dsi: mipi@021e0000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "fsl,imx6q-mipi-dsi", "snps,dw-mipi-dsi";
+		reg = <0x021e0000 0x4000>;
+		interrupts = <0 102 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&clks IMX6QDL_CLK_MIPI_CORE_CFG>,
+			 <&clks IMX6QDL_CLK_MIPI_IPG>;
+		clock-names = "ref", "pclk";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				mipi_mux_0: endpoint {
+					remote-endpoint = <&ipu1_di0_mipi>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				mipi_mux_1: endpoint {
+					remote-endpoint = <&ipu1_di1_mipi>;
+				};
+			};
+		};
+
+		panel {
+			compatible = "truly,tft480800-16-e-dsi";
+			reg = <0>;
+			/* ... */
+		};
+	};
-- 
2.6.3
