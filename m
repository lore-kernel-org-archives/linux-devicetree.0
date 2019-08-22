From: Sean Wang <sean.wang@kernel.org>
Subject: Re: [PATCH v2 07/11] pinctrl: mediatek: add mt6779 eint support
Date: Thu, 22 Aug 2019 11:13:48 -0700
Message-ID: <CAGp9Lzpsg2ZjP3Ydj+Fo88FXT_jrV=GnJ+vf4AsSNacwEEx=BA@mail.gmail.com>
References: <1566206502-4347-1-git-send-email-mars.cheng@mediatek.com> <1566206502-4347-8-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566206502-4347-8-git-send-email-mars.cheng@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mars Cheng <mars.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, CC Hwang <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>, lkml <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, devicetree@vger.kernel.org, wsd_upstream@mediatek.com, mtk01761 <wendell.lin@mediatek.com>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 19, 2019 at 2:22 AM Mars Cheng <mars.cheng@mediatek.com> wrote:
>
> add driver setting to support mt6779 eint
>
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>

Acked-by: Sean Wang <sean.wang@kernel.org>

> ---
>  drivers/pinctrl/mediatek/pinctrl-mt6779.c |    8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6779.c b/drivers/pinctrl/mediatek/pinctrl-mt6779.c
> index 145bf22..49ff3cc 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt6779.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt6779.c
> @@ -731,11 +731,19 @@
>         "iocfg_rt", "iocfg_lt", "iocfg_tl",
>  };
>
> +static const struct mtk_eint_hw mt6779_eint_hw = {
> +       .port_mask = 7,
> +       .ports     = 6,
> +       .ap_num    = 209,
> +       .db_cnt    = 16,
> +};
> +
>  static const struct mtk_pin_soc mt6779_data = {
>         .reg_cal = mt6779_reg_cals,
>         .pins = mtk_pins_mt6779,
>         .npins = ARRAY_SIZE(mtk_pins_mt6779),
>         .ngrps = ARRAY_SIZE(mtk_pins_mt6779),
> +       .eint_hw = &mt6779_eint_hw,
>         .gpio_m = 0,
>         .ies_present = true,
>         .base_names = mt6779_pinctrl_register_base_names,
> --
> 1.7.9.5
>
