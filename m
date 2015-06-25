From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH-v4 2/3] mfd: 88pm800: Set default interrupt clear method
Date: Thu, 25 Jun 2015 15:46:27 +0100
Message-ID: <20150625144627.GB23990@x1>
References: <1435217189-19578-1-git-send-email-vaibhav.hiremath@linaro.org>
 <1435217189-19578-3-git-send-email-vaibhav.hiremath@linaro.org>
 <20150625102618.GC15013@x1>
 <558BE3D6.2010801@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <558BE3D6.2010801@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vaibhav Hiremath <vaibhav.hiremath@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, yizhang@marvell.com, Zhao Ye <zhaoy@marvell.com>
List-Id: devicetree@vger.kernel.org

On Thu, 25 Jun 2015, Vaibhav Hiremath wrote:
> On Thursday 25 June 2015 03:56 PM, Lee Jones wrote:
> >On Thu, 25 Jun 2015, Vaibhav Hiremath wrote:
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
> >>Signed-off-by: Zhao Ye <zhaoy@marvell.com>
> >>Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath@linaro.org>
> >>---
> >>  drivers/mfd/88pm800.c       | 15 ++++++++++-----
> >>  include/linux/mfd/88pm80x.h |  6 ++++--
> >>  2 files changed, 14 insertions(+), 7 deletions(-)
> >>
> >>diff --git a/drivers/mfd/88pm800.c b/drivers/mfd/88pm800.c
> >>index 40fd014..e0cd7ad 100644
> >>--- a/drivers/mfd/88pm800.c
> >>+++ b/drivers/mfd/88pm800.c

[...]

> >>+		PM800_WAKEUP2_INT_WRITE_CLEAR : PM800_WAKEUP2_INT_READ_CLEAR;
> >>+	ret =3D regmap_update_bits(map, PM800_WAKEUP2, mask, irq_clr_mode=
);
> >>
> >>  	if (ret < 0)
> >>  		goto out;
> >>@@ -514,6 +515,7 @@ static int device_800_init(struct pm80x_chip *c=
hip,
> >>  	}
> >>
> >>  	chip->regmap_irq_chip =3D &pm800_irq_chip;
> >>+	chip->irq_clr_on_wr =3D pdata->irq_clr_on_wr;
> >
> >You have protection around pdata everywhere else in the file, I
> >suggest you supply some here too.
> >
>=20
> Actually it is not really needed, as the PATCH 1/1 introduces
>=20
>=20
>         if (!pdata && !np) {
>                 dev_err(&client->dev,
>                         "pm80x requires platform data or of_node\n");
>                 return -EINVAL;
>         }
>=20
>         if (!pdata && !np) {
>                 dev_err(&client->dev,
>                         "pm80x requires platform data or of_node\n");
>                 return -EINVAL;
>         }
>=20
>=20
> So there is no way you can have pdata =3D NULL beyond this point.

I saw that.  I want you to remove that too.

[...]

> >>--- a/include/linux/mfd/88pm80x.h
> >>+++ b/include/linux/mfd/88pm80x.h
> >>@@ -77,6 +77,8 @@ enum {
> >>  #define PM800_WAKEUP2		(0x0E)
> >>  #define PM800_WAKEUP2_INV_INT		(1 << 0)
> >>  #define PM800_WAKEUP2_INT_CLEAR		(1 << 1)
> >>+#define PM800_WAKEUP2_INT_READ_CLEAR		(0 << 1)
> >>+#define PM800_WAKEUP2_INT_WRITE_CLEAR		(1 << 1)
> >>  #define PM800_WAKEUP2_INT_MASK		(1 << 2)
> >
> >Use the BIT() macro.
> >
>=20
> I thought about this, but the whole file doesn't use it, so I also
> chose not to.

Then the whole file needs moving over.

Patches accepted.

> >>  #define PM800_POWER_UP_LOG	(0x10)
> >>@@ -300,7 +302,7 @@ struct pm80x_chip {
> >>  	struct regmap_irq_chip_data *irq_data;
> >>  	int type;
> >>  	int irq;
> >>-	int irq_mode;
> >>+	int irq_clr_on_wr;	/* '1': Clear on write, '0': Clear on read*/
> >
> >Whitespace issue.
>=20
> Didn't see any...and I also ran checkpatch.

You have no space before the '*/'.

> >Shouldn't this be a bool?
> >
>=20
> Just was not sure about any older board file interface.
> Ideally it should be bool only.

Right.

> >Actually even better, I would define; CLR_ON_WRITE and CLR_ON_READ,
> >and call the variable irq_clear_method, or something.
> >
> >Much clearer that way I think.
> >
>=20
> We have slowly decided to almost hardcode it to one value if there is
> no board file. I feel we should just keep it to simple.
>=20
> If you still insist, I can implement.

I like clarity and by your own admission (by warranting an additional
comment) it's not clear.  Please make it as clear as you can.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
