Return-Path: <SRS0=A7Xe=IP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr00069.outbound.protection.outlook.com ([40.107.0.69]:47392
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753149AbeE1DKW (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 27 May 2018 23:10:22 -0400
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v6 12/15] usb: typec: tcpm: set cc for drp toggling attach
Date: Mon, 28 May 2018 10:52:44 +0800
Message-Id: <1527475967-15201-13-git-send-email-jun.li@nxp.com>
In-Reply-To: <1527475967-15201-1-git-send-email-jun.li@nxp.com>
References: <1527475967-15201-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: cw00.choi@samsung.com, a.hajda@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, garsilva@embeddedor.com, gsomlo@gmail.com, jun.li@nxp.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

In case of drp toggling, we may need set correct cc value for role control
after attach as it may never been set.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/typec/tcpm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/typec/tcpm.c b/drivers/usb/typec/tcpm.c
index d885bff..98ea916 100644
--- a/drivers/usb/typec/tcpm.c
+++ b/drivers/usb/typec/tcpm.c
@@ -2599,6 +2599,7 @@ static void tcpm_reset_port(struct tcpm_port *port)
 	tcpm_set_attached_state(port, false);
 	port->try_src_count = 0;
 	port->try_snk_count = 0;
+	port->cc_req = TYPEC_CC_OPEN;
 	port->supply_voltage = 0;
 	port->current_limit = 0;
 	port->usb_type = POWER_SUPPLY_USB_TYPE_C;
@@ -2831,6 +2832,8 @@ static void run_state_machine(struct tcpm_port *port)
 		break;
 
 	case SRC_ATTACHED:
+		if (port->cc_req == TYPEC_CC_OPEN)
+			tcpm_set_cc(port, tcpm_rp_cc(port));
 		ret = tcpm_src_attach(port);
 		tcpm_set_state(port, SRC_UNATTACHED,
 			       ret < 0 ? 0 : PD_T_PS_SOURCE_ON);
@@ -3004,6 +3007,8 @@ static void run_state_machine(struct tcpm_port *port)
 		tcpm_set_state(port, SNK_UNATTACHED, PD_T_PD_DEBOUNCE);
 		break;
 	case SNK_ATTACHED:
+		if (port->cc_req == TYPEC_CC_OPEN)
+			tcpm_set_cc(port, TYPEC_CC_RD);
 		ret = tcpm_snk_attach(port);
 		if (ret < 0)
 			tcpm_set_state(port, SNK_UNATTACHED, 0);
-- 
2.7.4

