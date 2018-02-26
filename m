Return-Path: <SRS0=m1Og=FU=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-he1eur01on0073.outbound.protection.outlook.com ([104.47.0.73]:64918
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752877AbeBZME7 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 26 Feb 2018 07:04:59 -0500
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v2 05/12] staging: typec: tcpci: enable vbus detection
Date: Mon, 26 Feb 2018 19:49:12 +0800
Message-Id: <1519645759-12701-6-git-send-email-jun.li@nxp.com>
In-Reply-To: <1519645759-12701-1-git-send-email-jun.li@nxp.com>
References: <1519645759-12701-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: a.hajda@samsung.com, mark.rutland@arm.com, jun.li@nxp.com, yueyao@google.com, peter.chen@nxp.com, garsilva@embeddedor.com, o_leveque@orange.fr, shufan_lee@richtek.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

TCPCI implementation may need SW to enable VBUS detection to generate
power status events.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
Change for v2:
- Directly enable vbus detect in tcpci_init rather than adding a API.

 drivers/staging/typec/tcpci.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
index 1db67f0..953fc97 100644
--- a/drivers/staging/typec/tcpci.c
+++ b/drivers/staging/typec/tcpci.c
@@ -345,6 +345,12 @@ static int tcpci_init(struct tcpc_dev *tcpc)
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

