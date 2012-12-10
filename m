From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH RFC 07/13] of: Add empty of_get_next_child() function definition
Date: Mon, 10 Dec 2012 20:41:33 +0100
Message-ID: <1355168499-5847-8-git-send-email-s.nawrocki@samsung.com>
References: <1355168499-5847-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1355168499-5847-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: g.liakhovetski@gmx.de, linux-media@vger.kernel.org
Cc: grant.likely@secretlab.ca, rob.herring@calxeda.com, thomas.abraham@linaro.org, t.figa@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: devicetree@vger.kernel.org

Add an empty of_get_next_child() function definition so users can
be build when CONFIG_OF is disabled and are not required to exclude
OF specific parts explicitly with #ifdefs.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 include/linux/of.h |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index 7df42cc..fb92acc 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -335,6 +335,13 @@ static inline bool of_have_populated_dt(void)
 #define for_each_available_child_of_node(parent, child) \
 	while (0)
 
+static inline struct device_node *of_get_next_child(
+					const struct device_node *node,
+					struct device_node *prev)
+{
+	return NULL;
+}
+
 static inline struct device_node *of_get_child_by_name(
 					const struct device_node *node,
 					const char *name)
-- 
1.7.9.5
