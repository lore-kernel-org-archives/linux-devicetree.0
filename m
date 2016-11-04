From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 2/2] of: changesets: Introduce changeset helper methods
Date: Fri,  4 Nov 2016 15:42:41 +0100
Message-ID: <20161104144241.18002-2-hdegoede@redhat.com>
References: <20161104144241.18002-1-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161104144241.18002-1-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>

Changesets are very powerful, but the lack of a helper API
makes using them cumbersome. Introduce a simple copy based
API that makes things considerably easier.

To wit, adding a property using the raw API.

	struct property *prop;
	prop = kzalloc(sizeof(*prop)), GFP_KERNEL);
	prop->name = kstrdup("compatible");
	prop->value = kstrdup("foo,bar");
	prop->length = strlen(prop->value) + 1;
	of_changeset_add_property(ocs, np, prop);

while using the helper API

	of_changeset_add_property_string(ocs, np, "compatible",
			"foo,bar");

Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
Changes in v2 (hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org):
-Address review comments from:
 https://www.spinics.net/lists/kernel/msg2252845.html
 -Simplify (and fix) __of_changeset_add_update_property_copy OOM handling
 -Remove (by manual inlining) these 2 static helpers:
  __of_changeset_add_update_property_u32
  __of_changeset_add_update_property_bool
 -Remove the following exported helper method:
  of_changeset_node_move_to
---
 drivers/of/dynamic.c | 428 +++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/of.h   | 135 ++++++++++++++++
 2 files changed, 563 insertions(+)

diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index cc64675..d0b473b 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -830,3 +830,431 @@ int of_changeset_action(struct of_changeset *ocs, unsigned long action,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(of_changeset_action);
+
+/* changeset helpers */
+
+/**
+ * of_changeset_create_device_node - Create an empty device node
+ *
+ * @ocs:	changeset pointer
+ * @parent:	parent device node
+ * @fmt:	format string for the node's full_name
+ * @args:	argument list for the format string
+ *
+ * Create an empty device node, marking it as detached and allocated.
+ *
+ * Returns a device node on success, an error encoded pointer otherwise
+ */
+struct device_node *of_changeset_create_device_nodev(
+	struct of_changeset *ocs, struct device_node *parent,
+	const char *fmt, va_list vargs)
+{
+	struct device_node *node;
+
+	node = __of_node_dupv(NULL, fmt, vargs);
+	if (!node)
+		return ERR_PTR(-ENOMEM);
+
+	node->parent = parent;
+	return node;
+}
+EXPORT_SYMBOL_GPL(of_changeset_create_device_nodev);
+
+/**
+ * of_changeset_create_device_node - Create an empty device node
+ *
+ * @ocs:	changeset pointer
+ * @parent:	parent device node
+ * @fmt:	Format string for the node's full_name
+ * ...		Arguments
+ *
+ * Create an empty device node, marking it as detached and allocated.
+ *
+ * Returns a device node on success, an error encoded pointer otherwise
+ */
+struct device_node *of_changeset_create_device_node(
+	struct of_changeset *ocs, struct device_node *parent,
+	const char *fmt, ...)
+{
+	va_list vargs;
+	struct device_node *node;
+
+	va_start(vargs, fmt);
+	node = of_changeset_create_device_nodev(ocs, parent, fmt, vargs);
+	va_end(vargs);
+	return node;
+}
+EXPORT_SYMBOL_GPL(of_changeset_create_device_node);
+
+static int __of_changeset_add_update_property_copy(struct of_changeset *ocs,
+		struct device_node *np, const char *name, const void *value,
+		int length, bool update)
+{
+	struct property *prop;
+	int ret = -ENOMEM;
+
+	prop = kzalloc(sizeof(*prop), GFP_KERNEL);
+	if (!prop)
+		return ret;
+
+	prop->name = kstrdup(name, GFP_KERNEL);
+	if (!prop->name)
+		goto out;
+
+	/*
+	 * NOTE: There is no check for zero length value.
+	 * In case of a boolean property, this will allocate a value
+	 * of zero bytes. We do this to work around the use
+	 * of of_get_property() calls on boolean values.
+	 */
+	prop->value = kmemdup(value, length, GFP_KERNEL);
+	if (!prop->value)
+		goto out;
+
+	of_property_set_flag(prop, OF_DYNAMIC);
+	prop->length = length;
+
+	if (!update)
+		ret = of_changeset_add_property(ocs, np, prop);
+	else
+		ret = of_changeset_update_property(ocs, np, prop);
+
+	if (ret == 0)
+		return 0;
+
+out:
+	kfree(prop->value);
+	kfree(prop->name);
+	kfree(prop);
+	return ret;
+}
+
+static int __of_changeset_add_update_property_string(struct of_changeset *ocs,
+		struct device_node *np, const char *name, const char *str,
+		bool update)
+{
+	return __of_changeset_add_update_property_copy(ocs, np, name, str,
+			strlen(str) + 1, update);
+}
+
+static int __of_changeset_add_update_property_stringv(struct of_changeset *ocs,
+		struct device_node *np, const char *name,
+		const char *fmt, va_list vargs, bool update)
+{
+	char *str;
+	int ret;
+
+	str = kvasprintf(GFP_KERNEL, fmt, vargs);
+	if (!str)
+		return -ENOMEM;
+
+	ret = __of_changeset_add_update_property_string(ocs, np, name, str, update);
+
+	kfree(str);
+
+	return ret;
+}
+
+static int __of_changeset_add_update_property_string_list(
+		struct of_changeset *ocs, struct device_node *np, const char *name,
+		const char **strs, int count, bool update)
+{
+	int total = 0, i, ret;
+	char *value, *s;
+
+	for (i = 0; i < count; i++) {
+		/* check if  it's NULL */
+		if (!strs[i])
+			return -EINVAL;
+		total += strlen(strs[i]) + 1;
+	}
+
+	value = kmalloc(total, GFP_KERNEL);
+	if (!value)
+		return -ENOMEM;
+
+	for (i = 0, s = value; i < count; i++) {
+		/* no need to check for NULL, check above */
+		strcpy(s, strs[i]);
+		s += strlen(strs[i]) + 1;
+	}
+
+	ret = __of_changeset_add_update_property_copy(ocs, np, name, value,
+			total, update);
+
+	kfree(value);
+
+	return ret;
+}
+
+/**
+ * of_changeset_add_property_copy - Create a new property copying name & value
+ *
+ * @ocs:	changeset pointer
+ * @np:		device node pointer
+ * @name:	name of the property
+ * @value:	pointer to the value data
+ * @length:	length of the value in bytes
+ *
+ * Adds a property to the changeset by making copies of the name & value
+ * entries.
+ *
+ * Returns zero on success, a negative error value otherwise.
+ */
+int of_changeset_add_property_copy(struct of_changeset *ocs,
+		struct device_node *np, const char *name, const void *value,
+		int length)
+{
+	return __of_changeset_add_update_property_copy(ocs, np, name, value,
+			length, false);
+}
+EXPORT_SYMBOL_GPL(of_changeset_add_property_copy);
+
+/**
+ * of_changeset_add_property_string - Create a new string property
+ *
+ * @ocs:	changeset pointer
+ * @np:		device node pointer
+ * @name:	name of the property
+ * @str:	string property
+ *
+ * Adds a string property to the changeset by making copies of the name
+ * and the string value.
+ *
+ * Returns zero on success, a negative error value otherwise.
+ */
+int of_changeset_add_property_string(struct of_changeset *ocs,
+		struct device_node *np, const char *name, const char *str)
+{
+	return __of_changeset_add_update_property_string(ocs, np, name, str,
+			false);
+}
+EXPORT_SYMBOL_GPL(of_changeset_add_property_string);
+
+/**
+ * of_changeset_add_property_stringf - Create a new formatted string property
+ *
+ * @ocs:	changeset pointer
+ * @np:		device node pointer
+ * @name:	name of the property
+ * @fmt:	format of string property
+ * ...		arguments of the format string
+ *
+ * Adds a string property to the changeset by making copies of the name
+ * and the formatted value.
+ *
+ * Returns zero on success, a negative error value otherwise.
+ */
+int of_changeset_add_property_stringf(struct of_changeset *ocs,
+		struct device_node *np, const char *name, const char *fmt, ...)
+{
+	va_list vargs;
+	int ret;
+
+	va_start(vargs, fmt);
+	ret = __of_changeset_add_update_property_stringv(ocs, np, name, fmt,
+			vargs, false);
+	va_end(vargs);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(of_changeset_add_property_stringf);
+
+/**
+ * of_changeset_add_property_string_list - Create a new string list property
+ *
+ * @ocs:	changeset pointer
+ * @np:		device node pointer
+ * @name:	name of the property
+ * @strs:	pointer to the string list
+ * @count:	string count
+ *
+ * Adds a string list property to the changeset.
+ *
+ * Returns zero on success, a negative error value otherwise.
+ */
+int of_changeset_add_property_string_list(struct of_changeset *ocs,
+		struct device_node *np, const char *name, const char **strs,
+		int count)
+{
+	return __of_changeset_add_update_property_string_list(ocs, np, name,
+			strs, count, false);
+}
+EXPORT_SYMBOL_GPL(of_changeset_add_property_string_list);
+
+/**
+ * of_changeset_add_property_u32 - Create a new u32 property
+ *
+ * @ocs:	changeset pointer
+ * @np:		device node pointer
+ * @name:	name of the property
+ * @val:	value in host endian format
+ *
+ * Adds a u32 property to the changeset.
+ *
+ * Returns zero on success, a negative error value otherwise.
+ */
+int of_changeset_add_property_u32(struct of_changeset *ocs,
+		struct device_node *np, const char *name, u32 val)
+{
+	__be32 _val = cpu_to_be32(val);
+	return __of_changeset_add_update_property_copy(ocs, np, name, &_val,
+			sizeof(_val), false);
+}
+EXPORT_SYMBOL_GPL(of_changeset_add_property_u32);
+
+/**
+ * of_changeset_add_property_bool - Create a new u32 property
+ *
+ * @ocs:	changeset pointer
+ * @np:		device node pointer
+ * @name:	name of the property
+ *
+ * Adds a bool property to the changeset. Note that there is
+ * no option to set the value to false, since the property
+ * existing sets it to true.
+ *
+ * Returns zero on success, a negative error value otherwise.
+ */
+int of_changeset_add_property_bool(struct of_changeset *ocs,
+		struct device_node *np, const char *name)
+{
+	return __of_changeset_add_update_property_copy(ocs, np, name, "", 0,
+			false);
+}
+EXPORT_SYMBOL_GPL(of_changeset_add_property_bool);
+
+/**
+ * of_changeset_update_property_copy - Update a property copying name & value
+ *
+ * @ocs:	changeset pointer
+ * @np:		device node pointer
+ * @name:	name of the property
+ * @value:	pointer to the value data
+ * @length:	length of the value in bytes
+ *
+ * Update a property to the changeset by making copies of the name & value
+ * entries.
+ *
+ * Returns zero on success, a negative error value otherwise.
+ */
+int of_changeset_update_property_copy(struct of_changeset *ocs,
+		struct device_node *np, const char *name, const void *value,
+		int length)
+{
+	return __of_changeset_add_update_property_copy(ocs, np, name, value,
+			length, true);
+}
+EXPORT_SYMBOL_GPL(of_changeset_update_property_copy);
+
+/**
+ * of_changeset_update_property_string - Create a new string property
+ *
+ * @ocs:	changeset pointer
+ * @np:		device node pointer
+ * @name:	name of the property
+ * @str:	string property
+ *
+ * Updates a string property to the changeset by making copies of the name
+ * and the string value.
+ *
+ * Returns zero on success, a negative error value otherwise.
+ */
+int of_changeset_update_property_string(struct of_changeset *ocs,
+		struct device_node *np, const char *name, const char *str)
+{
+	return __of_changeset_add_update_property_string(ocs, np, name, str,
+			true);
+}
+EXPORT_SYMBOL_GPL(of_changeset_update_property_string);
+
+/**
+ * of_changeset_update_property_stringf - Update formatted string property
+ *
+ * @ocs:	changeset pointer
+ * @np:		device node pointer
+ * @name:	name of the property
+ * @fmt:	format of string property
+ * ...		arguments of the format string
+ *
+ * Updates a string property to the changeset by making copies of the name
+ * and the formatted value.
+ *
+ * Returns zero on success, a negative error value otherwise.
+ */
+int of_changeset_update_property_stringf(struct of_changeset *ocs,
+		struct device_node *np, const char *name, const char *fmt, ...)
+{
+	va_list vargs;
+	int ret;
+
+	va_start(vargs, fmt);
+	ret = __of_changeset_add_update_property_stringv(ocs, np, name, fmt,
+			vargs, true);
+	va_end(vargs);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(of_changeset_update_property_stringf);
+
+/**
+ * of_changeset_update_property_string_list - Update string list property
+ *
+ * @ocs:	changeset pointer
+ * @np:		device node pointer
+ * @name:	name of the property
+ * @strs:	pointer to the string list
+ * @count:	string count
+ *
+ * Updates a string list property to the changeset.
+ *
+ * Returns zero on success, a negative error value otherwise.
+ */
+int of_changeset_update_property_string_list(struct of_changeset *ocs,
+		struct device_node *np, const char *name, const char **strs,
+		int count)
+{
+	return __of_changeset_add_update_property_string_list(ocs, np, name,
+			strs, count, true);
+}
+EXPORT_SYMBOL_GPL(of_changeset_update_property_string_list);
+
+/**
+ * of_changeset_update_property_u32 - Update u32 property
+ *
+ * @ocs:	changeset pointer
+ * @np:		device node pointer
+ * @name:	name of the property
+ * @val:	value in host endian format
+ *
+ * Updates a u32 property to the changeset.
+ *
+ * Returns zero on success, a negative error value otherwise.
+ */
+int of_changeset_update_property_u32(struct of_changeset *ocs,
+		struct device_node *np, const char *name, u32 val)
+{
+	__be32 _val = cpu_to_be32(val);
+	return __of_changeset_add_update_property_copy(ocs, np, name, &_val,
+			sizeof(_val), true);
+}
+EXPORT_SYMBOL_GPL(of_changeset_update_property_u32);
+
+/**
+ * of_changeset_update_property_bool - Update a bool property
+ *
+ * @ocs:	changeset pointer
+ * @np:		device node pointer
+ * @name:	name of the property
+ *
+ * Updates a property to the changeset. Note that there is
+ * no option to set the value to false, since the property
+ * existing sets it to true.
+ *
+ * Returns zero on success, a negative error value otherwise.
+ */
+int of_changeset_update_property_bool(struct of_changeset *ocs,
+		struct device_node *np, const char *name)
+{
+	return __of_changeset_add_update_property_copy(ocs, np, name, "", 0,
+			true);
+}
+EXPORT_SYMBOL_GPL(of_changeset_update_property_bool);
diff --git a/include/linux/of.h b/include/linux/of.h
index 299aeb1..9c80457 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1227,6 +1227,40 @@ static inline int of_changeset_update_property(struct of_changeset *ocs,
 {
 	return of_changeset_action(ocs, OF_RECONFIG_UPDATE_PROPERTY, np, prop);
 }
+
+struct device_node *of_changeset_create_device_nodev(
+	struct of_changeset *ocs, struct device_node *parent,
+	const char *fmt, va_list vargs);
+__printf(3, 4) struct device_node *of_changeset_create_device_node(
+	struct of_changeset *ocs, struct device_node *parent,
+	const char *fmt, ...);
+int of_changeset_add_property_copy(struct of_changeset *ocs,
+	struct device_node *np, const char *name,
+	const void *value, int length);
+int of_changeset_add_property_string(struct of_changeset *ocs,
+	struct device_node *np, const char *name, const char *str);
+__printf(4, 5) int of_changeset_add_property_stringf(struct of_changeset *ocs,
+		struct device_node *np, const char *name, const char *fmt, ...);
+int of_changeset_add_property_string_list(struct of_changeset *ocs,
+	struct device_node *np, const char *name, const char **strs, int count);
+int of_changeset_add_property_u32(struct of_changeset *ocs,
+	struct device_node *np, const char *name, u32 val);
+int of_changeset_add_property_bool(struct of_changeset *ocs,
+	struct device_node *np, const char *name);
+int of_changeset_update_property_copy(struct of_changeset *ocs,
+	struct device_node *np, const char *name,
+	const void *value, int length);
+int of_changeset_update_property_string(struct of_changeset *ocs,
+	struct device_node *np, const char *name, const char *str);
+__printf(4, 5) int of_changeset_update_property_stringf(struct of_changeset *ocs,
+		struct device_node *np, const char *name, const char *fmt, ...);
+int of_changeset_update_property_string_list(struct of_changeset *ocs,
+	struct device_node *np, const char *name, const char **strs, int count);
+int of_changeset_update_property_u32(struct of_changeset *ocs,
+	struct device_node *np, const char *name, u32 val);
+int of_changeset_update_property_bool(struct of_changeset *ocs,
+	struct device_node *np, const char *name);
+
 #else /* CONFIG_OF_DYNAMIC */
 static inline int of_reconfig_notifier_register(struct notifier_block *nb)
 {
@@ -1246,6 +1280,107 @@ static inline int of_reconfig_get_state_change(unsigned long action,
 {
 	return -EINVAL;
 }
+
+static inline int of_changeset_create_device_node(struct of_changeset *ocs,
+	struct device_node *parent, const char *fmt, ...)
+{
+	return -EINVAL;
+}
+
+int of_changeset_add_property_copy(struct of_changeset *ocs,
+	struct device_node *np, const char *name,
+	const void *value, int length)
+{
+	return -EINVAL;
+}
+
+int of_changeset_add_property_string(struct of_changeset *ocs,
+	struct device_node *np, const char *name, const char *str)
+{
+	return -EINVAL;
+}
+
+static inline struct device_node *of_changeset_create_device_nodev(
+	struct of_changeset *ocs, struct device_node *parent,
+	const char *fmt, va_list vargs)
+{
+	return ERR_PTR(-EINVAL);
+}
+
+static inline __printf(4, 5) struct device_node *
+	of_changeset_add_property_stringf(
+		struct of_changeset *ocs, struct device_node *np,
+		const char *name, const char *fmt, ...)
+{
+	return ERR_PTR(-EINVAL);
+}
+
+static inline int of_changeset_add_property_string_list(
+	struct of_changeset *ocs, struct device_node *np, const char *name,
+	const char **strs, int count)
+{
+	return -EINVAL;
+}
+
+static inline int of_changeset_add_property_u32(struct of_changeset *ocs,
+	struct device_node *np, const char *name, u32 val)
+{
+	return -EINVAL;
+}
+
+static inline int of_changeset_add_property_bool(struct of_changeset *ocs,
+	struct device_node *np, const char *name)
+{
+	return -EINVAL;
+}
+
+int of_changeset_update_property_copy(struct of_changeset *ocs,
+	struct device_node *np, const char *name,
+	const void *value, int length)
+{
+	return -EINVAL;
+}
+
+int of_changeset_update_property_string(struct of_changeset *ocs,
+	struct device_node *np, const char *name, const char *str)
+{
+	return -EINVAL;
+}
+
+static inline struct device_node *of_changeset_create_device_nodev(
+	struct of_changeset *ocs, struct device_node *parent,
+	const char *fmt, va_list vargs)
+{
+	return ERR_PTR(-EINVAL);
+}
+
+static inline __printf(4, 5) struct device_node *
+	of_changeset_update_property_stringf(
+		struct of_changeset *ocs, struct device_node *np,
+		const char *name, const char *fmt, ...)
+{
+	return ERR_PTR(-EINVAL);
+}
+
+static inline int of_changeset_update_property_string_list(
+	struct of_changeset *ocs, struct device_node *np, const char *name,
+	const char **strs, int count)
+{
+	return -EINVAL;
+}
+
+static inline int of_changeset_update_property_u32(struct of_changeset *ocs,
+	struct device_node *np, const char *name, u32 val)
+{
+	return -EINVAL;
+}
+
+static inline int of_changeset_update_property_bool(struct of_changeset *ocs,
+	struct device_node *np, const char *name)
+{
+	return -EINVAL;
+}
+
 #endif /* CONFIG_OF_DYNAMIC */
 
 /* CONFIG_OF_RESOLVE api */
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
