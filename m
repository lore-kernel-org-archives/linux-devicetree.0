From: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v9 3/3] clk: qcom: Always add factor clock for xo clocks
Date: Wed,  2 Nov 2016 17:56:58 +0200
Message-ID: <20161102155658.32203-4-georgi.djakov@linaro.org>
References: <20161102155658.32203-1-georgi.djakov@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161102155658.32203-1-georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Currently the RPM/RPM-SMD clock drivers do not register the xo clocks,
so we should always add factor clock. When we later add xo clocks support
into the drivers, we should update this function to skip registration.
By doing so we avoid any DT dependencies.

Signed-off-by: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/clk/qcom/common.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index fffcbaf0fba7..27566a0098ca 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -153,15 +153,12 @@ int qcom_cc_register_board_clk(struct device *dev, const char *path,
 			       const char *name, unsigned long rate)
 {
 	bool add_factor = true;
-	struct device_node *node;
-
-	/* The RPM clock driver will add the factor clock if present */
-	if (IS_ENABLED(CONFIG_QCOM_RPMCC)) {
-		node = of_find_compatible_node(NULL, NULL, "qcom,rpmcc");
-		if (of_device_is_available(node))
-			add_factor = false;
-		of_node_put(node);
-	}
+
+	/*
+	 * TODO: The RPM clock driver currently does not support the xo clock.
+	 * When xo is added to the RPM clock driver, we should change this
+	 * function to skip registration of xo factor clocks.
+	 */
 
 	return _qcom_cc_register_board_clk(dev, path, name, rate, add_factor);
 }
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
