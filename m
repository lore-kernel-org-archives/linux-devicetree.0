Return-Path: <SRS0=xgCA=HW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr10042.outbound.protection.outlook.com ([40.107.1.42]:55200
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751708AbeECAmd (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 2 May 2018 20:42:33 -0400
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v5 13/14] staging: typec: tcpci: Only touch target bit when enable vconn
Date: Thu,  3 May 2018 08:24:53 +0800
Message-Id: <1525307094-27402-14-git-send-email-jun.li@nxp.com>
In-Reply-To: <1525307094-27402-1-git-send-email-jun.li@nxp.com>
References: <1525307094-27402-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: jun.li@nxp.com, a.hajda@samsung.com, cw00.choi@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, gsomlo@gmail.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

We need regmap_update_bits to avoid touch any other bits when
enable or disable vconn.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/staging/typec/tcpci.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
index 5c0c5e3..2818a4d 100644
--- a/drivers/staging/typec/tcpci.c
+++ b/drivers/staging/typec/tcpci.c
@@ -218,12 +218,9 @@ static int tcpci_set_vconn(struct tcpc_dev *tcpc, bool enable)
 			return ret;
 	}
 
-	ret = regmap_write(tcpci->regmap, TCPC_POWER_CTRL,
-			   enable ? TCPC_POWER_CTRL_VCONN_ENABLE : 0);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	return regmap_update_bits(tcpci->regmap, TCPC_POWER_CTRL,
+				TCPC_POWER_CTRL_VCONN_ENABLE,
+				enable ? TCPC_POWER_CTRL_VCONN_ENABLE : 0);
 }
 
 static int tcpci_set_roles(struct tcpc_dev *tcpc, bool attached,
-- 
2.7.4

