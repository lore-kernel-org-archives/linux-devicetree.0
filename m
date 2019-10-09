From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH 2/2] ARM: dts: stm32: Add DAC support to stm32mp157c-ed1
Date: Wed, 9 Oct 2019 16:12:52 +0200
Message-ID: <1570630372-24579-3-git-send-email-fabrice.gasnier@st.com>
References: <1570630372-24579-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1570630372-24579-1-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: alexandre.torgue@st.com
Cc: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, fabrice.gasnier@st.com
List-Id: devicetree@vger.kernel.org

stm32mp157c-ed1 board has digital-to-analog converter signals routed
to JP11 and JP10 jumpers (e.g. PA4/PA5).
It's easier then to configure them both. But keep them disabled by default,
so the pins are kept in their initial state to lower power consumption.
This way they can also be used as GPIO.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 arch/arm/boot/dts/stm32mp157c-ed1.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157c-ed1.dts b/arch/arm/boot/dts/stm32mp157c-ed1.dts
index 1d426ea..2b40ad9 100644
--- a/arch/arm/boot/dts/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ed1.dts
@@ -104,6 +104,19 @@
 	};
 };
 
+&dac {
+	pinctrl-names = "default";
+	pinctrl-0 = <&dac_ch1_pins_a &dac_ch2_pins_a>;
+	vref-supply = <&vdda>;
+	status = "disabled";
+	dac1: dac@1 {
+		status = "okay";
+	};
+	dac2: dac@2 {
+		status = "okay";
+	};
+};
+
 &dts {
 	status = "okay";
 };
-- 
2.7.4
