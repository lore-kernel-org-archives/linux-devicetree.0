From: Artur Lorincz <larturus2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/1] of: default implementation for of_find_all_nodes(...).
Date: Wed, 22 Mar 2017 17:27:11 +0100
Message-ID: <1490200031-7893-1-git-send-email-larturus2@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, larturus-/E1597aS9LQAvxtiuMwx3w@public.gmane.org, Artur Lorincz <larturus2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Added default implementation for of_find_all_nodes(). This function is
used by board.c from the board module (drivers/staging/board).

Signed-off-by: Artur Lorincz <larturus-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
---
 include/linux/of.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index 21e6323..f1cff92 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -840,6 +840,11 @@ static inline void of_property_clear_flag(struct property *p, unsigned long flag

 #define of_match_ptr(_ptr)	NULL
 #define of_match_node(_matches, _node)	NULL
+
+static inline struct device_node *of_find_all_nodes(struct device_node *prev)
+{
+	return NULL;
+}
 #endif /* CONFIG_OF */

 /* Default string compare functions, Allow arch asm/prom.h to override */
--
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
