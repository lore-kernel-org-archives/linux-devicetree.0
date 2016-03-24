From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: [PATCH v3 05/16] ARM: davinci: add set_parent callback for mux clocks
Date: Thu, 24 Mar 2016 18:51:30 -0500
Message-ID: <1458863503-31121-6-git-send-email-david@lechnology.com>
References: <1458863503-31121-1-git-send-email-david@lechnology.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458863503-31121-1-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, David.Laight-ZS65k/vG3HxXrIkS9f7CXA@public.gmane.org, David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:USB SUBSYSTEM" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Introduce a set_parent callback that will be used for mux clocks, such as
the USB PHY muxes and the async3 clock domain mux.

Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
---

v3 changes: none.


 arch/arm/mach-davinci/clock.c | 17 ++++++++++++++++-
 arch/arm/mach-davinci/clock.h |  1 +
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-davinci/clock.c b/arch/arm/mach-davinci/clock.c
index a5c2629..dfc2eb3 100644
--- a/arch/arm/mach-davinci/clock.c
+++ b/arch/arm/mach-davinci/clock.c
@@ -195,6 +195,13 @@ int clk_set_parent(struct clk *clk, struct clk *parent)
 		return -EINVAL;
 
 	mutex_lock(&clocks_mutex);
+	if (clk->set_parent) {
+		int ret = clk->set_parent(clk, parent);
+		if (ret) {
+			mutex_unlock(&clocks_mutex);
+			return ret;
+		}
+	}
 	clk->parent = parent;
 	list_del_init(&clk->childnode);
 	list_add(&clk->childnode, &clk->parent->children);
@@ -224,8 +231,16 @@ int clk_register(struct clk *clk)
 
 	mutex_lock(&clocks_mutex);
 	list_add_tail(&clk->node, &clocks);
-	if (clk->parent)
+	if (clk->parent) {
+		if (clk->set_parent) {
+			int ret = clk->set_parent(clk, clk->parent);
+			if (ret) {
+				mutex_unlock(&clocks_mutex);
+				return ret;
+			}
+		}
 		list_add_tail(&clk->childnode, &clk->parent->children);
+	}
 	mutex_unlock(&clocks_mutex);
 
 	/* If rate is already set, use it */
diff --git a/arch/arm/mach-davinci/clock.h b/arch/arm/mach-davinci/clock.h
index 8b0fbbe..96a591f 100644
--- a/arch/arm/mach-davinci/clock.h
+++ b/arch/arm/mach-davinci/clock.h
@@ -106,6 +106,7 @@ struct clk {
 	int (*reset) (struct clk *clk, bool reset);
 	void (*clk_enable) (struct clk *clk);
 	void (*clk_disable) (struct clk *clk);
+	int (*set_parent) (struct clk *clk, struct clk *parent);
 };
 
 /* Clock flags: SoC-specific flags start at BIT(16) */
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
