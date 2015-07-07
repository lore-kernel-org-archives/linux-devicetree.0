From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH-V5 3/4] mfd: 88pm800: Set default interrupt clear method
Date: Tue, 7 Jul 2015 13:54:39 +0100
Message-ID: <20150707125439.GE3182@x1>
References: <1435591877-18214-1-git-send-email-vaibhav.hiremath@linaro.org>
 <1435591877-18214-4-git-send-email-vaibhav.hiremath@linaro.org>
 <20150707072958.GN3182@x1>
 <559BA1AE.9050006@linaro.org>
 <20150707104028.GR3182@x1>
 <559BAF23.90002@linaro.org>
 <20150707111248.GU3182@x1>
 <559BB58E.9010406@linaro.org>
 <559BB727.2070106@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <559BB727.2070106-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yizhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, Zhao Ye <zhaoy-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 07 Jul 2015, Vaibhav Hiremath wrote:

>=20
>=20
> On Tuesday 07 July 2015 04:48 PM, Vaibhav Hiremath wrote:
> >
> >
> >On Tuesday 07 July 2015 04:42 PM, Lee Jones wrote:
> >>On Tue, 07 Jul 2015, Vaibhav Hiremath wrote:
> >>>On Tuesday 07 July 2015 04:10 PM, Lee Jones wrote:
> >>>>On Tue, 07 Jul 2015, Vaibhav Hiremath wrote:
> >>>>>On Tuesday 07 July 2015 12:59 PM, Lee Jones wrote:
> >>>>>>On Mon, 29 Jun 2015, Vaibhav Hiremath wrote:
> >>>>>>
> >>>>>>>As per the spec, bit 1 (INT_CLEAR_MODE) of reg addr 0xe
> >>>>>>>(page 0) controls the method of clearing interrupt
> >>>>>>>status of 88pm800 family of devices;
> >>>>>>>
> >>>>>>>   0: clear on read
> >>>>>>>   1: clear on write
> >>>>>>>
> >>>>>>>If pdata is not coming from board file, then set the
> >>>>>>>default irq clear method to "irq clear on write"
> >>>>>>>
> >>>>>>>Also, as suggested by "Lee Jones" renaming variable field
> >>>>>>>to appropriate name.
> >>>>>>>
> >>>>>>>Signed-off-by: Zhao Ye <zhaoy-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> >>>>>>>Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >>>>>>>---
> >>>>>>>  drivers/mfd/88pm800.c       | 15 ++++++++++-----
> >>>>>>>  include/linux/mfd/88pm80x.h | 10 ++++++++--
> >>>>>>>  2 files changed, 18 insertions(+), 7 deletions(-)
> >>>>>>>
> >>>>>>>diff --git a/drivers/mfd/88pm800.c b/drivers/mfd/88pm800.c
> >>>>>>>index d495737..66347be 100644
> >>>>>>>--- a/drivers/mfd/88pm800.c
> >>>>>>>+++ b/drivers/mfd/88pm800.c
> >>>>>>>@@ -374,7 +374,7 @@ static int device_irq_init_800(struct
> >>>>>>>pm80x_chip *chip)
> >>>>>>>  {
> >>>>>>>      struct regmap *map =3D chip->regmap;
> >>>>>>>      unsigned long flags =3D IRQF_ONESHOT;
> >>>>>>>-    int data, mask, ret =3D -EINVAL;
> >>>>>>>+    int irq_clr_mode, mask, ret =3D -EINVAL;
> >>>>>>>
> >>>>>>>      if (!map || !chip->irq) {
> >>>>>>>          dev_err(chip->dev, "incorrect parameters\n");
> >>>>>>>@@ -382,15 +382,16 @@ static int device_irq_init_800(struct
> >>>>>>>pm80x_chip *chip)
> >>>>>>>      }
> >>>>>>>
> >>>>>>>      /*
> >>>>>>>-     * irq_mode defines the way of clearing interrupt. it's
> >>>>>>>read-clear by
> >>>>>>>-     * default.
> >>>>>>>+     * irq_clr_on_wr defines the way of clearing interrupt by
> >>>>>>>+     * read/write(0/1).  It's read-clear by default.
> >>>>>>>       */
> >>>>>>>      mask =3D
> >>>>>>>          PM800_WAKEUP2_INV_INT | PM800_WAKEUP2_INT_CLEAR |
> >>>>>>>          PM800_WAKEUP2_INT_MASK;
> >>>>>>>
> >>>>>>>-    data =3D PM800_WAKEUP2_INT_CLEAR;
> >>>>>>>-    ret =3D regmap_update_bits(map, PM800_WAKEUP2, mask, data=
);
> >>>>>>>+    irq_clr_mode =3D chip->irq_clr_method =3D=3D PM800_IRQ_CL=
R_ON_WRITE ?
> >>>>>>>+        PM800_WAKEUP2_INT_WRITE_CLEAR :
> >>>>>>>PM800_WAKEUP2_INT_READ_CLEAR;
> >>>>>>>+    ret =3D regmap_update_bits(map, PM800_WAKEUP2, mask,
> >>>>>>>irq_clr_mode);
> >>>>>>
> >>>>>>What's stopping you just passing PM800_WAKEUP2_INT_WRITE_CLEAR =
or
> >>>>>>PM800_WAKEUP2_INT_READ_CLEAR from pdata?  Then you can use the =
value
> >>>>>>directly without all of this faffing about.
> >>>>>>
> >>>>>>   regmap_update_bits(map, PM800_WAKEUP2, mask, pdata->irq_clr_=
mode);
> >>>>>>
> >>>>>
> >>>>>Because "irq_clr_method" is of boolean type.
> >>>>>And macros which you are referring to is,
> >>>>>
> >>>>>#define PM800_WAKEUP2_INT_READ_CLEAR            (0 << 1)
> >>>>>#define PM800_WAKEUP2_INT_WRITE_CLEAR           (1 << 1)
> >>>>>
> >>>>>
> >>>>>And also, I feel it is more cleaner approach with the current co=
de as
> >>>>>register definition and userflag are maintained separately.
> >>>>
> >>>>I see your point, although it's a shame we have to have this code=
 in
> >>>>its place.
> >>>>
> >>>>One thing I think you can do though is rid chip->irq_clr_method, =
just
> >>>>use the one you already have in pdata.
> >>>>
> >>>
> >>>Looking at the current code,
> >>>Yes, this can be done, but I have to do some more changes around i=
t,
> >>>to make code cleaner,
> >>>
> >>>change the signature of
> >>>
> >>>static int device_irq_init_800(struct pm80x_chip *chip)
> >>>
> >>>TO
> >>>
> >>>static int device_irq_init_800(struct pm80x_chip *chip, struct
> >>>pm80x_platform_data *pdata)
> >>>
> >>>
> >>>and then only use pdata->irq_clr_method.
> >>>
> >>>
> >>>How do you want to get this inside? V6 version? or separate patch?
> >>>
> >>>I have one more cleanup patch in the queue, which I am planning to
> >>>submit today, if you are ok then I can submit along with that.
> >>
> >>Ideally not.  Don't you save the 'struct device' into *chip?  You
> >>should use that to fetch the pdata, like:
> >>
> >>pdata =3D dev_get_platdata(chip->dev);
> >>
> >
> >Yes certainly, this is another option (rather preferred one).
> >
> >But to be consistent with other's I proposed this, please refer to t=
he
> >fn device_800_init(), where all xxx_init() are taking 2 arguments, a=
nd
> >second argument is pdata.
> >
> >
> >There is room for cleanup, I agree.
> >I can put this too in the next cleanup series.
> >
>=20
> Note that this is init function, called from probe.
>=20
> So both approach looks ok to me.

Please clean up the other.  Function and put it at the front of the
set when you re-submit.

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
