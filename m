From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/2] clk: qcom: clk-rpmh: Add QCOM RPMh clock driver
Date: Wed, 02 May 2018 08:27:08 -0700
Message-ID: <152527482828.138124.7114901348273696817@swboyd.mtv.corp.google.com>
References: <1525258277-3478-1-git-send-email-tdas@codeaurora.org>
 <1525258277-3478-3-git-send-email-tdas@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525258277-3478-3-git-send-email-tdas@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, Odelu Kukatla <okukatla@codeaurora.org>, Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Taniya Das (2018-05-02 03:51:17)
> +
> +static DEFINE_MUTEX(rpmh_clk_lock);
> +
> +#define __DEFINE_CLK_RPMH(_platform, _name, _name_active, _res_name,   \
> +                         _res_en_offset, _res_on)                      \
> +       static struct clk_rpmh _platform##_##_name_active;              \
> +       static struct clk_rpmh _platform##_##_name =3D {                 =
 \
> +               .res_name =3D _res_name,                                 =
 \
> +               .res_addr =3D _res_en_offset,                            =
 \
> +               .res_on_val =3D _res_on,                                 =
 \
> +               .peer =3D &_platform##_##_name_active,                   =
 \
> +               .valid_state_mask =3D (BIT(RPMH_WAKE_ONLY_STATE) |       =
 \
> +                                     BIT(RPMH_ACTIVE_ONLY_STATE) |     \
> +                                     BIT(RPMH_SLEEP_STATE)),           \
> +               .hw.init =3D &(struct clk_init_data){                    =
 \
> +                       .ops =3D &clk_rpmh_ops,                          =
 \
> +                       .name =3D #_name,                                =
 \
> +                       .parent_names =3D (const char *[]){ "xo_board",  =
 \
> +                                               "xo_board_div" },       \

The rpmh clks that do a div 2 can have a recalc_rate function that
returns the xo_board clk rate divided by 2 all the time. That may be
easier to do. Keep xo_board as parent, but then specify if it does div-2
or div-1 in the SoC specific listing. Then DT can only show 38.4 MHz.
The div 2 part is inside the SoC anyway so this seems more accurate too.

> +                       .num_parents =3D 2,                              =
 \
> +               },                                                      \
> +       };                                                              \
