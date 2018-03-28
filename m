From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v4 06/13] usb: typec: tcpm: support get typec and pd config
 from device properties
Date: Thu, 29 Mar 2018 00:06:11 +0800
Message-ID: <1522253178-32414-7-git-send-email-jun.li@nxp.com>
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

This patch adds support of get typec and power delivery config from
firmware description.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/typec/tcpm.c | 140 ++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 115 insertions(+), 25 deletions(-)

diff --git a/drivers/usb/typec/tcpm.c b/drivers/usb/typec/tcpm.c
index be9b009..1744041b 100644
--- a/drivers/usb/typec/tcpm.c
+++ b/drivers/usb/typec/tcpm.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/proc_fs.h>
+#include <linux/property.h>
 #include <linux/sched/clock.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
@@ -3569,6 +3570,82 @@ static int tcpm_copy_vdos(u32 *dest_vdo, const u32 *src_vdo,
 	return nr_vdo;
 }
 
+static int tcpm_fw_get_caps(struct tcpm_port *port,
+			    struct fwnode_handle *fwnode)
+{
+	const char *cap_str;
+	int ret;
+	u32 mw;
+
+	if (!port || !fwnode)
+		return -EINVAL;
+
+	/* USB data support is optional */
+	ret = fwnode_property_read_string(fwnode, "data-type", &cap_str);
+	if (ret == 0) {
+		port->typec_caps.data = typec_find_data_type(cap_str);
+		if (port->typec_caps.data < 0)
+			return -EINVAL;
+	}
+
+	ret = fwnode_property_read_string(fwnode, "power-type", &cap_str);
+	if (ret < 0)
+		return ret;
+
+	port->typec_caps.type = typec_find_power_type(cap_str);
+	if (port->typec_caps.type < 0)
+		return -EINVAL;
+	port->port_type = port->typec_caps.type;
+
+	if (port->port_type == TYPEC_PORT_SNK)
+		goto sink;
+
+	/* Get soruce pdos */
+	ret = fwnode_property_read_u32_array(fwnode, "source-pdos",
+					     NULL, 0);
+	if (ret <= 0)
+		return -EINVAL;
+
+	port->nr_src_pdo = min(ret, PDO_MAX_OBJECTS);
+	ret = fwnode_property_read_u32_array(fwnode, "source-pdos",
+					     port->src_pdo, port->nr_src_pdo);
+	if ((ret < 0) || tcpm_validate_caps(port, port->src_pdo,
+					    port->nr_src_pdo))
+		return -EINVAL;
+
+	if (port->port_type == TYPEC_PORT_SRC)
+		return 0;
+
+	/* Get the preferred power role for DRP */
+	ret = fwnode_property_read_string(fwnode, "try-power-role", &cap_str);
+	if (ret < 0)
+		return ret;
+
+	port->typec_caps.prefer_role = typec_find_preferred_role(cap_str);
+	if (port->typec_caps.prefer_role < 0)
+		return -EINVAL;
+sink:
+	/* Get sink pdos */
+	ret = fwnode_property_read_u32_array(fwnode, "sink-pdos",
+					     NULL, 0);
+	if (ret <= 0)
+		return -EINVAL;
+
+	port->nr_snk_pdo = min(ret, PDO_MAX_OBJECTS);
+	ret = fwnode_property_read_u32_array(fwnode, "sink-pdos",
+					     port->snk_pdo, port->nr_snk_pdo);
+	if ((ret < 0) || tcpm_validate_caps(port, port->snk_pdo,
+					    port->nr_snk_pdo))
+		return -EINVAL;
+
+	if (fwnode_property_read_u32(fwnode, "op-sink-microwatt-hours",
+				     &mw) < 0)
+		return -EINVAL;
+	port->operating_snk_mw = mw / 1000;
+
+	return 0;
+}
+
 int tcpm_update_source_capabilities(struct tcpm_port *port, const u32 *pdo,
 				    unsigned int nr_pdo)
 {
@@ -3643,12 +3720,39 @@ static int nr_type_pdos(const u32 *pdo, unsigned int nr_pdo,
 	return count;
 }
 
+static int tcpm_copy_caps(struct tcpm_port *port,
+			  const struct tcpc_config *tcfg)
+{
+	if (tcpm_validate_caps(port, tcfg->src_pdo, tcfg->nr_src_pdo) ||
+	    tcpm_validate_caps(port, tcfg->snk_pdo, tcfg->nr_snk_pdo))
+		return -EINVAL;
+
+	port->nr_src_pdo = tcpm_copy_pdos(port->src_pdo, tcfg->src_pdo,
+					  tcfg->nr_src_pdo);
+	port->nr_snk_pdo = tcpm_copy_pdos(port->snk_pdo, tcfg->snk_pdo,
+					  tcfg->nr_snk_pdo);
+
+	port->nr_snk_vdo = tcpm_copy_vdos(port->snk_vdo, tcfg->snk_vdo,
+					  tcfg->nr_snk_vdo);
+
+	port->max_snk_mv = tcfg->max_snk_mv;
+	port->max_snk_ma = tcfg->max_snk_ma;
+	port->max_snk_mw = tcfg->max_snk_mw;
+	port->operating_snk_mw = tcfg->operating_snk_mw;
+
+	port->typec_caps.prefer_role = tcfg->default_role;
+	port->typec_caps.type = tcfg->type;
+	port->typec_caps.data = tcfg->data;
+
+	return 0;
+}
+
 struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 {
 	struct tcpm_port *port;
 	int i, err;
 
-	if (!dev || !tcpc || !tcpc->config ||
+	if (!dev || !tcpc ||
 	    !tcpc->get_vbus || !tcpc->set_cc || !tcpc->get_cc ||
 	    !tcpc->set_polarity || !tcpc->set_vconn || !tcpc->set_vbus ||
 	    !tcpc->set_pd_rx || !tcpc->set_roles || !tcpc->pd_transmit)
@@ -3677,17 +3781,13 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 	init_completion(&port->swap_complete);
 	tcpm_debugfs_init(port);
 
-	if (tcpm_validate_caps(port, tcpc->config->src_pdo,
-			       tcpc->config->nr_src_pdo) ||
-	    tcpm_validate_caps(port, tcpc->config->snk_pdo,
-			       tcpc->config->nr_snk_pdo)) {
-		err = -EINVAL;
+	if (tcpc->config)
+		err = tcpm_copy_caps(port, tcpc->config);
+	else
+		err = tcpm_fw_get_caps(port, tcpc->fwnode);
+	if (err < 0)
 		goto out_destroy_wq;
-	}
-	port->nr_src_pdo = tcpm_copy_pdos(port->src_pdo, tcpc->config->src_pdo,
-					  tcpc->config->nr_src_pdo);
-	port->nr_snk_pdo = tcpm_copy_pdos(port->snk_pdo, tcpc->config->snk_pdo,
-					  tcpc->config->nr_snk_pdo);
+
 	port->nr_fixed =  nr_type_pdos(port->snk_pdo,
 				       port->nr_snk_pdo,
 				       PDO_TYPE_FIXED);
@@ -3697,22 +3797,12 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 	port->nr_batt = nr_type_pdos(port->snk_pdo,
 				     port->nr_snk_pdo,
 				     PDO_TYPE_BATT);
-	port->nr_snk_vdo = tcpm_copy_vdos(port->snk_vdo, tcpc->config->snk_vdo,
-					  tcpc->config->nr_snk_vdo);
-
-	port->max_snk_mv = tcpc->config->max_snk_mv;
-	port->max_snk_ma = tcpc->config->max_snk_ma;
-	port->max_snk_mw = tcpc->config->max_snk_mw;
-	port->operating_snk_mw = tcpc->config->operating_snk_mw;
-	if (!tcpc->config->try_role_hw)
-		port->try_role = tcpc->config->default_role;
+	if (!tcpc->config || !tcpc->config->try_role_hw)
+		port->try_role = port->typec_caps.prefer_role;
 	else
 		port->try_role = TYPEC_NO_PREFERRED_ROLE;
 
 	port->typec_caps.fwnode = tcpc->fwnode;
-	port->typec_caps.prefer_role = tcpc->config->default_role;
-	port->typec_caps.type = tcpc->config->type;
-	port->typec_caps.data = tcpc->config->data;
 	port->typec_caps.revision = 0x0120;	/* Type-C spec release 1.2 */
 	port->typec_caps.pd_revision = 0x0200;	/* USB-PD spec release 2.0 */
 	port->typec_caps.dr_set = tcpm_dr_set;
@@ -3722,7 +3812,7 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 	port->typec_caps.port_type_set = tcpm_port_type_set;
 
 	port->partner_desc.identity = &port->partner_ident;
-	port->port_type = tcpc->config->type;
+	port->port_type = port->typec_caps.type;
 
 	port->role_sw = usb_role_switch_get(port->dev);
 	if (IS_ERR(port->role_sw)) {
@@ -3736,7 +3826,7 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 		goto out_destroy_wq;
 	}
 
-	if (tcpc->config->alt_modes) {
+	if (tcpc->config && tcpc->config->alt_modes) {
 		const struct typec_altmode_desc *paltmode = tcpc->config->alt_modes;
 
 		i = 0;
-- 
2.7.4
