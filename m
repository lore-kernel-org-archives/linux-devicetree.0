From: Saravana Kannan <saravanak@google.com>
Subject: [PATCH v1 1/3] of: property: Minor code formatting/style clean ups
Date: Fri, 11 Oct 2019 12:15:19 -0700
Message-ID: <20191011191521.179614-2-saravanak@google.com>
References: <20191011191521.179614-1-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191011191521.179614-1-saravanak@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>, kernel-team@android.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Better variable and function names. Remove "," after the sentinel in an
array initialization list.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/of/property.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 923d6f88a99c..6f6e1d9644cf 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1147,11 +1147,11 @@ struct supplier_bindings {
 					  const char *prop_name, int index);
 };
 
-static const struct supplier_bindings bindings[] = {
+static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_clocks, },
 	{ .parse_prop = parse_interconnects, },
 	{ .parse_prop = parse_regulators, },
-	{},
+	{}
 };
 
 /**
@@ -1177,7 +1177,7 @@ static int of_link_property(struct device *dev, struct device_node *con_np,
 			     const char *prop_name)
 {
 	struct device_node *phandle;
-	const struct supplier_bindings *s = bindings;
+	const struct supplier_bindings *s = of_supplier_bindings;
 	unsigned int i = 0;
 	bool matched = false;
 	int ret = 0;
@@ -1196,7 +1196,7 @@ static int of_link_property(struct device *dev, struct device_node *con_np,
 	return ret;
 }
 
-static int __of_link_to_suppliers(struct device *dev,
+static int of_link_to_suppliers(struct device *dev,
 				  struct device_node *con_np)
 {
 	struct device_node *child;
@@ -1208,7 +1208,7 @@ static int __of_link_to_suppliers(struct device *dev,
 			ret = -EAGAIN;
 
 	for_each_child_of_node(con_np, child)
-		if (__of_link_to_suppliers(dev, child))
+		if (of_link_to_suppliers(dev, child))
 			ret = -EAGAIN;
 
 	return ret;
@@ -1226,7 +1226,7 @@ static int of_fwnode_add_links(const struct fwnode_handle *fwnode,
 	if (unlikely(!is_of_node(fwnode)))
 		return 0;
 
-	return __of_link_to_suppliers(dev, to_of_node(fwnode));
+	return of_link_to_suppliers(dev, to_of_node(fwnode));
 }
 
 const struct fwnode_operations of_fwnode_ops = {
-- 
2.23.0.700.g56cf767bdb-goog
