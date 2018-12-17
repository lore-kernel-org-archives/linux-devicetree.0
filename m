From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 01/15] clk: rockchip: add clock ids for dphy rx and tx channels on rk3368
Date: Mon, 17 Dec 2018 13:36:36 +0100
Message-ID: <20181217123650.6773-2-heiko@sntech.de>
References: <20181217123650.6773-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181217123650.6773-1-heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rockchip@lists.infradead.org, hjc@rock-chips.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, mark.rutland@arm.com, architt@codeaurora.org, a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, linux-clk@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

Add the clock ids so that they can be exported from the clock driver
and referenced in the rk3368 devicetree.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 include/dt-bindings/clock/rk3368-cru.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/rk3368-cru.h b/include/dt-bindings/clock/rk3368-cru.h
index a0063ed7284a..a4ed1f094da8 100644
--- a/include/dt-bindings/clock/rk3368-cru.h
+++ b/include/dt-bindings/clock/rk3368-cru.h
@@ -157,6 +157,8 @@
 #define PCLK_VIP		367
 #define PCLK_WDT		368
 #define PCLK_EFUSE256		369
+#define PCLK_DPHYRX		370
+#define PCLK_DPHYTX		371
 
 /* hclk gates */
 #define HCLK_SFC		448
-- 
2.19.2
