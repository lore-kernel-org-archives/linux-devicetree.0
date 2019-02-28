From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH v2 6/6] ARM: dts: stm32: Add romem and temperature calibration on stm32f429
Date: Thu, 28 Feb 2019 11:19:56 +0100
Message-ID: <1551349196-8956-7-git-send-email-fabrice.gasnier@st.com>
References: <1551349196-8956-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551349196-8956-1-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: srinivas.kandagatla@linaro.org, robh+dt@kernel.org, alexandre.torgue@st.com
Cc: mark.rutland@arm.com, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com, lionel.debieve@st.com, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add & enable stm32 factory-programmed memory. Describe temperature sensor
calibration cells.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 arch/arm/boot/dts/stm32f429.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index 8d6f028..8055c98 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -78,6 +78,19 @@
 	};
 
 	soc {
+		romem: nvmem@1fff7800 {
+			compatible = "st,stm32f4-otp";
+			reg = <0x1fff7800 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ts_cal1: calib@22c {
+				reg = <0x22c 0x2>;
+			};
+			ts_cal2: calib@22e {
+				reg = <0x22e 0x2>;
+			};
+		};
+
 		timer2: timer@40000000 {
 			compatible = "st,stm32-timer";
 			reg = <0x40000000 0x400>;
-- 
2.7.4
