Return-Path: <SRS0=m1Og=FU=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-he1eur01on0077.outbound.protection.outlook.com ([104.47.0.77]:60177
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752846AbeBZMEf (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 26 Feb 2018 07:04:35 -0500
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v2 01/12] usb: typec: add API to get port type and preferred role
Date: Mon, 26 Feb 2018 19:49:08 +0800
Message-Id: <1519645759-12701-2-git-send-email-jun.li@nxp.com>
In-Reply-To: <1519645759-12701-1-git-send-email-jun.li@nxp.com>
References: <1519645759-12701-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: a.hajda@samsung.com, mark.rutland@arm.com, jun.li@nxp.com, yueyao@google.com, peter.chen@nxp.com, garsilva@embeddedor.com, o_leveque@orange.fr, shufan_lee@richtek.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

This patch add 2 APIs to get port type and preferred role from firmware
description.

Signed-off-by: Li Jun <jun.li@nxp.com>

---
change for v2
- Change the 2 APIs name and input para to be device_node pointer.

 drivers/usb/typec/typec.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/usb/typec.h |  2 ++
 2 files changed, 48 insertions(+)

diff --git a/drivers/usb/typec/typec.c b/drivers/usb/typec/typec.c
index 735726c..e7b2802 100644
--- a/drivers/usb/typec/typec.c
+++ b/drivers/usb/typec/typec.c
@@ -9,6 +9,7 @@
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/of.h>
 #include <linux/slab.h>
 #include <linux/usb/typec.h>
 
@@ -1246,6 +1247,51 @@ void typec_set_pwr_opmode(struct typec_port *port,
 }
 EXPORT_SYMBOL_GPL(typec_set_pwr_opmode);
 
+/**
+ * typec_of_get_port_type - Get the typec port type
+ * @np: device node from which the property value is to be read.
+ *
+ * This routine is used by typec hardware driver to read property port type
+ * from the device firmware description.
+ *
+ * Returns typec_port_type if success, otherwise negative error code.
+ */
+int typec_of_get_port_type(struct device_node *np)
+{
+	const char *type_str;
+	int ret;
+
+	ret = of_property_read_string(np, "port-type", &type_str);
+	if (ret < 0)
+		return ret;
+
+	return match_string(typec_port_types, ARRAY_SIZE(typec_port_types),
+								 type_str);
+}
+EXPORT_SYMBOL_GPL(typec_get_port_type);
+
+/**
+ * typec_of_get_preferred_role - Get the typec preferred role
+ * @np: device node from which the property value is to be read.
+ *
+ * This routine is used by typec hardware driver to read property default role
+ * from the device firmware description.
+ *
+ * Returns typec_role if success, otherwise negative error code.
+ */
+int typec_of_get_preferred_role(struct device_node *np)
+{
+	const char *power_str;
+	int ret;
+
+	ret = of_property_read_string(np, "default-role", &power_str);
+	if (ret < 0)
+		return ret;
+
+	return match_string(typec_roles, ARRAY_SIZE(typec_roles), power_str);
+}
+EXPORT_SYMBOL_GPL(typec_get_preferred_role);
+
 /* --------------------------------------- */
 
 /**
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 0d44ce6..f2a581a 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -244,5 +244,7 @@ void typec_set_data_role(struct typec_port *port, enum typec_data_role role);
 void typec_set_pwr_role(struct typec_port *port, enum typec_role role);
 void typec_set_vconn_role(struct typec_port *port, enum typec_role role);
 void typec_set_pwr_opmode(struct typec_port *port, enum typec_pwr_opmode mode);
+int typec_of_get_port_type(struct device_node *np);
+int typec_of_get_preferred_role(struct device_node *np);
 
 #endif /* __LINUX_USB_TYPEC_H */
-- 
2.7.4

