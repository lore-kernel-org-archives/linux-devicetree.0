From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 10/13] NFC: st21nfca: Report error returned by functions instead of -ENODEV
Date: Tue,  2 Dec 2014 21:27:55 +0100
Message-ID: <1417552078-9269-11-git-send-email-christophe-h.ricard@st.com>
References: <1417552078-9269-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417552078-9269-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Report error returned by devm_gpio_request_one or
st21nfca_hci_platform_init instead of -ENODEV.

Reported-by: Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfca/i2c.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/nfc/st21nfca/i2c.c b/drivers/nfc/st21nfca/i2c.c
index a9188c2..c0352a9 100644
--- a/drivers/nfc/st21nfca/i2c.c
+++ b/drivers/nfc/st21nfca/i2c.c
@@ -530,7 +530,7 @@ static int st21nfca_hci_i2c_of_request_resources(struct i2c_client *client)
 				  "clf_enable");
 	if (r) {
 		nfc_err(&client->dev, "Failed to request enable pin\n");
-		return -ENODEV;
+		return r;
 	}
 
 	phy->gpio_ena = gpio;
@@ -567,7 +567,7 @@ static int st21nfca_hci_i2c_request_resources(struct i2c_client *client)
 					  GPIOF_OUT_INIT_HIGH, "clf_enable");
 		if (r) {
 			pr_err("%s : ena gpio_request failed\n", __FILE__);
-			return -ENODEV;
+			return r;
 		}
 	}
 
@@ -628,7 +628,7 @@ static int st21nfca_hci_i2c_probe(struct i2c_client *client,
 	r = st21nfca_hci_platform_init(phy);
 	if (r < 0) {
 		nfc_err(&client->dev, "Unable to reboot st21nfca\n");
-		return -ENODEV;
+		return r;
 	}
 
 	r = devm_request_threaded_irq(&client->dev, client->irq, NULL,
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
