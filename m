From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: [PATCH v2 2/2] ARM: dts: stm32: Add hwlock for irqchip on stm32mp157
Date: Fri, 14 Dec 2018 16:11:28 +0100
Message-ID: <20181214151128.10005-3-benjamin.gaignard@linaro.org>
References: <20181214151128.10005-1-benjamin.gaignard@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181214151128.10005-1-benjamin.gaignard@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, alexandre.torgue@st.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

From: Benjamin Gaignard <benjamin.gaignard@st.com>

Define a hwspinlock to be used by irq controller

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 arch/arm/boot/dts/stm32mp157c.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
index 8bf1c17f8cef..cac0af371082 100644
--- a/arch/arm/boot/dts/stm32mp157c.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c.dtsi
@@ -815,6 +815,7 @@
 			interrupt-controller;
 			#interrupt-cells = <2>;
 			reg = <0x5000d000 0x400>;
+			hwlocks = <&hsem 1>;
 		};
 
 		syscfg: syscon@50020000 {
-- 
2.15.0
