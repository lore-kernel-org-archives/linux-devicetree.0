From: Gabriel Fernandez <gabriel.fernandez@st.com>
Subject: [PATCH 2/2] ARM: dts: stm32: Enable STM32F769 clock driver
Date: Fri, 5 Apr 2019 09:53:32 +0200
Message-ID: <20190405075332.28530-3-gabriel.fernandez@st.com>
References: <20190405075332.28530-1-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190405075332.28530-1-gabriel.fernandez@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: michael turquette <mturquette@baylibre.com>, stephen boyd <sboyd@kernel.org>, rob herring <robh+dt@kernel.org>, mark rutland <mark.rutland@arm.com>, maxime coquelin <mcoquelin.stm32@gmail.com>, alexandre torgue <alexandre.torgue@st.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Gabriel Fernandez <gabriel.fernandez@st.com>
List-Id: devicetree@vger.kernel.org

This patch enables clocks for STM32F769 boards.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
---
 arch/arm/boot/dts/stm32f769-disco.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f769-disco.dts b/arch/arm/boot/dts/stm32f769-disco.dts
index 3c7216844a9b..6f1d0ac8c31c 100644
--- a/arch/arm/boot/dts/stm32f769-disco.dts
+++ b/arch/arm/boot/dts/stm32f769-disco.dts
@@ -102,6 +102,10 @@
 	};
 };
 
+&rcc {
+	compatible = "st,stm32f769-rcc", "st,stm32f746-rcc", "st,stm32-rcc";
+};
+
 &cec {
 	pinctrl-0 = <&cec_pins_a>;
 	pinctrl-names = "default";
-- 
2.17.1
