Return-Path: <SRS0=m1Og=FU=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-db5eur01on0067.outbound.protection.outlook.com ([104.47.2.67]:46304
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752918AbeBZMFQ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 26 Feb 2018 07:05:16 -0500
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v2 08/12] staging: typec: tcpci: keep the uncontact cc line open
Date: Mon, 26 Feb 2018 19:49:15 +0800
Message-Id: <1519645759-12701-9-git-send-email-jun.li@nxp.com>
In-Reply-To: <1519645759-12701-1-git-send-email-jun.li@nxp.com>
References: <1519645759-12701-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: a.hajda@samsung.com, mark.rutland@arm.com, jun.li@nxp.com, yueyao@google.com, peter.chen@nxp.com, garsilva@embeddedor.com, o_leveque@orange.fr, shufan_lee@richtek.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

While set polarity, we should keep the disconnected cc line to be
open when attached.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
Change for v2:
- Set the uncontact cc line to be open when set polarity, this way,
  we don't need change set_cc api.

 drivers/staging/typec/tcpci.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
index 530a5d7..7145771 100644
--- a/drivers/staging/typec/tcpci.c
+++ b/drivers/staging/typec/tcpci.c
@@ -184,6 +184,7 @@ static int tcpci_set_polarity(struct tcpc_dev *tcpc,
 			      enum typec_cc_polarity polarity)
 {
 	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
+	unsigned int reg;
 	int ret;
 
 	ret = regmap_write(tcpci->regmap, TCPC_TCPC_CTRL,
@@ -192,6 +193,20 @@ static int tcpci_set_polarity(struct tcpc_dev *tcpc,
 	if (ret < 0)
 		return ret;
 
+	ret = regmap_read(tcpci->regmap, TCPC_ROLE_CTRL, &reg);
+	if (ret < 0)
+		return ret;
+
+	if (polarity == TYPEC_POLARITY_CC2)
+		ret = TCPC_ROLE_CTRL_CC1_SHIFT;
+	else
+		ret = TCPC_ROLE_CTRL_CC2_SHIFT;
+	reg |= TCPC_ROLE_CTRL_CC_OPEN << ret;
+	reg &= ~TCPC_ROLE_CTRL_DRP;
+	ret = regmap_write(tcpci->regmap, TCPC_ROLE_CTRL, reg);
+	if (ret < 0)
+		return ret;
+
 	return 0;
 }
 
-- 
2.7.4

