From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 3/7] mfd: add support for sun6i PRCM
 (Power/Reset/Clock Management) unit
Date: Fri, 9 May 2014 08:12:46 +0100
Message-ID: <20140509071246.GE5767@lee--X1>
References: <1399483554-8824-1-git-send-email-boris.brezillon@free-electrons.com>
 <1399483554-8824-4-git-send-email-boris.brezillon@free-electrons.com>
 <20140508110205.GB5767@lee--X1>
 <536BE366.8080907@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <536BE366.8080907@free-electrons.com>
Sender: linux-doc-owner@vger.kernel.org
To: Boris BREZILLON <boris.brezillon@free-electrons.com>
Cc: Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>, Mike Turquette <mturquette@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Philipp Zabel <p.zabel@pengutronix.de>, Shuge <shuge@allwinnertech.com>, kevin@allwinnertech.com, Hans de Goede <hdegoede@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dev@linux-sunxi.org
List-Id: devicetree@vger.kernel.org

> >> +static struct platform_driver sun6i_prcm_driver =3D {
> >> +	.driver =3D {
> >> +		.name =3D "sun6i-prcm",
> >> +		.owner =3D THIS_MODULE,
> >> +		.of_match_table =3D sun6i_prcm_dt_ids,
> >> +	},
> >> +	.probe =3D sun6i_prcm_probe,
> > You need a .remove() call-back.
>=20
> This driver cannot be compiled as module (see the Kconfig definition)
> and the devices are not hotpluggable, as a result a probed device wil=
l
> never be removed.
>=20
> Do you still want me to implement the remove function ?

=2Eremove() also be run on shut down.  It's best practice to have one.

> >> +module_platform_driver(sun6i_prcm_driver);
> >> +
> >> +MODULE_AUTHOR("Boris BREZILLON <boris.brezillon@free-electrons.co=
m>");
> >> +MODULE_DESCRIPTION("Allwinner sun6i PRCM driver");
> >> +MODULE_LICENSE("GPL v2");
>=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
