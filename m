From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [rtc-linux] [PATCH 2/6] mfd: max77620: add core driver for
 MAX77620/MAX20024
Date: Mon, 11 Jan 2016 05:46:27 +0000
Message-ID: <20160111054627.GB3331@x1>
References: <1452177524-23192-1-git-send-email-ldewangan@nvidia.com>
 <1452177524-23192-3-git-send-email-ldewangan@nvidia.com>
 <CAJKOXPfa0jjRWE6LKvNmwCRcG9Es7=36_03kTqCx-aB1wENx0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJKOXPfa0jjRWE6LKvNmwCRcG9Es7=36_03kTqCx-aB1wENx0g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: rtc-linux@googlegroups.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, broonie@kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, swarren@nvidia.com, treding@nvidia.com, Laxman Dewangan <ldewangan@nvidia.com>, Chaitanya Bandi <bandik@nvidia.com>, Mallikarjun Kasoju <mkasoju@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Fri, 08 Jan 2016, Krzysztof Kozlowski wrote:

Thanks for taking the time to review.

> ()2016-01-07 23:38 GMT+09:00 Laxman Dewangan <ldewangan@nvidia.com>:
> > MAX77620/MAX20024 are Power Management IC from the MAXIM.
> > It supports RTC, multiple GPIOs, multiple DCDC and LDOs,
> > watchdog, clock etc.
> >
> > Add MFD drier to provides common support for accessing the
> > device; additional drivers is developed on respected subsystem
> > in order to use the functionality of the device.
> >
> > Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> > Signed-off-by: Chaitanya Bandi <bandik@nvidia.com>
> > Signed-off-by: Mallikarjun Kasoju <mkasoju@nvidia.com>
> > Tested-by: Venkat Reddy Talla <vreddytalla@nvidia.com>
>=20
> The Testing and Reviewed are statements (see SubmittingPatches) so
> they should be made explicitly by people. As this is v1 how they coul=
d
> make a public statement so far?

SubmittingPatches bears no mention that Reviewed-by/Tested-by
statements have to be provided on one of the public mailing lists.
These can be provided privately prior to upstream submission v1.

> > ---
> >  drivers/mfd/Kconfig          |  15 +
> >  drivers/mfd/Makefile         |   1 +
> >  drivers/mfd/max77620.c       | 926 +++++++++++++++++++++++++++++++=
++++++++++++
> >  include/linux/mfd/max77620.h | 503 +++++++++++++++++++++++
> >  4 files changed, 1445 insertions(+)
> >  create mode 100644 drivers/mfd/max77620.c
> >  create mode 100644 include/linux/mfd/max77620.h

[...]
=20
--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
