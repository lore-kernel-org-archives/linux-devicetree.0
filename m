From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] [net-next?] of: add of_property_read_variable_* dummy helpers
Date: Mon,  6 Nov 2017 14:26:10 +0100
Message-ID: <20171106132627.150459-1-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vivien Didelot <vivien.didelot@savoirfairelinux.com>, "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: netdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, Grant Likely <grant.likely@secretlab.ca>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Commit a67e9472da42 ("of: Add array read functions with min/max size
limits") added a new interface for reading variable-length arrays from
DT properties. One user was added in dsa recently and this causes a
build error because that code can be built with CONFIG_OF disabled:

net/dsa/dsa2.c: In function 'dsa_switch_parse_member_of':
net/dsa/dsa2.c:678:7: error: implicit declaration of function 'of_property_read_variable_u32_array'; did you mean 'of_property_read_u32_array'? [-Werror=implicit-function-declaration]

This adds a dummy functions for of_property_read_variable_u32_array()
and a few others that had been missing here. I decided to move
of_property_read_string() and of_property_read_string_helper() in the
process to make it easier to compare the two sets of function prototypes
to make sure they match.

Fixes: 975e6e32215e ("net: dsa: rework switch parsing")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
DT maintainers: there is currently a build break in the net-next tree
(from branch "dsa-parsing-stage") because of this, I think the best
way forward would be to get an Ack for this patch to get picked up
through the netdev trees.
---
 include/linux/of.h | 62 +++++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 50 insertions(+), 12 deletions(-)

diff --git a/include/linux/of.h b/include/linux/of.h
index 43b5034c6a1e..d3dea1d1e3a9 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -681,12 +681,6 @@ static inline int of_property_count_elems_of_size(const struct device_node *np,
 	return -ENOSYS;
 }
 
-static inline int of_property_read_u32_index(const struct device_node *np,
-			const char *propname, u32 index, u32 *out_value)
-{
-	return -ENOSYS;
-}
-
 static inline int of_property_read_u8_array(const struct device_node *np,
 			const char *propname, u8 *out_values, size_t sz)
 {
@@ -713,16 +707,14 @@ static inline int of_property_read_u64_array(const struct device_node *np,
 	return -ENOSYS;
 }
 
-static inline int of_property_read_string(const struct device_node *np,
-					  const char *propname,
-					  const char **out_string)
+static inline int of_property_read_u32_index(const struct device_node *np,
+			const char *propname, u32 index, u32 *out_value)
 {
 	return -ENOSYS;
 }
 
-static inline int of_property_read_string_helper(const struct device_node *np,
-						 const char *propname,
-						 const char **out_strs, size_t sz, int index)
+static inline int of_property_read_u64_index(const struct device_node *np,
+			const char *propname, u32 index, u64 *out_value)
 {
 	return -ENOSYS;
 }
@@ -750,12 +742,51 @@ static inline int of_n_size_cells(struct device_node *np)
 	return 0;
 }
 
+static inline int of_property_read_variable_u8_array(const struct device_node *np,
+					const char *propname, u8 *out_values,
+					size_t sz_min, size_t sz_max)
+{
+	return -ENOSYS;
+}
+
+static inline int of_property_read_variable_u16_array(const struct device_node *np,
+					const char *propname, u16 *out_values,
+					size_t sz_min, size_t sz_max)
+{
+	return -ENOSYS;
+}
+
+static inline int of_property_read_variable_u32_array(const struct device_node *np,
+					const char *propname,
+					u32 *out_values,
+					size_t sz_min,
+					size_t sz_max)
+{
+	return -ENOSYS;
+}
+
 static inline int of_property_read_u64(const struct device_node *np,
 				       const char *propname, u64 *out_value)
 {
 	return -ENOSYS;
 }
 
+static inline int of_property_read_variable_u64_array(const struct device_node *np,
+					const char *propname,
+					u64 *out_values,
+					size_t sz_min,
+					size_t sz_max)
+{
+	return -ENOSYS;
+}
+
+static inline int of_property_read_string(const struct device_node *np,
+					  const char *propname,
+					  const char **out_string)
+{
+	return -ENOSYS;
+}
+
 static inline int of_property_match_string(const struct device_node *np,
 					   const char *propname,
 					   const char *string)
@@ -763,6 +794,13 @@ static inline int of_property_match_string(const struct device_node *np,
 	return -ENOSYS;
 }
 
+static inline int of_property_read_string_helper(const struct device_node *np,
+						 const char *propname,
+						 const char **out_strs, size_t sz, int index)
+{
+	return -ENOSYS;
+}
+
 static inline struct device_node *of_parse_phandle(const struct device_node *np,
 						   const char *phandle_name,
 						   int index)
-- 
2.9.0
