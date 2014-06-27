From: Lee Jones <lee.jones@linaro.org>
Subject: Re: mfd: sec-core requires regulators
Date: Fri, 27 Jun 2014 11:19:40 +0100
Message-ID: <20140627101940.GJ19645@lee--X1>
References: <CA+r1ZhhFYip3Jp2c3d8tNpD-vK8Pkf7DzrKTtk6Gy8uOOO3Ucw@mail.gmail.com>
 <29237234.T7oGEGKuvp@wuerfel>
 <20140624154833.GR13803@lee--X1>
 <6906564.1ehoeq1QjB@wuerfel>
 <20140627090957.GG19645@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140627090957.GG19645@lee--X1>
Sender: linux-next-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jim Davis <jim.epost@gmail.com>, sfr@canb.auug.org.au, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, sbkim73@samsung.com, sameo@linux.intel.com, grant.likely@linaro.org, robh+dt@kernel.org, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, 27 Jun 2014, Lee Jones wrote:

> On Tue, 24 Jun 2014, Arnd Bergmann wrote:
>=20
> > The newly added sec-core mfd module calls the regulator_suspend_pre=
pare()
> > function, which is only available if the regulator API is provided.=
 This
> > matches the usage of the driver, so we can just add a Kconfig depen=
dency.
> >=20
> > Reported-by: Jim Davis <jim.epost@gmail.com>
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>=20
> Thanks for re-sending Arnd, patch applied.

Slight change of plan - this appears to have been fixed by 591123e.

> > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > index 207c433..1caa3c5 100644
> > --- a/drivers/mfd/Kconfig
> > +++ b/drivers/mfd/Kconfig
> > @@ -582,7 +582,7 @@ config MFD_RC5T583
> > =20
> >  config MFD_SEC_CORE
> >         bool "SAMSUNG Electronics PMIC Series Support"
> > -       depends on I2C=3Dy
> > +       depends on I2C=3Dy && REGULATOR
> >         select MFD_CORE
> >         select REGMAP_I2C
> >         select REGMAP_IRQ
>=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
