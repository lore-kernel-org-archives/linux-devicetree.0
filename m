From: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Subject: [PATCH v2 06/14] drivers: clk: st: STiH407: Support for A9 MUX Clocks
Date: Fri, 27 Jun 2014 15:25:03 +0200
Message-ID: <1403875511-7710-7-git-send-email-gabriel.fernandez@linaro.org>
References: <1403875511-7710-1-git-send-email-gabriel.fernandez@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1403875511-7710-1-git-send-email-gabriel.fernandez@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com, Lee Jones <lee.jones@linaro.org>, Gabriel Fernandez <gabriel.fernandez@linaro.org>, Olivier Bideau <olivier.bideau@st.com>
List-Id: devicetree@vger.kernel.org

The patch supports the A9-mux clocks used by ClockGenA9

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Signed-off-by: Olivier Bideau <olivier.bideau@st.com>
Acked-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/clk/st/clkgen-mux.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/st/clkgen-mux.c b/drivers/clk/st/clkgen-mux.c
index a329906..9bdedc8 100644
--- a/drivers/clk/st/clkgen-mux.c
+++ b/drivers/clk/st/clkgen-mux.c
@@ -580,6 +580,11 @@ static struct clkgen_mux_data stih416_a9_mux_data = {
 	.shift = 0,
 	.width = 2,
 };
+static struct clkgen_mux_data stih407_a9_mux_data = {
+	.offset = 0x1a4,
+	.shift = 1,
+	.width = 2,
+};
 
 static struct of_device_id mux_of_match[] = {
 	{
@@ -610,6 +615,10 @@ static struct of_device_id mux_of_match[] = {
 		.compatible = "st,stih416-clkgen-a9-mux",
 		.data = &stih416_a9_mux_data,
 	},
+	{
+		.compatible = "st,stih407-clkgen-a9-mux",
+		.data = &stih407_a9_mux_data,
+	},
 	{}
 };
 
-- 
1.9.1
