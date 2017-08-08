From: Elaine Zhang <zhangqing@rock-chips.com>
Subject: [PATCH v3 2/9] clk: rockchip: rename the clk id for HCLK_I2S1_2CH
Date: Tue,  8 Aug 2017 15:15:40 +0800
Message-ID: <1502176547-30817-3-git-send-email-zhangqing@rock-chips.com>
References: <1502176547-30817-1-git-send-email-zhangqing@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502176547-30817-1-git-send-email-zhangqing@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@codeaurora.org, heiko@sntech.de
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, xxx@rock-chips.com, xf@rock-chips.com, huangtao@rock-chips.com, shawn.lin@rock-chips.com, andy.yan@rock-chips.com, Elaine Zhang <zhangqing@rock-chips.com>
List-Id: devicetree@vger.kernel.org

i2s1 has 2 channels but not 8 channels.

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
---
 include/dt-bindings/clock/rv1108-cru.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/rv1108-cru.h b/include/dt-bindings/clock/rv1108-cru.h
index fe013cf51e2b..e8aa6d56990a 100644
--- a/include/dt-bindings/clock/rv1108-cru.h
+++ b/include/dt-bindings/clock/rv1108-cru.h
@@ -144,7 +144,7 @@
 
 /* hclk gates */
 #define HCLK_I2S0_8CH			320
-#define HCLK_I2S1_8CH			321
+#define HCLK_I2S1_2CH			321
 #define HCLK_I2S2_2CH			322
 #define HCLK_NANDC			323
 #define HCLK_SDMMC			324
-- 
1.9.1
