Return-Path: <SRS0=m1Og=FU=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-db5eur01on0045.outbound.protection.outlook.com ([104.47.2.45]:3776
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752863AbeBZMEx (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 26 Feb 2018 07:04:53 -0500
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v2 04/12] staging: typec: tcpci: register port before request irq
Date: Mon, 26 Feb 2018 19:49:11 +0800
Message-Id: <1519645759-12701-5-git-send-email-jun.li@nxp.com>
In-Reply-To: <1519645759-12701-1-git-send-email-jun.li@nxp.com>
References: <1519645759-12701-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: a.hajda@samsung.com, mark.rutland@arm.com, jun.li@nxp.com, yueyao@google.com, peter.chen@nxp.com, garsilva@embeddedor.com, o_leveque@orange.fr, shufan_lee@richtek.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

With that we can clear any pending events and the port is registered
so driver can be ready to handle typec events once we request irq.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/staging/typec/tcpci.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
index be6ed16..1db67f0 100644
--- a/drivers/staging/typec/tcpci.c
+++ b/drivers/staging/typec/tcpci.c
@@ -534,15 +534,18 @@ static int tcpci_probe(struct i2c_client *client,
 	/* Disable chip interrupts */
 	tcpci_write16(tcpci, TCPC_ALERT_MASK, 0);
 
+	tcpci->port = tcpm_register_port(tcpci->dev, &tcpci->tcpc);
+	if (IS_ERR(tcpci->port))
+		return PTR_ERR(tcpci->port);
+
 	err = devm_request_threaded_irq(tcpci->dev, client->irq, NULL,
 					tcpci_irq,
 					IRQF_ONESHOT | IRQF_TRIGGER_LOW,
 					dev_name(tcpci->dev), tcpci);
-	if (err < 0)
-		return err;
+	if (err)
+		tcpm_unregister_port(tcpci->port);
 
-	tcpci->port = tcpm_register_port(tcpci->dev, &tcpci->tcpc);
-	return PTR_ERR_OR_ZERO(tcpci->port);
+	return err;
 }
 
 static int tcpci_remove(struct i2c_client *client)
-- 
2.7.4

