From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v8 06/34] ARM: dts: imx6qdl: Add video multiplexers, mipi_csi,
 and their connections
Date: Wed,  7 Jun 2017 11:33:45 -0700
Message-ID: <1496860453-6282-7-git-send-email-steve_longerbeam@mentor.com>
References: <1496860453-6282-1-git-send-email-steve_longerbeam@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1496860453-6282-1-git-send-email-steve_longerbeam@mentor.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com, linux@armlinux.org.uk, mchehab@kernel.org, hverkuil@xs4all.nl, nick@shmanahar.org, markus.heiser@darmarIT.de, p.zabel@pengutronix.de, laurent.pinchart+renesas@ideasonboard.com, bparrot@ti.com, geert@linux-m68k.org, arnd@arndb.de, sudipm.mukherjee@gmail.com, minghsiu.tsai@mediatek.com, tiffany.lin@mediatek.com, jean-christophe.trotin@st.com, horms+renesas@verge.net.au, niklas.soderlund+renesas@ragnatech.se, robert.jarzmik@free.fr, songjun.wu@microchip.com, andrew-ct.chen@mediatek.com, gregkh@linuxfoundation.org, shuah@kernel.org, sakari.ailus@linux.intel.com, pavel@ucw.cz
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Steve Longerbeam <steve_longerbeam@mentor.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Philipp Zabel <p.zabel@pengutronix.de>

This patch adds the device tree graph connecting the input multiplexers
to the IPU CSIs and the MIPI-CSI2 gasket on i.MX6. The MIPI_IPU
multiplexers are added as children of the iomuxc-gpr syscon device node.
On i.MX6Q/D two two-input multiplexers in front of IPU1 CSI0 and IPU2
CSI1 allow to select between CSI0/1 parallel input pads and the MIPI
CSI-2 virtual channels 0/3.
On i.MX6DL/S two five-input multiplexers in front of IPU1 CSI0 and IPU1
CSI1 allow to select between CSI0/1 parallel input pads and any of the
four MIPI CSI-2 virtual channels.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

- Removed some dangling/unused endpoints (ipu2_csi0_from_csi2ipu)
- Renamed the mipi virtual channel endpoint labels, from "mipi_csiX_..."
  to "mipi_vcX...".
- Added input endpoint anchors to the video muxes for the connections
  from parallel sensors.

Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
---
 arch/arm/boot/dts/imx6dl.dtsi  | 174 +++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/imx6q.dtsi   | 110 ++++++++++++++++++++++++++
 arch/arm/boot/dts/imx6qdl.dtsi |   6 ++
 3 files changed, 290 insertions(+)

diff --git a/arch/arm/boot/dts/imx6dl.dtsi b/arch/arm/boot/dts/imx6dl.dtsi
index 10bc9d1..4049af7 100644
--- a/arch/arm/boot/dts/imx6dl.dtsi
+++ b/arch/arm/boot/dts/imx6dl.dtsi
@@ -164,6 +164,116 @@
 		      <&iomuxc 9 207 1>, <&iomuxc 10 206 1>, <&iomuxc 11 133 3>;
 };
 
