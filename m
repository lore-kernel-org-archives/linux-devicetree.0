From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 02/13] media: rc: Introduce sunxi_ir_quirks
Date: Tue,  4 Jun 2019 18:29:48 +0200
Message-ID: <20190604162959.29199-3-peron.clem@gmail.com>
References: <20190604162959.29199-1-peron.clem@gmail.com>
Reply-To: peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCELXIX7UICBBEFZ3LTQKGQEFXLG3WA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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

This driver is used in various Allwinner SoC with different configuration.

Introduce a quirks struct to know the fifo size and if a reset is required.

Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Acked-by: Sean Young <sean-hENCXIMQXOg@public.gmane.org>
---
 drivers/media/rc/sunxi-cir.c | 61 +++++++++++++++++++++++++++---------
 1 file changed, 47 insertions(+), 14 deletions(-)

diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index 307e44714ea0..d02dcb6fd0a5 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -81,6 +81,17 @@
 /* Time after which device stops sending data in ms */
 #define SUNXI_IR_TIMEOUT      120
=20
+/**
+ * struct sunxi_ir_quirks - Differences between SoC variants.
+ *
+ * @has_reset: SoC needs reset deasserted.
+ * @fifo_size: size of the fifo.
+ */
+struct sunxi_ir_quirks {
+	bool		has_reset;
+	int		fifo_size;
+};
+
 struct sunxi_ir {
 	spinlock_t      ir_lock;
 	struct rc_dev   *rc;
@@ -143,6 +154,7 @@ static int sunxi_ir_probe(struct platform_device *pdev)
=20
 	struct device *dev =3D &pdev->dev;
 	struct device_node *dn =3D dev->of_node;
+	const struct sunxi_ir_quirks *quirks;
 	struct resource *res;
 	struct sunxi_ir *ir;
 	u32 b_clk_freq =3D SUNXI_IR_BASE_CLK;
@@ -151,12 +163,15 @@ static int sunxi_ir_probe(struct platform_device *pde=
v)
 	if (!ir)
 		return -ENOMEM;
=20
+	quirks =3D of_device_get_match_data(&pdev->dev);
+	if (quirks =3D=3D NULL) {
+		dev_err(&pdev->dev, "Failed to determine the quirks to use\n");
+		return -ENODEV;
+	}
+
 	spin_lock_init(&ir->ir_lock);
=20
-	if (of_device_is_compatible(dn, "allwinner,sun5i-a13-ir"))
-		ir->fifo_size =3D 64;
-	else
-		ir->fifo_size =3D 16;
+	ir->fifo_size =3D quirks->fifo_size;
=20
 	/* Clock */
 	ir->apb_clk =3D devm_clk_get(dev, "apb");
@@ -173,13 +188,15 @@ static int sunxi_ir_probe(struct platform_device *pde=
v)
 	/* Base clock frequency (optional) */
 	of_property_read_u32(dn, "clock-frequency", &b_clk_freq);
=20
-	/* Reset (optional) */
-	ir->rst =3D devm_reset_control_get_optional_exclusive(dev, NULL);
-	if (IS_ERR(ir->rst))
-		return PTR_ERR(ir->rst);
-	ret =3D reset_control_deassert(ir->rst);
-	if (ret)
-		return ret;
+	/* Reset */
+	if (quirks->has_reset) {
+		ir->rst =3D devm_reset_control_get_exclusive(dev, NULL);
+		if (IS_ERR(ir->rst))
+			return PTR_ERR(ir->rst);
+		ret =3D reset_control_deassert(ir->rst);
+		if (ret)
+			return ret;
+	}
=20
 	ret =3D clk_set_rate(ir->clk, b_clk_freq);
 	if (ret) {
@@ -316,10 +333,26 @@ static int sunxi_ir_remove(struct platform_device *pd=
ev)
 	return 0;
 }
=20
+static const struct sunxi_ir_quirks sun4i_a10_ir_quirks =3D {
+	.has_reset =3D false,
+	.fifo_size =3D 16,
+};
+
+static const struct sunxi_ir_quirks sun5i_a13_ir_quirks =3D {
+	.has_reset =3D false,
+	.fifo_size =3D 64,
+};
+
 static const struct of_device_id sunxi_ir_match[] =3D {
-	{ .compatible =3D "allwinner,sun4i-a10-ir", },
-	{ .compatible =3D "allwinner,sun5i-a13-ir", },
-	{},
+	{
+		.compatible =3D "allwinner,sun4i-a10-ir",
+		.data =3D &sun4i_a10_ir_quirks,
+	},
+	{
+		.compatible =3D "allwinner,sun5i-a13-ir",
+		.data =3D &sun5i_a13_ir_quirks,
+	},
+	{}
 };
 MODULE_DEVICE_TABLE(of, sunxi_ir_match);
=20
--=20
2.20.1

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
To view this discussion on the web, visit https://groups.google.com/d/msgid=
/linux-sunxi/20190604162959.29199-3-peron.clem%40gmail.com.
For more options, visit https://groups.google.com/d/optout.
