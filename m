From: James Liao <jamesjj.liao@mediatek.com>
Subject: [PATCH v5 01/10] clk: mediatek: Removed unused dpi_ck clock from MT8173
Date: Wed, 29 Jul 2015 14:52:25 +0800
Message-ID: <1438152754-11970-2-git-send-email-jamesjj.liao@mediatek.com>
References: <1438152754-11970-1-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438152754-11970-1-git-send-email-jamesjj.liao@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Heiko Stubner <heiko@sntech.de>
Cc: srv_heupstream@mediatek.com, Daniel Kurtz <djkurtz@chromium.org>, Ricky Liang <jcliang@chromium.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, James Liao <jamesjj.liao@mediatek.com>
List-Id: devicetree@vger.kernel.org

The dpi_ck clock can be removed because it not actually used
in topckgen and subsystems.

Signed-off-by: James Liao <jamesjj.liao@mediatek.com>
---
 drivers/clk/mediatek/clk-mt8173.c      | 1 -
 include/dt-bindings/clock/mt8173-clk.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
index 4b9e04c..4486f8f 100644
--- a/drivers/clk/mediatek/clk-mt8173.c
+++ b/drivers/clk/mediatek/clk-mt8173.c
@@ -26,7 +26,6 @@ static DEFINE_SPINLOCK(mt8173_clk_lock);
 
 static const struct mtk_fixed_factor root_clk_alias[] __initconst = {
 	FACTOR(CLK_TOP_CLKPH_MCK_O, "clkph_mck_o", "clk_null", 1, 1),
-	FACTOR(CLK_TOP_DPI, "dpi_ck", "clk_null", 1, 1),
 	FACTOR(CLK_TOP_USB_SYSPLL_125M, "usb_syspll_125m", "clk_null", 1, 1),
 	FACTOR(CLK_TOP_HDMITX_DIG_CTS, "hdmitx_dig_cts", "clk_null", 1, 1),
 };
diff --git a/include/dt-bindings/clock/mt8173-clk.h b/include/dt-bindings/clock/mt8173-clk.h
index 4ad76ed..7230c38 100644
--- a/include/dt-bindings/clock/mt8173-clk.h
+++ b/include/dt-bindings/clock/mt8173-clk.h
@@ -18,7 +18,6 @@
 /* TOPCKGEN */
 
 #define CLK_TOP_CLKPH_MCK_O		1
-#define CLK_TOP_DPI			2
 #define CLK_TOP_USB_SYSPLL_125M		3
 #define CLK_TOP_HDMITX_DIG_CTS		4
 #define CLK_TOP_ARMCA7PLL_754M		5
-- 
1.8.1.1.dirty
