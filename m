From: Christophe Ricard <christophe.ricard@gmail.com>
Subject: [RFC v1 04/14] nfc: st21nfcb: Do not remove header once the payload is sent
Date: Fri,  1 May 2015 22:19:27 +0200
Message-ID: <1430511577-19678-5-git-send-email-christophe-h.ricard@st.com>
References: <1430511577-19678-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1430511577-19678-1-git-send-email-christophe-h.ricard@st.com>
Sender: stable-owner@vger.kernel.org
To: sameo@linux.intel.com
Cc: linux-nfc@lists.01.org, christophe-h.ricard@st.com, devicetree@vger.kernel.org, christophe.ricard@gmail.com, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Once the data is sent, we need to preserve the full frame for the ndlc
state machine. If the NDLC ACK is not received in time, the ndlc layer
will resend the same frame.
Having the header byte pulled will corrupt the frame.

Cc: stable@vger.kernel.org
Signed-off-by: Christophe Ricard <christophe-h.ricard@st.com>
---
 drivers/nfc/st21nfcb/i2c.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/nfc/st21nfcb/i2c.c b/drivers/nfc/st21nfcb/i2c.c
index 76a4cad..4bc15ec 100644
--- a/drivers/nfc/st21nfcb/i2c.c
+++ b/drivers/nfc/st21nfcb/i2c.c
@@ -87,11 +87,6 @@ static void st21nfcb_nci_i2c_disable(void *phy_id)
 	gpio_set_value(phy->gpio_reset, 1);
 }
 
-static void st21nfcb_nci_remove_header(struct sk_buff *skb)
-{
-	skb_pull(skb, ST21NFCB_FRAME_HEADROOM);
-}
-
 /*
  * Writing a frame must not return the number of written bytes.
  * It must return either zero for success, or <0 for error.
@@ -121,8 +116,6 @@ static int st21nfcb_nci_i2c_write(void *phy_id, struct sk_buff *skb)
 			r = 0;
 	}
 
-	st21nfcb_nci_remove_header(skb);
-
 	return r;
 }
 
-- 
2.1.4
