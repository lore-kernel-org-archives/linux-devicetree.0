From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v3 09/14] regmap: add iopoll-like polling macro
 for regmap_field
Date: Fri, 29 Sep 2017 16:23:01 +0800
Message-ID: <20170929082306.16193-10-wens@csie.org>
References: <20170929082306.16193-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBB6MFXDHAKGQETNOODXA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170929082306.16193-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds a macro regmap_field_read_poll_timeout that works
similar to the readx_poll_timeout defined in linux/iopoll.h, except
that this can also return the error value returned by a failed
regmap_field_read.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 include/linux/regmap.h | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index 978abfbac617..93a4663d7acb 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -139,6 +139,45 @@ struct reg_sequence {
 	pollret ?: ((cond) ? 0 : -ETIMEDOUT); \
 })
 
+/**
+ * regmap_field_read_poll_timeout - Poll until a condition is met or timeout
+ *
+ * @field: Regmap field to read from
+ * @val: Unsigned integer variable to read the value into
+ * @cond: Break condition (usually involving @val)
+ * @sleep_us: Maximum time to sleep between reads in us (0
+ *            tight-loops).  Should be less than ~20ms since usleep_range
+ *            is used (see Documentation/timers/timers-howto.txt).
+ * @timeout_us: Timeout in us, 0 means never timeout
+ *
+ * Returns 0 on success and -ETIMEDOUT upon a timeout or the regmap_field_read
+ * error return value in case of a error read. In the two former cases,
+ * the last read value at @addr is stored in @val. Must not be called
+ * from atomic context if sleep_us or timeout_us are used.
+ *
+ * This is modelled after the readx_poll_timeout macros in linux/iopoll.h.
+ */
+#define regmap_field_read_poll_timeout(field, val, cond, sleep_us, timeout_us) \
+({ \
+	ktime_t timeout = ktime_add_us(ktime_get(), timeout_us); \
+	int pollret; \
+	might_sleep_if(sleep_us); \
+	for (;;) { \
+		pollret = regmap_field_read((field), &(val)); \
+		if (pollret) \
+			break; \
+		if (cond) \
+			break; \
+		if (timeout_us && ktime_compare(ktime_get(), timeout) > 0) { \
+			pollret = regmap_field_read((field), &(val)); \
+			break; \
+		} \
+		if (sleep_us) \
+			usleep_range((sleep_us >> 2) + 1, sleep_us); \
+	} \
+	pollret ?: ((cond) ? 0 : -ETIMEDOUT); \
+})
+
 #ifdef CONFIG_REGMAP
 
 enum regmap_endian {
-- 
2.14.2
