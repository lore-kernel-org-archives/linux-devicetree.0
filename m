From: <gabriel.fernandez@st.com>
Subject: [PATCH 1/2] clk: stm32: END_PRIMARY_CLK should be declare after CLK_SYSCLK
Date: Thu, 18 Jan 2018 15:49:39 +0100
Message-ID: <1516286980-8603-2-git-send-email-gabriel.fernandez@st.com>
References: <1516286980-8603-1-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1516286980-8603-1-git-send-email-gabriel.fernandez@st.com>
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Nicolas Pitre <nico@linaro.org>, daniel.thompson@linaro.org, philippe.cornu@st.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, gabriel.fernandez.st@gmail.com, gabriel.fernandez@st.com
List-Id: devicetree@vger.kernel.org

From: Gabriel Fernandez <gabriel.fernandez@st.com>

Update of END_PRIMARY_CLK was missed, it should be after CLK_SYSCLK
hsi and sysclk are overwritten by gpioa and gpiob.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
---
 include/dt-bindings/clock/stm32fx-clock.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/dt-bindings/clock/stm32fx-clock.h b/include/dt-bindings/clock/stm32fx-clock.h
index 49bb3c2..4d523b0 100644
--- a/include/dt-bindings/clock/stm32fx-clock.h
+++ b/include/dt-bindings/clock/stm32fx-clock.h
@@ -33,11 +33,11 @@
 #define CLK_SAI2		11
 #define CLK_I2SQ_PDIV		12
 #define CLK_SAIQ_PDIV		13
-
-#define END_PRIMARY_CLK		14
-
 #define CLK_HSI			14
 #define CLK_SYSCLK		15
+
+#define END_PRIMARY_CLK		16
+
 #define CLK_HDMI_CEC		16
 #define CLK_SPDIF		17
 #define CLK_USART1		18
-- 
1.9.1

