From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: [PATCH] ARM: dts: stm32: Add push button to stm32f769 Discovery board
Date: Wed, 17 Jan 2018 10:40:05 +0100
Message-ID: <20180117094005.20728-4-benjamin.gaignard@st.com>
References: <20180117094005.20728-1-benjamin.gaignard@st.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180117094005.20728-1-benjamin.gaignard@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

Add node for user push button.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 arch/arm/boot/dts/stm32f769-disco.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f769-disco.dts b/arch/arm/boot/dts/stm32f769-disco.dts
index 25a4b71f0317..8b3e1b518570 100644
--- a/arch/arm/boot/dts/stm32f769-disco.dts
+++ b/arch/arm/boot/dts/stm32f769-disco.dts
@@ -71,6 +71,18 @@
 			gpios = <&gpioj 13 0>;
 		};
 	};
+
+	gpio_keys {
+		compatible = "gpio-keys";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		autorepeat;
+		button@0 {
+			label = "User";
+			linux,code = <KEY_HOME>;
+			gpios = <&gpioa 0 0>;
+		};
+	};
 };
 
 &cec {
-- 
2.15.0
