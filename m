From: Fabien Dessenne <fabien.dessenne@st.com>
Subject: [PATCH 1/3] ARM: dts: stm32: add IPCC mailbox support on STM32MP157c
Date: Fri, 1 Mar 2019 10:18:37 +0100
Message-ID: <1551431919-23410-2-git-send-email-fabien.dessenne@st.com>
References: <1551431919-23410-1-git-send-email-fabien.dessenne@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551431919-23410-1-git-send-email-fabien.dessenne@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Cc: Fabien Dessenne <fabien.dessenne@st.com>
List-Id: devicetree@vger.kernel.org

Add configuration on DT for IPCC mailbox driver.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 arch/arm/boot/dts/stm32mp157c.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
index 10bf338..c664b55 100644
--- a/arch/arm/boot/dts/stm32mp157c.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c.dtsi
@@ -886,6 +886,21 @@
 			status = "disabled";
 		};
 
+		ipcc: mailbox@4c001000 {
+			compatible = "st,stm32mp1-ipcc";
+			#mbox-cells = <1>;
+			reg = <0x4c001000 0x400>;
+			st,proc-id = <0>;
+			interrupts-extended =
+				<&intc GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
+				<&exti 61 1>;
+			interrupt-names = "rx", "tx", "wakeup";
+			clocks = <&rcc IPCC>;
+			wakeup-source;
+			status = "disabled";
+		};
+
 		rcc: rcc@50000000 {
 			compatible = "st,stm32mp1-rcc", "syscon";
 			reg = <0x50000000 0x1000>;
-- 
2.7.4
