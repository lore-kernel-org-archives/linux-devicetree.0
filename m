From: <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 12/14] clk: stm32mp1: add RTC clock
Date: Fri, 2 Feb 2018 15:03:40 +0100
Message-ID: <1517580222-23301-13-git-send-email-gabriel.fernandez@st.com>
References: <1517580222-23301-1-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1517580222-23301-1-git-send-email-gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gabriel.fernandez.st-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, olivier.bideau-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>

This patch adds the RTC clock.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
---
 drivers/clk/clk-stm32mp1.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/clk-stm32mp1.c
index 5a1142c..1cb06b0 100644
--- a/drivers/clk/clk-stm32mp1.c
+++ b/drivers/clk/clk-stm32mp1.c
@@ -1179,6 +1179,15 @@ static struct clk_hw *_clk_register_cktim(struct device *dev,
 	_MUX(_mux_offset, _mux_bit, _mux_width, 0),\
 }
 
+#define _GATEMUX(_gate_offset,\
+		 _bit_idx,\
+		 _mux_offset, _mux_bit, _mux_width)\
+{\
+	_NO_DIV,\
+	_GATE(_gate_offset, _bit_idx, 0),\
+	_MUX(_mux_offset, _mux_bit, _mux_width, 0),\
+}
+
 #define _MP1_GATE(_gate_offset, _bit_idx, _flags)\
 		  _GATE_OPS(_gate_offset, _bit_idx, _flags, &mp1_gate_clk_ops)
 
@@ -1526,6 +1535,14 @@ static struct clk_hw *_clk_register_cktim(struct device *dev,
 		 RCC_APB4ENSETR, 0, 0),
 
 	MP1_GATE(GPU_K, "gpu_k", "pll2_q", 0, RCC_AHB6ENSETR, 5, 0),
+
+	/* RTC clock */
+	DIV(NO_ID, "ck_hse_rtc", "ck_hse", 0, RCC_RTCDIVR, 0, 7,
+	    CLK_DIVIDER_ALLOW_ZERO),
+
+	COMPOSITE(RTC, "ck_rtc", rtc_src, CLK_OPS_PARENT_ENABLE |
+		  CLK_SET_RATE_PARENT,
+		  _GATEMUX(RCC_BDCR, 20, RCC_BDCR, 16, 2)),
 };
 
 struct stm32_clock_match_data {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
