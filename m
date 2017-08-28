From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [RESEND PATCH 3/3] ARM: dts: stm32: add vrefbuf to stm32h743
Date: Mon, 28 Aug 2017 14:58:53 +0200
Message-ID: <1503925133-30722-4-git-send-email-fabrice.gasnier@st.com>
References: <1503925133-30722-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1503925133-30722-1-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org, alexandre.torgue@st.com
Cc: mark.rutland@arm.com, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com, linux@armlinux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add STM32H743 VREFBUF (Voltage Reference Buffer) definition.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 arch/arm/boot/dts/stm32h743.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/stm32h743.dtsi b/arch/arm/boot/dts/stm32h743.dtsi
index 36a99db..83ee8fe 100644
--- a/arch/arm/boot/dts/stm32h743.dtsi
+++ b/arch/arm/boot/dts/stm32h743.dtsi
@@ -82,6 +82,15 @@
 			interrupts = <50>;
 			clocks = <&timer_clk>;
 		};
+
+		vrefbuf: regulator@58003C00 {
+			compatible = "st,stm32-vrefbuf";
+			reg = <0x58003C00 0x8>;
+			clocks = <&timer_clk>;
+			regulator-min-microvolt = <1500000>;
+			regulator-max-microvolt = <2500000>;
+			status = "disabled";
+		};
 	};
 };
 
-- 
1.9.1
