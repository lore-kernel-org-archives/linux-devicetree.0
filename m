From: Alexandru M Stan <amstan@chromium.org>
Subject: [PATCH v3 1/2] clk: rockchip: add bindings for the mmc clocks
Date: Tue, 18 Nov 2014 13:08:27 -0800
Message-ID: <1416344908-5975-2-git-send-email-amstan@chromium.org>
References: <1416344908-5975-1-git-send-email-amstan@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1416344908-5975-1-git-send-email-amstan@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Doug Anderson <dianders@chromium.org>, addy ke <addy.ke@rock-chips.com>
Cc: Sonny Rao <sonnyrao@chromium.org>, Kever Yang <kever.yang@rock-chips.com>, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Alexandru M Stan <amstan@chromium.org>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mark.yao@rock-chips.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

These clocks represent the physical clocks (including phases) and they will
later be used for clock phase tuning.

Suggested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Alexandru M Stan <amstan@chromium.org>
---
Changes in v3: None
Changes in v2: None

 include/dt-bindings/clock/rk3288-cru.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/dt-bindings/clock/rk3288-cru.h b/include/dt-bindings/clock/rk3288-cru.h
index 100a08c..b4e9142 100644
--- a/include/dt-bindings/clock/rk3288-cru.h
+++ b/include/dt-bindings/clock/rk3288-cru.h
@@ -72,6 +72,16 @@
 #define SCLK_HEVC_CABAC		111
 #define SCLK_HEVC_CORE		112
 
+#define SCLK_SDMMC_DRV		113
+#define SCLK_SDIO0_DRV		114
+#define SCLK_SDIO1_DRV		115
+#define SCLK_EMMC_DRV		116
+
+#define SCLK_SDMMC_SAMPLE	117
+#define SCLK_SDIO0_SAMPLE	118
+#define SCLK_SDIO1_SAMPLE	119
+#define SCLK_EMMC_SAMPLE	120
+
 #define DCLK_VOP0		190
 #define DCLK_VOP1		191
 
-- 
2.1.0.rc2.206.gedb03e5
