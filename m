From: Christophe Roullier <christophe.roullier@st.com>
Subject: [PATCH  4/8] ARM: dts: stm32: Add syscfg on stm32mp1
Date: Tue, 24 Apr 2018 17:01:56 +0200
Message-ID: <1524582120-4451-5-git-send-email-christophe.roullier@st.com>
References: <1524582120-4451-1-git-send-email-christophe.roullier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1524582120-4451-1-git-send-email-christophe.roullier@st.com>
Sender: netdev-owner@vger.kernel.org
To: mark.rutland@arm.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, peppe.cavallaro@st.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, christophe.roullier@st.com
List-Id: devicetree@vger.kernel.org

System configuration controller is mainly used to manage
the compensation cell and other IOs and system related
settings.

Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
---
 arch/arm/boot/dts/stm32mp157c.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
index bc3eddc..f98a0ae 100644
--- a/arch/arm/boot/dts/stm32mp157c.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c.dtsi
@@ -167,6 +167,11 @@
 			#reset-cells = <1>;
 		};
 
+		syscfg: system-config@50020000 {
+			compatible = "st,stm32-syscfg", "syscon";
+			reg = <0x50020000 0x400>;
+		};
+
 		usart1: serial@5c000000 {
 			compatible = "st,stm32h7-uart";
 			reg = <0x5c000000 0x400>;
-- 
1.9.1
