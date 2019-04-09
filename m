From: Mickael Guene <mickael.guene@st.com>
Subject: [PATCH v5 2/3] dt-bindings: Document MIPID02 bindings
Date: Tue, 9 Apr 2019 08:15:48 +0200
Message-ID: <1554790549-795-3-git-send-email-mickael.guene@st.com>
References: <1554790549-795-1-git-send-email-mickael.guene@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554790549-795-1-git-send-email-mickael.guene@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: hugues.fruchet@st.com, Mickael Guene <mickael.guene@st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

This adds documentation of device tree for MIPID02 CSI-2 to PARALLEL
bridge.

Reviewed-by: Rob Herring <robh@kernel.org>

Signed-off-by: Mickael Guene <mickael.guene@st.com>
---

Changes in v5:
- Typo

Changes in v4:
- Fix and clarify endpoints properties documentation

Changes in v3: None
Changes in v2:
- Add precision about first CSI-2 port data rate
- Document endpoints supported properties
- Rename 'mipid02@14' into generic 'csi2rx@14' in example

 .../bindings/media/i2c/st,st-mipid02.txt           | 82 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 ++
 2 files changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/st,st-mipid02.txt

diff --git a/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.txt b/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.txt
new file mode 100644
index 0000000..7976e6c
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.txt
@@ -0,0 +1,82 @@
+STMicroelectronics MIPID02 CSI-2 to PARALLEL bridge
+
+MIPID02 has two CSI-2 input ports, only one of those ports can be active at a
+time. Active port input stream will be de-serialized and its content outputted
+through PARALLEL output port.
+CSI-2 first input port is a dual lane 800Mbps per lane whereas CSI-2 second
+input port is a single lane 800Mbps. Both ports support clock and data lane
+polarity swap. First port also supports data lane swap.
+PARALLEL output port has a maximum width of 12 bits.
+Supported formats are RAW6, RAW7, RAW8, RAW10, RAW12, RGB565, RGB888, RGB444,
+YUV420 8-bit, YUV422 8-bit and YUV420 10-bit.
+
+Required Properties:
+- compatible: shall be "st,st-mipid02"
+- clocks: reference to the xclk input clock.
+- clock-names: shall be "xclk".
+- VDDE-supply: sensor digital IO supply. Must be 1.8 volts.
+- VDDIN-supply: sensor internal regulator supply. Must be 1.8 volts.
+
+Optional Properties:
+- reset-gpios: reference to the GPIO connected to the xsdn pin, if any.
+	       This is an active low signal to the mipid02.
+
+Required subnodes:
+  - ports: A ports node with one port child node per device input and output
+	   port, in accordance with the video interface bindings defined in
+	   Documentation/devicetree/bindings/media/video-interfaces.txt. The
+	   port nodes are numbered as follows:
+
+	   Port Description
+	   -----------------------------
+	   0    CSI-2 first input port
+	   1    CSI-2 second input port
+	   2    PARALLEL output
+
+Endpoint node required property for CSI-2 connection is:
+- data-lanes: shall be <1> for Port 1. for Port 0 dual-lane operation shall be
+<1 2> or <2 1>. For Port 0 single-lane operation shall be <1> or <2>.
+Endpoint node optional property for CSI-2 connection is:
+- lane-polarities: any lane can be inverted or not.
+
+Endpoint node required property for PARALLEL connection is:
+- bus-width: shall be set to <6>, <7>, <8>, <10> or <12>.
+Endpoint node optional properties for PARALLEL connection are:
+- hsync-active: active state of the HSYNC signal, 0/1 for LOW/HIGH respectively.
+LOW being the default.
+- vsync-active: active state of the VSYNC signal, 0/1 for LOW/HIGH respectively.
+LOW being the default.
+
+Example:
+
+mipid02: csi2rx@14 {
+	compatible = "st,st-mipid02";
+	reg = <0x14>;
+	status = "okay";
+	clocks = <&clk_ext_camera_12>;
+	clock-names = "xclk";
+	VDDE-supply = <&vdd>;
+	VDDIN-supply = <&vdd>;
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@0 {
+			reg = <0>;
+
+			ep0: endpoint {
+				data-lanes = <1 2>;
+				remote-endpoint = <&mipi_csi2_in>;
+			};
+		};
+		port@2 {
+			reg = <2>;
+
+			ep2: endpoint {
+				bus-width = <8>;
+				hsync-active = <0>;
+				vsync-active = <0>;
+				remote-endpoint = <&parallel_out>;
+			};
+		};
+	};
+};
diff --git a/MAINTAINERS b/MAINTAINERS
index c6c15de..fbcbdf8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14667,6 +14667,13 @@ S:	Maintained
 F:	drivers/iio/imu/st_lsm6dsx/
 F:	Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
 
+ST MIPID02 CSI-2 TO PARALLEL BRIDGE DRIVER
+M:	Mickael Guene <mickael.guene@st.com>
+L:	linux-media@vger.kernel.org
+T:	git git://linuxtv.org/media_tree.git
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/st,st-mipid02.txt
+
 ST STM32 I2C/SMBUS DRIVER
 M:	Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
 L:	linux-i2c@vger.kernel.org
-- 
2.7.4
