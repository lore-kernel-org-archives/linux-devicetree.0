From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v4 04/13] usb: typec: add fwnode to tcpc
Date: Thu, 29 Mar 2018 00:06:09 +0800
Message-ID: <1522253178-32414-5-git-send-email-jun.li@nxp.com>
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

Add fwnode handle to get the fwnode so we can get typec configs
it contains.

Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/staging/typec/tcpci.c | 14 +++++++-------
 drivers/usb/typec/tcpm.c      |  1 +
 include/linux/usb/tcpm.h      |  2 ++
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
index ed76327..4f7ad10 100644
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
@@ -463,17 +464,16 @@ static const struct regmap_config tcpci_regmap_config = {
 	.max_register = 0x7F, /* 0x80 .. 0xFF are vendor defined */
 };
 
-static const struct tcpc_config tcpci_tcpc_config = {
-	.type = TYPEC_PORT_DFP,
-	.default_role = TYPEC_SINK,
-};
-
 static int tcpci_parse_config(struct tcpci *tcpci)
 {
 	tcpci->controls_vbus = true; /* XXX */
 
-	/* TODO: Populate struct tcpc_config from ACPI/device-tree */
-	tcpci->tcpc.config = &tcpci_tcpc_config;
+	tcpci->tcpc.fwnode = device_get_named_child_node(tcpci->dev,
+							 "connector");
+	if (!tcpci->tcpc.fwnode) {
+		dev_err(tcpci->dev, "Can't find connector node.\n");
+		return -EINVAL;
+	}
 
 	return 0;
 }
diff --git a/drivers/usb/typec/tcpm.c b/drivers/usb/typec/tcpm.c
index a7b82d9..be9b009 100644
--- a/drivers/usb/typec/tcpm.c
+++ b/drivers/usb/typec/tcpm.c
@@ -3709,6 +3709,7 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 	else
 		port->try_role = TYPEC_NO_PREFERRED_ROLE;
 
+	port->typec_caps.fwnode = tcpc->fwnode;
 	port->typec_caps.prefer_role = tcpc->config->default_role;
 	port->typec_caps.type = tcpc->config->type;
 	port->typec_caps.data = tcpc->config->data;
diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
index f0d839d..e2e2db3 100644
--- a/include/linux/usb/tcpm.h
+++ b/include/linux/usb/tcpm.h
@@ -115,6 +115,7 @@ enum tcpc_mux_mode {
 /**
  * struct tcpc_dev - Port configuration and callback functions
  * @config:	Pointer to port configuration
+ * @fwnode:	Pointer to port fwnode
  * @get_vbus:	Called to read current VBUS state
  * @get_current_limit:
  *		Optional; called by the tcpm core when configured as a snk
@@ -143,6 +144,7 @@ enum tcpc_mux_mode {
  */
 struct tcpc_dev {
 	const struct tcpc_config *config;
+	struct fwnode_handle *fwnode;
 
 	int (*init)(struct tcpc_dev *dev);
 	int (*get_vbus)(struct tcpc_dev *dev);
-- 
2.7.4
