From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] dt: add helper functions to read u32 and string property
	values
Date: Thu, 30 Jun 2011 21:26:10 +0530
Message-ID: <1309449370-9554-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add helper functions to retrive unsigned integer and string property values from
properties of a device node. These helper functions can be used to lookup a
property in a device node, perform error checking and read the property value.

[grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org: Proposal and initial implementation]
Signed-off-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/of/base.c  |   59 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/of.h |    4 +++
 2 files changed, 63 insertions(+), 0 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 632ebae..4823b53 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -596,6 +596,65 @@ struct device_node *of_find_node_by_phandle(phandle handle)
 EXPORT_SYMBOL(of_find_node_by_phandle);
 
 /**
+ * of_property_read_u32 - Find a property in a device node and read the
+ *				32-bit property value
+ * @np:		device node from which the property value is to be read.
+ * @propname:	name of the property to be searched.
+ * @out_value:	returned value, valid if return value is 0.
+ *
+ * Search for a property in a device node and read a 32-bit value from a
+ * property. Returns -EINVAL, if the property does not exist, -ENODATA, if
+ * property does not have a value, -EOVERFLOW, if the property data isn't
+ * large enough, and 0 on success.
+ *
+ * The out_value is modified only if a valid u32 value can be decoded.
+ */
+int of_property_read_u32(struct device_node *np, char *propname, u32 *out_value)
+{
+	struct property *prop = of_find_property(np, propname, NULL);
+
+	if (!prop)
+		return -EINVAL;
+	if (!prop->value)
+		return -ENODATA;
+	if (sizeof(*out_value) > prop->length)
+		return -EOVERFLOW;
+	*out_value = be32_to_cpup(prop->value);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_property_read_u32);
+
+/**
+ * of_property_read_string - Find a property in a device node and return a
+ *				pointer to the property string value.
+ * @np:		device node from which the property value is to be read.
+ * @propname:	name of the property to be searched.
+ * @out_string:	pointer to a null terminated string, valid only if the return
+ *		value is 0.
+ *
+ * Returns a pointer to a null terminated property value string. Returns
+ * -EINVAL, if the property does not exist, -ENODATA, if property does not have
+ * a value, -EILSEQ, if the string is not null-terminated within the length of
+ * the property value, and 0 on success.
+ *
+ * The out_string value is modified only if a valid string can be decoded.
+ */
+int of_property_read_string(struct device_node *np, char *propname,
+				char **out_string)
+{
+	struct property *prop = of_find_property(np, propname, NULL);
+	if (!prop)
+		return -EINVAL;
+	if (!prop->value)
+		return -ENODATA;
+	if (strnlen(prop->value, prop->length) == prop->length)
+		return -EILSEQ;
+	*out_string = prop->value;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_property_read_string);
+
+/**
  * of_parse_phandle - Resolve a phandle property to a device_node pointer
  * @np: Pointer to device node holding phandle property
  * @phandle_name: Name of property holding a phandle value
diff --git a/include/linux/of.h b/include/linux/of.h
index bfc0ed1..4fc4c1b 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -195,6 +195,10 @@ extern struct device_node *of_find_node_with_property(
 extern struct property *of_find_property(const struct device_node *np,
 					 const char *name,
 					 int *lenp);
+extern int of_property_read_u32(struct device_node *np, char *propname,
+					u32 *out_value);
+extern int of_property_read_string(struct device_node *np, char *propname,
+					char **out_string);
 extern int of_device_is_compatible(const struct device_node *device,
 				   const char *);
 extern int of_device_is_available(const struct device_node *device);
-- 
1.6.6.rc2
