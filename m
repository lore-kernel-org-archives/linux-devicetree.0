From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 02/13] NFC: dts: st21nfcb: Fix compatible string spelling to follow other drivers
Date: Sun, 25 Jan 2015 23:33:20 +0100
Message-ID: <1422225211-27510-3-git-send-email-christophe-h.ricard@st.com>
References: <1422225211-27510-1-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422225211-27510-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Other drivers are following the following compatible string format for =
dts:
s/_/-/

Because some devices may still use the previous string, the new correct=
ed
string is added to the of_device_id table.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 Documentation/devicetree/bindings/net/nfc/st21nfcb.txt | 4 ++--
 drivers/nfc/st21nfcb/i2c.c                             | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/nfc/st21nfcb.txt b/D=
ocumentation/devicetree/bindings/net/nfc/st21nfcb.txt
index 9005608..bb23707 100644
--- a/Documentation/devicetree/bindings/net/nfc/st21nfcb.txt
+++ b/Documentation/devicetree/bindings/net/nfc/st21nfcb.txt
@@ -1,7 +1,7 @@
 * STMicroelectronics SAS. ST21NFCB NFC Controller
=20
 Required properties:
-- compatible: Should be "st,st21nfcb_i2c".
+- compatible: Should be "st,st21nfcb-i2c".
 - clock-frequency: I=C2=B2C work frequency.
 - reg: address on the bus
 - interrupt-parent: phandle for the interrupt gpio controller
@@ -20,7 +20,7 @@ Example (for ARM-based BeagleBoard xM with ST21NFCB o=
n I2C2):
=20
 	st21nfcb: st21nfcb@8 {
=20
-		compatible =3D "st,st21nfcb_i2c";
+		compatible =3D "st,st21nfcb-i2c";
=20
 		reg =3D <0x08>;
 		clock-frequency =3D <400000>;
diff --git a/drivers/nfc/st21nfcb/i2c.c b/drivers/nfc/st21nfcb/i2c.c
index 01ba865..b65847c 100644
--- a/drivers/nfc/st21nfcb/i2c.c
+++ b/drivers/nfc/st21nfcb/i2c.c
@@ -373,6 +373,7 @@ static int st21nfcb_nci_i2c_remove(struct i2c_clien=
t *client)
=20
 #ifdef CONFIG_OF
 static const struct of_device_id of_st21nfcb_i2c_match[] =3D {
+	{ .compatible =3D "st,st21nfcb-i2c", },
 	{ .compatible =3D "st,st21nfcb_i2c", },
 	{}
 };
--=20
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
