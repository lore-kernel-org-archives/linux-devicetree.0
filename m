From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH Resend V2] dt: add helper function to read u8 & u16 variables & arrays
Date: Fri, 26 Oct 2012 09:50:56 +0530
Message-ID: <64c5278ebdec503f83e9b7002bf13affb7f3260f.1351225085.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rob.herring@calxeda.com, grant.likely@secretlab.ca
Cc: spear-devel@list.st.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, andriy.shevchenko@intel.com, linaro-dev@lists.linaro.org, patches@linaro.org, Viresh Kumar <viresh.kumar@linaro.org>
List-Id: devicetree@vger.kernel.org

This adds following helper routines:
- of_property_read_u8_array()
- of_property_read_u16_array()
- of_property_read_u8()
- of_property_read_u16()

First two actually share most of the code with of_property_read_u32_array()=
, so
the common part is taken out into a macro, which can be used by all three
*_array() routines.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V1->V2:
-----
- Use typeof() in of_property_read_array() macro instead of passing type to=
 it

 drivers/of/base.c  | 73 +++++++++++++++++++++++++++++++++++++++++++-------=
----
 include/linux/of.h | 30 ++++++++++++++++++++++
 2 files changed, 89 insertions(+), 14 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index af3b22a..039e178 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -670,6 +670,64 @@ struct device_node *of_find_node_by_phandle(phandle ha=
ndle)
 }
 EXPORT_SYMBOL(of_find_node_by_phandle);
=20
+#define of_property_read_array(_np, _pname, _out, _sz)=09=09=09\
+=09struct property *_prop =3D of_find_property(_np, _pname, NULL);=09\
+=09const __be32 *_val;=09=09=09=09=09=09\
+=09=09=09=09=09=09=09=09=09\
+=09if (!_prop)=09=09=09=09=09=09=09\
+=09=09return -EINVAL;=09=09=09=09=09=09\
+=09if (!_prop->value)=09=09=09=09=09=09\
+=09=09return -ENODATA;=09=09=09=09=09\
+=09if ((_sz * sizeof(*_out)) > _prop->length)=09=09=09\
+=09=09return -EOVERFLOW;=09=09=09=09=09\
+=09=09=09=09=09=09=09=09=09\
+=09_val =3D _prop->value;=09=09=09=09=09=09\
+=09while (_sz--)=09=09=09=09=09=09=09\
+=09=09*_out++ =3D (typeof(*_out))be32_to_cpup(_val++);=09=09\
+=09return 0;
+
+/**
+ * of_property_read_u8_array - Find and read an array of u8 from a propert=
y.
+ *
+ * @np:=09=09device node from which the property value is to be read.
+ * @propname:=09name of the property to be searched.
+ * @out_value:=09pointer to return value, modified only if return value is=
 0.
+ *
+ * Search for a property in a device node and read 8-bit value(s) from
+ * it. Returns 0 on success, -EINVAL if the property does not exist,
+ * -ENODATA if property does not have a value, and -EOVERFLOW if the
+ * property data isn't large enough.
+ *
+ * The out_value is modified only if a valid u8 value can be decoded.
+ */
+int of_property_read_u8_array(const struct device_node *np,
+=09=09=09const char *propname, u8 *out_values, size_t sz)
+{
+=09of_property_read_array(np, propname, out_values, sz);
+}
+EXPORT_SYMBOL_GPL(of_property_read_u8_array);
+
+/**
+ * of_property_read_u16_array - Find and read an array of u16 from a prope=
rty.
+ *
+ * @np:=09=09device node from which the property value is to be read.
+ * @propname:=09name of the property to be searched.
+ * @out_value:=09pointer to return value, modified only if return value is=
 0.
+ *
+ * Search for a property in a device node and read 16-bit value(s) from
+ * it. Returns 0 on success, -EINVAL if the property does not exist,
+ * -ENODATA if property does not have a value, and -EOVERFLOW if the
+ * property data isn't large enough.
+ *
+ * The out_value is modified only if a valid u16 value can be decoded.
+ */
+int of_property_read_u16_array(const struct device_node *np,
+=09=09=09const char *propname, u16 *out_values, size_t sz)
+{
+=09of_property_read_array(np, propname, out_values, sz);
+}
+EXPORT_SYMBOL_GPL(of_property_read_u16_array);
+
 /**
  * of_property_read_u32_array - Find and read an array of 32 bit integers
  * from a property.
@@ -689,20 +747,7 @@ int of_property_read_u32_array(const struct device_nod=
e *np,
 =09=09=09       const char *propname, u32 *out_values,
 =09=09=09       size_t sz)
 {
-=09struct property *prop =3D of_find_property(np, propname, NULL);
-=09const __be32 *val;
-
-=09if (!prop)
-=09=09return -EINVAL;
-=09if (!prop->value)
-=09=09return -ENODATA;
-=09if ((sz * sizeof(*out_values)) > prop->length)
-=09=09return -EOVERFLOW;
-
-=09val =3D prop->value;
-=09while (sz--)
-=09=09*out_values++ =3D be32_to_cpup(val++);
-=09return 0;
+=09of_property_read_array(np, propname, out_values, sz);
 }
 EXPORT_SYMBOL_GPL(of_property_read_u32_array);
=20
diff --git a/include/linux/of.h b/include/linux/of.h
index 72843b7..e2d9b40 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -223,6 +223,10 @@ extern struct device_node *of_find_node_with_property(
 extern struct property *of_find_property(const struct device_node *np,
 =09=09=09=09=09 const char *name,
 =09=09=09=09=09 int *lenp);
+extern int of_property_read_u8_array(const struct device_node *np,
+=09=09=09const char *propname, u8 *out_values, size_t sz);
+extern int of_property_read_u16_array(const struct device_node *np,
+=09=09=09const char *propname, u16 *out_values, size_t sz);
 extern int of_property_read_u32_array(const struct device_node *np,
 =09=09=09=09      const char *propname,
 =09=09=09=09      u32 *out_values,
@@ -357,6 +361,18 @@ static inline struct device_node *of_find_compatible_n=
ode(
 =09return NULL;
 }
=20
+static inline int of_property_read_u8_array(const struct device_node *np,
+=09=09=09const char *propname, u8 *out_values, size_t sz)
+{
+=09return -ENOSYS;
+}
+
+static inline int of_property_read_u16_array(const struct device_node *np,
+=09=09=09const char *propname, u16 *out_values, size_t sz)
+{
+=09return -ENOSYS;
+}
+
 static inline int of_property_read_u32_array(const struct device_node *np,
 =09=09=09=09=09     const char *propname,
 =09=09=09=09=09     u32 *out_values, size_t sz)
@@ -463,6 +479,20 @@ static inline bool of_property_read_bool(const struct =
device_node *np,
 =09return prop ? true : false;
 }
=20
+static inline int of_property_read_u8(const struct device_node *np,
+=09=09=09=09       const char *propname,
+=09=09=09=09       u8 *out_value)
+{
+=09return of_property_read_u8_array(np, propname, out_value, 1);
+}
+
+static inline int of_property_read_u16(const struct device_node *np,
+=09=09=09=09       const char *propname,
+=09=09=09=09       u16 *out_value)
+{
+=09return of_property_read_u16_array(np, propname, out_value, 1);
+}
+
 static inline int of_property_read_u32(const struct device_node *np,
 =09=09=09=09       const char *propname,
 =09=09=09=09       u32 *out_value)
--=20
1.7.12.rc2.18.g61b472e
