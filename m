From: yannick fertre <yannick.fertre@st.com>
Subject: [PATCH v1 1/3] ARM: dts: stm32: add cec support on stm32mp157c
Date: Tue, 24 Apr 2018 09:54:07 +0200
Message-ID: <1524556449-5262-2-git-send-email-yannick.fertre@st.com>
References: <1524556449-5262-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524556449-5262-1-git-send-email-yannick.fertre@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Philippe Cornu <philippe.cornu@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Loic Pallardy <loic.pallardy@st.com>, Gerald Baeza <gerald.baeza@st.com>, Patrice Chotard <patrice.chotard@st.com>, Kamel Kholti <kamel.kholti@st.com>
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

Add cec support on stm32mp157c

Signed-off-by: yannick fertre <yannick.fertre@st.com>
---
 arch/arm/boot/dts/stm32mp157c.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
index bc3eddc..b80eb6b 100644
--- a/arch/arm/boot/dts/stm32mp157c.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c.dtsi
@@ -136,6 +136,15 @@
 			status = "disabled";
 		};
 
+		cec: cec@40016000 {
+			compatible = "st,stm32-cec";
+			reg = <0x40016000 0x400>;
+			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc CEC_K>, <&clk_lse>;
+			clock-names = "cec", "hdmi-cec";
+			status = "disabled";
+		};
+
 		uart7: serial@40018000 {
 			compatible = "st,stm32h7-uart";
 			reg = <0x40018000 0x400>;
-- 
1.9.1
