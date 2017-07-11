From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH 2/2] ARM: dts: stm32: enable ADC on stm32h743i-eval board
Date: Tue, 11 Jul 2017 18:13:10 +0200
Message-ID: <1499789590-13021-3-git-send-email-fabrice.gasnier@st.com>
References: <1499789590-13021-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1499789590-13021-1-git-send-email-fabrice.gasnier@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: alexandre.torgue@st.com, robh+dt@kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux@armlinux.org.uk, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

There's a potentiometer connected to ADC1 and ADC2 in0 on
stm32h743i-eval board.
- Add fixed-voltage 'vdda' regulator that supplies 'vref' pin.
  It's used as voltage reference for ADC and/or DAC.
- Enable ADC1 in0 input (arbitrary choice: could be ADC2 as well).
Note: No pinctrl is needed to use in0 dedicated analog input pin
(e.g. ADC12_INP0).

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 arch/arm/boot/dts/stm32h743i-eval.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/stm32h743i-eval.dts b/arch/arm/boot/dts/stm32h743i-eval.dts
index c6effbb..6c07786 100644
--- a/arch/arm/boot/dts/stm32h743i-eval.dts
+++ b/arch/arm/boot/dts/stm32h743i-eval.dts
@@ -60,6 +60,24 @@
 	aliases {
 		serial0 = &usart1;
 	};
+
+	vdda: regulator-vdda {
+		compatible = "regulator-fixed";
+		regulator-name = "vdda";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+};
+
+&adc_12 {
+	vref-supply = <&vdda>;
+	status = "okay";
+	adc1: adc@0 {
+		/* potentiometer */
+		st,adc-channels = <0>;
+		status = "okay";
+	};
 };
 
 &clk_hse {
-- 
1.9.1
