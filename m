From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v4 07/13] staging: typec: tcpci: register port before request
 irq
Date: Thu, 29 Mar 2018 00:06:12 +0800
Message-ID: <1522253178-32414-8-git-send-email-jun.li@nxp.com>
References: <1522253178-32414-1-git-send-email-jun.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1522253178-32414-1-git-send-email-jun.li@nxp.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, peter.chen@nxp.com, linux-usb@vger.kernel.org, a.hajda@samsung.com, linux-imx@nxp.com, jun.li@nxp.com, shufan_lee@richtek.com
List-Id: devicetree@vger.kernel.org

With that we can clear any pending events and the port is registered
so driver can be ready to handle typec events once we request irq.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/staging/typec/tcpci.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
index 4f7ad10..9e0014b 100644
--- a/drivers/staging/typec/tcpci.c
+++ b/drivers/staging/typec/tcpci.c
@@ -537,25 +537,26 @@ static int tcpci_probe(struct i2c_client *client,
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
+	if (PTR_ERR_OR_ZERO(chip->tcpci))
+		return PTR_ERR(chip->tcpci);
+
 	err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
 					_tcpci_irq,
 					IRQF_ONESHOT | IRQF_TRIGGER_LOW,
 					dev_name(&client->dev), chip);
 	if (err < 0)
-		return err;
+		tcpci_unregister_port(chip->tcpci);
 
-	chip->tcpci = tcpci_register_port(&client->dev, &chip->data);
-	if (PTR_ERR_OR_ZERO(chip->tcpci))
-		return PTR_ERR(chip->tcpci);
-
-	i2c_set_clientdata(client, chip);
-	return 0;
+	return err;
 }
 
 static int tcpci_remove(struct i2c_client *client)
-- 
2.7.4
