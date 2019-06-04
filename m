From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 03/13] media: rc: sunxi: Add A31 compatible
Date: Tue,  4 Jun 2019 18:29:49 +0200
Message-ID: <20190604162959.29199-4-peron.clem@gmail.com>
References: <20190604162959.29199-1-peron.clem@gmail.com>
Reply-To: peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCELXIX7UICBBENZ3LTQKGQEE4AR7TQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190604162959.29199-1-peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sean Young <sean-hENCXIMQXOg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Allwiner A31 has a different memory mapping so add the compatible
we will need it later.

Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Acked-by: Sean Young <sean-hENCXIMQXOg@public.gmane.org>
---
 drivers/media/rc/sunxi-cir.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index d02dcb6fd0a5..0504ebfc831f 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -343,6 +343,11 @@ static const struct sunxi_ir_quirks sun5i_a13_ir_quirk=
s =3D {
 	.fifo_size =3D 64,
 };
=20
+static const struct sunxi_ir_quirks sun6i_a31_ir_quirks =3D {
+	.has_reset =3D true,
+	.fifo_size =3D 64,
+};
+
 static const struct of_device_id sunxi_ir_match[] =3D {
 	{
 		.compatible =3D "allwinner,sun4i-a10-ir",
@@ -352,6 +357,10 @@ static const struct of_device_id sunxi_ir_match[] =3D =
{
 		.compatible =3D "allwinner,sun5i-a13-ir",
 		.data =3D &sun5i_a13_ir_quirks,
 	},
+	{
+		.compatible =3D "allwinner,sun6i-a31-ir",
+		.data =3D &sun6i_a31_ir_quirks,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, sunxi_ir_match);
--=20
2.20.1

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
To view this discussion on the web, visit https://groups.google.com/d/msgid=
/linux-sunxi/20190604162959.29199-4-peron.clem%40gmail.com.
For more options, visit https://groups.google.com/d/optout.
