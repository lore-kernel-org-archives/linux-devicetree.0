Return-Path: <SRS0=8UYE=GN=nxp.com=jun.li@kernel.org>
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v2 5/5] usb: typec: tcpm: remove max_snk_mv/ma/mw
Date: Fri, 23 Mar 2018 22:58:47 +0800
Message-Id: <1521817127-23061-6-git-send-email-jun.li@nxp.com>
In-Reply-To: <1521817127-23061-1-git-send-email-jun.li@nxp.com>
References: <1521817127-23061-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, heikki.krogerus@linux.intel.com, hdegoede@redhat.com
Cc: linux@roeck-us.net, rmfrfs@gmail.com, yueyao.zhu@gmail.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

Since there is no user of max_snk_*, so we can remove them from tcpm.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/typec/tcpm.c | 12 ------------
 include/linux/usb/tcpm.h |  9 ---------
 2 files changed, 21 deletions(-)

diff --git a/drivers/usb/typec/tcpm.c b/drivers/usb/typec/tcpm.c
index 50a1979..72e7a65 100644
--- a/drivers/usb/typec/tcpm.c
+++ b/drivers/usb/typec/tcpm.c
@@ -260,9 +260,6 @@ struct tcpm_port {
 	u32 snk_vdo[VDO_MAX_OBJECTS];
 	unsigned int nr_snk_vdo;
 
-	unsigned int max_snk_mv;
-	unsigned int max_snk_ma;
-	unsigned int max_snk_mw;
 	unsigned int operating_snk_mw;
 
 	/* Requested current / voltage */
@@ -3600,9 +3597,6 @@ EXPORT_SYMBOL_GPL(tcpm_update_source_capabilities);
 
 int tcpm_update_sink_capabilities(struct tcpm_port *port, const u32 *pdo,
 				  unsigned int nr_pdo,
-				  unsigned int max_snk_mv,
-				  unsigned int max_snk_ma,
-				  unsigned int max_snk_mw,
 				  unsigned int operating_snk_mw)
 {
 	if (tcpm_validate_caps(port, pdo, nr_pdo))
@@ -3610,9 +3604,6 @@ int tcpm_update_sink_capabilities(struct tcpm_port *port, const u32 *pdo,
 
 	mutex_lock(&port->lock);
 	port->nr_snk_pdo = tcpm_copy_pdos(port->snk_pdo, pdo, nr_pdo);
-	port->max_snk_mv = max_snk_mv;
-	port->max_snk_ma = max_snk_ma;
-	port->max_snk_mw = max_snk_mw;
 	port->operating_snk_mw = operating_snk_mw;
 
 	switch (port->state) {
@@ -3700,9 +3691,6 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 	port->nr_snk_vdo = tcpm_copy_vdos(port->snk_vdo, tcpc->config->snk_vdo,
 					  tcpc->config->nr_snk_vdo);
 
-	port->max_snk_mv = tcpc->config->max_snk_mv;
-	port->max_snk_ma = tcpc->config->max_snk_ma;
-	port->max_snk_mw = tcpc->config->max_snk_mw;
 	port->operating_snk_mw = tcpc->config->operating_snk_mw;
 	if (!tcpc->config->try_role_hw)
 		port->try_role = tcpc->config->default_role;
diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
index f0d839d..f5bda9a 100644
--- a/include/linux/usb/tcpm.h
+++ b/include/linux/usb/tcpm.h
@@ -62,9 +62,6 @@ enum tcpm_transmit_type {
  * @snk_pdo:	PDO parameters sent to partner as response to
  *		PD_CTRL_GET_SINK_CAP message
  * @nr_snk_pdo:	Number of entries in @snk_pdo
- * @max_snk_mv:	Maximum acceptable sink voltage in mV
- * @max_snk_ma:	Maximum sink current in mA
- * @max_snk_mw:	Maximum required sink power in mW
  * @operating_snk_mw:
  *		Required operating sink power in mW
  * @type:	Port type (TYPEC_PORT_DFP, TYPEC_PORT_UFP, or
@@ -85,9 +82,6 @@ struct tcpc_config {
 	const u32 *snk_vdo;
 	unsigned int nr_snk_vdo;
 
-	unsigned int max_snk_mv;
-	unsigned int max_snk_ma;
-	unsigned int max_snk_mw;
 	unsigned int operating_snk_mw;
 
 	enum typec_port_type type;
@@ -174,9 +168,6 @@ int tcpm_update_source_capabilities(struct tcpm_port *port, const u32 *pdo,
 				    unsigned int nr_pdo);
 int tcpm_update_sink_capabilities(struct tcpm_port *port, const u32 *pdo,
 				  unsigned int nr_pdo,
-				  unsigned int max_snk_mv,
-				  unsigned int max_snk_ma,
-				  unsigned int max_snk_mw,
 				  unsigned int operating_snk_mw);
 
 void tcpm_vbus_change(struct tcpm_port *port);
-- 
2.7.4
