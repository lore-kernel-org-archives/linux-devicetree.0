From: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Subject: [PATCH 2/9] ARM: STi: DT: STiH416: Remove unused CLK_S_ICN_REG_0 fixed clock
Date: Mon,  5 May 2014 17:53:36 +0200
Message-ID: <1399305223-18703-3-git-send-email-gabriel.fernandez@linaro.org>
References: <1399305223-18703-1-git-send-email-gabriel.fernandez@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1399305223-18703-1-git-send-email-gabriel.fernandez@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, kernel@stlinux.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Gabriel Fernandez <gabriel.fernandez@linaro.org>
List-Id: devicetree@vger.kernel.org

CLK_S_ICN_REG_0 clock is no longer used.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
---
 arch/arm/boot/dts/stih416-clock.dtsi | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/arm/boot/dts/stih416-clock.dtsi b/arch/arm/boot/dts/stih416-clock.dtsi
index 66693e4..47bbfd4 100644
--- a/arch/arm/boot/dts/stih416-clock.dtsi
+++ b/arch/arm/boot/dts/stih416-clock.dtsi
@@ -34,17 +34,6 @@
 			clock-frequency = <600000000>;
 		};
 
-		/*
-		 * Bootloader initialized system infrastructure clock for
-		 * serial devices.
-		 */
-		CLK_S_ICN_REG_0: clockgenA0@4 {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <100000000>;
-			clock-output-names = "CLK_S_ICN_REG_0";
-		};
-
 		CLK_S_GMAC0_PHY: clockgenA1@7 {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
-- 
1.9.1
