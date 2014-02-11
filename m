From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH] of: Turn of_match_node into a static inline when CONFIG_OF isn't set
Date: Tue, 11 Feb 2014 13:36:51 +0100
Message-ID: <1392122211-11422-1-git-send-email-laurent.pinchart@ideasonboard.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

when CONFIG_OF is disabled of_match_node is defined as a macro that
evaluates to NULL. This breaks compilation of drivers that dereference
the function's return value directly. Fix it by turning the macro into a
static inline function that returns NULL.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 include/linux/of.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/linux/of.h b/include/linux/of.h
index 70c64ba..719e69f 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -560,7 +560,13 @@ static inline const char *of_prop_next_string(struct property *prop,
 }
 
 #define of_match_ptr(_ptr)	NULL
-#define of_match_node(_matches, _node)	NULL
+
+static inline const struct of_device_id *of_match_node(
+	const struct of_device_id *matches, const struct device_node *node)
+{
+	return NULL;
+}
+
 #endif /* CONFIG_OF */
 
 #if defined(CONFIG_OF) && defined(CONFIG_NUMA)
-- 
Regards,

Laurent Pinchart
