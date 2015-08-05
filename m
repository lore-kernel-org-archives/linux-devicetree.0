From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: [PATCH 3/4] arm64: Juno: Add HDLCD support to the Juno boards.
Date: Wed,  5 Aug 2015 15:28:11 +0100
Message-ID: <1438784892-27888-4-git-send-email-Liviu.Dudau@arm.com>
References: <1438784892-27888-1-git-send-email-Liviu.Dudau@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1438784892-27888-1-git-send-email-Liviu.Dudau@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Jon Medhurst <tixy@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

ARM's Juno board has two HDLCD controllers, each linked to an NXP
TDA19988 HDMI transmitter that provides output encoding. Add them
to the device tree.

Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
---
 arch/arm64/boot/dts/arm/juno-base.dtsi | 70 +++++++++++++++++++++++++++++++++-
 1 file changed, 68 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
index c624208..a12a2b1 100644
--- a/arch/arm64/boot/dts/arm/juno-base.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
@@ -118,6 +118,34 @@
 		clock-names = "apb_pclk";
 	};
 
+	hdlcd@7ff50000 {
+		compatible = "arm,hdlcd";
+		reg = <0 0x7ff50000 0 0x1000>;
+		interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&scpi_clk 4>;
+		clock-names = "pxlclk";
+
+		port {
+			hdlcd1_output: endpoint@0 {
+				remote-endpoint = <&tda998x_1_input>;
+			};
+		};
+	};
+
+	hdlcd@7ff60000 {
+		compatible = "arm,hdlcd";
+		reg = <0 0x7ff60000 0 0x1000>;
+		interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&scpi_clk 4>;
+		clock-names = "pxlclk";
+
+		port {
+			hdlcd0_output: endpoint@0 {
+				remote-endpoint = <&tda998x_0_input>;
+			};
+		};
+	};
+
 	soc_uart0: uart@7ff80000 {
 		compatible = "arm,pl011", "arm,primecell";
 		reg = <0x0 0x7ff80000 0x0 0x1000>;
@@ -136,14 +164,32 @@
 		i2c-sda-hold-time-ns = <500>;
 		clocks = <&soc_smc50mhz>;
 
-		dvi0: dvi-transmitter@70 {
+		hdmi-transmitter@70 {
 			compatible = "nxp,tda998x";
 			reg = <0x70>;
+			port {
+				tda998x_0_input: endpoint@0 {
+					remote-endpoint = <&hdlcd0_output>;
+				};
+
+				tda998x_0_output: endpoint@1 {
+					remote-endpoint = <&hdmi0_connector_output>;
+				};
+			};
 		};
 
-		dvi1: dvi-transmitter@71 {
+		hdmi-transmitter@71 {
 			compatible = "nxp,tda998x";
 			reg = <0x71>;
+			port {
+				tda998x_1_input: endpoint@0 {
+					remote-endpoint = <&hdlcd1_output>;
+				};
+
+				tda998x_1_output: endpoint@1 {
+					remote-endpoint = <&hdmi1_connector_output>;
+				};
+			};
 		};
 	};
 
@@ -177,6 +223,26 @@
 		      <0x00000008 0x80000000 0x1 0x80000000>;
 	};
 
+	hdmi0: connector@0 {
+		compatible = "hdmi-connector";
+		type = "a";
+		port {
+			hdmi0_connector_output: endpoint {
+				remote-endpoint = <&tda998x_0_output>;
+			};
+		};
+	};
+
+	hdmi1: connector@1 {
+		compatible = "hdmi-connector";
+		type = "a";
+		port {
+			hdmi1_connector_output: endpoint {
+				remote-endpoint = <&tda998x_1_output>;
+			};
+		};
+	};
+
 	smb {
 		compatible = "simple-bus";
 		#address-cells = <2>;
-- 
2.4.6
