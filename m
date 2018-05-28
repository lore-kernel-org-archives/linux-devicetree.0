Return-Path: <SRS0=A7Xe=IP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr00077.outbound.protection.outlook.com ([40.107.0.77]:9280
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752952AbeE1DJe (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 27 May 2018 23:09:34 -0400
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v6 04/15] usb: typec: add fwnode to tcpc
Date: Mon, 28 May 2018 10:52:36 +0800
Message-Id: <1527475967-15201-5-git-send-email-jun.li@nxp.com>
In-Reply-To: <1527475967-15201-1-git-send-email-jun.li@nxp.com>
References: <1527475967-15201-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: cw00.choi@samsung.com, a.hajda@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, garsilva@embeddedor.com, gsomlo@gmail.com, jun.li@nxp.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

Add fwnode handle to get the fwnode so we can get typec configs
it contains.

Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/staging/typec/tcpci.c | 7 +++++++
 drivers/usb/typec/tcpm.c      | 1 +
 include/linux/usb/tcpm.h      | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
index dd29288..e59547a 100644
--- a/drivers/staging/typec/tcpci.c
+++ b/drivers/staging/typec/tcpci.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/usb/pd.h>
 #include <linux/usb/tcpm.h>
@@ -474,6 +475,12 @@ static int tcpci_parse_config(struct tcpci *tcpci)
 
 	/* TODO: Populate struct tcpc_config from ACPI/device-tree */
 	tcpci->tcpc.config = &tcpci_tcpc_config;
+	tcpci->tcpc.fwnode = device_get_named_child_node(tcpci->dev,
+							 "connector");
+	if (!tcpci->tcpc.fwnode) {
+		dev_err(tcpci->dev, "Can't find connector node.\n");
+		return -EINVAL;
+	}
 
 	return 0;
 }
diff --git a/drivers/usb/typec/tcpm.c b/drivers/usb/typec/tcpm.c
index 0ccd2ce..fcd22e8 100644
--- a/drivers/usb/typec/tcpm.c
+++ b/drivers/usb/typec/tcpm.c
@@ -4581,6 +4581,7 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 	else
 		port->try_role = TYPEC_NO_PREFERRED_ROLE;
 
+	port->typec_caps.fwnode = tcpc->fwnode;
 	port->typec_caps.prefer_role = tcpc->config->default_role;
 	port->typec_caps.type = tcpc->config->type;
 	port->typec_caps.data = tcpc->config->data;
diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
index b231b93..193920a 100644
--- a/include/linux/usb/tcpm.h
+++ b/include/linux/usb/tcpm.h
@@ -110,6 +110,7 @@ enum tcpc_mux_mode {
 /**
  * struct tcpc_dev - Port configuration and callback functions
  * @config:	Pointer to port configuration
+ * @fwnode:	Pointer to port fwnode
  * @get_vbus:	Called to read current VBUS state
  * @get_current_limit:
  *		Optional; called by the tcpm core when configured as a snk
@@ -138,6 +139,7 @@ enum tcpc_mux_mode {
  */
 struct tcpc_dev {
 	const struct tcpc_config *config;
+	struct fwnode_handle *fwnode;
 
 	int (*init)(struct tcpc_dev *dev);
 	int (*get_vbus)(struct tcpc_dev *dev);
-- 
2.7.4

