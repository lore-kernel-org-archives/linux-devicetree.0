From: <patrice.chotard@st.com>
Subject: [PATCH 6/6] ARM: dts: stm32: Fix sdio2 rcc hard coded value
Date: Thu, 1 Mar 2018 10:43:41 +0100
Message-ID: <1519897421-23803-7-git-send-email-patrice.chotard@st.com>
References: <1519897421-23803-1-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1519897421-23803-1-git-send-email-patrice.chotard@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, alexandre.torgue@st.com, lee.jones@linaro.org
Cc: mcoquelin.stm32@gmail.com, Patrice Chotard <patrice.chotard@st.com>
List-Id: devicetree@vger.kernel.org

From: Patrice Chotard <patrice.chotard@st.com>

Replace sdio2 rcc hard coded clock value by its macro.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---
 arch/arm/boot/dts/stm32f746.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32f746.dtsi b/arch/arm/boot/dts/stm32f746.dtsi
index 07c29658696c..2c5704f96801 100644
--- a/arch/arm/boot/dts/stm32f746.dtsi
+++ b/arch/arm/boot/dts/stm32f746.dtsi
@@ -432,7 +432,7 @@
 			compatible = "arm,pl180", "arm,primecell";
 			arm,primecell-periphid = <0x00880180>;
 			reg = <0x40011c00 0x400>;
-			clocks = <&rcc 0 167>;
+			clocks = <&rcc 0 STM32F7_APB2_CLOCK(SDMMC2)>;
 			clock-names = "apb_pclk";
 			interrupts = <103>;
 			max-frequency = <48000000>;
-- 
1.9.1
