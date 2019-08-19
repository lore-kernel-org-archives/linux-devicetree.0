From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 2/8] clk: Warn if clk_init_data is not zero initialized
Date: Mon, 19 Aug 2019 18:31:37 +0530
Message-ID: <20190819130143.18778-3-manivannan.sadhasivam@linaro.org>
References: <20190819130143.18778-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190819130143.18778-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, haitao.suo@bitmain.com, darren.tsao@bitmain.com, fisher.cheng@bitmain.com, alec.lin@bitmain.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

The new implementation for determining parent map uses multiple ways
to pass parent info. The order in which it gets processed depends on
the first available member. Hence, it is necessary to zero init the
clk_init_data struct so that the expected member gets processed correctly.
So, add a warning if multiple clk_init_data members are available during
clk registration.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/clk/clk.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index c0990703ce54..7d6d6984c979 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3497,6 +3497,14 @@ static int clk_core_populate_parent_map(struct clk_core *core)
 	if (!num_parents)
 		return 0;
 
+	/*
+	 * Check for non-zero initialized clk_init_data struct. This is
+	 * required because, we only require one of the (parent_names/
+	 * parent_data/parent_hws) to be set at a time. Otherwise, the
+	 * current code would use first available member.
+	 */
+	WARN_ON((parent_names && parent_data) || (parent_names && parent_hws));
+
 	/*
 	 * Avoid unnecessary string look-ups of clk_core's possible parents by
 	 * having a cache of names/clk_hw pointers to clk_core pointers.
-- 
2.17.1
