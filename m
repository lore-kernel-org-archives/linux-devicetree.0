From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH V3 2/2] clk: imx: scu: add cpu frequency scaling support
Date: Wed, 13 Feb 2019 09:42:56 -0800
Message-ID: <155007977634.115909.4465011219844819801@swboyd.mtv.corp.google.com>
References: <1550073243-11242-1-git-send-email-Anson.Huang@nxp.com> <1550073243-11242-2-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550073243-11242-2-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>, Anson Huang <anson.huang@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Quoting Anson Huang (2019-02-13 07:59:32)
> @@ -145,6 +161,39 @@ static long clk_scu_round_rate(struct clk_hw *hw, un=
signed long rate,
>         return rate;
>  }
> =20
> +static bool clk_scu_atf_set_cpu_rate(struct clk_hw *hw, unsigned long ra=
te)
> +{
> +       struct clk_scu *clk =3D to_clk_scu(hw);
> +       struct arm_smccc_res res;
> +       unsigned int cluster_id;
> +       int i;
> +
> +       /* CPU frequency scaling can ONLY be done by ARM-Trusted-Firmware=
 */
> +       if (clk->clk_type =3D=3D IMX_SC_PM_CLK_CPU) {
> +               for (i =3D 0; i < ARRAY_SIZE(imx_sc_cpufreq_data); i++) {
> +                       if (!strcmp(clk_hw_get_name(hw),
> +                               imx_sc_cpufreq_data[i].clk_name)) {
> +                               cluster_id =3D imx_sc_cpufreq_data[i].clu=
ster_id;
> +                               break;
> +                       }
> +               }

Is there some reason why these clks can't be determined once at boot
time? It would be a good idea to avoid doing any sort of string
comparison here, instead just calling the right arm_smccc_smc with the
right arguments based on code that registers those types of clks.
