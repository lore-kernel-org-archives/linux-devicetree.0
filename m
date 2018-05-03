Return-Path: <SRS0=xgCA=HW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr10043.outbound.protection.outlook.com ([40.107.1.43]:21952
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751747AbeECAlm (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 2 May 2018 20:41:42 -0400
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v5 05/14] usb: typec: add API to get typec basic port power and data config
Date: Thu,  3 May 2018 08:24:45 +0800
Message-Id: <1525307094-27402-6-git-send-email-jun.li@nxp.com>
In-Reply-To: <1525307094-27402-1-git-send-email-jun.li@nxp.com>
References: <1525307094-27402-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: jun.li@nxp.com, a.hajda@samsung.com, cw00.choi@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, gsomlo@gmail.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

This patch adds 3 APIs to get the typec port power and data type,
and preferred power role by its name string.

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