+&gpr {
+	ipu1_csi0_mux: ipu1_csi0_mux@34 {
+		compatible = "video-mux";
+		mux-controls = <&mux 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			ipu1_csi0_mux_from_mipi_vc0: endpoint {
+				remote-endpoint = <&mipi_vc0_to_ipu1_csi0_mux>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			ipu1_csi0_mux_from_mipi_vc1: endpoint {
+				remote-endpoint = <&mipi_vc1_to_ipu1_csi0_mux>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			ipu1_csi0_mux_from_mipi_vc2: endpoint {
+				remote-endpoint = <&mipi_vc2_to_ipu1_csi0_mux>;
+			};
+		};
+
+		port@3 {
+			reg = <3>;
+
+			ipu1_csi0_mux_from_mipi_vc3: endpoint {
+				remote-endpoint = <&mipi_vc3_to_ipu1_csi0_mux>;
+			};
+		};
+
+		port@4 {
+			reg = <4>;
+
+			ipu1_csi0_mux_from_parallel_sensor: endpoint {
+			};
+		};
+
+		port@5 {
+			reg = <5>;
+
+			ipu1_csi0_mux_to_ipu1_csi0: endpoint {
+				remote-endpoint = <&ipu1_csi0_from_ipu1_csi0_mux>;
+			};
+		};
+	};
+
+	ipu1_csi1_mux: ipu1_csi1_mux@34 {
+		compatible = "video-mux";
+		mux-controls = <&mux 1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			ipu1_csi1_mux_from_mipi_vc0: endpoint {
+				remote-endpoint = <&mipi_vc0_to_ipu1_csi1_mux>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			ipu1_csi1_mux_from_mipi_vc1: endpoint {
+				remote-endpoint = <&mipi_vc1_to_ipu1_csi1_mux>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			ipu1_csi1_mux_from_mipi_vc2: endpoint {
+				remote-endpoint = <&mipi_vc2_to_ipu1_csi1_mux>;
+			};
+		};
+
+		port@3 {
+			reg = <3>;
+
+			ipu1_csi1_mux_from_mipi_vc3: endpoint {
+				remote-endpoint = <&mipi_vc3_to_ipu1_csi1_mux>;
+			};
+		};
+
+		port@4 {
+			reg = <4>;
+
+			ipu1_csi1_mux_from_parallel_sensor: endpoint {
+			};
+		};
+
+		port@5 {
+			reg = <5>;
+
+			ipu1_csi1_mux_to_ipu1_csi1: endpoint {
+				remote-endpoint = <&ipu1_csi1_from_ipu1_csi1_mux>;
+			};
+		};
+	};
+};
+
 &gpt {
 	compatible = "fsl,imx6dl-gpt";
 };
@@ -172,6 +282,12 @@
 	compatible = "fsl,imx6dl-hdmi";
 };
 
+&ipu1_csi1 {
+	ipu1_csi1_from_ipu1_csi1_mux: endpoint {
+		remote-endpoint = <&ipu1_csi1_mux_to_ipu1_csi1>;
+	};
+};
+
 &ldb {
 	clocks = <&clks IMX6QDL_CLK_LDB_DI0_SEL>, <&clks IMX6QDL_CLK_LDB_DI1_SEL>,
 		 <&clks IMX6QDL_CLK_IPU1_DI0_SEL>, <&clks IMX6QDL_CLK_IPU1_DI1_SEL>,
@@ -181,6 +297,64 @@
 		      "di0", "di1";
 };
 
+&mipi_csi {
+	port@1 {
+		reg = <1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		mipi_vc0_to_ipu1_csi0_mux: endpoint@0 {
+			remote-endpoint = <&ipu1_csi0_mux_from_mipi_vc0>;
+		};
+
+		mipi_vc0_to_ipu1_csi1_mux: endpoint@1 {
+			remote-endpoint = <&ipu1_csi1_mux_from_mipi_vc0>;
+		};
+	};
+
+	port@2 {
+		reg = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		mipi_vc1_to_ipu1_csi0_mux: endpoint@0 {
+			remote-endpoint = <&ipu1_csi0_mux_from_mipi_vc1>;
+		};
+
+		mipi_vc1_to_ipu1_csi1_mux: endpoint@1 {
+			remote-endpoint = <&ipu1_csi1_mux_from_mipi_vc1>;
+		};
+	};
+
+	port@3 {
+		reg = <3>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		mipi_vc2_to_ipu1_csi0_mux: endpoint@0 {
+			remote-endpoint = <&ipu1_csi0_mux_from_mipi_vc2>;
+		};
+
+		mipi_vc2_to_ipu1_csi1_mux: endpoint@1 {
+			remote-endpoint = <&ipu1_csi1_mux_from_mipi_vc2>;
+		};
+	};
+
+	port@4 {
+		reg = <4>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		mipi_vc3_to_ipu1_csi0_mux: endpoint@0 {
+			remote-endpoint = <&ipu1_csi0_mux_from_mipi_vc3>;
+		};
+
+		mipi_vc3_to_ipu1_csi1_mux: endpoint@1 {
+			remote-endpoint = <&ipu1_csi1_mux_from_mipi_vc3>;
+		};
+	};
+};
+
 &mux {
 	mux-reg-masks = <0x34 0x00000007>, /* IPU_CSI0_MUX */
 			<0x34 0x00000038>, /* IPU_CSI1_MUX */
diff --git a/arch/arm/boot/dts/imx6q.dtsi b/arch/arm/boot/dts/imx6q.dtsi
index a6962be..214bbb3 100644
--- a/arch/arm/boot/dts/imx6q.dtsi
+++ b/arch/arm/boot/dts/imx6q.dtsi
@@ -143,10 +143,18 @@
 
 			ipu2_csi0: port@0 {
 				reg = <0>;
+
+				ipu2_csi0_from_mipi_vc2: endpoint {
+					remote-endpoint = <&mipi_vc2_to_ipu2_csi0>;
+				};
 			};
 
 			ipu2_csi1: port@1 {
 				reg = <1>;
+
+				ipu2_csi1_from_ipu2_csi1_mux: endpoint {
+					remote-endpoint = <&ipu2_csi1_mux_to_ipu2_csi1>;
+				};
 			};
 
 			ipu2_di0: port@2 {
@@ -246,6 +254,68 @@
 	gpio-ranges = <&iomuxc 0 172 9>, <&iomuxc 9 189 2>, <&iomuxc 11 146 3>;
 };
 
+&gpr {
+	ipu1_csi0_mux {
+		compatible = "video-mux";
+		mux-controls = <&mux 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			ipu1_csi0_mux_from_mipi_vc0: endpoint {
+				remote-endpoint = <&mipi_vc0_to_ipu1_csi0_mux>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			ipu1_csi0_mux_from_parallel_sensor: endpoint {
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			ipu1_csi0_mux_to_ipu1_csi0: endpoint {
+				remote-endpoint = <&ipu1_csi0_from_ipu1_csi0_mux>;
+			};
+		};
+	};
+
+	ipu2_csi1_mux {
+		compatible = "video-mux";
+		mux-controls = <&mux 1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			ipu2_csi1_mux_from_mipi_vc3: endpoint {
+				remote-endpoint = <&mipi_vc3_to_ipu2_csi1_mux>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			ipu2_csi1_mux_from_parallel_sensor: endpoint {
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			ipu2_csi1_mux_to_ipu2_csi1: endpoint {
+				remote-endpoint = <&ipu2_csi1_from_ipu2_csi1_mux>;
+			};
+		};
+	};
+};
+
 &hdmi {
 	compatible = "fsl,imx6q-hdmi";
 
@@ -266,6 +336,12 @@
 	};
 };
 
+&ipu1_csi1 {
+	ipu1_csi1_from_mipi_vc1: endpoint {
+		remote-endpoint = <&mipi_vc1_to_ipu1_csi1>;
+	};
+};
+
 &ldb {
 	clocks = <&clks IMX6QDL_CLK_LDB_DI0_SEL>, <&clks IMX6QDL_CLK_LDB_DI1_SEL>,
 		 <&clks IMX6QDL_CLK_IPU1_DI0_SEL>, <&clks IMX6QDL_CLK_IPU1_DI1_SEL>,
@@ -312,6 +388,40 @@
 	};
 };
 
+&mipi_csi {
+	port@1 {
+		reg = <1>;
+
+		mipi_vc0_to_ipu1_csi0_mux: endpoint {
+			remote-endpoint = <&ipu1_csi0_mux_from_mipi_vc0>;
+		};
+	};
+
+	port@2 {
+		reg = <2>;
+
+		mipi_vc1_to_ipu1_csi1: endpoint {
+			remote-endpoint = <&ipu1_csi1_from_mipi_vc1>;
+		};
+	};
+
+	port@3 {
+		reg = <3>;
+
+		mipi_vc2_to_ipu2_csi0: endpoint {
+			remote-endpoint = <&ipu2_csi0_from_mipi_vc2>;
+		};
+	};
+
+	port@4 {
+		reg = <4>;
+
+		mipi_vc3_to_ipu2_csi1_mux: endpoint {
+			remote-endpoint = <&ipu2_csi1_mux_from_mipi_vc3>;
+		};
+	};
+};
+
 &mipi_dsi {
 	ports {
 		port@2 {
diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index dd9917c..d744a5b 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -1142,6 +1142,8 @@
 			mipi_csi: mipi@021dc000 {
 				compatible = "fsl,imx6-mipi-csi2", "snps,dw-mipi-csi2";
 				reg = <0x021dc000 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				interrupts = <0 100 0x04>, <0 101 0x04>;
 				clocks = <&clks IMX6QDL_CLK_HSI_TX>,
 					 <&clks IMX6QDL_CLK_VIDEO_27M>,
@@ -1249,6 +1251,10 @@
 
 			ipu1_csi0: port@0 {
 				reg = <0>;
+
+				ipu1_csi0_from_ipu1_csi0_mux: endpoint {
+					remote-endpoint = <&ipu1_csi0_mux_to_ipu1_csi0>;
+				};
 			};
 
 			ipu1_csi1: port@1 {
-- 
2.7.4
