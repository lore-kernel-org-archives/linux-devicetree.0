Return-Path: <SRS0=Dkm/=JL=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-db5eur01on0088.outbound.protection.outlook.com ([104.47.2.88]:4509
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753288AbeFYI0u (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 25 Jun 2018 04:26:50 -0400
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v7 12/14] staging: typec: tcpci: keep the disconnected cc line open
Date: Mon, 25 Jun 2018 16:08:44 +0800
Message-Id: <1529914126-22550-13-git-send-email-jun.li@nxp.com>
In-Reply-To: <1529914126-22550-1-git-send-email-jun.li@nxp.com>
References: <1529914126-22550-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: a.hajda@samsung.com, jun.li@nxp.com, cw00.choi@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

While set polarity, we should keep the disconnected cc line to be
open.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/staging/typec/tcpci.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
index 4d3b0ae..11c2d37 100644
--- a/drivers/staging/typec/tcpci.c
+++ b/drivers/staging/typec/tcpci.c
@@ -185,15 +185,25 @@ static int tcpci_set_polarity(struct tcpc_dev *tcpc,
 			      enum typec_cc_polarity polarity)
 {
 	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
+	unsigned int reg;
 	int ret;
 
-	ret = regmap_write(tcpci->regmap, TCPC_TCPC_CTRL,
-			   (polarity == TYPEC_POLARITY_CC2) ?
-			   TCPC_TCPC_CTRL_ORIENTATION : 0);
+	/* Keep the disconnect cc line open */
+	ret = regmap_read(tcpci->regmap, TCPC_ROLE_CTRL, &reg);
 	if (ret < 0)
 		return ret;
 
-	return 0;
+	if (polarity == TYPEC_POLARITY_CC2)
+		reg |= TCPC_ROLE_CTRL_CC_OPEN << TCPC_ROLE_CTRL_CC1_SHIFT;
+	else
+		reg |= TCPC_ROLE_CTRL_CC_OPEN << TCPC_ROLE_CTRL_CC2_SHIFT;
+	ret = regmap_write(tcpci->regmap, TCPC_ROLE_CTRL, reg);
+	if (ret < 0)
+		return ret;
+
+	return regmap_write(tcpci->regmap, TCPC_TCPC_CTRL,
+			   (polarity == TYPEC_POLARITY_CC2) ?
+			   TCPC_TCPC_CTRL_ORIENTATION : 0);
 }
 
 static int tcpci_set_vconn(struct tcpc_dev *tcpc, bool enable)
-- 
2.7.4

