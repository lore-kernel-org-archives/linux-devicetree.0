Return-Path: <SRS0=bntt=JN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr00087.outbound.protection.outlook.com ([40.107.0.87]:56349
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S934331AbeF0ADd (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 26 Jun 2018 20:03:33 -0400
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v8 13/14] staging: typec: tcpci: Only touch target bit when enable vconn
Date: Wed, 27 Jun 2018 07:45:31 +0800
Message-Id: <1530056732-9640-14-git-send-email-jun.li@nxp.com>
In-Reply-To: <1530056732-9640-1-git-send-email-jun.li@nxp.com>
References: <1530056732-9640-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: a.hajda@samsung.com, jun.li@nxp.com, cw00.choi@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

We need regmap_update_bits to avoid touch any other bits when
enable or disable vconn.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/staging/typec/tcpci.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
index 11c2d37..ac6b418 100644
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

