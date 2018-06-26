Return-Path: <SRS0=bntt=JN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr00040.outbound.protection.outlook.com ([40.107.0.40]:27246
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S932104AbeF0AC5 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 26 Jun 2018 20:02:57 -0400
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v8 06/14] usb: typec: tcpm: support get typec and pd config from device properties
Date: Wed, 27 Jun 2018 07:45:24 +0800
Message-Id: <1530056732-9640-7-git-send-email-jun.li@nxp.com>
In-Reply-To: <1530056732-9640-1-git-send-email-jun.li@nxp.com>
References: <1530056732-9640-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: a.hajda@samsung.com, jun.li@nxp.com, cw00.choi@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

This patch adds support of get typec and power delivery config from
firmware description.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/typec/tcpm.c | 131 +++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 109 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/typec/tcpm.c b/drivers/usb/typec/tcpm.c
index d22b37b..9dcab81 100644
--- a/drivers/usb/typec/tcpm.c
+++ b/drivers/usb/typec/tcpm.c
@@ -4236,6 +4236,81 @@ static int tcpm_copy_vdos(u32 *dest_vdo, const u32 *src_vdo,
 	return nr_vdo;
 }
 
+static int tcpm_fw_get_caps(struct tcpm_port *port,
+			    struct fwnode_handle *fwnode)
+{
+	const char *cap_str;
+	int ret;
+	u32 mw;
+
+	if (!fwnode)
+		return -EINVAL;
+
+	/* USB data support is optional */
+	ret = fwnode_property_read_string(fwnode, "data-role", &cap_str);
+	if (ret == 0) {
+		port->typec_caps.data = typec_find_port_data_role(cap_str);
+		if (port->typec_caps.data < 0)
+			return -EINVAL;
+	}
+
+	ret = fwnode_property_read_string(fwnode, "power-role", &cap_str);
+	if (ret < 0)
+		return ret;
+
+	port->typec_caps.type = typec_find_port_power_role(cap_str);
+	if (port->typec_caps.type < 0)
+		return -EINVAL;
+	port->port_type = port->typec_caps.type;
+
+	if (port->port_type == TYPEC_PORT_SNK)
+		goto sink;
+
+	/* Get source pdos */
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
+	port->typec_caps.prefer_role = typec_find_power_role(cap_str);
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
+	if (fwnode_property_read_u32(fwnode, "op-sink-microwatt", &mw) < 0)
+		return -EINVAL;
+	port->operating_snk_mw = mw / 1000;
+
+	return 0;
+}
+
 int tcpm_update_source_capabilities(struct tcpm_port *port, const u32 *pdo,
 				    unsigned int nr_pdo)
 {
@@ -4521,12 +4596,36 @@ static int devm_tcpm_psy_register(struct tcpm_port *port)
 	return PTR_ERR_OR_ZERO(port->psy);
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
@@ -4556,30 +4655,18 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 	init_completion(&port->pps_complete);
 	tcpm_debugfs_init(port);
 
-	if (tcpm_validate_caps(port, tcpc->config->src_pdo,
-			       tcpc->config->nr_src_pdo) ||
-	    tcpm_validate_caps(port, tcpc->config->snk_pdo,
-			       tcpc->config->nr_snk_pdo)) {
-		err = -EINVAL;
+	err = tcpm_fw_get_caps(port, tcpc->fwnode);
+	if ((err < 0) && tcpc->config)
+		err = tcpm_copy_caps(port, tcpc->config);
+	if (err < 0)
 		goto out_destroy_wq;
-	}
-	port->nr_src_pdo = tcpm_copy_pdos(port->src_pdo, tcpc->config->src_pdo,
-					  tcpc->config->nr_src_pdo);
-	port->nr_snk_pdo = tcpm_copy_pdos(port->snk_pdo, tcpc->config->snk_pdo,
-					  tcpc->config->nr_snk_pdo);
-	port->nr_snk_vdo = tcpm_copy_vdos(port->snk_vdo, tcpc->config->snk_vdo,
-					  tcpc->config->nr_snk_vdo);
-
-	port->operating_snk_mw = tcpc->config->operating_snk_mw;
-	if (!tcpc->config->try_role_hw)
-		port->try_role = tcpc->config->default_role;
+
+	if (!tcpc->config || !tcpc->config->try_role_hw)
+		port->try_role = port->typec_caps.prefer_role;
 	else
 		port->try_role = TYPEC_NO_PREFERRED_ROLE;
 
 	port->typec_caps.fwnode = tcpc->fwnode;
-	port->typec_caps.prefer_role = tcpc->config->default_role;
-	port->typec_caps.type = tcpc->config->type;
-	port->typec_caps.data = tcpc->config->data;
 	port->typec_caps.revision = 0x0120;	/* Type-C spec release 1.2 */
 	port->typec_caps.pd_revision = 0x0300;	/* USB-PD spec release 3.0 */
 	port->typec_caps.dr_set = tcpm_dr_set;
@@ -4589,7 +4676,7 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 	port->typec_caps.port_type_set = tcpm_port_type_set;
 
 	port->partner_desc.identity = &port->partner_ident;
-	port->port_type = tcpc->config->type;
+	port->port_type = port->typec_caps.type;
 
 	port->role_sw = usb_role_switch_get(port->dev);
 	if (IS_ERR(port->role_sw)) {
@@ -4607,7 +4694,7 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 		goto out_destroy_wq;
 	}
 
-	if (tcpc->config->alt_modes) {
+	if (tcpc->config && tcpc->config->alt_modes) {
 		const struct typec_altmode_desc *paltmode = tcpc->config->alt_modes;
 
 		i = 0;
-- 
2.7.4

