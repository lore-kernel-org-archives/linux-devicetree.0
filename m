From: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: [RESEND PATCH 1/1] of: Make return types of to_of_node and of_fwnode_handle macros consistent
Date: Thu,  2 Nov 2017 11:59:18 +0200
Message-ID: <20171102095918.7041-1-sakari.ailus@linux.intel.com>
References: <2117711.dO2rQLXOup@avalon>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2117711.dO2rQLXOup@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

(Fixed Mauro's e-mail.)

to_of_node() macro checks whether the fwnode_handle passed to it is not an
OF node, and if so, returns NULL in order to be NULL-safe. Otherwise it
returns the pointer to the OF node which the fwnode_handle contains.

The problem with returning NULL is that its type was void *, which
sometimes matters. Explicitly return struct device_node * instead.

Make a similar change to of_fwnode_handle() as well.

Fixes: d20dc1493db4 ("of: Support const and non-const use for to_of_node()")
Fixes: debd3a3b27c7 ("of: Make of_fwnode_handle() safer")
Signed-off-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
---
Hi Mauro,

Could you check whether this addresses the smatch issue with the xilinx
driver?

Thanks.

 include/linux/of.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/of.h b/include/linux/of.h
index b240ed69dc96..0651231c115e 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -161,7 +161,7 @@ static inline bool is_of_node(const struct fwnode_handle *fwnode)
 		is_of_node(__to_of_node_fwnode) ?			\
 			container_of(__to_of_node_fwnode,		\
 				     struct device_node, fwnode) :	\
-			NULL;						\
+			(struct device_node *)NULL;			\
 	})
 
 #define of_fwnode_handle(node)						\
@@ -169,7 +169,8 @@ static inline bool is_of_node(const struct fwnode_handle *fwnode)
 		typeof(node) __of_fwnode_handle_node = (node);		\
 									\
 		__of_fwnode_handle_node ?				\
-			&__of_fwnode_handle_node->fwnode : NULL;	\
+			&__of_fwnode_handle_node->fwnode :		\
+			(struct fwnode_handle *)NULL;			\
 	})
 
 static inline bool of_have_populated_dt(void)
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
