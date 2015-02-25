From: Andrew Bresticker <abrestic@chromium.org>
Subject: [PATCH 7/7] clk: pistachio: Register external clock gates
Date: Tue, 24 Feb 2015 19:56:07 -0800
Message-ID: <1424836567-7252-8-git-send-email-abrestic@chromium.org>
References: <1424836567-7252-1-git-send-email-abrestic@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424836567-7252-1-git-send-email-abrestic@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: devicetree@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Damien Horsley <Damien.Horsley@imgtec.com>
List-Id: devicetree@vger.kernel.org

Register the clock gates for the external audio and ethernet
reference clocks provided by the top-level general control block.

Signed-off-by: Damien Horsley <Damien.Horsley@imgtec.com>
Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
---
 drivers/clk/pistachio/clk-pistachio.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/clk/pistachio/clk-pistachio.c b/drivers/clk/pistachio/clk-pistachio.c
index 3351808..8c0fe88 100644
--- a/drivers/clk/pistachio/clk-pistachio.c
+++ b/drivers/clk/pistachio/clk-pistachio.c
@@ -306,3 +306,24 @@ static void __init pistachio_cr_periph_init(struct device_node *np)
 }
 CLK_OF_DECLARE(pistachio_cr_periph, "img,pistachio-cr-periph",
 	       pistachio_cr_periph_init);
+
+static struct pistachio_gate pistachio_ext_gates[] __initdata = {
+	GATE(EXT_CLK_ENET_IN, "enet_clk_in_gate", "enet_clk_in", 0x58, 5),
+	GATE(EXT_CLK_AUDIO_IN, "audio_clk_in_gate", "audio_clk_in", 0x58, 8)
+};
+
+static void __init pistachio_cr_top_init(struct device_node *np)
+{
+	struct pistachio_clk_provider *p;
+
+	p = pistachio_clk_alloc_provider(np, EXT_CLK_NR_CLKS);
+	if (!p)
+		return;
+
+	pistachio_clk_register_gate(p, pistachio_ext_gates,
+				    ARRAY_SIZE(pistachio_ext_gates));
+
+	pistachio_clk_register_provider(p);
+}
+CLK_OF_DECLARE(pistachio_cr_top, "img,pistachio-cr-top",
+	       pistachio_cr_top_init);
-- 
2.2.0.rc0.207.ga3a616c
