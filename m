From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH V3 1/4] dt-bindings: imx: Add clock binding doc for i.MX8MN
Date: Wed, 05 Jun 2019 16:33:18 -0700
Message-ID: <20190605233319.06CE62083E@mail.kernel.org>
References: <20190604015928.23157-1-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190604015928.23157-1-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson.Huang@nxp.com, abel.vesa@nxp.com, aisheng.dong@nxp.com, bjorn.andersson@linaro.org, catalin.marinas@arm.com, devicetree@vger.kernel.org, dinguyen@kernel.org, enric.balletbo@collabora.com, festevam@gmail.com, horms+renesas@verge.net.au, jagan@amarulasolutions.com, kernel@pengutronix.de, l.stach@pengutronix.de, leonard.crestez@nxp.com, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, mturquette@baylibre.com, olof@lixom.net, ping.bai@nxp.com, robh+dt@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org, will.deacon@arm.com
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

Quoting Anson.Huang@nxp.com (2019-06-03 18:59:25)
> From: Anson Huang <Anson.Huang@nxp.com>
>=20
> Add the clock binding doc for i.MX8MN.
>=20
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> No changes.
> ---
>  .../devicetree/bindings/clock/imx8mn-clock.txt     |  29 +++

Can this be yaml?

>  include/dt-bindings/clock/imx8mn-clock.h           | 215 +++++++++++++++=
++++++
>  2 files changed, 244 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/imx8mn-clock.=
txt
>  create mode 100644 include/dt-bindings/clock/imx8mn-clock.h
>=20
