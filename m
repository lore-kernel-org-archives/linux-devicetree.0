From: Rob Herring <robh@kernel.org>
Subject: [PATCH] of: Add device_type access helper functions
Date: Thu, 30 Aug 2018 13:52:29 -0500
Message-ID: <20180830185229.20393-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

In preparation to remove direct access to device_node.type, add
of_node_is_type() and of_node_get_device_type() helpers to check and
retrieve the device type.

Cc: Frank Rowand <frowand.list@gmail.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 include/linux/of.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index a40f63a36afa..506beca9588d 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -980,6 +980,18 @@ static inline struct device_node *of_find_matching_node(
 	return of_find_matching_node_and_match(from, matches, NULL);
 }
 
+static inline const char *of_node_get_device_type(const struct device_node *np)
+{
+	return of_get_property(np, "type", NULL);
+}
+
+static inline bool of_node_is_type(const struct device_node *np, const char *type)
+{
+	const char *match = of_node_get_device_type(np);
+
+	return np && match && type && !of_prop_cmp(match, type);
+}
+
 /**
  * of_property_count_u8_elems - Count the number of u8 elements in a property
  *
-- 
2.17.1
