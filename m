From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 04/11] NFC: dts: st21nfcb_i2c: Fix invalid interrupts polarity.
Date: Sat, 13 Sep 2014 10:28:46 +0200
Message-ID: <1410596933-5530-5-git-send-email-christophe-h.ricard@st.com>
References: <1410596933-5530-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410596933-5530-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

St21nfcb has a reverse polarity compare to st21nfca.
In st21nfcb case, the irq pin is active high.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 Documentation/devicetree/bindings/net/nfc/st21nfcb.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/nfc/st21nfcb.txt b/Documentation/devicetree/bindings/net/nfc/st21nfcb.txt
index 3b58ae4..9005608 100644
--- a/Documentation/devicetree/bindings/net/nfc/st21nfcb.txt
+++ b/Documentation/devicetree/bindings/net/nfc/st21nfcb.txt
@@ -26,7 +26,7 @@ Example (for ARM-based BeagleBoard xM with ST21NFCB on I2C2):
 		clock-frequency = <400000>;
 
 		interrupt-parent = <&gpio5>;
-		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+		interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
 
 		reset-gpios = <&gpio5 29 GPIO_ACTIVE_HIGH>;
 	};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
