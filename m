From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH 4/5] ARM: dts: stm32: add missing vdda-supply to adc on
 stm32429i-eval
Date: Wed, 19 Jun 2019 14:29:57 +0200
Message-ID: <1560947398-11592-5-git-send-email-fabrice.gasnier@st.com>
References: <1560947398-11592-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1560947398-11592-1-git-send-email-fabrice.gasnier@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: jic23@kernel.org, robh+dt@kernel.org, alexandre.torgue@st.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de, mcoquelin.stm32@gmail.com, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, pmeerw@pmeerw.net, knaack.h@gmx.de, fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add missing vdda-supply required by STM32 ADC.

Fixes: 7465d81191a1 ("ARM: dts: stm32: enable ADC on stm32f429i-eval
board")

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 arch/arm/boot/dts/stm32429i-eval.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/stm32429i-eval.dts b/arch/arm/boot/dts/stm32429i-eval.dts
index d79f58f..ba08624 100644
--- a/arch/arm/boot/dts/stm32429i-eval.dts
+++ b/arch/arm/boot/dts/stm32429i-eval.dts
@@ -81,6 +81,12 @@
 		dma-ranges = <0xc0000000 0x0 0x10000000>;
 	};
 
+	vdda: regulator-vdda {
+		compatible = "regulator-fixed";
+		regulator-name = "vdda";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
 
 	vref: regulator-vref {
 		compatible = "regulator-fixed";
@@ -151,6 +157,7 @@
 &adc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&adc3_in8_pin>;
+	vdda-supply = <&vdda>;
 	vref-supply = <&vref>;
 	status = "okay";
 	adc3: adc@200 {
-- 
2.7.4
