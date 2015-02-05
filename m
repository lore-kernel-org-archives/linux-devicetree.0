From: Ray Jui <rjui@broadcom.com>
Subject: [PATCH v5 1/6] clk: add of_clk_get_parent_rate function
Date: Wed, 4 Feb 2015 16:55:00 -0800
Message-ID: <1423097705-22939-2-git-send-email-rjui@broadcom.com>
References: <Ray Jui <rjui@broadcom.com>
 <1423097705-22939-1-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423097705-22939-1-git-send-email-rjui@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Matt Porter <mporter@linaro.org>, Alex Elder <elder@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Scott Branden <sbranden@broadcom.com>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazau <anatol@google.com>, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>
List-Id: devicetree@vger.kernel.org

Sometimes a clock needs to know the rate of its parent before itself is
registered to the framework. An example is that a PLL may need to
initialize itself to a specific VCO frequency, before registering to the
framework. The parent rate needs to be known, for PLL multipliers and
divisors to be configured properly.

Introduce helper function of_clk_get_parent_rate, which can be used to
obtain the parent rate of a clock, given a device node and index.

Signed-off-by: Ray Jui <rjui@broadcom.com>
---
 drivers/clk/clk.c            |   17 +++++++++++++++++
 include/linux/clk-provider.h |    6 +++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index d48ac71..e1893a2 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2581,6 +2581,23 @@ const char *of_clk_get_parent_name(struct device_node *np, int index)
 }
 EXPORT_SYMBOL_GPL(of_clk_get_parent_name);
 
+unsigned long of_clk_get_parent_rate(struct device_node *np, int index)
+{
+	const char *parent_name;
+	struct clk *parent_clk;
+
+	parent_name = of_clk_get_parent_name(np, index);
+	if (!parent_name)
+		return 0;
+
+	parent_clk = __clk_lookup(parent_name);
+	if (!parent_clk)
+		return 0;
+
+	return clk_get_rate(parent_clk);
+}
+EXPORT_SYMBOL_GPL(of_clk_get_parent_rate);
+
 struct clock_provider {
 	of_clk_init_cb_t clk_init_cb;
 	struct device_node *np;
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index d936409..e1e2d95 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -585,7 +585,7 @@ struct clk *of_clk_src_simple_get(struct of_phandle_args *clkspec,
 struct clk *of_clk_src_onecell_get(struct of_phandle_args *clkspec, void *data);
 int of_clk_get_parent_count(struct device_node *np);
 const char *of_clk_get_parent_name(struct device_node *np, int index);
-
+unsigned long of_clk_get_parent_rate(struct device_node *np, int index);
 void of_clk_init(const struct of_device_id *matches);
 
 #else /* !CONFIG_OF */
@@ -614,6 +614,10 @@ static inline const char *of_clk_get_parent_name(struct device_node *np,
 {
 	return NULL;
 }
+static unsigned long of_clk_get_parent_rate(struct device_node *np, int index)
+{
+	return 0;
+}
 #define of_clk_init(matches) \
 	{ while (0); }
 #endif /* CONFIG_OF */
-- 
1.7.9.5
