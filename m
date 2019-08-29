From: Saravana Kannan <saravanak@google.com>
Subject: [PATCH v10 7/7] of: property: Add "depends-on" parsing support to of_fwnode_add_links()
Date: Thu, 29 Aug 2019 00:46:03 -0700
Message-ID: <20190829074603.70424-8-saravanak@google.com>
References: <20190829074603.70424-1-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190829074603.70424-1-saravanak@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Len Brown <lenb@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-acpi@vger.kernel.org, clang-built-linux@googlegroups.com, David Collins <collinsd@codeaurora.org>, kernel-team@android.com
List-Id: devicetree@vger.kernel.org

If dependencies inferred by of_fwnode_add_links() result in a cycle, it
can prevent the probing of all the devices in the cycle. The depends-on
property has been added to explicitly override inferred dependencies
when they create a cycle.

Add depends-on parsing support to of_fwnode_add_links() so that
platforms with cyclic dependencies can use "depends-on" to break the
cycle and continue successfully probing devices.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/of/property.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 420c2d428184..78a262e24686 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1106,6 +1106,12 @@ static struct device_node *parse_interconnects(struct device_node *np,
 				"#interconnect-cells");
 }
 
+static struct device_node *parse_depends_on(struct device_node *np,
+					    const char *prop_name, int index)
+{
+	return parse_prop_cells(np, prop_name, index, "depends-on", NULL);
+}
+
 static int strcmp_suffix(const char *str, const char *suffix)
 {
 	unsigned int len, suffix_len;
@@ -1151,6 +1157,7 @@ static const struct supplier_bindings bindings[] = {
 	{ .parse_prop = parse_clocks, },
 	{ .parse_prop = parse_interconnects, },
 	{ .parse_prop = parse_regulators, },
+	{ .parse_prop = parse_depends_on, },
 	{},
 };
 
@@ -1203,6 +1210,12 @@ static int __of_link_to_suppliers(struct device *dev,
 	struct property *p;
 	int ret = 0;
 
+	if (of_find_property(con_np, "depends-on", NULL)) {
+		if (of_link_property(dev, con_np, "depends-on"))
+			ret = -EAGAIN;
+		return ret;
+	}
+
 	for_each_property_of_node(con_np, p)
 		if (of_link_property(dev, con_np, p->name))
 			ret = -EAGAIN;
-- 
2.23.0.187.g17f5b7556c-goog
