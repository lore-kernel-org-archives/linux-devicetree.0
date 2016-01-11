From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 5/6] rtc: max77620: add support for max77620/max20024 RTC
 driver
Date: Mon, 11 Jan 2016 05:46:18 +0000
Message-ID: <20160111054618.GA3331@x1>
References: <1452177524-23192-1-git-send-email-ldewangan@nvidia.com>
 <1452177524-23192-6-git-send-email-ldewangan@nvidia.com>
 <568F0BD3.8080000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <568F0BD3.8080000@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linux Kernel <linuxkernelmails@gmail.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, broonie@kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, rtc-linux@googlegroups.com, swarren@nvidia.com, treding@nvidia.com, Chaitanya Bandi <bandik@nvidia.com>
List-Id: devicetree@vger.kernel.org

=46rom: Linux Kernel <linuxkernelmails@gmail.com>

Really?  Why the shroud of secrecy?

Any reason why you're not using your real name?

On Fri, 08 Jan 2016, Linux Kernel wrote:
> On Thursday 07 January 2016 08:08 PM, Laxman Dewangan wrote:
>=20
> >Maxim Semiconductor's PMIC MAX77620/MAX20024 has on chip
> >RTC  module. This support for setting alarm and time.
> >
> >Add RTC driver to access this chip's RTC module via RTC
> >APIs.
> >
> >Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> >Signed-off-by: Chaitanya Bandi <bandik@nvidia.com>
> >Tested-by: Venkat Reddy Talla <vreddytalla@nvidia.com>
> >---
> >  drivers/rtc/Kconfig        |   9 +
> >  drivers/rtc/Makefile       |   1 +
> >  drivers/rtc/rtc-max77620.c | 574 +++++++++++++++++++++++++++++++++=
++++++++++++
> >  3 files changed, 584 insertions(+)
> >  create mode 100644 drivers/rtc/rtc-max77620.c
> >
> (...)
>=20
> >+static struct platform_driver max77620_rtc_driver =3D {
> >+	.probe =3D max77620_rtc_probe,
> >+	.remove =3D max77620_rtc_remove,
> >+	.id_table =3D max77620_rtc_devtype,
> >+	.driver =3D {
> >+			.name =3D "max77620-rtc",
> >+			.owner =3D THIS_MODULE,
>=20
> Drop this line, .owner will be populated by driver core.
>=20
> >+			.pm =3D &max77620_rtc_pm_ops,
> >+	},
> >+};
> >+
> >+module_platform_driver(max77620_rtc_driver);
> >+
> >+MODULE_DESCRIPTION("max77620 RTC driver");
> >+MODULE_AUTHOR("Chaitanya Bandi <bandik@nvidia.com>");
> >+MODULE_AUTHOR("Laxman Dewangan <ldewangan@nvidia.com>");
> >+MODULE_ALIAS("platform:max77620-rtc");
> >+MODULE_LICENSE("GPL v2");

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
