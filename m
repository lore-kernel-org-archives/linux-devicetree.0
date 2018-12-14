From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/3] clk: imx: imx7ulp: add arm hsrun mode clocks support
Date: Fri, 14 Dec 2018 14:04:43 -0800
Message-ID: <154482508301.19322.1653003805163251008@swboyd.mtv.corp.google.com>
References: <1544176659-32022-1-git-send-email-Anson.Huang@nxp.com> <1544176659-32022-2-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544176659-32022-2-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>, Anson Huang <anson.huang@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Quoting Anson Huang (2018-12-07 02:03:34)
> i.MX7ULP has a Cortex-A7 CPU which can run in RUN mode
> or HSRUN mode, it is controlled in SMC1 module. The RUN
> mode and HSRUN mode will use different clock source for
> ARM, "divcore" for RUN mode and "hsrun_divcore" for HSRUN
> mode, so the control bits in SMC1 module can be abstracted
> as a HW clock mux, this patch adds HSRUN mode related
> clocks in SCG1 module and adds "arm" clock in SMC1 module
> to support RUN mode and HSRUN mode switch.
>=20
> Latest clock tree in RUN mode as below:
>=20
>  firc                                 0        0        0    48000000    =
      0     0  50000
>     firc_bus_clk                      0        0        0    48000000    =
      0     0  50000
>     hsrun_scs_sel                     0        0        0    48000000    =
      0     0  50000
>        hsrun_divcore                  0        0        0    48000000    =
      0     0  50000
>=20
>  sosc                                 3        3        3    24000000    =
      0     0  50000
>     spll_pre_sel                      1        1        1    24000000    =
      0     0  50000
>        spll_pre_div                   1        1        2    24000000    =
      0     0  50000
>           spll                        1        1        2   528000000    =
      0     0  50000
>              spll_pfd0                1        1        1   500210526    =
      0     0  50000
>                 spll_pfd_sel          1        1        0   500210526    =
      0     0  50000
>                    spll_sel           1        1        0   500210526    =
      0     0  50000
>                       scs_sel         1        1        0   500210526    =
      0     0  50000
>                          divcore      1        1        0   500210526    =
      0     0  50000
>                             arm       1        1        0   500210526    =
      0     0  50000
>=20
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---

Applied to clk-next
