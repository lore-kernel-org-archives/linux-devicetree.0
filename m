From: yannick fertre <yannick.fertre@st.com>
Subject: [PATCH v1 2/3] ARM: dts: stm32: add cec pins to stm32mp157c
Date: Tue, 24 Apr 2018 09:54:08 +0200
Message-ID: <1524556449-5262-3-git-send-email-yannick.fertre@st.com>
References: <1524556449-5262-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524556449-5262-1-git-send-email-yannick.fertre@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Philippe Cornu <philippe.cornu@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Loic Pallardy <loic.pallardy@st.com>, Gerald Baeza <gerald.baeza@st.com>, Patrice Chotard <patrice.chotard@st.com>, Kamel Kholti <kamel.kholti@st.com>
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

This patch adds cec support on stm32mp157c eval board.

Signed-off-by: Yannick Fertre <yannick.fertre@st.com>
---
 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
index 6f044100..67b0349 100644
--- a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
@@ -14,6 +14,15 @@
 			ranges = <0 0x50002000 0xa400>;
 			pins-are-numbered;
 
+			cec_pins_a: cec@0 {
+				pins {
+					pinmux = <STM32_PINMUX('A', 15, AF4)>;
+					bias-disable;
+					drive-open-drain;
+					slew-rate = <0>;
+				};
+			};
+
 			gpioa: gpio@50002000 {
 				gpio-controller;
 				#gpio-cells = <2>;
-- 
1.9.1
