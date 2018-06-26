Return-Path: <SRS0=bntt=JN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr00042.outbound.protection.outlook.com ([40.107.0.42]:44438
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S932104AbeF0ADS (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 26 Jun 2018 20:03:18 -0400
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v8 10/14] staging: typec: tcpci: enable vbus detection
Date: Wed, 27 Jun 2018 07:45:28 +0800
Message-Id: <1530056732-9640-11-git-send-email-jun.li@nxp.com>
In-Reply-To: <1530056732-9640-1-git-send-email-jun.li@nxp.com>
References: <1530056732-9640-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: a.hajda@samsung.com, jun.li@nxp.com, cw00.choi@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

TCPCI implementation may need SW to enable VBUS detection to generate
power status events.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/staging/typec/tcpci.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
index 3b35fce..4d3b0ae 100644
--- a/drivers/staging/typec/tcpci.c
+++ b/drivers/staging/typec/tcpci.c
@@ -373,6 +373,12 @@ static int tcpci_init(struct tcpc_dev *tcpc)
 	if (ret < 0)
 		return ret;
 
+	/* Enable Vbus detection */
+	ret = regmap_write(tcpci->regmap, TCPC_COMMAND,
+			   TCPC_CMD_ENABLE_VBUS_DETECT);
+	if (ret < 0)
+		return ret;
+
 	reg = TCPC_ALERT_TX_SUCCESS | TCPC_ALERT_TX_FAILED |
 		TCPC_ALERT_TX_DISCARDED | TCPC_ALERT_RX_STATUS |
 		TCPC_ALERT_RX_HARD_RST | TCPC_ALERT_CC_STATUS;
-- 
2.7.4

