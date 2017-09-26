From: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH resend 05/12] staging: typec: tcpci: register port before request irq
Date: Tue, 26 Sep 2017 12:05:16 +0800
Message-ID: <1506398723-19359-6-git-send-email-jun.li@nxp.com>
References: <1506398723-19359-1-git-send-email-jun.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1506398723-19359-1-git-send-email-jun.li-3arQi8VN3Tc@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: yueyao-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, o_leveque-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org, peter.chen-3arQi8VN3Tc@public.gmane.org, aisheng.dong-3arQi8VN3Tc@public.gmane.org, jun.li-3arQi8VN3Tc@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

With that we can clear any pending events and the port is registered
so driver can be ready to handle typec events once we request irq.

Signed-off-by: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
Signed-off-by: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
---
 drivers/staging/typec/tcpci.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
index 0119453..6d608b4 100644
--- a/drivers/staging/typec/tcpci.c
+++ b/drivers/staging/typec/tcpci.c
@@ -552,15 +552,14 @@ static int tcpci_probe(struct i2c_client *client,
 	/* Disable chip interrupts */
 	tcpci_write16(tcpci, TCPC_ALERT_MASK, 0);
 
-	err = devm_request_threaded_irq(tcpci->dev, client->irq, NULL,
+	tcpci->port = tcpm_register_port(tcpci->dev, &tcpci->tcpc);
+	if (IS_ERR(tcpci->port))
+		return PTR_ERR(tcpci->port);
+
+	return devm_request_threaded_irq(tcpci->dev, client->irq, NULL,
 					tcpci_irq,
 					IRQF_ONESHOT | IRQF_TRIGGER_LOW,
 					dev_name(tcpci->dev), tcpci);
-	if (err < 0)
-		return err;
