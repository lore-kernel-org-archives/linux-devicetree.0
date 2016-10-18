From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH v3 2/2] Add support for Omnivision OV5647
Date: Tue, 18 Oct 2016 20:31:33 +0200
Message-ID: <20161018183133.GA26548@amd>
References: <cover.1476286687.git.roliveir@synopsys.com>
 <17092ffede9eb8aff0d6a7f54ca771e81712b18e.1476286687.git.roliveir@synopsys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <17092ffede9eb8aff0d6a7f54ca771e81712b18e.1476286687.git.roliveir-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ramiro Oliveira <Ramiro.Oliveira-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dheitmueller-eb9eJ82Ua7k9XoPSrs7Ehg@public.gmane.org, pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, CARLOS.PALMINHA-HKixBCOQz3hWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> +/*
> + * A V4L2 driver for OmniVision OV5647 cameras.
> + *
> + * Based on Samsung S5K6AAFX SXGA 1/6" 1.3M CMOS Image Sensor driver
> + * Copyright (C) 2011 Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> + *
> + * Based on Omnivision OV7670 Camera Driver
> + * Copyright (C) 2006-7 Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>
> + *
> + * Copyright (C) 2016, Synopsys, Inc.
> + *
> + */

If you do copyrights, you should also specify license.

> +static bool debug;
> +module_param(debug, bool, 0644);
> +MODULE_PARM_DESC(debug, "Debug level (0-1)");

Please remove, we have generic infrastructure for debugging.

> +/*
> + * The ov5647 sits on i2c with ID 0x6c
> + */
> +#define OV5647_I2C_ADDR 0x6c
> +#define SENSOR_NAME "ov5647"
> +
> +#define OV5647_REG_CHIPID_H	0x300A
> +#define OV5647_REG_CHIPID_L	0x300B
> +
> +#define REG_TERM 0xfffe
> +#define VAL_TERM 0xfe
> +#define REG_DLY  0xffff
> +
> +/*define the voltage level of control signal*/

"/* ", " */".

> +#define CSI_STBY_ON		1
> +#define CSI_STBY_OFF		0
> +#define CSI_RST_ON		0
> +#define CSI_RST_OFF		1
> +#define CSI_PWR_ON		1
> +#define CSI_PWR_OFF		0
> +#define CSI_AF_PWR_ON		1
> +#define CSI_AF_PWR_OFF		0
=2E..
> +enum power_seq_cmd {
> +	CSI_SUBDEV_PWR_OFF =3D 0x00,
> +	CSI_SUBDEV_PWR_ON =3D 0x01,
> +};

Pick one style for defines/enums?

> +struct regval_list {
> +	uint16_t addr;
> +	uint8_t data;
> +};

u8/u16?

> +/**
> +* @short I2C Write operation
> +* @param[in] i2c_client I2C client
> +* @param[in] reg register address
> +* @param[in] val value to write
> +* @return Error code
> +*/

" *"?

> +static int ov5647_write(struct v4l2_subdev *sd, uint16_t reg, uint8_t va=
l)
> +{
> +	int ret;
> +	unsigned char data[3] =3D { reg >> 8, reg & 0xff, val};

" }".

> +static int ov5647_write_array(struct v4l2_subdev *subdev,
> +				struct regval_list *regs, int array_size)
> +{
> +	int i =3D 0;
> +	int ret =3D 0;
> +
> +	if (!regs)
> +		return -EINVAL;
> +
> +	while (i < array_size) {
> +		if (regs->addr =3D=3D REG_DLY)
> +			mdelay(regs->data);
> +		else
> +			ret =3D ov5647_write(subdev, regs->addr, regs->data);

The "REG_DLY" is never used AFAICT? Remove?

> +		if (ret =3D=3D -EIO)
> +			return ret;
> +

ov5647_write() can return errors other then EIO. Are they handled correctly?

> +/**
> + * @short Set SW standby
> + * @param[in] subdev v4l2 subdev
> + * @param[in] on_off standby on or off
> + * @return Error code
> + */
> +static int sensor_s_sw_stby(struct v4l2_subdev *subdev, int on_off)
> +{
> +	int ret;
> +	unsigned char rdval;
> +
> +	ret =3D ov5647_read(subdev, 0x0100, &rdval);
> +	if (ret !=3D 0)
> +		return ret;
> +
> +	if (on_off =3D=3D CSI_STBY_ON)
> +		ret =3D ov5647_write(subdev, 0x0100, rdval&0xfe);
> +
> +	else
> +		ret =3D ov5647_write(subdev, 0x0100, rdval|0x01);

I'd get rid of CSI_STBY_ON, and convert arg to bool, as you don't
really handle other values. Plus, naming it "set_sw_standby()" would
make core slightly more readable. Also kill the empty line before
else.

> +/**
> +* @short Initialize sensor
> +* @param[in] subdev v4l2 subdev
> +* @param[in] val not used
> +* @return Error code
> +*/
> +static int __sensor_init(struct v4l2_subdev *subdev)
> +{
> +	int ret;
> +	uint8_t resetval;
> +	unsigned char rdval;

u8 for both?

> +	ov5647_read(subdev, 0x0100, &resetval);
> +		if (!resetval&0x01) {
> +			v4l2_dbg(1, debug, subdev,
> +					"DEVICE WAS IN SOFTWARE STANDBY");

No shouting please? If it is important maybe it should have higher
priority?

> +static int sensor_power(struct v4l2_subdev *subdev, int on)
> +{
> +	int ret;
> +	struct ov5647 *ov5647 =3D to_state(subdev);
> +
> +	ret =3D 0;
> +	mutex_lock(&ov5647->lock);
> +
> +	switch (on) {
> +	case CSI_SUBDEV_PWR_OFF:
=2E..
> +	case CSI_SUBDEV_PWR_ON:
=2E..
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	mutex_unlock(&ov5647->lock);

I'd really convert this to bool. Note how it returns with lock held?


> +int ov5647_detect(struct v4l2_subdev *sd)
> +{
> +	unsigned char v;
> +	int ret;
> +
> +	ret =3D sensor_power(sd, 1);
> +	if (ret < 0)
> +		return ret;
> +	ret =3D ov5647_read(sd, OV5647_REG_CHIPID_H, &v);
> +	if (ret < 0)
> +		return ret;
> +	if (v !=3D 0x56) /* OV manuf. id. */
> +		return -ENODEV;
> +	ret =3D ov5647_read(sd, OV5647_REG_CHIPID_L, &v);
> +	if (ret < 0)
> +		return ret;
> +	if (v !=3D 0x47)
> +		return -ENODEV;

I guess invalid chipid deserves a printk?

> +* Refer to Linux errors.

Useful?

> +/**
> +* @short of_device_id structure
> +*/
> +static const struct i2c_device_id ov5647_id[] =3D {

Umm. The comment looks useless and wrong.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlgGaoUACgkQMOfwapXb+vJGaQCdFJ7oowVpmQcGM3WK4/KPK0ji
tMQAnRCosrCRa3yUNxfQfPb9iy+ViQlK
=4jqB
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
