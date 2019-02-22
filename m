From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH RESEND V6 2/2] clk: imx: scu: add cpu frequency scaling support
Date: Fri, 22 Feb 2019 11:08:10 -0800
Message-ID: <155086249004.77512.8709011386763447047@swboyd.mtv.corp.google.com>
References: <1550802436-13007-1-git-send-email-Anson.Huang@nxp.com> <1550802436-13007-2-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550802436-13007-2-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>, Anson Huang <anson.huang@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Quoting Anson Huang (2019-02-21 18:32:10)
> On NXP's i.MX SoCs with system controller inside, CPU frequency
> scaling can ONLY be done by system controller firmware, and it
> can ONLY be requested from secure mode, so Linux kernel has to
> call ARM SMC to trap to ARM-Trusted-Firmware to request system
> controller firmware to do CPU frequency scaling.
>=20
> This patch adds i.MX system controller CPU frequency scaling support,
> it reuses cpufreq-dt driver and implement the CPU frequency scaling
> inside SCU clock driver.
>=20
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Ah I missed one thing, see below.

> @@ -180,6 +185,23 @@ static long clk_scu_round_rate(struct clk_hw *hw, un=
signed long rate,
>         return rate;
>  }
> =20
> +static int clk_scu_atf_set_cpu_rate(struct clk_hw *hw, unsigned long rat=
e,
> +                                   unsigned long parent_rate)
> +{
> +       struct clk_scu *clk =3D to_clk_scu(hw);
> +       struct arm_smccc_res res;
> +       unsigned long cluster_id;
> +
> +       if (clk->rsrc_id =3D=3D IMX_SC_R_A35)
> +               cluster_id =3D 0;

Do we still need to check this anymore? Why not just always use
cluster_id 0?

> +
> +       /* CPU frequency scaling can ONLY be done by ARM-Trusted-Firmware=
 */
> +       arm_smccc_smc(IMX_SIP_CPUFREQ, IMX_SIP_SET_CPUFREQ,
> +                     cluster_id, rate, 0, 0, 0, 0, &res);

Because not checking would make this work, vs. checking causes this code
to sometimes use an uninitialized value from the stack.

> +
> +       return 0;
> +}
> +
