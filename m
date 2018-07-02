From: Yixun Lan <yixun.lan@amlogic.com>
Subject: [PATCH v2 1/2] clk: meson-axg: add pcie and mipi clock bindings
Date: Mon, 2 Jul 2018 21:31:17 +0000
Message-ID: <20180702213118.19222-2-yixun.lan@amlogic.com>
References: <20180702213118.19222-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180702213118.19222-1-yixun.lan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
Cc: Yixun Lan <yixun.lan@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Qiufang Dai <qiufang.dai@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, Jianxin Qin <jianxin.qin@amlogic.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the pcie and mipi clock dt-bindings for the pcie driver.

Since the mipi clock isalso used by the pcie driver,
we add it together in this patch.

Tested-by: Jianxin Qin <jianxin.qin@amlogic.com>
Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
---
 include/dt-bindings/clock/axg-clkc.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/clock/axg-clkc.h b/include/dt-bindings/clock/axg-clkc.h
index 555937a25504..70371228b7e0 100644
--- a/include/dt-bindings/clock/axg-clkc.h
+++ b/include/dt-bindings/clock/axg-clkc.h
@@ -68,5 +68,8 @@
 #define CLKID_SD_EMMC_B_CLK0			59
 #define CLKID_SD_EMMC_C_CLK0			60
 #define CLKID_HIFI_PLL				69
+#define CLKID_PCIE_CML_EN0			79
+#define CLKID_PCIE_CML_EN1			80
+#define CLKID_MIPI_ENABLE			81
 
 #endif /* __AXG_CLKC_H */
-- 
2.18.0
