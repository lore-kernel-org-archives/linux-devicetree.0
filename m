From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 09/11] NFC: st21nfcb: remove error output
Date: Sat, 13 Sep 2014 10:28:51 +0200
Message-ID: <1410596933-5530-10-git-send-email-christophe-h.ricard@st.com>
References: <1410596933-5530-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410596933-5530-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

In case we are not able to read out the NDLC/NCI header, we do not
consider this as an issue and we will give a later chance.
The NDLC layer will handle errors thanks to its internal timers.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfcb/i2c.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/nfc/st21nfcb/i2c.c b/drivers/nfc/st21nfcb/i2c.c
index 0b8f721..c5d2427 100644
--- a/drivers/nfc/st21nfcb/i2c.c
+++ b/drivers/nfc/st21nfcb/i2c.c
@@ -156,10 +156,8 @@ static int st21nfcb_nci_i2c_read(struct st21nfcb_i2c_phy *phy,
 		r = i2c_master_recv(client, buf, ST21NFCB_NCI_I2C_MIN_SIZE);
 	}
 
-	if (r != ST21NFCB_NCI_I2C_MIN_SIZE) {
-		nfc_err(&client->dev, "cannot read ndlc & nci header\n");
+	if (r != ST21NFCB_NCI_I2C_MIN_SIZE)
 		return -EREMOTEIO;
-	}
 
 	len = be16_to_cpu(*(__be16 *) (buf + 2));
 	if (len > ST21NFCB_NCI_I2C_MAX_SIZE) {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
