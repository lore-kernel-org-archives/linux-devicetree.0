Return-Path: <SRS0=A7Xe=IP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr00043.outbound.protection.outlook.com ([40.107.0.43]:28192
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753149AbeE1DKK (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 27 May 2018 23:10:10 -0400
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v6 10/15] staging: typec: tcpci: enable vbus detection
Date: Mon, 28 May 2018 10:52:42 +0800
Message-Id: <1527475967-15201-11-git-send-email-jun.li@nxp.com>
In-Reply-To: <1527475967-15201-1-git-send-email-jun.li@nxp.com>
References: <1527475967-15201-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: cw00.choi@samsung.com, a.hajda@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, garsilva@embeddedor.com, gsomlo@gmail.com, jun.li@nxp.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

TCPCI implementation may need SW to enable VBUS detection to generate
power status events.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
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

