From: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 1/2] dt-bindings: drm/bridge: Add IT6151 bridge chip driver bindings.
Date: Wed, 11 Mar 2015 11:25:55 +0800
Message-ID: <1426044356-54844-1-git-send-email-ck.hu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add devicetree bindings for IT6151 MIPI to eDP bridge chip driver.
---
 Documentation/devicetree/bindings/drm/bridge/it6151.txt | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/drm/bridge/it6151.txt

diff --git a/Documentation/devicetree/bindings/drm/bridge/it6151.txt b/Documentation/devicetree/bindings/drm/bridge/it6151.txt
new file mode 100644
index 0000000..ad0ad60
--- /dev/null
+++ b/Documentation/devicetree/bindings/drm/bridge/it6151.txt
@@ -0,0 +1,15 @@
+it6151 bridge bindings
+
+Required properties:
+	- compatible: "ite,it6151"
+	- reg: i2c address of the bridge's dp tx.
+	- rxreg: i2c address of the bridge's mipi rx.
+	- reset-gpio: OF device-tree gpio specification
+
+Example:
+	ite6151: edp-bridge@5c {
+		compatible = "ite,it6151";
+		reg = <0x5c>;
+		rxreg = <0x6c>;
+		reset-gpio = <&pio 94 GPIO_ACTIVE_HIGH>;
+	};
-- 
1.8.1.1.dirty

************* Email Confidentiality Notice ********************
The information contained in this e-mail message (including any 
attachments) may be confidential, proprietary, privileged, or otherwise
exempt from disclosure under applicable laws. It is intended to be 
conveyed only to the designated recipient(s). Any use, dissemination, 
distribution, printing, retaining or copying of this e-mail (including its 
attachments) by unintended recipient(s) is strictly prohibited and may 
be unlawful. If you are not an intended recipient of this e-mail, or believe 
that you have received this e-mail in error, please notify the sender 
immediately (by replying to this e-mail), delete any and all copies of 
this e-mail (including any attachments) from your system, and do not
disclose the content of this e-mail to any other person. Thank you!
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
