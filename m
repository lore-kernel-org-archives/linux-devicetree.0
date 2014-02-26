From: Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 08/12] clk: bcm281xx: add an initialized flag
Date: Tue, 25 Feb 2014 18:15:48 -0600
Message-ID: <1393373752-30875-9-git-send-email-elder@linaro.org>
References: <1393373752-30875-1-git-send-email-elder@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393373752-30875-1-git-send-email-elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add a flag that tracks whether a clock has already been initialized.
This will be used by the next patch to avoid initializing a clock
more than once when it's listed as a prerequisite.

Signed-off-by: Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/clk/bcm/clk-kona.c |   16 ++++++++++++++--
 drivers/clk/bcm/clk-kona.h |    7 +++++++
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/bcm/clk-kona.c b/drivers/clk/bcm/clk-kona.c
index 64b6361..6caed3b 100644
--- a/drivers/clk/bcm/clk-kona.c
+++ b/drivers/clk/bcm/clk-kona.c
@@ -27,6 +27,9 @@
 #define CCU_ACCESS_PASSWORD      0xA5A500
 #define CLK_GATE_DELAY_LOOP      2000
 
+#define clk_is_initialized(_clk)	FLAG_TEST((_clk), KONA, INITIALIZED)
+#define clk_set_initialized(_clk)	FLAG_SET((_clk), KONA, INITIALIZED)
+
 /* Bitfield operations */
 
 /* Produces a mask of set bits covering a range of a 32-bit value */
@@ -1192,13 +1195,22 @@ static bool __peri_clk_init(struct kona_clk *bcm_clk)
 
 static bool __kona_clk_init(struct kona_clk *bcm_clk)
 {
+	bool ret = false;
+
+	if (clk_is_initialized(bcm_clk))
+		return true;
+
 	switch (bcm_clk->type) {
 	case bcm_clk_peri:
-		return __peri_clk_init(bcm_clk);
+		ret = __peri_clk_init(bcm_clk);
+		break;
 	default:
 		BUG();
 	}
-	return -EINVAL;
+	if (ret)
+		clk_set_initialized(bcm_clk);
+
+	return ret;
 }
 
 /* Set a CCU and all its clocks into their desired initial state */
diff --git a/drivers/clk/bcm/clk-kona.h b/drivers/clk/bcm/clk-kona.h
index c6285d2..01fa776 100644
--- a/drivers/clk/bcm/clk-kona.h
+++ b/drivers/clk/bcm/clk-kona.h
@@ -406,6 +406,7 @@ struct kona_clk {
 	struct clk_init_data init_data;	/* includes name of this clock */
 	struct ccu_data *ccu;	/* ccu this clock is associated with */
 	enum bcm_clk_type type;
+	u32 flags;		/* BCM_CLK_KONA_FLAGS_* below */
 	union {
 		void *data;
 		struct peri_clk_data *peri;
@@ -414,6 +415,12 @@ struct kona_clk {
 #define to_kona_clk(_hw) \
 	container_of(_hw, struct kona_clk, hw)
 
+/*
+ * Kona clock flags:
+ *   INITIALIZED	clock has been initialized already
+ */
+#define BCM_CLK_KONA_FLAGS_INITIALIZED	((u32)1 << 0)	/* Clock initialized */
+
 /* Initialization macro for an entry in a CCU's kona_clks[] array. */
 #define KONA_CLK(_ccu_name, _clk_name, _type)				\
 	{								\
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
