From: Stephen Boyd <sboyd@kernel.org>
Subject: RE: [PATCH V3 3/4] clk: imx: Add support for i.MX8MN clock driver
Date: Fri, 07 Jun 2019 11:00:38 -0700
Message-ID: <20190607180039.611C7208C0@mail.kernel.org>
References: <20190604015928.23157-1-Anson.Huang@nxp.com> <20190604015928.23157-3-Anson.Huang@nxp.com> <20190606162543.EFFB820645@mail.kernel.org> <DB3PR0402MB391625A0B3D838CE88C53E33F5100@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB3PR0402MB391625A0B3D838CE88C53E33F5100@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "dinguyen@kernel.org" <dinguyen@kernel.org>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "festevam@gmail.com" <festevam@gmail.com>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Quoting Anson Huang (2019-06-06 17:50:28)
>=20
> I will use devm_platform_ioremap_resource() instead of ioremap(),
> and can you be more specific about devmified clk registration?
>=20

I mean using things like devm_clk_hw_register().
