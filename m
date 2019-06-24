From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v13 08/13] clk: jz4740: Add TCU clock
Date: Tue, 25 Jun 2019 00:57:54 +0200
Message-ID: <20190624225759.18299-9-paul@crapouillou.net>
References: <20190624225759.18299-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190624225759.18299-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Lee Jones <lee.jones@linaro.org>
Cc: Mathieu Malaterre <malat@debian.org>, od@zcrc.me, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-doc@vger.kernel.org, linux-clk@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, Artur Rojek <contact@artur-rojek.eu>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

Add the missing TCU clock to the list of clocks supplied by the CGU for
the JZ4740 SoC.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Mathieu Malaterre <malat@debian.org>
Tested-by: Artur Rojek <contact@artur-rojek.eu>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Acked-by: Rob Herring <robh@kernel.org>
---

Notes:
    v5: New patch
    
    v6-v13: No change

 drivers/clk/ingenic/jz4740-cgu.c       | 6 ++++++
 include/dt-bindings/clock/jz4740-cgu.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/clk/ingenic/jz4740-cgu.c b/drivers/clk/ingenic/jz4740-cgu.c
index c77f4e1506dc..176d911b5839 100644
--- a/drivers/clk/ingenic/jz4740-cgu.c
+++ b/drivers/clk/ingenic/jz4740-cgu.c
@@ -203,6 +203,12 @@ static const struct ingenic_cgu_clk_info jz4740_cgu_clocks[] = {
 		.parents = { JZ4740_CLK_EXT, -1, -1, -1 },
 		.gate = { CGU_REG_CLKGR, 5 },
 	},
+
+	[JZ4740_CLK_TCU] = {
+		"tcu", CGU_CLK_GATE,
+		.parents = { JZ4740_CLK_EXT, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR, 1 },
+	},
 };
 
 static void __init jz4740_cgu_init(struct device_node *np)
diff --git a/include/dt-bindings/clock/jz4740-cgu.h b/include/dt-bindings/clock/jz4740-cgu.h
index 6ed83f926ae7..e82d77028581 100644
--- a/include/dt-bindings/clock/jz4740-cgu.h
+++ b/include/dt-bindings/clock/jz4740-cgu.h
@@ -34,5 +34,6 @@
 #define JZ4740_CLK_ADC		19
 #define JZ4740_CLK_I2C		20
 #define JZ4740_CLK_AIC		21
+#define JZ4740_CLK_TCU		22
 
 #endif /* __DT_BINDINGS_CLOCK_JZ4740_CGU_H__ */
-- 
2.21.0.593.g511ec345e18
