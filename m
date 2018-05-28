Return-Path: <SRS0=A7Xe=IP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr00056.outbound.protection.outlook.com ([40.107.0.56]:32004
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753131AbeE1DK3 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 27 May 2018 23:10:29 -0400
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v6 13/15] staging: typec: tcpci: keep the disconnected cc line open
Date: Mon, 28 May 2018 10:52:45 +0800
Message-Id: <1527475967-15201-14-git-send-email-jun.li@nxp.com>
In-Reply-To: <1527475967-15201-1-git-send-email-jun.li@nxp.com>
References: <1527475967-15201-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: cw00.choi@samsung.com, a.hajda@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, garsilva@embeddedor.com, gsomlo@gmail.com, jun.li@nxp.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

While set polarity, we should keep the disconnected cc line to be
open.

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

