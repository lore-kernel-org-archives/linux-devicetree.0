From: Jacob Chen <jacob-chen@iotwrt.com>
Subject: [PATCH v6 10/17] dt-bindings: Document the Rockchip ISP1 bindings
Date: Thu,  8 Mar 2018 17:48:00 +0800
Message-ID: <20180308094807.9443-11-jacob-chen@iotwrt.com>
References: <20180308094807.9443-1-jacob-chen@iotwrt.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180308094807.9443-1-jacob-chen@iotwrt.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org, eddie.cai.linux@gmail.com, heiko@sntech.de, Jacob Chen <jacob2.chen@rock-chips.com>, jeffy.chen@rock-chips.com, zyc@rock-chips.com, linux-kernel@vger.kernel.org, tfiga@chromium.org, hans.verkuil@cisco.com, laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com, mchehab@kernel.org, zhengsq@rock-chips.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Jacob Chen <jacob2.chen@rock-chips.com>

Add DT bindings documentation for Rockchip ISP1

Signed-off-by: Jacob Chen <jacob2.chen@rock-chips.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/media/rockchip-isp1.txt    | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/rockchip-isp1.txt

diff --git a/Documentation/devicetree/bindings/media/rockchip-isp1.txt b/Documentation/devicetree/bindings/media/rockchip-isp1.txt
new file mode 100644
index 000000000000..4631a4b7c88a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip-isp1.txt
@@ -0,0 +1,69 @@
+Rockchip SoC Image Signal Processing unit v1
+----------------------------------------------
+
+Rockchip ISP1 is the Camera interface for the Rockchip series of SoCs
+which contains image processing, scaling, and compression funcitons.
+
+Required properties:
+- compatible: value should be one of the following
+	"rockchip,rk3288-cif-isp";
+	"rockchip,rk3399-cif-isp";
+- reg : offset and length of the register set for the device.
+- interrupts: should contain ISP interrupt.
+- clocks: phandle to the required clocks.
+- clock-names: required clock name.
+- iommus: required a iommu node.
+
+port node
+-------------------
+
+The device node should contain one 'port' child node with child 'endpoint'
+nodes, according to the bindings defined in Documentation/devicetree/bindings/
+media/video-interfaces.txt.
+
+- endpoint(parallel):
+	- remote-endpoint: Connecting to a sensor with a parallel video bus.
+	- parallel_bus properties: Refer to Documentation/devicetree/bindings/
+		media/video-interfaces.txt.
+- endpoint(mipi):
+	- remote-endpoint: Connecting to Rockchip MIPI-DPHY,
+		which is defined in rockchip-mipi-dphy.txt.
+
+The port node must contain at least one endpoint, either parallel or mipi.
+It could have multiple endpoints, but please note the hardware don't support
+two sensors work at a time, they are supposed to work asynchronously.
+
+Device node example
+-------------------
+
+	isp0: isp0@ff910000 {
+		compatible = "rockchip,rk3399-cif-isp";
+		reg = <0x0 0xff910000 0x0 0x4000>;
+		interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru SCLK_ISP0>,
+			 <&cru ACLK_ISP0>, <&cru ACLK_ISP0_WRAPPER>,
+			 <&cru HCLK_ISP0>, <&cru HCLK_ISP0_WRAPPER>;
+		clock-names = "clk_isp",
+			      "aclk_isp", "aclk_isp_wrap",
+			      "hclk_isp", "hclk_isp_wrap";
+		power-domains = <&power RK3399_PD_ISP0>;
+		iommus = <&isp0_mmu>;
+
+		port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* mipi */
+			isp0_mipi_in: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&dphy_rx0_out>;
+			};
+
+			/* parallel */
+			isp0_parallel_in: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&ov5640_out>;
+				bus-width = <8>;
+			};
+		};
+	};
-- 
2.16.1
