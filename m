Return-Path: <SRS0=m1Og=FU=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-db5eur01on0059.outbound.protection.outlook.com ([104.47.2.59]:19538
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752777AbeBZMEr (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 26 Feb 2018 07:04:47 -0500
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v2 03/12] staging: typec: tcpci: support port config passed via dt
Date: Mon, 26 Feb 2018 19:49:10 +0800
Message-Id: <1519645759-12701-4-git-send-email-jun.li@nxp.com>
In-Reply-To: <1519645759-12701-1-git-send-email-jun.li@nxp.com>
References: <1519645759-12701-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: a.hajda@samsung.com, mark.rutland@arm.com, jun.li@nxp.com, yueyao@google.com, peter.chen@nxp.com, garsilva@embeddedor.com, o_leveque@orange.fr, shufan_lee@richtek.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

User can define the typec port properties in tcpci node to setup
the port config.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
Changes for v2:
- Use infra APIs to get sink and source config.
- Improve the error message.

 drivers/staging/typec/tcpci.c | 70 ++++++++++++++++++++++++++++++++++++++-----
 include/linux/usb/tcpm.h      |  6 ++--
 2 files changed, 66 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
index b6abaf7..be6ed16 100644
--- a/drivers/staging/typec/tcpci.c
+++ b/drivers/staging/typec/tcpci.c
@@ -426,17 +426,73 @@ static const struct regmap_config tcpci_regmap_config = {
 	.max_register = 0x7F, /* 0x80 .. 0xFF are vendor defined */
 };
 
-static const struct tcpc_config tcpci_tcpc_config = {
-	.type = TYPEC_PORT_DFP,
-	.default_role = TYPEC_SINK,
-};
-
+/* Populate struct tcpc_config from device-tree */
 static int tcpci_parse_config(struct tcpci *tcpci)
 {
+	struct tcpc_config *tcfg;
+	struct device_node *child;
+	int ret = -EINVAL;
+
 	tcpci->controls_vbus = true; /* XXX */
 
-	/* TODO: Populate struct tcpc_config from ACPI/device-tree */
-	tcpci->tcpc.config = &tcpci_tcpc_config;
+	tcpci->tcpc.config = devm_kzalloc(tcpci->dev, sizeof(*tcfg),
+					  GFP_KERNEL);
+	if (!tcpci->tcpc.config)
+		return -ENOMEM;
+
+	tcfg = tcpci->tcpc.config;
+
+	child = of_get_child_by_name(tcpci->dev->of_node, "connector");
+	if (!child) {
+		dev_err(tcpci->dev, "failed to get connector node.\n");
+		return -EINVAL;
+	}
+
+	/* Get port-type */
+	ret = typec_of_get_port_type(child);
+	if (ret < 0) {
+		dev_err(tcpci->dev, "failed to get correct port type.\n");
+		return ret;
+	}
+	tcfg->type = ret;
+
+	if (tcfg->type == TYPEC_PORT_UFP)
+		goto sink;
+
+	tcfg->src_pdo = devm_kcalloc(tcpci->dev, PDO_MAX_OBJECTS,
+				     sizeof(*tcfg->src_pdo), GFP_KERNEL);
+	if (!tcfg->src_pdo)
+		return -ENOMEM;
+
+	/* Get source capability */
+	ret = tcpm_of_get_src_config(child, tcfg);
+	if (ret <= 0) {
+		dev_err(tcpci->dev, "failed to get source pdo %d\n", ret);
+		return -EINVAL;
+	}
+
+	if (tcfg->type == TYPEC_PORT_DFP)
+		return 0;
+
+	/* Get the preferred power role for drp */
+	ret = typec_of_get_preferred_role(child);
+	if (ret < 0) {
+		dev_err(tcpci->dev, "failed to get correct preferred role.\n");
+		return ret;
+	}
+	tcfg->default_role = ret;
+sink:
+	tcfg->snk_pdo = devm_kcalloc(tcpci->dev, PDO_MAX_OBJECTS,
+				     sizeof(*tcfg->snk_pdo), GFP_KERNEL);
+	if (!tcfg->snk_pdo)
+		return -ENOMEM;
+
+	/* Get power sink config */
+	ret = tcpm_of_get_snk_config(child, tcfg);
+	if (ret < 0) {
+		dev_err(tcpci->dev, "failed to get sink configs %d\n", ret);
+		return -EINVAL;
+	}
 
 	return 0;
 }
diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
index 962eff1..8e9edb4 100644
--- a/include/linux/usb/tcpm.h
+++ b/include/linux/usb/tcpm.h
@@ -76,10 +76,10 @@ enum tcpm_transmit_type {
  * @alt_modes:	List of supported alternate modes
  */
 struct tcpc_config {
-	const u32 *src_pdo;
+	u32 *src_pdo;
 	unsigned int nr_src_pdo;
 
-	const u32 *snk_pdo;
+	u32 *snk_pdo;
 	unsigned int nr_snk_pdo;
 
 	const u32 *snk_vdo;
@@ -154,7 +154,7 @@ struct tcpc_mux_dev {
  * @mux:	Pointer to multiplexer data
  */
 struct tcpc_dev {
-	const struct tcpc_config *config;
+	struct tcpc_config *config;
 
 	int (*init)(struct tcpc_dev *dev);
 	int (*get_vbus)(struct tcpc_dev *dev);
-- 
2.7.4

