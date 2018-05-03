Return-Path: <SRS0=xgCA=HW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr10055.outbound.protection.outlook.com ([40.107.1.55]:63776
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751755AbeECAmO (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 2 May 2018 20:42:14 -0400
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v5 10/14] typec: tcpm: add starting value for drp toggling
Date: Thu,  3 May 2018 08:24:50 +0800
Message-Id: <1525307094-27402-11-git-send-email-jun.li@nxp.com>
In-Reply-To: <1525307094-27402-1-git-send-email-jun.li@nxp.com>
References: <1525307094-27402-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: jun.li@nxp.com, a.hajda@samsung.com, cw00.choi@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, gsomlo@gmail.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

As DRP port autonomously toggles the Rp/Rd need a start value to
begin with, so add one parameter for it in tcpm_start_drp_toggling.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/typec/tcpm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/tcpm.c b/drivers/usb/typec/tcpm.c
index becedcf..0c7fa14 100644
--- a/drivers/usb/typec/tcpm.c
+++ b/drivers/usb/typec/tcpm.c
@@ -2436,15 +2436,15 @@ static int tcpm_set_charge(struct tcpm_port *port, bool charge)
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
@@ -2752,7 +2752,7 @@ static void run_state_machine(struct tcpm_port *port)
 		if (!port->non_pd_role_swap)
 			tcpm_swap_complete(port, -ENOTCONN);
 		tcpm_src_detach(port);
-		if (tcpm_start_drp_toggling(port)) {
+		if (tcpm_start_drp_toggling(port, tcpm_rp_cc(port))) {
 			tcpm_set_state(port, DRP_TOGGLING, 0);
 			break;
 		}
@@ -2927,7 +2927,7 @@ static void run_state_machine(struct tcpm_port *port)
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

