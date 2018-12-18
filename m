Return-Path: <SRS0=YIMn=O3=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 1/3] media: dt-bindings: add bindings for Toshiba TC358746
Date: Tue, 18 Dec 2018 15:12:38 +0100
Message-Id: <20181218141240.3056-2-m.felsch@pengutronix.de>
In-Reply-To: <20181218141240.3056-1-m.felsch@pengutronix.de>
References: <20181218141240.3056-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: hans.verkuil@cisco.com, sakari.ailus@linux.intel.com, mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, graphics@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

Add corresponding dt-bindings for the Toshiba tc358746 device.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 .../bindings/media/i2c/toshiba,tc358746.txt   | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.txt

diff --git a/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.txt b/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.txt
new file mode 100644
index 000000000000..499733df744a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.txt
@@ -0,0 +1,80 @@
+* Toshiba TC358746 Parallel to MIPI CSI2-TX or MIPI CSI2-RX to Parallel Bridge
+
+The Toshiba TC358746 is a bridge that converts a Parallel-in stream to MIPI CSI-2 TX
+or a MIPI CSI-2 RX stream into a Parallel-out. It is programmable through I2C.
+
+Required Properties:
+
+- compatible: should be "toshiba,tc358746"
+- reg: should be <0x0e>
+- clocks: should contain a phandle link to the reference clock source
+- clock-names: the clock input is named "refclk".
+
+Optional Properties:
+
+- reset-gpios: gpio phandle GPIO connected to the reset pin
+
+Parallel Endpoint:
+
+Required Properties:
+
+- reg: should be <0>
+- bus-width: the data bus width e.g. <8> for eight bit bus, or <16>
+	     for sixteen bit wide bus.
+
+MIPI CSI-2 Endpoint:
+
+Required Properties:
+
+- reg: should be <1>
+- data-lanes: should be <1 2 3 4> for four-lane operation,
+	      or <1 2> for two-lane operation
+- clock-lanes: should be <0>
+- link-frequencies: List of allowed link frequencies in Hz. Each frequency is
+		    expressed as a 64-bit big-endian integer. The frequency
+		    is half of the bps per lane due to DDR transmission.
+
+Optional Properties:
+
+- clock-noncontinuous: Presence of this boolean property decides whether the
+		       MIPI CSI-2 clock is continuous or non-continuous.
+
+For further information on the endpoint node properties, see
+Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+Example:
+
+&i2c {
+	tc358746: tc358746@0e {
+		reg = <0x0e>;
+		compatible = "toshiba,tc358746";
+		pinctrl-names = "default";
+		clocks = <&clk_cam_ref>;
+		clock-names = "refclk";
+		reset-gpios = <&gpio3 2 GPIO_ACTIVE_LOW>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			tc358746_parallel_in: endpoint {
+				bus-width = <8>;
+				remote-endpoint = <&micron_parallel_out>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			tc358746_mipi2_out: endpoint {
+				remote-endpoint = <&mipi_csi2_in>;
+				data-lanes = <1 2>;
+				clock-lanes = <0>;
+				clock-noncontinuous;
+				link-frequencies = /bits/ 64 <216000000>;
+			};
+		};
+	};
+};
-- 
2.19.1
