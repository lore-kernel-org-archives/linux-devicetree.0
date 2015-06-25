From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH-v4 1/3] mfd: 88pm800: Add device tree support
Date: Thu, 25 Jun 2015 15:48:00 +0100
Message-ID: <20150625144800.GC23990@x1>
References: <1435217189-19578-1-git-send-email-vaibhav.hiremath@linaro.org>
 <1435217189-19578-2-git-send-email-vaibhav.hiremath@linaro.org>
 <20150625101916.GB15013@x1>
 <558BE1B7.2060308@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <558BE1B7.2060308-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, yizhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, Chao Xie <chao.xie-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 25 Jun 2015, Vaibhav Hiremath wrote:
> On Thursday 25 June 2015 03:49 PM, Lee Jones wrote:
> >On Thu, 25 Jun 2015, Vaibhav Hiremath wrote:
> >
> >>Add DT support to the 88pm800 driver, along with compatible
> >>field for it's sub-devices (rtc, onkey and regulator)
> >>
> >>Signed-off-by: Chao Xie <chao.xie-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> >>Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >>---
> >>  drivers/mfd/88pm800.c | 23 +++++++++++++++++++++++
> >>  1 file changed, 23 insertions(+)
> >>
> >>diff --git a/drivers/mfd/88pm800.c b/drivers/mfd/88pm800.c
> >>index 841717a..40fd014 100644
> >>--- a/drivers/mfd/88pm800.c
> >>+++ b/drivers/mfd/88pm800.c
> >>@@ -27,6 +27,7 @@
> >>  #include <linux/mfd/core.h>
> >>  #include <linux/mfd/88pm80x.h>
> >>  #include <linux/slab.h>
> >>+#include <linux/of_device.h>
> >>
> >>  /* Interrupt Registers */
> >>  #define PM800_INT_STATUS1		(0x05)
> >>@@ -121,6 +122,11 @@ static const struct i2c_device_id pm80x_id_tab=
le[] =3D {
> >>  };
> >>  MODULE_DEVICE_TABLE(i2c, pm80x_id_table);
> >>
> >>+static const struct of_device_id pm80x_of_match_table[] =3D {
> >>+	{ .compatible =3D "marvell,88pm800", },
> >>+	{},
> >>+};
> >>+
> >>  static struct resource rtc_resources[] =3D {
> >>  	{
> >>  	 .name =3D "88pm80x-rtc",
> >>@@ -133,6 +139,7 @@ static struct resource rtc_resources[] =3D {
> >>  static struct mfd_cell rtc_devs[] =3D {
> >>  	{
> >>  	 .name =3D "88pm80x-rtc",
> >>+	 .of_compatible =3D "marvell,88pm80x-rtc",
> >>  	 .num_resources =3D ARRAY_SIZE(rtc_resources),
> >>  	 .resources =3D &rtc_resources[0],
> >>  	 .id =3D -1,
> >>@@ -151,6 +158,7 @@ static struct resource onkey_resources[] =3D {
> >>  static const struct mfd_cell onkey_devs[] =3D {
> >>  	{
> >>  	 .name =3D "88pm80x-onkey",
> >>+	 .of_compatible =3D "marvell,88pm80x-onkey",
> >>  	 .num_resources =3D 1,
> >>  	 .resources =3D &onkey_resources[0],
> >>  	 .id =3D -1,
> >>@@ -160,6 +168,7 @@ static const struct mfd_cell onkey_devs[] =3D {
> >>  static const struct mfd_cell regulator_devs[] =3D {
> >>  	{
> >>  	 .name =3D "88pm80x-regulator",
> >>+	 .of_compatible =3D "marvell,88pm80x-regulator",
> >>  	 .id =3D -1,
> >>  	},
> >>  };
> >>@@ -544,8 +553,21 @@ static int pm800_probe(struct i2c_client *clie=
nt,
> >>  	int ret =3D 0;
> >>  	struct pm80x_chip *chip;
> >>  	struct pm80x_platform_data *pdata =3D dev_get_platdata(&client->=
dev);
> >>+	struct device_node *np =3D client->dev.of_node;
> >>  	struct pm80x_subchip *subchip;
> >>
> >>+	if (!pdata && !np) {
> >>+		dev_err(&client->dev,
> >>+			"pm80x requires platform data or of_node\n");
> >>+		return -EINVAL;
> >>+	}
> >>+
> >>+	if (!pdata) {
> >>+		pdata =3D devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL)=
;
> >>+		if (!pdata)
> >>+			return -ENOMEM;
> >>+	}
> >
> >Why have you allocated data for pdata, then done nothing with it?
> >
>=20
> Not in this patch, but subsequent patches would use it.

Only provide it when you start using it please.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
