From: <gabriel.fernandez@st.com>
Subject: [PATCH] dt-bindings: clk: stm32h7: fix clock-cell size
Date: Tue, 19 Sep 2017 13:44:06 +0200
Message-ID: <1505821446-6847-1-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Nicolas Pitre <nico@linaro.org>, Arnd Bergmann <arnd@arndb.de>, daniel.thompson@linaro.org, andrea.merello@gmail.com, radoslaw.pietrzyk@gmail.com, Lee Jones <lee.jones@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, gabriel.fernandez@st.com, ludovic.barre@st.com, olivier.bideau@st.com, amelie.delaunay@st.com, gabriel.fernandez.st@gmail.com
List-Id: devicetree@vger.kernel.org

From: Gabriel Fernandez <gabriel.fernandez@st.com>

The clock-cell size is 1 on stm32h7 plaform.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
Fixes: 3e4d618b0722 ("clk: stm32h7: Add stm32h743 clock driver")
---
 Documentation/devicetree/bindings/clock/st,stm32h7-rcc.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/st,stm32h7-rcc.txt b/Documentation/devicetree/bindings/clock/st,stm32h7-rcc.txt
index a135504..cac24ee 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32h7-rcc.txt
+++ b/Documentation/devicetree/bindings/clock/st,stm32h7-rcc.txt
@@ -32,7 +32,7 @@ Example:
 		compatible = "st,stm32h743-rcc", "st,stm32-rcc";
 		reg = <0x58024400 0x400>;
 		#reset-cells = <1>;
-		#clock-cells = <2>;
+		#clock-cells = <1>;
 		clocks = <&clk_hse>, <&clk_lse>, <&clk_i2s_ckin>;
 
 		st,syscfg = <&pwrcfg>;
-- 
1.9.1
