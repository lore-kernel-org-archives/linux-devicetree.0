Return-Path: <SRS0=A7Xe=IP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr00071.outbound.protection.outlook.com ([40.107.0.71]:48480
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753149AbeE1DKQ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 27 May 2018 23:10:16 -0400
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v6 11/15] typec: tcpm: add starting value for drp toggling
Date: Mon, 28 May 2018 10:52:43 +0800
Message-Id: <1527475967-15201-12-git-send-email-jun.li@nxp.com>
In-Reply-To: <1527475967-15201-1-git-send-email-jun.li@nxp.com>
References: <1527475967-15201-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: cw00.choi@samsung.com, a.hajda@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, garsilva@embeddedor.com, gsomlo@gmail.com, jun.li@nxp.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

As DRP port autonomously toggles the Rp/Rd need a start value to
begin with, so add one parameter for it in tcpm_start_drp_toggling.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/typec/tcpm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/tcpm.c b/drivers/usb/typec/tcpm.c
index aa17cd5..d885bff 100644
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

