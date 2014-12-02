From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 08/13] NFC: dts: st21nfca: Fix compatible string spelling to follow other drivers
Date: Tue,  2 Dec 2014 21:27:53 +0100
Message-ID: <1417552078-9269-9-git-send-email-christophe-h.ricard@st.com>
References: <1417552078-9269-1-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417552078-9269-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Other drivers are following the following compatible string format for =
dts:
s/_/-/

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 Documentation/devicetree/bindings/net/nfc/st21nfca.txt | 4 ++--
 drivers/nfc/st21nfca/i2c.c                             | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/nfc/st21nfca.txt b/D=
ocumentation/devicetree/bindings/net/nfc/st21nfca.txt
index e4faa2e..db677fe 100644
--- a/Documentation/devicetree/bindings/net/nfc/st21nfca.txt
+++ b/Documentation/devicetree/bindings/net/nfc/st21nfca.txt
@@ -1,7 +1,7 @@
 * STMicroelectronics SAS. ST21NFCA NFC Controller
=20
 Required properties:
-- compatible: Should be "st,st21nfca_i2c".
+- compatible: Should be "st,st21nfca-i2c".
 - clock-frequency: I=C2=B2C work frequency.
 - reg: address on the bus
 - interrupt-parent: phandle for the interrupt gpio controller
@@ -20,7 +20,7 @@ Example (for ARM-based BeagleBoard xM with ST21NFCA o=
n I2C2):
=20
 	st21nfca: st21nfca@1 {
=20
-		compatible =3D "st,st21nfca_i2c";
+		compatible =3D "st,st21nfca-i2c";
=20
 		reg =3D <0x01>;
 		clock-frequency =3D <400000>;
diff --git a/drivers/nfc/st21nfca/i2c.c b/drivers/nfc/st21nfca/i2c.c
index 44e1c76..a9188c2 100644
--- a/drivers/nfc/st21nfca/i2c.c
+++ b/drivers/nfc/st21nfca/i2c.c
@@ -661,7 +661,7 @@ static int st21nfca_hci_i2c_remove(struct i2c_clien=
t *client)
=20
 #ifdef CONFIG_OF
 static const struct of_device_id of_st21nfca_i2c_match[] =3D {
-	{ .compatible =3D "st,st21nfca_i2c", },
+	{ .compatible =3D "st,st21nfca-i2c", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, of_st21nfca_i2c_match);
--=20
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
