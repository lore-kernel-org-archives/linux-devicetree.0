From: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
Subject: [PATCH v1 2/2] ARM: dts: stm32: Add I2C1 support for STM32H743I-EVAL Board
Date: Fri, 20 Apr 2018 11:05:22 +0200
Message-ID: <1524215122-14046-3-git-send-email-pierre-yves.mordret@st.com>
References: <1524215122-14046-1-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524215122-14046-1-git-send-email-pierre-yves.mordret@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
List-Id: devicetree@vger.kernel.org

Add I2C1 support for STM32H743I-EVAL Board

Signed-off-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
---
  Version history:
     v1:
        * Initial
---
---
 arch/arm/boot/dts/stm32h743i-eval.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/stm32h743i-eval.dts b/arch/arm/boot/dts/stm32h743i-eval.dts
index c7187e1..3f8e0c4 100644
--- a/arch/arm/boot/dts/stm32h743i-eval.dts
+++ b/arch/arm/boot/dts/stm32h743i-eval.dts
@@ -92,6 +92,14 @@
 	clock-frequency = <25000000>;
 };
 
+&i2c1 {
+	pinctrl-0 = <&i2c1_pins_a>;
+	pinctrl-names = "default";
+	i2c-scl-rising-time-ns = <185>;
+	i2c-scl-falling-time-ns = <20>;
+	status = "okay";
+};
+
 &rtc {
 	status = "okay";
 };
-- 
2.7.4
