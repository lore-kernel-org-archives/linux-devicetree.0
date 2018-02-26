Return-Path: <SRS0=m1Og=FU=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-db5eur01on0051.outbound.protection.outlook.com ([104.47.2.51]:31376
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752919AbeBZMFW (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 26 Feb 2018 07:05:22 -0500
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v2 09/12] staging: typec: tcpci: Only touch target bit when enable vconn
Date: Mon, 26 Feb 2018 19:49:16 +0800
Message-Id: <1519645759-12701-10-git-send-email-jun.li@nxp.com>
In-Reply-To: <1519645759-12701-1-git-send-email-jun.li@nxp.com>
References: <1519645759-12701-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: a.hajda@samsung.com, mark.rutland@arm.com, jun.li@nxp.com, yueyao@google.com, peter.chen@nxp.com, garsilva@embeddedor.com, o_leveque@orange.fr, shufan_lee@richtek.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

We need regmap_update_bits to avoid touch any other bits when
enable or disable vconn.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/staging/typec/tcpci.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
index 7145771..27d53c6 100644
--- a/drivers/staging/typec/tcpci.c
+++ b/drivers/staging/typec/tcpci.c
@@ -213,14 +213,10 @@ static int tcpci_set_polarity(struct tcpc_dev *tcpc,
 static int tcpci_set_vconn(struct tcpc_dev *tcpc, bool enable)
 {
 	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
-	int ret;
 
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

