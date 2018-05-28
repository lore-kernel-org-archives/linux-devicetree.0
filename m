Return-Path: <SRS0=A7Xe=IP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr00073.outbound.protection.outlook.com ([40.107.0.73]:32576
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753149AbeE1DKE (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 27 May 2018 23:10:04 -0400
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v6 09/15] staging: typec: tcpci: register port before request irq
Date: Mon, 28 May 2018 10:52:41 +0800
Message-Id: <1527475967-15201-10-git-send-email-jun.li@nxp.com>
In-Reply-To: <1527475967-15201-1-git-send-email-jun.li@nxp.com>
References: <1527475967-15201-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: cw00.choi@samsung.com, a.hajda@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, garsilva@embeddedor.com, gsomlo@gmail.com, jun.li@nxp.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

From: Peter Chen <peter.chen@nxp.com>

With that we can clear any pending events and the port is registered
so driver can be ready to handle typec events once we request irq.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/staging/typec/tcpci.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
index b63f147..3b35fce 100644
--- a/drivers/staging/typec/tcpci.c
+++ b/drivers/staging/typec/tcpci.c
@@ -537,24 +537,27 @@ static int tcpci_probe(struct i2c_client *client,
 	if (IS_ERR(chip->data.regmap))
 		return PTR_ERR(chip->data.regmap);
 
+	i2c_set_clientdata(client, chip);
+
 	/* Disable chip interrupts before requesting irq */
 	err = regmap_raw_write(chip->data.regmap, TCPC_ALERT_MASK, &val,
 			       sizeof(u16));
 	if (err < 0)
 		return err;
 
+	chip->tcpci = tcpci_register_port(&client->dev, &chip->data);
+	if (IS_ERR(chip->tcpci))
+		return PTR_ERR(chip->tcpci);
+
 	err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
 					_tcpci_irq,
 					IRQF_ONESHOT | IRQF_TRIGGER_LOW,
 					dev_name(&client->dev), chip);
-	if (err < 0)
+	if (err < 0) {
+		tcpci_unregister_port(chip->tcpci);
 		return err;
+	}
 
-	chip->tcpci = tcpci_register_port(&client->dev, &chip->data);
-	if (IS_ERR(chip->tcpci))
-		return PTR_ERR(chip->tcpci);
-
-	i2c_set_clientdata(client, chip);
 	return 0;
 }
 
-- 
2.7.4

