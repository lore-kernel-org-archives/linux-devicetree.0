Return-Path: <SRS0=pME0=JL=nxp.com=jun.li@kernel.org>
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v7 08/14] staging: typec: tcpci: use IS_ERR() instead of PTR_ERR_OR_ZERO()
Date: Mon, 25 Jun 2018 16:08:40 +0800
Message-Id: <1529914126-22550-9-git-send-email-jun.li@nxp.com>
In-Reply-To: <1529914126-22550-1-git-send-email-jun.li@nxp.com>
References: <1529914126-22550-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
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
