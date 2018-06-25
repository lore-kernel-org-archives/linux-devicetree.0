Return-Path: <SRS0=pME0=JL=nxp.com=jun.li@kernel.org>
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v7 10/14] staging: typec: tcpci: enable vbus detection
Date: Mon, 25 Jun 2018 16:08:42 +0800
Message-Id: <1529914126-22550-11-git-send-email-jun.li@nxp.com>
In-Reply-To: <1529914126-22550-1-git-send-email-jun.li@nxp.com>
References: <1529914126-22550-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
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
