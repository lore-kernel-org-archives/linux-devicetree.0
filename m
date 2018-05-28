Return-Path: <SRS0=A7Xe=IP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr00059.outbound.protection.outlook.com ([40.107.0.59]:46304
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753149AbeE1DJ6 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 27 May 2018 23:09:58 -0400
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v6 08/15] staging: typec: tcpci: use IS_ERR() instead of PTR_ERR_OR_ZERO()
Date: Mon, 28 May 2018 10:52:40 +0800
Message-Id: <1527475967-15201-9-git-send-email-jun.li@nxp.com>
In-Reply-To: <1527475967-15201-1-git-send-email-jun.li@nxp.com>
References: <1527475967-15201-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: cw00.choi@samsung.com, a.hajda@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, garsilva@embeddedor.com, gsomlo@gmail.com, jun.li@nxp.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

As tcpm_register_port() and tcpci_register_port() never return
NULL and NULL is not a success in this case, use IS_ERR() to check
the return value of both.

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

