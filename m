Return-Path: <SRS0=m1Og=FU=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-db5eur01on0063.outbound.protection.outlook.com ([104.47.2.63]:48864
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752879AbeBZMFE (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 26 Feb 2018 07:05:04 -0500
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v2 06/12] typec: tcpm: add starting value for drp toggling
Date: Mon, 26 Feb 2018 19:49:13 +0800
Message-Id: <1519645759-12701-7-git-send-email-jun.li@nxp.com>
In-Reply-To: <1519645759-12701-1-git-send-email-jun.li@nxp.com>
References: <1519645759-12701-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: a.hajda@samsung.com, mark.rutland@arm.com, jun.li@nxp.com, yueyao@google.com, peter.chen@nxp.com, garsilva@embeddedor.com, o_leveque@orange.fr, shufan_lee@richtek.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

As DRP port autonomously toggles the Rp/Rd need a start value to
begin with, so add one parameter for it in tcpm_start_drp_toggling.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/typec/tcpm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/tcpm.c b/drivers/usb/typec/tcpm.c
index 409f1d0..488a252 100644
--- a/drivers/usb/typec/tcpm.c
+++ b/drivers/usb/typec/tcpm.c
@@ -1985,15 +1985,15 @@ static int tcpm_set_charge(struct tcpm_port *port, bool charge)
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
@@ -2302,7 +2302,7 @@ static void run_state_machine(struct tcpm_port *port)
 		if (!port->non_pd_role_swap)
 			tcpm_swap_complete(port, -ENOTCONN);
 		tcpm_src_detach(port);
-		if (tcpm_start_drp_toggling(port)) {
+		if (tcpm_start_drp_toggling(port, tcpm_rp_cc(port))) {
 			tcpm_set_state(port, DRP_TOGGLING, 0);
 			break;
 		}
@@ -2474,7 +2474,7 @@ static void run_state_machine(struct tcpm_port *port)
 		if (!port->non_pd_role_swap)
 			tcpm_swap_complete(port, -ENOTCONN);
 		tcpm_snk_detach(port);
-		if (tcpm_start_drp_toggling(port)) {
+		if (tcpm_start_drp_toggling(port, TYPEC_CC_RD)) {
 			tcpm_set_state(port, DRP_TOGGLING, 0);
 			break;
 		}
-- 
2.7.4

