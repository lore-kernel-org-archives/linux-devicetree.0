From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH 1/4] dt-bindings: iio: stm32-dac: Add support for STM32 DAC
Date: Fri, 31 Mar 2017 13:45:04 +0200
Message-ID: <1490960707-22422-2-git-send-email-fabrice.gasnier@st.com>
References: <1490960707-22422-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1490960707-22422-1-git-send-email-fabrice.gasnier@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: jic23@kernel.org, linux@armlinux.org.uk, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: mark.rutland@arm.com, benjamin.gaignard@linaro.org, lars@metafoo.de, alexandre.torgue@st.com, linux-iio@vger.kernel.org, pmeerw@pmeerw.net, amelie.delaunay@st.com, mcoquelin.stm32@gmail.com, knaack.h@gmx.de, fabrice.gasnier@st.com, linus.walleij@linaro.org, benjamin.gaignard@st.com
List-Id: devicetree@vger.kernel.org

Document STMicroelectronics STM32 DAC (digital-to-analog converter).

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 .../devicetree/bindings/iio/dac/st,stm32-dac.txt   | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/dac/st,stm32-dac.txt

diff --git a/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.txt b/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.txt
new file mode 100644
index 0000000..1981983
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.txt
@@ -0,0 +1,56 @@
+STMicroelectronics STM32 DAC
+
+The STM32 DAC is a 12-bit voltage output digital-to-analog converter. The DAC
+can be configured in 8- or 12-bit mode. In 12-bit mode, the data could be
+left- or right-aligned. It has two output channels, each with its own converter.
+It has built-in noise and triangle waveform generator and supports external
+triggers for conversions. The DAC's output buffer allows a high drive output
+current.
+
+Contents of a stm32 dac root node:
+-----------------------------------
+Required properties:
+- compatible: Must be "st,stm32h7-dac-core".
+- reg: Offset and length of the device's register set.
+- clocks: Must contain an entry for pclk (which feeds the peripheral bus
+  interface)
+- clock-names: Must be "pclk".
+- vref-supply: Phandle to the vref+ input analog reference supply.
+
+Optional properties:
+- resets: Must contain the phandle to the reset controller.
+- A pinctrl state named "default" for each DAC channel may be defined to set
+  DAC_OUTx pin in mode of operation for analog output on external pin.
+
+Contents of a stm32 dac child node:
+-----------------------------------
+DAC core node should contain at least one subnode, representing a
+DAC instance/channel available on the machine.
+
+Required properties:
+- compatible: Must be "st,stm32-dac".
+- #io-channel-cells = <1>: See the IIO bindings section "IIO consumers" in
+  Documentation/devicetree/bindings/iio/iio-bindings.txt
+- st,dac-channel: Must be either 1 or 2, to define channel in use (e.g.
+  single channels: 1 or 2)
+
+Example:
+	dac: dac@40007400 {
+		compatible = "st,stm32h7-dac-core";
+		reg = <0x40007400 0x400>;
+		clocks = <&clk>;
+		clock-names = "pclk";
+		vref-supply = <&reg_vref>;
+
+		dac1: dac@1 {
+			compatible = "st,stm32-dac";
+			#io-channels-cells = <1>;
+			st,dac-channel = <1>;
+		};
+
+		dac2: dac@2 {
+			compatible = "st,stm32-dac";
+			#io-channels-cells = <1>;
+			st,dac-channel = <2>;
+		};
+	};
-- 
1.9.1
