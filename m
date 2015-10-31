From: Chris Zhong <zyw@rock-chips.com>
Subject: [PATCH v2 01/13] clk: rockchip: add id for mipidsi sclk on rk3288
Date: Sat, 31 Oct 2015 20:55:57 +0800
Message-ID: <1446296170-3702-2-git-send-email-zyw@rock-chips.com>
References: <1446296170-3702-1-git-send-email-zyw@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446296170-3702-1-git-send-email-zyw@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, linux-rockchip@lists.infradead.org
Cc: Chris Zhong <zyw@rock-chips.com>, devicetree@vger.kernel.org, Alexandru M Stan <amstan@chromium.org>, linux-kernel@vger.kernel.org, Kever Yang <kever.yang@rock-chips.com>, Doug Anderson <dianders@chromium.org>, Kumar Gala <galak@codeaurora.org>, "David S. Miller" <davem@davemloft.net>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Sonny Rao <sonnyrao@chromium.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Jeff Chen <cym@rock-chips.com>, Mark Rutland <mark.rutland@arm.com>, Huang Lin <hl@rock-chips.com>, Roger Chen <roger.chen@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Adds a new id for the sclk supplying the mipidsi on rk3288 socs.

Signed-off-by: Chris Zhong <zyw@rock-chips.com>

---

Changes in v2:
add the mipi clk id in a single patch

 include/dt-bindings/clock/rk3288-cru.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/rk3288-cru.h b/include/dt-bindings/clock/rk3288-cru.h
index c719aac..b07cdd3 100644
--- a/include/dt-bindings/clock/rk3288-cru.h
+++ b/include/dt-bindings/clock/rk3288-cru.h
@@ -86,6 +86,7 @@
 #define SCLK_USBPHY480M_SRC	122
 #define SCLK_PVTM_CORE		123
 #define SCLK_PVTM_GPU		124
+#define SCLK_MIPI_24M		125
 
 #define SCLK_MAC		151
 #define SCLK_MACREF_OUT		152
-- 
2.6.2
