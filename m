From: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] iio: iadc: Qualcomm SPMI PMIC current ADC driver
Date: Fri, 19 Sep 2014 15:16:34 +0300
Message-ID: <1411128994.3997.19.camel@iivanov-dev>
References: <1411046123-30625-1-git-send-email-iivanov@mm-sol.com>
	 <541C032F.3080206@smartplayin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <541C032F.3080206-edOiRQu9Xnj5XLMNweQjbQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kiran Padwal <kiran.padwal-edOiRQu9Xnj5XLMNweQjbQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


Hi Kiran,

On Fri, 2014-09-19 at 15:49 +0530, Kiran Padwal wrote:
> Hi Ivan,
>=20
> On Thursday 18 September 2014 06:45 PM, Ivan T. Ivanov wrote:
> > The current ADC is peripheral of Qualcomm SPMI PMIC chips. It has
> > 16 bits resolution and register space inside PMIC accessible across
> > SPMI bus.
> >=20
> > The driver registers itself through IIO interface.
> >=20
> > Signed-off-by: Ivan T. Ivanov <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
> > ---
> >  .../devicetree/bindings/iio/adc/qcom,spmi-iadc.txt |  61 ++
>=20
> <snip>
>=20
> > diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> > index 11b048a..77274e4 100644
> > --- a/drivers/iio/adc/Kconfig
> > +++ b/drivers/iio/adc/Kconfig
> > @@ -279,4 +279,15 @@ config XILINX_XADC
> >  	  The driver can also be build as a module. If so, the module wil=
l be called
> >  	  xilinx-xadc.
> > =20
> > +config QCOM_SPMI_IADC
> > +	tristate "Qualcomm SPMI PMIC current ADC"
> > +	select REGMAP_SPMI
> > +	depends on IIO
>=20
> May be you need to add "SPMI" in depends on because without enabling =
that it breaks.

Right.=20

>=20
> > +	help
> > +	  This is the IIO Current ADC driver for Qualcomm QPNP IADC Chip.
> > +
> > +	  The driver supports single mode operation to read from upto sev=
en channel
> > +	  configuration that include reading the external/internal Rsense=
, CSP_EX,
> > +	  CSN_EX pair along with the gain and offset calibration.
> > +
> >  endmenu
>=20
> <snip>
>=20
> > +
> > +	return iadc_write(iadc, IADC_EN_CTL1, data);
> > +}
> > +
> > +static void iadc_status_show(struct iadc_chip *iadc)
> > +{
> > +	u8 mode, sta1, chan, dig, en, req;
>=20
> During compilation, getting a waring as below for all variables,
>=20
> rivers/iio/adc/qcom-spmi-iadc.c: In function =E2=80=98iadc_poll_wait_=
eoc=E2=80=99:
> drivers/iio/adc/qcom-spmi-iadc.c:227:10: warning: =E2=80=98en=E2=80=99=
 may be used uninitialized in this function [-Wmaybe-uninitialized]
>   dev_warn(iadc->dev,
>           ^
>=20

Right. I am not sure why I am not getting this warning.

> > +	int ret;
> > +
> > +	ret =3D iadc_read(iadc, IADC_MODE_CTL, &mode);
> > +	if (ret < 0)
> > +		return;
> > +
> > +	ret =3D iadc_read(iadc, IADC_DIG_PARAM, &dig);
>=20

Thank you for review.

Regards,
Ivan
