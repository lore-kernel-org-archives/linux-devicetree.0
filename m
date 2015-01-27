From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 10/10] NFC: dts: st21nfca: Document ese-present & uicc-present DTS property
Date: Tue, 27 Jan 2015 01:18:20 +0100
Message-ID: <1422317900-3810-11-git-send-email-christophe-h.ricard@st.com>
References: <1422317900-3810-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422317900-3810-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On st21nfca, the mechanism to enable a secure element needs to add 2
properties in order manage the SWP line correctly.

Document ese-present and uicc-present properties.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 Documentation/devicetree/bindings/net/nfc/st21nfca.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/nfc/st21nfca.txt b/Documentation/devicetree/bindings/net/nfc/st21nfca.txt
index db677fe..7bb2e21 100644
--- a/Documentation/devicetree/bindings/net/nfc/st21nfca.txt
+++ b/Documentation/devicetree/bindings/net/nfc/st21nfca.txt
@@ -11,6 +11,10 @@ Required properties:
 Optional SoC Specific Properties:
 - pinctrl-names: Contains only one value - "default".
 - pintctrl-0: Specifies the pin control groups used for this controller.
+- ese-present: Specifies that an ese is physically connected to the nfc
+controller.
+- uicc-present: Specifies that the uicc swp signal can be physically
+connected to the nfc controller.
 
 Example (for ARM-based BeagleBoard xM with ST21NFCA on I2C2):
 
@@ -29,5 +33,8 @@ Example (for ARM-based BeagleBoard xM with ST21NFCA on I2C2):
 		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
 
 		enable-gpios = <&gpio5 29 GPIO_ACTIVE_HIGH>;
+
+		ese-present;
+		uicc-present;
 	};
 };
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
