From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH V3 3/4] clk: imx: Add support for i.MX8MN clock driver
Date: Thu, 06 Jun 2019 09:25:43 -0700
Message-ID: <20190606162543.EFFB820645@mail.kernel.org>
References: <20190604015928.23157-1-Anson.Huang@nxp.com> <20190604015928.23157-3-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190604015928.23157-3-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson.Huang@nxp.com, abel.vesa@nxp.com, aisheng.dong@nxp.com, bjorn.andersson@linaro.org, catalin.marinas@arm.com, devicetree@vger.kernel.org, dinguyen@kernel.org, enric.balletbo@collabora.com, festevam@gmail.com, horms+renesas@verge.net.au, jagan@amarulasolutions.com, kernel@pengutronix.de, l.stach@pengutronix.de, leonard.crestez@nxp.com, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, mturquette@baylibre.com, olof@lixom.net, ping.bai@nxp.com, robh+dt@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org, will.deacon@arm.com
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

Quoting Anson.Huang@nxp.com (2019-06-03 18:59:27)
> From: Anson Huang <Anson.Huang@nxp.com>
>=20
> This patch adds i.MX8MN clock driver support.
>=20
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V2:
>         - use platform driver model for this clock driver;

Can you also use platform device APIs like platform_*(),
devm_ioremap_resource() and devmified clk registration?
