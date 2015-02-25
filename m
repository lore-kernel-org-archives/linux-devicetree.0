From: Andrew Bresticker <abrestic@chromium.org>
Subject: [PATCH 6/7] clk: pistachio: Register system interface gate clocks
Date: Tue, 24 Feb 2015 19:56:06 -0800
Message-ID: <1424836567-7252-7-git-send-email-abrestic@chromium.org>
References: <1424836567-7252-1-git-send-email-abrestic@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424836567-7252-1-git-send-email-abrestic@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: devicetree@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Damien Horsley <Damien.Horsley@imgtec.com>
List-Id: devicetree@vger.kernel.org

Register the system interface gate clocks provided by the peripheral
general control block.  These clocks gate register access for various
peripherals.

Signed-off-by: Damien Horsley <Damien.Horsley@imgtec.com>
Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
---
 drivers/clk/pistachio/clk-pistachio.c | 42 +++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/clk/pistachio/clk-pistachio.c b/drivers/clk/pistachio/clk-pistachio.c
index 0eabb54..3351808 100644
--- a/drivers/clk/pistachio/clk-pistachio.c
+++ b/drivers/clk/pistachio/clk-pistachio.c
@@ -264,3 +264,45 @@ static void __init pistachio_clk_periph_init(struct device_node *np)
 }
 CLK_OF_DECLARE(pistachio_clk_periph, "img,pistachio-clk-periph",
 	       pistachio_clk_periph_init);
+
+static struct pistachio_gate pistachio_sys_gates[] __initdata = {
+	GATE(SYS_CLK_I2C0, "i2c0_sys", "sys", 0x8, 0),
+	GATE(SYS_CLK_I2C1, "i2c1_sys", "sys", 0x8, 1),
+	GATE(SYS_CLK_I2C2, "i2c2_sys", "sys", 0x8, 2),
+	GATE(SYS_CLK_I2C3, "i2c3_sys", "sys", 0x8, 3),
+	GATE(SYS_CLK_I2S_IN, "i2s_in_sys", "sys", 0x8, 4),
+	GATE(SYS_CLK_PAUD_OUT, "paud_out_sys", "sys", 0x8, 5),
+	GATE(SYS_CLK_SPDIF_OUT, "spdif_out_sys", "sys", 0x8, 6),
+	GATE(SYS_CLK_SPI0_MASTER, "spi0_master_sys", "sys", 0x8, 7),
+	GATE(SYS_CLK_SPI0_SLAVE, "spi0_slave_sys", "sys", 0x8, 8),
+	GATE(SYS_CLK_PWM, "pwm_sys", "sys", 0x8, 9),
+	GATE(SYS_CLK_UART0, "uart0_sys", "sys", 0x8, 10),
+	GATE(SYS_CLK_UART1, "uart1_sys", "sys", 0x8, 11),
+	GATE(SYS_CLK_SPI1, "spi1_sys", "sys", 0x8, 12),
+	GATE(SYS_CLK_MDC, "mdc_sys", "sys", 0x8, 13),
+	GATE(SYS_CLK_SD_HOST, "sd_host_sys", "sys", 0x8, 14),
+	GATE(SYS_CLK_ENET, "enet_sys", "sys", 0x8, 15),
+	GATE(SYS_CLK_IR, "ir_sys", "sys", 0x8, 16),
+	GATE(SYS_CLK_WD, "wd_sys", "sys", 0x8, 17),
+	GATE(SYS_CLK_TIMER, "timer_sys", "sys", 0x8, 18),
+	GATE(SYS_CLK_I2S_OUT, "i2s_out_sys", "sys", 0x8, 24),
+	GATE(SYS_CLK_SPDIF_IN, "spdif_in_sys", "sys", 0x8, 25),
+	GATE(SYS_CLK_EVENT_TIMER, "event_timer_sys", "sys", 0x8, 26),
+	GATE(SYS_CLK_HASH, "hash_sys", "sys", 0x8, 27),
+};
+
+static void __init pistachio_cr_periph_init(struct device_node *np)
+{
+	struct pistachio_clk_provider *p;
+
+	p = pistachio_clk_alloc_provider(np, SYS_CLK_NR_CLKS);
+	if (!p)
+		return;
+
+	pistachio_clk_register_gate(p, pistachio_sys_gates,
+				    ARRAY_SIZE(pistachio_sys_gates));
+
+	pistachio_clk_register_provider(p);
+}
+CLK_OF_DECLARE(pistachio_cr_periph, "img,pistachio-cr-periph",
+	       pistachio_cr_periph_init);
-- 
2.2.0.rc0.207.ga3a616c
