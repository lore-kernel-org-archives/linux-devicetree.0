From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 11/13] NFC: st21nfcb: Report error returned by st21nfcb_nci_i2c_request_resources instead of -ENODEV
Date: Tue,  2 Dec 2014 21:27:56 +0100
Message-ID: <1417552078-9269-12-git-send-email-christophe-h.ricard@st.com>
References: <1417552078-9269-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417552078-9269-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Report error returned by devm_gpio_request_one instead of -ENODEV.

Reported-by: Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfcb/i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/st21nfcb/i2c.c b/drivers/nfc/st21nfcb/i2c.c
index 002420b..4698a8a 100644
--- a/drivers/nfc/st21nfcb/i2c.c
+++ b/drivers/nfc/st21nfcb/i2c.c
@@ -255,7 +255,7 @@ static int st21nfcb_nci_i2c_of_request_resources(struct i2c_client *client)
 				GPIOF_OUT_INIT_HIGH, "clf_reset");
 	if (r) {
 		nfc_err(&client->dev, "Failed to request reset pin\n");
-		return -ENODEV;
+		return r;
 	}
 	phy->gpio_reset = gpio;
 
@@ -290,7 +290,7 @@ static int st21nfcb_nci_i2c_request_resources(struct i2c_client *client)
 			phy->gpio_reset, GPIOF_OUT_INIT_HIGH, "clf_reset");
 	if (r) {
 		pr_err("%s : reset gpio_request failed\n", __FILE__);
-		return -ENODEV;
+		return r;
 	}
 
 	return 0;
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
