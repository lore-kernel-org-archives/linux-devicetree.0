From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH v2 3/3] ARM: dts: stm32: Add clock on stm32mp157c syscfg
Date: Wed, 12 Dec 2018 09:48:15 +0100
Message-ID: <1544604495-4082-4-git-send-email-fabrice.gasnier@st.com>
References: <1544604495-4082-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544604495-4082-1-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, alexandre.torgue@st.com
Cc: mcoquelin.stm32@gmail.com, arnd@arndb.de, mark.rutland@arm.com, gabriel.fernandez@st.com, fabrice.gasnier@st.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

STM32 syscfg needs a clock to access registers.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 arch/arm/boot/dts/stm32mp157c.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
index 8bf1c17..61b2a70 100644
--- a/arch/arm/boot/dts/stm32mp157c.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c.dtsi
@@ -820,6 +820,7 @@
 		syscfg: syscon@50020000 {
 			compatible = "st,stm32mp157-syscfg", "syscon";
 			reg = <0x50020000 0x400>;
+			clocks = <&rcc SYSCFG>;
 		};
 
 		lptimer2: timer@50021000 {
-- 
1.9.1
