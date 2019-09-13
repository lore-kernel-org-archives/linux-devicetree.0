From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH 1/3] ARM: dts: stm32: Enable VREFBUF on stm32mp157a-dk1
Date: Fri, 13 Sep 2019 16:34:38 +0200
Message-ID: <1568385280-2633-2-git-send-email-fabrice.gasnier@st.com>
References: <1568385280-2633-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568385280-2633-1-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: alexandre.torgue@st.com
Cc: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, fabrice.gasnier@st.com
List-Id: devicetree@vger.kernel.org

Enable VREFBUF as ADC/DAC uses it on stm32mp157a-dk1 board.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 arch/arm/boot/dts/stm32mp157a-dk1.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157a-dk1.dts b/arch/arm/boot/dts/stm32mp157a-dk1.dts
index 0615d1c..ebd9f33 100644
--- a/arch/arm/boot/dts/stm32mp157a-dk1.dts
+++ b/arch/arm/boot/dts/stm32mp157a-dk1.dts
@@ -449,3 +449,10 @@
 	pinctrl-0 = <&uart4_pins_a>;
 	status = "okay";
 };
+
+&vrefbuf {
+	regulator-min-microvolt = <2500000>;
+	regulator-max-microvolt = <2500000>;
+	vdda-supply = <&vdd>;
+	status = "okay";
+};
-- 
2.7.4
