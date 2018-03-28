From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v4 05/13] usb: typec: add API to get typec basic port power
 and data config
Date: Thu, 29 Mar 2018 00:06:10 +0800
Message-ID: <1522253178-32414-6-git-send-email-jun.li@nxp.com>
References: <1522253178-32414-1-git-send-email-jun.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1522253178-32414-1-git-send-email-jun.li@nxp.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, peter.chen@nxp.com, linux-usb@vger.kernel.org, a.hajda@samsung.com, linux-imx@nxp.com, jun.li@nxp.com, shufan_lee@richtek.com
List-Id: devicetree@vger.kernel.org

This patch adds 3 APIs to get the typec port power and data type,
and preferred power role by its name string.

Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/typec/class.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/usb/typec.h |  3 +++
 2 files changed, 55 insertions(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 53df10d..5981e18 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -9,6 +9,7 @@
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/usb/typec.h>
 #include <linux/usb/typec_mux.h>
@@ -802,6 +803,12 @@ static const char * const typec_port_types[] = {
 	[TYPEC_PORT_DRP] = "dual",
 };
 
+static const char * const typec_data_types[] = {
+	[TYPEC_PORT_DFP] = "host",
+	[TYPEC_PORT_UFP] = "device",
+	[TYPEC_PORT_DRD] = "dual",
+};
+
 static const char * const typec_port_types_drp[] = {
 	[TYPEC_PORT_SRC] = "dual [source] sink",
 	[TYPEC_PORT_SNK] = "dual source [sink]",
@@ -1252,6 +1259,51 @@ void typec_set_pwr_opmode(struct typec_port *port,
 }
 EXPORT_SYMBOL_GPL(typec_set_pwr_opmode);
 
+/**
+ * typec_find_power_type - Get the typec port power type
+ * @name: port type string
+ *
+ * This routine is used to find the typec_port_type by its string name.
+ *
+ * Returns typec_port_type if success, otherwise negative error code.
+ */
+int typec_find_power_type(const char *name)
+{
+	return match_string(typec_port_types, ARRAY_SIZE(typec_port_types),
+			    name);
+}
+EXPORT_SYMBOL_GPL(typec_find_power_type);
+
+/**
+ * typec_find_preferred_role - Find the typec drp port preferred power role
+ * @name: power role string
+ *
+ * This routine is used to find the typec_role by its string name of
+ * preferred power role(Try.SRC or Try.SNK).
+ *
+ * Returns typec_role if success, otherwise negative error code.
+ */
+int typec_find_preferred_role(const char *name)
+{
+	return match_string(typec_roles, ARRAY_SIZE(typec_roles), name);
+}
+EXPORT_SYMBOL_GPL(typec_find_preferred_role);
+
+/**
+ * typec_find_data_type - Get the typec port data capability
+ * @name: data type string
+ *
+ * This routine is used to find the typec_port_data by its string name.
+ *
+ * Returns typec_port_data if success, otherwise negative error code.
+ */
+int typec_find_data_type(const char *name)
+{
+	return match_string(typec_data_types, ARRAY_SIZE(typec_data_types),
+			    name);
+}
+EXPORT_SYMBOL_GPL(typec_find_data_type);
+
 /* ------------------------------------------ */
 /* API for Multiplexer/DeMultiplexer Switches */
 
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 672b39b..00c93e7 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -267,4 +267,7 @@ int typec_set_orientation(struct typec_port *port,
 			  enum typec_orientation orientation);
 int typec_set_mode(struct typec_port *port, int mode);
 
+int typec_find_power_type(const char *name);
+int typec_find_preferred_role(const char *name);
+int typec_find_data_type(const char *name);
 #endif /* __LINUX_USB_TYPEC_H */
-- 
2.7.4
