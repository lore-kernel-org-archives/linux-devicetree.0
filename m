Return-Path: <SRS0=pME0=JL=nxp.com=jun.li@kernel.org>
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v7 11/14] typec: tcpm: add starting value for drp toggling
Date: Mon, 25 Jun 2018 16:08:43 +0800
Message-Id: <1529914126-22550-12-git-send-email-jun.li@nxp.com>
In-Reply-To: <1529914126-22550-1-git-send-email-jun.li@nxp.com>
References: <1529914126-22550-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
To: robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: a.hajda@samsung.com, jun.li@nxp.com, cw00.choi@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

As DRP port autonomously toggles the Rp/Rd need a start value to
begin with, so add one parameter for it in tcpm_start_drp_toggling.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/typec/tcpm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/tcpm.c b/drivers/usb/typec/tcpm.c
index 0454654..c80f1a4 100644
--- a/drivers/usb/typec/tcpm.c
+++ b/drivers/usb/typec/tcpm.c
@@ -2431,15 +2431,15 @@ static int tcpm_set_charge(struct tcpm_port *port, bool charge)
 	return 0;
 }
 
-static bool tcpm_start_drp_toggling(struct tcpm_port *port)
+static bool tcpm_start_drp_toggling(struct tcpm_port *port,
+				    enum typec_cc_status cc)
 {
 	int ret;
 
 	if (port->tcpc->start_drp_toggling &&
 	    port->port_type == TYPEC_PORT_DRP) {
 		tcpm_log_force(port, "Start DRP toggling");
-		ret = port->tcpc->start_drp_toggling(port->tcpc,
-						     tcpm_rp_cc(port));
+		ret = port->tcpc->start_drp_toggling(port->tcpc, cc);
 		if (!ret)
 			return true;
 	}
@@ -2747,7 +2747,7 @@ static void run_state_machine(struct tcpm_port *port)
 		if (!port->non_pd_role_swap)
 			tcpm_swap_complete(port, -ENOTCONN);
 		tcpm_src_detach(port);
-		if (tcpm_start_drp_toggling(port)) {
+		if (tcpm_start_drp_toggling(port, tcpm_rp_cc(port))) {
 			tcpm_set_state(port, DRP_TOGGLING, 0);
 			break;
 		}
@@ -2922,7 +2922,7 @@ static void run_state_machine(struct tcpm_port *port)
 			tcpm_swap_complete(port, -ENOTCONN);
 		tcpm_pps_complete(port, -ENOTCONN);
 		tcpm_snk_detach(port);
-		if (tcpm_start_drp_toggling(port)) {
+		if (tcpm_start_drp_toggling(port, TYPEC_CC_RD)) {
 			tcpm_set_state(port, DRP_TOGGLING, 0);
 			break;
 		}
-- 
2.7.4
