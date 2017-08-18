From: Elaine Zhang <zhangqing@rock-chips.com>
Subject: [PATCH v1 1/2] clk: rockchip: add rk3228 sclk_sdio_src ID
Date: Fri, 18 Aug 2017 11:49:24 +0800
Message-ID: <1503028165-27072-2-git-send-email-zhangqing@rock-chips.com>
References: <1503028165-27072-1-git-send-email-zhangqing@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1503028165-27072-1-git-send-email-zhangqing@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@codeaurora.org, heiko@sntech.de
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, xxx@rock-chips.com, xf@rock-chips.com, huangtao@rock-chips.com, frank.wang@rock-chips.com, cl@rock-chips.com, Elaine Zhang <zhangqing@rock-chips.com>
List-Id: devicetree@vger.kernel.org

This patch exports sdio src clock for dts reference.

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
---
 include/dt-bindings/clock/rk3228-cru.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/rk3228-cru.h b/include/dt-bindings/clock/rk3228-cru.h
index 56f841c22801..55655ab0a4c4 100644
--- a/include/dt-bindings/clock/rk3228-cru.h
+++ b/include/dt-bindings/clock/rk3228-cru.h
@@ -49,6 +49,7 @@
 #define SCLK_EMMC_DRV		117
 #define SCLK_SDMMC_SAMPLE	118
 #define SCLK_SDIO_SAMPLE	119
+#define SCLK_SDIO_SRC		120
 #define SCLK_EMMC_SAMPLE	121
 #define SCLK_VOP		122
 #define SCLK_HDMI_HDCP		123
-- 
1.9.1
