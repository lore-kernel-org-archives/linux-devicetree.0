From: Kever Yang <kever.yang@rock-chips.com>
Subject: [PATCH 1/2] clk: rockchip: add clock ID for usbphy480m_src
Date: Thu, 13 Nov 2014 15:22:36 +0800
Message-ID: <1415863357-15680-1-git-send-email-kever.yang@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Mike Turquette <mturquette@linaro.org>
Cc: dianders@chromium.org, sonnyrao@chromium.org, addy.ke@rock-chips.com, cf@rock-chips.com, dkl@rock-chips.com, huangtao@rock-chips.com, linux-rockchip@lists.infradead.org, Kever Yang <kever.yang@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark yao <mark.yao@rock-chips.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

There are 3 different parent clock from different usbphy,
all of them are fixed 480MHz, it is not able to auto select
by clock core to the 2nd and the 3rd parent.
For different use case for different board, we may need to
select different usbphy clock out as parent manually.

Add the clock ID for it so that we can use in dts.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

 include/dt-bindings/clock/rk3288-cru.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/rk3288-cru.h b/include/dt-bindings/clock/rk3288-cru.h
index 100a08c..3dcc906 100644
--- a/include/dt-bindings/clock/rk3288-cru.h
+++ b/include/dt-bindings/clock/rk3288-cru.h
@@ -71,6 +71,7 @@
 #define SCLK_HDMI_CEC		110
 #define SCLK_HEVC_CABAC		111
 #define SCLK_HEVC_CORE		112
+#define SCLK_USBPHY480M_SRC	113
 
 #define DCLK_VOP0		190
 #define DCLK_VOP1		191
-- 
1.9.1
