From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v5 1/3] clk: meson: add emmc sub clock phase delay driver
Date: Thu, 18 Oct 2018 10:14:31 -0700
Message-ID: <153988287137.5275.1146335138540290297@swboyd.mtv.corp.google.com>
References: <1539839245-13793-1-git-send-email-jianxin.pan@amlogic.com>
 <1539839245-13793-2-git-send-email-jianxin.pan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1539839245-13793-2-git-send-email-jianxin.pan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
Cc: Yixun Lan <yixun.lan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Boris Brezillon <boris.brezillon@bootlin.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Liang Yang <liang.yang@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>, Hanjie Lin <hanjie.lin@amlogic.com>, Victor Wan <victor.wan@amlogic.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Jianxin Pan (2018-10-17 22:07:23)
> diff --git a/drivers/clk/meson/clkc.h b/drivers/clk/meson/clkc.h
> index 6b96d55..3309d78 100644
> --- a/drivers/clk/meson/clkc.h
> +++ b/drivers/clk/meson/clkc.h
> @@ -105,6 +105,18 @@ struct clk_regmap _name =3D {                       =
                         \
>         },                                                              \
>  };
>  =

> +struct meson_clk_phase_delay_data {
> +       struct parm                     phase;
> +       struct parm                     delay;
> +       unsigned int                    delay_step_ps;
> +};
> +
> +static inline struct meson_clk_phase_delay_data *
> +meson_clk_get_phase_delay_data(struct clk_regmap *clk)
> +{
> +       return (struct meson_clk_phase_delay_data *)clk->data;

Is data a void *? If so, please drop the useless cast.

> +}
> +
>  /* clk_ops */
>  extern const struct clk_ops meson_clk_pll_ro_ops;
>  extern const struct clk_ops meson_clk_pll_ops;
