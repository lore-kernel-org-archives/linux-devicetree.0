From: Robin Gong <yibin.gong@nxp.com>
Subject: RE: [PATCH v8 5/6] regulator: pfuze100-regulator: provide
 pm_power_off_prepare handler
Date: Mon, 6 Aug 2018 02:51:38 +0000
Message-ID: <DB6PR04MB3223921579ED18FDD802A73F89200@DB6PR04MB3223.eurprd04.prod.outlook.com>
References: <20180726092220.17250-1-o.rempel@pengutronix.de>
 <20180726092220.17250-6-o.rempel@pengutronix.de>
 <DB6PR04MB32233832762D02F1023861A1892A0@DB6PR04MB3223.eurprd04.prod.outlook.com>
 <403db02e-9c91-5080-ee9c-7a44716e64b2@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <403db02e-9c91-5080-ee9c-7a44716e64b2@pengutronix.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Oleksij Rempel <o.rempel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Liam Girdwood <lgirdwood@gmail.com>, Leonard Crestez <leonard.crestez@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Fabio Estevam <fabio.estevam@nxp.com>, Russell King <linux@armlinux.org.uk>, dl-linux-imx <linux-imx@nxp.com>, "A.s. Dong" <aisheng.dong@nxp.com>
List-Id: devicetree@vger.kernel.org

> >> +static struct pfuze_chip *syspm_pfuze_chip;
> >> +
> >> +static void pfuze_power_off_prepare(void)
> >> +	dev_info(syspm_pfuze_chip->dev, "Configure standy mode for power
> >> +off");
> > Add 'if (syspm_pfuze_chip ->chip_id =3D=3D PFUZE100))' here is easy for
> > extend Support on pfuze200/3000.. in the feature.
> There is already:
> static int pfuze_power_off_prepare_init(struct pfuze_chip *pfuze_chip) {
>         if (pfuze_chip->chip_id !=3D PFUZE100) {
>                 dev_warn(pfuze_chip->dev, "Requested
> pm_power_off_prepare handler for not supported chip\n");
>                 return -ENODEV;
>         }
>=20
>=20
> No need to add it in pfuze_power_off_prepare()
I saw you add chip check in pfuze_power_off_prepare_init(), but I'm saying
In the future case pfuze200/3000 may should still support this feature, but=
 registers
are different between different chips, thus, move checking chip into pfuze_=
power_off_prepare()
could make the later patch for pfuze200/3000 more clear, less and easier.
