From: Eddie Cai <eddie.cai.linux@gmail.com>
Subject: [PATCH V2  1/2] clk: rockchip: add ids for camera
Date: Tue, 25 Apr 2017 14:41:09 +0800
Message-ID: <1493102470-22965-2-git-send-email-eddie.cai.linux@gmail.com>
References: <1493102470-22965-1-git-send-email-eddie.cai.linux@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1493102470-22965-1-git-send-email-eddie.cai.linux@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, heiko@sntech.de, zhengxing@rock-chips.com, mturquette@baylibre.com, sboyd@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, Eddie Cai <eddie.cai.linux@gmail.com>
List-Id: devicetree@vger.kernel.org

we use SCLK_TESTCLKOUT1 and SCLK_TESTCLKOUT2 for camera, so add those ids.

Signed-off-by: Eddie Cai <eddie.cai.linux@gmail.com>
---
 include/dt-bindings/clock/rk3399-cru.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/rk3399-cru.h b/include/dt-bindings/clock/rk3399-cru.h
index 220a60f..22cb1df 100644
--- a/include/dt-bindings/clock/rk3399-cru.h
+++ b/include/dt-bindings/clock/rk3399-cru.h
@@ -132,6 +132,8 @@
 #define SCLK_RMII_SRC			166
 #define SCLK_PCIEPHY_REF100M		167
 #define SCLK_DDRC			168
+#define SCLK_TESTCLKOUT1		169
+#define SCLK_TESTCLKOUT2		170
 
 #define DCLK_VOP0			180
 #define DCLK_VOP1			181
-- 
1.9.1
