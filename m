From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 5/6] clk: imx8mq: Remove CLK_IS_CRITICAL flag for IMX8MQ_CLK_TMU_ROOT
Date: Mon, 22 Jul 2019 14:31:00 -0700
Message-ID: <20190722213101.ADF8821900@mail.kernel.org>
References: <20190705045612.27665-1-Anson.Huang@nxp.com> <20190705045612.27665-5-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190705045612.27665-5-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson.Huang@nxp.com, abel.vesa@nxp.com, agx@sigxcpu.org, andrew.smirnov@gmail.com, angus@akkea.ca, ccaione@baylibre.com, daniel.lezcano@linaro.org, devicetree@vger.kernel.org, edubezval@gmail.com, festevam@gmail.com, kernel@pengutronix.de, l.stach@pengutronix.de, leonard.crestez@nxp.com, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org, rui.zhang@intel.com, s.hauer@pengutronix.de, shawnguo@kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

Quoting Anson.Huang@nxp.com (2019-07-04 21:56:11)
> From: Anson Huang <Anson.Huang@nxp.com>
>=20
> IMX8MQ_CLK_TMU_ROOT is ONLY used for thermal module, the driver
> should manage this clock, so no need to have CLK_IS_CRITICAL flag
> set.
>=20
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
