From: Volodymyr Bendiuga <volodymyr.bendiuga-qeDNsGSBLoYwFerOooGFRg@public.gmane.org>
Subject: [PATCH] rtc: pcf8563: Do not disable clk out by default
Date: Fri,  9 Dec 2016 16:03:49 +0100
Message-ID: <1481295829-21974-1-git-send-email-volodymyr.bendiuga@westermo.se>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <rtc-linux+bncBAABBOEQVPBAKGQEQZLRCUI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, volodymyr.bendiuga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <mattias.walstrom-qeDNsGSBLoYwFerOooGFRg@public.gmane.org>, Volodymyr Bendiuga <volodymyr.bendiuga-qeDNsGSBLoYwFerOooGFRg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Mattias Walstr=C3=B6m <mattias.walstrom-qeDNsGSBLoYwFerOooGFRg@public.gmane.org>

Commit a39a6405d5f949bc651694028a disables CLKOUT of
the rtc after power-up to improve power consumption.
This is very useful, but some designs do require to
have the rtc on all the time, otherwise devices will
be bricked. Therefore this patch is a compromise that
works for both cases, where the default case is when
CLKOUT is on. If one wants to disable the CLKOUT,
clkout-allow-disable can be added to devicetree's rtc node.

Signed-off-by: Volodymyr Bendiuga <volodymyr.bendiuga-qeDNsGSBLoYwFerOooGFRg@public.gmane.org>
---
 Documentation/devicetree/bindings/rtc/pcf8563.txt |  1 +
 drivers/rtc/rtc-pcf8563.c                         | 11 +++--------
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/pcf8563.txt b/Documentat=
ion/devicetree/bindings/rtc/pcf8563.txt
index 086c998..0b06a36 100644
--- a/Documentation/devicetree/bindings/rtc/pcf8563.txt
+++ b/Documentation/devicetree/bindings/rtc/pcf8563.txt
@@ -7,6 +7,7 @@ see: Documentation/devicetree/bindings/i2c/trivial-admin-gu=
ide/devices.rst
=20
 Optional property:
 - #clock-cells: Should be 0.
+- clkout-allow-disable: Allow the CLKOUT to be disabled if not used.
 - clock-output-names:
   overwrite the default clock name "pcf8563-clkout"
=20
diff --git a/drivers/rtc/rtc-pcf8563.c b/drivers/rtc/rtc-pcf8563.c
index 1227cea..1489ee9 100644
--- a/drivers/rtc/rtc-pcf8563.c
+++ b/drivers/rtc/rtc-pcf8563.c
@@ -519,18 +519,13 @@ static struct clk *pcf8563_clkout_register_clk(struct=
 pcf8563 *pcf8563)
 	struct device_node *node =3D client->dev.of_node;
 	struct clk *clk;
 	struct clk_init_data init;
-	int ret;
-	unsigned char buf;
-
-	/* disable the clkout output */
-	buf =3D 0;
-	ret =3D pcf8563_write_block_data(client, PCF8563_REG_CLKO, 1, &buf);
-	if (ret < 0)
-		return ERR_PTR(ret);
=20
 	init.name =3D "pcf8563-clkout";
 	init.ops =3D &pcf8563_clkout_ops;
+
+	/* disable the clkout output only if it is allowed in devicetree */
 	init.flags =3D 0;
+	init.flags |=3D !of_property_read_bool(node, "clkout-allow-disable") ? CL=
K_IGNORE_UNUSED : 0;
 	init.parent_names =3D NULL;
 	init.num_parents =3D 0;
 	pcf8563->clkout_hw.init =3D &init;
--=20
2.7.4

--=20
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
---=20
You received this message because you are subscribed to the Google Groups "=
rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
