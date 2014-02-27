From: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Subject: [PATCH v0 06/15] drivers: clk: st: Support for A9 MUX clocks
Date: Thu, 27 Feb 2014 16:24:19 +0100
Message-ID: <1393514668-17440-7-git-send-email-gabriel.fernandez@st.com>
References: <1393514668-17440-1-git-send-email-gabriel.fernandez@st.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1393514668-17440-1-git-send-email-gabriel.fernandez@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Lee Jones <lee.jones@linaro.org>, Gabriel Fernandez <gabriel.fernandez@st.com>, Pankaj Dev <pankaj.dev@st.com>
List-Id: devicetree@vger.kernel.org

The patch supports the A9-mux clocks used by ClockGenA9

A9-mux clock : Multiplexer inside ClockGenA9. A9 clock can be driven by
either PLL or External clock (with an optional divide-by-2). This is
implemented as 3-parent clock : PLL, Ext-clk OR Ext-clk/2

Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
---
 drivers/clk/st/clkgen-mux.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/clk/st/clkgen-mux.c b/drivers/clk/st/clkgen-mux.c
index 7ccff62..a329906 100644
--- a/drivers/clk/st/clkgen-mux.c
+++ b/drivers/clk/st/clkgen-mux.c
@@ -570,6 +570,17 @@ static struct clkgen_mux_data clkgen_mux_c_vcc_sd_416 = {
 	.lock = &clkgenf_lock,
 };
 
+static struct clkgen_mux_data stih415_a9_mux_data = {
+	.offset = 0,
+	.shift = 1,
+	.width = 2,
+};
+static struct clkgen_mux_data stih416_a9_mux_data = {
+	.offset = 0,
+	.shift = 0,
+	.width = 2,
+};
+
 static struct of_device_id mux_of_match[] = {
 	{
 		.compatible = "st,stih416-clkgenc-vcc-hd",
@@ -591,6 +602,14 @@ static struct of_device_id mux_of_match[] = {
 		.compatible = "st,stih416-clkgenf-vcc-sd",
 		.data = &clkgen_mux_c_vcc_sd_416,
 	},
+	{
+		.compatible = "st,stih415-clkgen-a9-mux",
+		.data = &stih415_a9_mux_data,
+	},
+	{
+		.compatible = "st,stih416-clkgen-a9-mux",
+		.data = &stih416_a9_mux_data,
+	},
 	{}
 };
 
-- 
1.9.0
