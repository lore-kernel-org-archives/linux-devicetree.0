Return-Path: <SRS0=bntt=JN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-he1eur01on0086.outbound.protection.outlook.com ([104.47.0.86]:50463
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S932104AbeF0ADI (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 26 Jun 2018 20:03:08 -0400
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v8 08/14] staging: typec: tcpci: use IS_ERR() instead of PTR_ERR_OR_ZERO()
Date: Wed, 27 Jun 2018 07:45:26 +0800
Message-Id: <1530056732-9640-9-git-send-email-jun.li@nxp.com>
In-Reply-To: <1530056732-9640-1-git-send-email-jun.li@nxp.com>
References: <1530056732-9640-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: a.hajda@samsung.com, jun.li@nxp.com, cw00.choi@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

As tcpm_register_port() and tcpci_register_port() never return
NULL and NULL is not a success in this case, use IS_ERR() to check
the return value of both.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/staging/typec/tcpci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
index 076498a..b63f147 100644
--- a/drivers/staging/typec/tcpci.c
+++ b/drivers/staging/typec/tcpci.c
@@ -509,7 +509,7 @@ struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data)
 		return ERR_PTR(err);
 
 	tcpci->port = tcpm_register_port(tcpci->dev, &tcpci->tcpc);
-	if (PTR_ERR_OR_ZERO(tcpci->port))
+	if (IS_ERR(tcpci->port))
 		return ERR_CAST(tcpci->port);
 
 	return tcpci;
@@ -551,7 +551,7 @@ static int tcpci_probe(struct i2c_client *client,
 		return err;
 
 	chip->tcpci = tcpci_register_port(&client->dev, &chip->data);
-	if (PTR_ERR_OR_ZERO(chip->tcpci))
+	if (IS_ERR(chip->tcpci))
 		return PTR_ERR(chip->tcpci);
 
 	i2c_set_clientdata(client, chip);
-- 
2.7.4

