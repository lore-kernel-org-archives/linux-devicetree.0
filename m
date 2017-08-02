From: Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2 02/23] clk: rockchip: rename the clk id for HCLK_I2S1_2CH
Date: Wed,  2 Aug 2017 16:29:48 +0800
Message-ID: <1501662588-11807-1-git-send-email-andy.yan@rock-chips.com>
References: <1501662303-11687-1-git-send-email-andy.yan@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1501662303-11687-1-git-send-email-andy.yan@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: robh+dt@kernel.org, shawn.lin@rock-chips.com, zhangqing@rock-chips.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Yan <andy.yan@rock-chips.com>
List-Id: devicetree@vger.kernel.org

From: Elaine Zhang <zhangqing@rock-chips.com>

i2s1 has 2 channels but not 8 channels.

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

Changes in v2: None

 include/dt-bindings/clock/rv1108-cru.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/rv1108-cru.h b/include/dt-bindings/clock/rv1108-cru.h
index fe013cf..e8aa6d5 100644
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
2.7.4
