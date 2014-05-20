From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] NFC: dts: st21nfca_i2c: Correct minor typo in documentation
Date: Tue, 20 May 2014 21:45:04 +0200
Message-ID: <1400615104-3864-1-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Replaced st,st21nfca-i2c by st,st21nfca_i2c to be concistent
with below configuration and driver in drivers/nfc/st21nfca/

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 Documentation/devicetree/bindings/net/nfc/st21nfca.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/nfc/st21nfca.txt b/D=
ocumentation/devicetree/bindings/net/nfc/st21nfca.txt
index 4724fe6..e4faa2e 100644
--- a/Documentation/devicetree/bindings/net/nfc/st21nfca.txt
+++ b/Documentation/devicetree/bindings/net/nfc/st21nfca.txt
@@ -1,7 +1,7 @@
 * STMicroelectronics SAS. ST21NFCA NFC Controller
=20
 Required properties:
-- compatible: Should be "st,st21nfca-i2c".
+- compatible: Should be "st,st21nfca_i2c".
 - clock-frequency: I=C2=B2C work frequency.
 - reg: address on the bus
 - interrupt-parent: phandle for the interrupt gpio controller
--=20
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
