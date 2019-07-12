From: Saravana Kannan <saravanak@google.com>
Subject: [PATCH v5 07/11] of/platform: Sanity check DT bindings before
 creating device links
Date: Fri, 12 Jul 2019 16:52:40 -0700
Message-ID: <20190712235245.202558-8-saravanak@google.com>
References: <20190712235245.202558-1-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190712235245.202558-1-saravanak@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, David Collins <collinsd@codeaurora.org>, kernel-team@android.com
List-Id: devicetree@vger.kernel.org

If a common DT binding is pointing to a child DT node of a particular
parent DT node, don't add device links for such DT references. This is
because, by definition, a child node can't be a functional dependency for
the parent node.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/of/platform.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index dba962a0ee50..98414ba53b1f 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -512,6 +512,19 @@ int of_platform_default_populate(struct device_node *root,
 }
 EXPORT_SYMBOL_GPL(of_platform_default_populate);
 
+bool of_link_is_valid(struct device_node *con, struct device_node *sup)
+{
+	of_node_get(sup);
+	while (sup) {
+		if (sup == con) {
+			of_node_put(sup);
+			return false;
+		}
+		sup = of_get_next_parent(sup);
+	}
+	return true;
+}
+
 static int of_link_binding(struct device *dev,
 			   const char *binding, const char *cell)
 {
@@ -522,6 +535,10 @@ static int of_link_binding(struct device *dev,
 
 	while (!of_parse_phandle_with_args(dev->of_node, binding, cell, i,
 					   &sup_args)) {
+		if (!of_link_is_valid(dev->of_node, sup_args.np)) {
+			of_node_put(sup_args.np);
+			continue;
+		}
 		i++;
 		sup_dev = of_find_device_by_node(sup_args.np);
 		of_node_put(sup_args.np);
-- 
2.22.0.510.g264f2c817a-goog
