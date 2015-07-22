From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v7 3/5] clk: Supply the critical clock {init, enable,
 disable} framework
Date: Wed, 22 Jul 2015 14:04:13 +0100
Message-ID: <1437570255-21049-4-git-send-email-lee.jones@linaro.org>
References: <1437570255-21049-1-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1437570255-21049-1-git-send-email-lee.jones@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, mturquette@linaro.org, kernel@stlinux.com, s.hauer@pengutronix.de, sboyd@codeaurora.org, geert@linux-m68k.org, maxime.ripard@free-electrons.com, Lee Jones <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org

These new API calls will firstly provide a mechanisms to tag a clock as
critical and secondly allow any knowledgeable driver to (un)gate clocks,
even if they are marked as critical.

Suggested-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/clk/clk.c            | 45 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/clk-provider.h |  2 ++
 include/linux/clk.h          | 30 +++++++++++++++++++++++++++++
 3 files changed, 77 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 61c3fc5..486b1da 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -46,6 +46,21 @@ static struct clk_core *clk_core_lookup(const char *name);
 
 /***    private data structures    ***/
 
+/**
+ * struct critical -	Provides 'play' over critical clocks.  A clock can be
+ *			marked as critical, meaning that it should not be
+ *			disabled.  However, if a driver which is aware of the
+ *			critical behaviour wants to control it, it can do so
+ *			using clk_enable_critical() and clk_disable_critical().
+ *
+ * @enabled	Is clock critical?  Once set, doesn't change
+ * @leave_on	Self explanatory.  Can be disabled by knowledgeable drivers
+ */
+struct critical {
+	bool enabled;
+	bool leave_on;
+};
+
 struct clk_core {
 	const char		*name;
 	const struct clk_ops	*ops;
@@ -75,6 +90,7 @@ struct clk_core {
 	struct dentry		*dentry;
 #endif
 	struct kref		ref;
+	struct critical		critical;
 };
 
 struct clk {
@@ -995,6 +1011,10 @@ static void clk_core_disable(struct clk_core *clk)
 	if (WARN_ON(clk->enable_count == 0))
 		return;
 
+	/* Refuse to turn off a critical clock */
+	if (clk->enable_count == 1 && clk->critical.leave_on)
+		return;
+
 	if (--clk->enable_count > 0)
 		return;
 
@@ -1037,6 +1057,13 @@ void clk_disable(struct clk *clk)
 }
 EXPORT_SYMBOL_GPL(clk_disable);
 
+void clk_disable_critical(struct clk *clk)
+{
+	clk->core->critical.leave_on = false;
+	clk_disable(clk);
+}
+EXPORT_SYMBOL_GPL(clk_disable_critical);
+
 static int clk_core_enable(struct clk_core *clk)
 {
 	int ret = 0;
@@ -1100,6 +1127,15 @@ int clk_enable(struct clk *clk)
 }
 EXPORT_SYMBOL_GPL(clk_enable);
 
+int clk_enable_critical(struct clk *clk)
+{
+	if (clk->core->critical.enabled)
+		clk->core->critical.leave_on = true;
+
+	return clk_enable(clk);
+}
+EXPORT_SYMBOL_GPL(clk_enable_critical);
+
 static unsigned long clk_core_round_rate_nolock(struct clk_core *clk,
 						unsigned long rate,
 						unsigned long min_rate,
@@ -2482,6 +2518,15 @@ fail_out:
 }
 EXPORT_SYMBOL_GPL(clk_register);
 
+void clk_init_critical(struct clk *clk)
+{
+	struct critical *critical = &clk->core->critical;
+
+	critical->enabled = true;
+	critical->leave_on = true;
+}
+EXPORT_SYMBOL_GPL(clk_init_critical);
+
 /*
  * Free memory allocated for a clock.
  * Caller must hold prepare_lock.
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 5591ea7..15ef8c9 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -563,6 +563,8 @@ struct clk *devm_clk_register(struct device *dev, struct clk_hw *hw);
 void clk_unregister(struct clk *clk);
 void devm_clk_unregister(struct device *dev, struct clk *clk);
 
+void clk_init_critical(struct clk *clk);
+
 /* helper functions */
 const char *__clk_get_name(struct clk *clk);
 struct clk_hw *__clk_get_hw(struct clk *clk);
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 8381bbf..9807f3b 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -231,6 +231,19 @@ struct clk *devm_clk_get(struct device *dev, const char *id);
 int clk_enable(struct clk *clk);
 
 /**
+ * clk_enable_critical - inform the system when the clock source should be
+ * 			 running, even if clock is critical.
+ * @clk: clock source
+ *
+ * If the clock can not be enabled/disabled, this should return success.
+ *
+ * May be called from atomic contexts.
+ *
+ * Returns success (0) or negative errno.
+ */
+int clk_enable_critical(struct clk *clk);
+
+/**
  * clk_disable - inform the system when the clock source is no longer required.
  * @clk: clock source
  *
@@ -247,6 +260,23 @@ int clk_enable(struct clk *clk);
 void clk_disable(struct clk *clk);
 
 /**
+ * clk_disable_critical - inform the system when the clock source is no
+ * 			  longer required, even if clock is critical.
+ * @clk: clock source
+ *
+ * Inform the system that a clock source is no longer required by
+ * a driver and may be shut down.
+ *
+ * May be called from atomic contexts.
+ *
+ * Implementation detail: if the clock source is shared between
+ * multiple drivers, clk_enable_critical() calls must be balanced
+ * by the same number of clk_disable_critical() calls for the clock
+ * source to be disabled.
+ */
+void clk_disable_critical(struct clk *clk);
+
+/**
  * clk_get_rate - obtain the current clock rate (in Hz) for a clock source.
  *		  This is only valid once the clock source has been enabled.
  * @clk: clock source
-- 
1.9.1
