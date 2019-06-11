From: Luis Oliveira <Luis.Oliveira@synopsys.com>
Subject: [v4 1/6] dt-bindings: media: Document bindings for DW MIPI CSI-2 Host
Date: Tue, 11 Jun 2019 21:20:50 +0200
Message-ID: <1560280855-18085-2-git-send-email-luis.oliveira@synopsys.com>
References: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mchehab@kernel.org, davem@davemloft.net, gregkh@linuxfoundation.org, Jonathan.Cameron@huawei.com, robh@kernel.org, nicolas.ferre@microchip.com, paulmck@linux.ibm.com, mark.rutland@arm.com, kishon@ti.com, devicetree@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Joao.Pinto@synopsys.com, Luis Oliveira <Luis.Oliveira@synopsys.com>
List-Id: devicetree@vger.kernel.org

From: Luis Oliveira <lolivei@synopsys.com>

Add bindings for Synopsys DesignWare MIPI CSI-2 host.

Signed-off-by: Luis Oliveira <lolivei@synopsys.com>
---
Changelog
v3-v4
- remove "plat" from the block name @rob @laurent
- remove "phy-names" when single-entry @rob
- remove "snps,output-type" -> went to the driver config @laurent

 .../devicetree/bindings/media/snps,dw-csi.txt      | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/snps,dw-csi.txt

diff --git a/Documentation/devicetree/bindings/media/snps,dw-csi.txt b/Documentation/devicetree/bindings/media/snps,dw-csi.txt
new file mode 100644
index 0000000..613b7f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/snps,dw-csi.txt
@@ -0,0 +1,41 @@
+Synopsys DesignWare CSI-2 Host controller
+
+Description
+-----------
+
+This HW block is used to receive image coming from an MIPI CSI-2 compatible
+camera.
+
+Required properties:
+- compatible		: shall be "snps,dw-csi"
+- reg			: physical base address and size of the device memory
+			  mapped registers;
+- interrupts		: DW CSI-2 Host interrupts
+- phys			: List of one PHY specifier (as defined in
+			  Documentation/devicetree/bindings/phy/phy-bindings.txt).
+			  This PHY is a MIPI DPHY working in RX mode.
+- resets		: Reference to a reset controller (optional)
+
+The per-board settings:
+ - port sub-node describing a single endpoint connected to the camera as
+   described in video-interfaces.txt[1].
+
+Example:
+
+	csi2: csi2@3000 {
+		compatible = "snps,dw-csi";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = < 0x03000 0x7FF>;
+		phys = <&mipi_dphy_rx>;
+		resets = <&dw_rst 1>;
+		interrupts = <2>;
+
+		port@0 {
+			reg = <0>;
+			csi_ep1: endpoint {
+				remote-endpoint = <&camera_1>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
-- 
2.7.4
