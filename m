From: Rob Herring <robherring2@gmail.com>
Subject: [RFC PATCH 2/2] of: add initcall with match boilerplate helpers
Date: Wed, 30 Oct 2013 01:12:51 -0500
Message-ID: <1383113571-13029-3-git-send-email-robherring2@gmail.com>
References: <1383113571-13029-1-git-send-email-robherring2@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1383113571-13029-1-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Grant Likely <grant.likely@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring@calxeda.com>

Add boilerplate helpers to create initcalls which are conditional on
matching on devicetree properties.

Cc: Grant Likely <grant.likely@linaro.org>
Signed-off-by: Rob Herring <rob.herring@calxeda.com>
---
 include/linux/of.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index f95aee3..a1327c9 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -592,6 +592,18 @@ static inline int of_property_read_u32(const struct device_node *np,
 		s;						\
 		s = of_prop_next_string(prop, s))
 
+#define of_initcall_match(__func, __lvl, __match) \
+static int __init __func##_init(void) \
+{ \
+	if (of_find_matching_node(NULL, __match)) \
+		return __func(); \
+	else \
+		return -ENODEV;	\
+} \
+__lvl(__func##_init);
+
+#define of_module_init_match(__func, __match) of_initcall_match(__func, module_init, __match)
+
 #if defined(CONFIG_PROC_FS) && defined(CONFIG_PROC_DEVICETREE)
 extern void proc_device_tree_add_node(struct device_node *, struct proc_dir_entry *);
 extern void proc_device_tree_add_prop(struct proc_dir_entry *pde, struct property *prop);
-- 
1.8.1.2
