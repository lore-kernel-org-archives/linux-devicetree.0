From: Chris Zhong <zyw@rock-chips.com>
Subject: [v2 PATCH 2/3] clk: rockchip: add dclk_vop_frac ids for vop
Date: Thu,  1 Sep 2016 20:26:24 -0700
Message-ID: <1472786785-2393-2-git-send-email-zyw@rock-chips.com>
References: <1472786785-2393-1-git-send-email-zyw@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1472786785-2393-1-git-send-email-zyw@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, dianders@chromium.org
Cc: linux-rockchip@lists.infradead.org, zhengxing@rock-chips.com, ykk@rock-chips.com, Chris Zhong <zyw@rock-chips.com>, devicetree@vger.kernel.org, Jianqun Xu <jay.xu@rock-chips.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lin Huang <hl@rock-chips.com>
List-Id: devicetree@vger.kernel.org

From: Yakir Yang <ykk@rock-chips.com>

Export the dclk_vop_frac out, so we can set the dclk_vop as the
child of dclk_vop_frac, and then we can start to take use of
the fractional dividers.

Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
Signed-off-by: Yakir Yang <ykk@rock-chips.com>
Signed-off-by: Chris Zhong <zyw@rock-chips.com>
---

 include/dt-bindings/clock/rk3399-cru.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/rk3399-cru.h b/include/dt-bindings/clock/rk3399-cru.h
index ce5f3e9..220a60f 100644
--- a/include/dt-bindings/clock/rk3399-cru.h
+++ b/include/dt-bindings/clock/rk3399-cru.h
@@ -138,6 +138,8 @@
 #define DCLK_VOP0_DIV			182
 #define DCLK_VOP1_DIV			183
 #define DCLK_M0_PERILP			184
+#define DCLK_VOP0_FRAC			185
+#define DCLK_VOP1_FRAC			186
 
 #define FCLK_CM0S			190
 
-- 
1.9.1
