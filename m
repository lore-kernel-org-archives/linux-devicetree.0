From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH 13/15] of: Add nop implementation of of_get_next_parent()
Date: Fri, 27 Jan 2017 18:03:08 +0200
Message-ID: <1485532990-8431-14-git-send-email-sakari.ailus@linux.intel.com>
References: <1485532990-8431-1-git-send-email-sakari.ailus@linux.intel.com>
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <1485532990-8431-1-git-send-email-sakari.ailus@linux.intel.com>
Sender: linux-acpi-owner@vger.kernel.org
To: linux-acpi@vger.kernel.org, devicetree@vger.kernel.org
Cc: sudeep.holla@arm.com, lorenzo.pieralisi@arm.com, mika.westerberg@linux.intel.com, rafael@kernel.org, mark.rutland@arm.com, broonie@kernel.org, robh@kernel.org, ahs3@redhat.com
List-Id: devicetree@vger.kernel.org

To avoid #ifdefs where the function is used.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/linux/of.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index 16b2054..e0ddb22 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -585,6 +585,12 @@ static inline struct device_node *of_get_parent(const struct device_node *node)
 	return NULL;
 }
 
+static inline struct device_node *of_get_next_parent(
+	const struct device_node *node)
+{
+	return NULL;
+}
+
 static inline struct device_node *of_get_next_child(
 	const struct device_node *node, struct device_node *prev)
 {
-- 
2.7.4

