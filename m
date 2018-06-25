Return-Path: <SRS0=pME0=JL=nxp.com=jun.li@kernel.org>
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v7 07/14] staging: typec: tcpci: remove unused tcpci_tcpc_config
Date: Mon, 25 Jun 2018 16:08:39 +0800
Message-Id: <1529914126-22550-8-git-send-email-jun.li@nxp.com>
In-Reply-To: <1529914126-22550-1-git-send-email-jun.li@nxp.com>
References: <1529914126-22550-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
To: robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: a.hajda@samsung.com, jun.li@nxp.com, cw00.choi@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

Since we will use config settings via device properties, so
remove the hard code tcpci_tcpc_config.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/staging/typec/tcpci.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
index e59547a..076498a 100644
--- a/drivers/staging/typec/tcpci.c
+++ b/drivers/staging/typec/tcpci.c
@@ -464,17 +464,10 @@ static const struct regmap_config tcpci_regmap_config = {
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
 	tcpci->tcpc.fwnode = device_get_named_child_node(tcpci->dev,
 							 "connector");
 	if (!tcpci->tcpc.fwnode) {
-- 
2.7.4
