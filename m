From: Vikas Manocha <vikas.manocha@st.com>
Subject: [PATCH 3/3] ARM: dts: stm32h7: correct uart nodes compatible string
Date: Thu, 28 Sep 2017 15:51:26 -0700
Message-ID: <1506639114-16913-4-git-send-email-vikas.manocha@st.com>
References: <1506639114-16913-1-git-send-email-vikas.manocha@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1506639114-16913-1-git-send-email-vikas.manocha@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Vikas Manocha <vikas.manocha@st.com>, alexandre.torgue@st.com, patrice.chotard@st.com, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>
List-Id: devicetree@vger.kernel.org

With this change, stm32h743 will use its own uart configuration.
Major difference between stm32f7 & stm32h7 uart configuration is FIFO
availability in stm32h7.

Signed-off-by: Vikas Manocha <vikas.manocha@st.com>
Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
---
 arch/arm/boot/dts/stm32h743.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/stm32h743.dtsi b/arch/arm/boot/dts/stm32h743.dtsi
index 26de315..fab637b 100644
--- a/arch/arm/boot/dts/stm32h743.dtsi
+++ b/arch/arm/boot/dts/stm32h743.dtsi
@@ -67,7 +67,7 @@
 		};
 
 		usart2: serial@40004400 {
-			compatible = "st,stm32f7-uart";
+			compatible = "st,stm32h7-uart";
 			reg = <0x40004400 0x400>;
 			interrupts = <38>;
 			status = "disabled";
@@ -99,7 +99,7 @@
 		};
 
 		usart1: serial@40011000 {
-			compatible = "st,stm32f7-uart";
+			compatible = "st,stm32h7-uart";
 			reg = <0x40011000 0x400>;
 			interrupts = <37>;
 			status = "disabled";
-- 
1.9.1
