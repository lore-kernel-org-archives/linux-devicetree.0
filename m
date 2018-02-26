Return-Path: <SRS0=m1Og=FU=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-db5eur01on0078.outbound.protection.outlook.com ([104.47.2.78]:29115
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752909AbeBZMFK (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 26 Feb 2018 07:05:10 -0500
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v2 07/12] staging: typec: tcpci: correct drp toggling
Date: Mon, 26 Feb 2018 19:49:14 +0800
Message-Id: <1519645759-12701-8-git-send-email-jun.li@nxp.com>
In-Reply-To: <1519645759-12701-1-git-send-email-jun.li@nxp.com>
References: <1519645759-12701-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: a.hajda@samsung.com, mark.rutland@arm.com, jun.li@nxp.com, yueyao@google.com, peter.chen@nxp.com, garsilva@embeddedor.com, o_leveque@orange.fr, shufan_lee@richtek.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

Per tcpci spec 4.4.5.2 ROLE_CONTROL description: "the TCPM shall
write B6 (DRP) =1b and the starting value of Rp/Rd to B3..0 (CC1/CC2)
to indicate DRP autonomous toggling mode to the TCPC", so add CC1/CC2
setting, also we should issue COMMAND.Look4Connection to start it.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/staging/typec/tcpci.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
index 953fc97..530a5d7 100644
--- a/drivers/staging/typec/tcpci.c
+++ b/drivers/staging/typec/tcpci.c
@@ -109,6 +109,7 @@ static int tcpci_start_drp_toggling(struct tcpc_dev *tcpc,
 {
 	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
 	unsigned int reg = TCPC_ROLE_CTRL_DRP;
+	int ret;
 
 	switch (cc) {
 	default:
@@ -126,7 +127,19 @@ static int tcpci_start_drp_toggling(struct tcpc_dev *tcpc,
 		break;
 	}
 
-	return regmap_write(tcpci->regmap, TCPC_ROLE_CTRL, reg);
+	if (cc == TYPEC_CC_RD)
+		reg |= (TCPC_ROLE_CTRL_CC_RD << TCPC_ROLE_CTRL_CC1_SHIFT) |
+			(TCPC_ROLE_CTRL_CC_RD << TCPC_ROLE_CTRL_CC2_SHIFT);
+	else
+		reg |= (TCPC_ROLE_CTRL_CC_RP << TCPC_ROLE_CTRL_CC1_SHIFT) |
+			(TCPC_ROLE_CTRL_CC_RP << TCPC_ROLE_CTRL_CC2_SHIFT);
+
+	ret = regmap_write(tcpci->regmap, TCPC_ROLE_CTRL, reg);
+	if (ret < 0)
+		return ret;
+
+	return regmap_write(tcpci->regmap, TCPC_COMMAND,
+				TCPC_CMD_LOOK4CONNECTION);
 }
 
 static enum typec_cc_status tcpci_to_typec_cc(unsigned int cc, bool sink)
-- 
2.7.4

