Return-Path: <SRS0=bntt=JN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr00049.outbound.protection.outlook.com ([40.107.0.49]:56225
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S932104AbeF0ACv (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 26 Jun 2018 20:02:51 -0400
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v8 05/14] usb: typec: add API to get typec basic port power and data config
Date: Wed, 27 Jun 2018 07:45:23 +0800
Message-Id: <1530056732-9640-6-git-send-email-jun.li@nxp.com>
In-Reply-To: <1530056732-9640-1-git-send-email-jun.li@nxp.com>
References: <1530056732-9640-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: a.hajda@samsung.com, jun.li@nxp.com, cw00.choi@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

This patch adds 3 APIs to get the typec port power and data type,
and preferred power role by its name string.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/typec/class.c | 58 +++++++++++++++++++++++++++++++++++++++++++----
 include/linux/usb/typec.h |  3 +++
 2 files changed, 57 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 53df10d..6331059 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -796,12 +796,18 @@ static const char * const typec_data_roles[] = {
 	[TYPEC_HOST]	= "host",
 };
 
-static const char * const typec_port_types[] = {
+static const char * const typec_port_power_roles[] = {
 	[TYPEC_PORT_SRC] = "source",
 	[TYPEC_PORT_SNK] = "sink",
 	[TYPEC_PORT_DRP] = "dual",
 };
 
+static const char * const typec_port_data_roles[] = {
+	[TYPEC_PORT_DFP] = "host",
+	[TYPEC_PORT_UFP] = "device",
+	[TYPEC_PORT_DRD] = "dual",
+};
+
 static const char * const typec_port_types_drp[] = {
 	[TYPEC_PORT_SRC] = "dual [source] sink",
 	[TYPEC_PORT_SNK] = "dual source [sink]",
@@ -932,7 +938,7 @@ static ssize_t power_role_store(struct device *dev,
 	mutex_lock(&port->port_type_lock);
 	if (port->port_type != TYPEC_PORT_DRP) {
 		dev_dbg(dev, "port type fixed at \"%s\"",
-			     typec_port_types[port->port_type]);
+			     typec_port_power_roles[port->port_type]);
 		ret = -EOPNOTSUPP;
 		goto unlock_and_ret;
 	}
@@ -973,7 +979,7 @@ port_type_store(struct device *dev, struct device_attribute *attr,
 		return -EOPNOTSUPP;
 	}
 
-	ret = sysfs_match_string(typec_port_types, buf);
+	ret = sysfs_match_string(typec_port_power_roles, buf);
 	if (ret < 0)
 		return ret;
 
@@ -1007,7 +1013,7 @@ port_type_show(struct device *dev, struct device_attribute *attr,
 		return sprintf(buf, "%s\n",
 			       typec_port_types_drp[port->port_type]);
 
-	return sprintf(buf, "[%s]\n", typec_port_types[port->cap->type]);
+	return sprintf(buf, "[%s]\n", typec_port_power_roles[port->cap->type]);
 }
 static DEVICE_ATTR_RW(port_type);
 
@@ -1252,6 +1258,50 @@ void typec_set_pwr_opmode(struct typec_port *port,
 }
 EXPORT_SYMBOL_GPL(typec_set_pwr_opmode);
 
+/**
+ * typec_find_port_power_role - Get the typec port power capability
+ * @name: port power capability string
+ *
+ * This routine is used to find the typec_port_type by its string name.
+ *
+ * Returns typec_port_type if success, otherwise negative error code.
+ */
+int typec_find_port_power_role(const char *name)
+{
+	return match_string(typec_port_power_roles,
+			    ARRAY_SIZE(typec_port_power_roles), name);
+}
+EXPORT_SYMBOL_GPL(typec_find_port_power_role);
+
+/**
+ * typec_find_power_role - Find the typec one specific power role
+ * @name: power role string
+ *
+ * This routine is used to find the typec_role by its string name.
+ *
+ * Returns typec_role if success, otherwise negative error code.
+ */
+int typec_find_power_role(const char *name)
+{
+	return match_string(typec_roles, ARRAY_SIZE(typec_roles), name);
+}
+EXPORT_SYMBOL_GPL(typec_find_power_role);
+
+/**
+ * typec_find_port_data_role - Get the typec port data capability
+ * @name: port data capability string
+ *
+ * This routine is used to find the typec_port_data by its string name.
+ *
+ * Returns typec_port_data if success, otherwise negative error code.
+ */
+int typec_find_port_data_role(const char *name)
+{
+	return match_string(typec_port_data_roles,
+			    ARRAY_SIZE(typec_port_data_roles), name);
+}
+EXPORT_SYMBOL_GPL(typec_find_port_data_role);
+
 /* ------------------------------------------ */
 /* API for Multiplexer/DeMultiplexer Switches */
 
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 672b39b..15f8d9a 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -267,4 +267,7 @@ int typec_set_orientation(struct typec_port *port,
 			  enum typec_orientation orientation);
 int typec_set_mode(struct typec_port *port, int mode);
 
+int typec_find_port_power_role(const char *name);
+int typec_find_power_role(const char *name);
+int typec_find_port_data_role(const char *name);
 #endif /* __LINUX_USB_TYPEC_H */
-- 
2.7.4

