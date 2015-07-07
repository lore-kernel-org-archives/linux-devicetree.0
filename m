From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH-V5 3/4] mfd: 88pm800: Set default interrupt clear method
Date: Tue, 7 Jul 2015 11:40:28 +0100
Message-ID: <20150707104028.GR3182@x1>
References: <1435591877-18214-1-git-send-email-vaibhav.hiremath@linaro.org>
 <1435591877-18214-4-git-send-email-vaibhav.hiremath@linaro.org>
 <20150707072958.GN3182@x1>
 <559BA1AE.9050006@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <559BA1AE.9050006-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yizhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, Zhao Ye <zhaoy-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 07 Jul 2015, Vaibhav Hiremath wrote:
> On Tuesday 07 July 2015 12:59 PM, Lee Jones wrote:
> >On Mon, 29 Jun 2015, Vaibhav Hiremath wrote:
> >
> >>As per the spec, bit 1 (INT_CLEAR_MODE) of reg addr 0xe
> >>(page 0) controls the method of clearing interrupt
> >>status of 88pm800 family of devices;
> >>
> >>   0: clear on read
> >>   1: clear on write
> >>
> >>If pdata is not coming from board file, then set the
> >>default irq clear method to "irq clear on write"
> >>
> >>Also, as suggested by "Lee Jones" renaming variable field
> >>to appropriate name.
> >>
> >>Signed-off-by: Zhao Ye <zhaoy-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> >>Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >>---
> >>  drivers/mfd/88pm800.c       | 15 ++++++++++-----
> >>  include/linux/mfd/88pm80x.h | 10 ++++++++--
> >>  2 files changed, 18 insertions(+), 7 deletions(-)
> >>
> >>diff --git a/drivers/mfd/88pm800.c b/drivers/mfd/88pm800.c
> >>index d495737..66347be 100644
> >>--- a/drivers/mfd/88pm800.c
> >>+++ b/drivers/mfd/88pm800.c
> >>@@ -374,7 +374,7 @@ static int device_irq_init_800(struct pm80x_chi=
p *chip)
> >>  {
> >>  	struct regmap *map =3D chip->regmap;
> >>  	unsigned long flags =3D IRQF_ONESHOT;
> >>-	int data, mask, ret =3D -EINVAL;
> >>+	int irq_clr_mode, mask, ret =3D -EINVAL;
> >>
> >>  	if (!map || !chip->irq) {
> >>  		dev_err(chip->dev, "incorrect parameters\n");
> >>@@ -382,15 +382,16 @@ static int device_irq_init_800(struct pm80x_c=
hip *chip)
> >>  	}
> >>
> >>  	/*
> >>-	 * irq_mode defines the way of clearing interrupt. it's read-clea=
r by
> >>-	 * default.
> >>+	 * irq_clr_on_wr defines the way of clearing interrupt by
> >>+	 * read/write(0/1).  It's read-clear by default.
> >>  	 */
> >>  	mask =3D
> >>  	    PM800_WAKEUP2_INV_INT | PM800_WAKEUP2_INT_CLEAR |
> >>  	    PM800_WAKEUP2_INT_MASK;
> >>
> >>-	data =3D PM800_WAKEUP2_INT_CLEAR;
> >>-	ret =3D regmap_update_bits(map, PM800_WAKEUP2, mask, data);
> >>+	irq_clr_mode =3D chip->irq_clr_method =3D=3D PM800_IRQ_CLR_ON_WRI=
TE ?
> >>+		PM800_WAKEUP2_INT_WRITE_CLEAR : PM800_WAKEUP2_INT_READ_CLEAR;
> >>+	ret =3D regmap_update_bits(map, PM800_WAKEUP2, mask, irq_clr_mode=
);
> >
> >What's stopping you just passing PM800_WAKEUP2_INT_WRITE_CLEAR or
> >PM800_WAKEUP2_INT_READ_CLEAR from pdata?  Then you can use the value
> >directly without all of this faffing about.
> >
> >   regmap_update_bits(map, PM800_WAKEUP2, mask, pdata->irq_clr_mode)=
;
> >
>=20
> Because "irq_clr_method" is of boolean type.
> And macros which you are referring to is,
>=20
> #define PM800_WAKEUP2_INT_READ_CLEAR            (0 << 1)
> #define PM800_WAKEUP2_INT_WRITE_CLEAR           (1 << 1)
>=20
>=20
> And also, I feel it is more cleaner approach with the current code as
> register definition and userflag are maintained separately.

I see your point, although it's a shame we have to have this code in
its place.

One thing I think you can do though is rid chip->irq_clr_method, just
use the one you already have in pdata.

> >>  	if (ret < 0)
> >>  		goto out;
> >>@@ -512,6 +513,7 @@ static int device_800_init(struct pm80x_chip *c=
hip,
> >>  	}
> >>
> >>  	chip->regmap_irq_chip =3D &pm800_irq_chip;
> >>+	chip->irq_clr_method =3D pdata->irq_clr_method;
> >>
> >>  	ret =3D device_irq_init_800(chip);
> >>  	if (ret < 0) {
> >>@@ -564,6 +566,9 @@ static int pm800_probe(struct i2c_client *clien=
t,
> >>  		pdata =3D devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL=
);
> >>  		if (!pdata)
> >>  			return -ENOMEM;
> >>+
> >>+		/* by default, set irq clear method on write */
> >>+		pdata->irq_clr_method =3D PM800_IRQ_CLR_ON_WRITE;
> >>  	}
> >>
> >>  	ret =3D pm80x_init(client);
> >>diff --git a/include/linux/mfd/88pm80x.h b/include/linux/mfd/88pm80=
x.h
> >>index 8fcad63..648e01a 100644
> >>--- a/include/linux/mfd/88pm80x.h
> >>+++ b/include/linux/mfd/88pm80x.h
> >>@@ -77,6 +77,8 @@ enum {
> >>  #define PM800_WAKEUP2			(0x0E)
> >>  #define PM800_WAKEUP2_INV_INT		BIT(0)
> >>  #define PM800_WAKEUP2_INT_CLEAR		BIT(1)
> >>+#define PM800_WAKEUP2_INT_READ_CLEAR	(0 << 1)
> >>+#define PM800_WAKEUP2_INT_WRITE_CLEAR	(1 << 1)
> >>  #define PM800_WAKEUP2_INT_MASK		BIT(2)
> >>
> >>  #define PM800_POWER_UP_LOG		(0x10)
> >>@@ -300,7 +302,11 @@ struct pm80x_chip {
> >>  	struct regmap_irq_chip_data *irq_data;
> >>  	int type;
> >>  	int irq;
> >>-	int irq_mode;
> >>+
> >>+#define PM800_IRQ_CLR_ON_READ	0
> >>+#define PM800_IRQ_CLR_ON_WRITE	1
> >
> >Defines in the middle of structs makes for ugly code.
> >
>=20
> Sorry, but kernel code is full of such implementations.
> Infact it is right place in terms of readability.
>=20
> If you still feel insist to fix it, please let me know whether you wa=
nt
> to submit V6 just for this. Or you will fix it while merging.
> I am OK with anything here...
>=20
>=20
> Thanks,
> Vaibhav

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
