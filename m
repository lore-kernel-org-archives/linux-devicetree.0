From: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH] pinctrl: add drive for I2C related pins on MT8183
Date: Fri, 8 Mar 2019 13:59:58 +0800
Message-ID: <CANMq1KAyvBLzGKOp=LXy3Ft3khs=QsUgTLXMq1mTd7o2_phcsg@mail.gmail.com>
References: <20190303015341.986-1-zhiyong.tao@mediatek.com> <20190303015341.986-2-zhiyong.tao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190303015341.986-2-zhiyong.tao@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>, liguo.zhang@mediatek.com, Eddie Huang <eddie.huang@mediatek.com>, hongkun.cao@mediatek.com, biao.huang@mediatek.com, hongzhou.yang@mediatek.com, chuanjia.liu@mediatek.com, Erin Lo <erin.lo@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This is a v3, I think, please make sure the update the email title,
and add a changelog below ---.

On Sun, Mar 3, 2019 at 9:54 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
>
> This patch provides the advanced drive for I2C used pins on MT8183.
> The detail strength specification description of the I2C pin is as follows.
> When E1=0/E0=0, the strength is 0.125mA.
> When E1=0/E0=1, the strength is 0.25mA.
> When E1=1/E0=0, the strength is 0.5mA.
> When E1=1/E0=1, the strength is 1mA.
>
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  drivers/pinctrl/mediatek/pinctrl-mt8183.c        | 50 ++++++++++++++++++++++++
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 45 +++++++++++++++++++++
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h | 13 ++++++
>  drivers/pinctrl/mediatek/pinctrl-paris.c         | 20 ++++++++++
>  4 files changed, 128 insertions(+)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8183.c b/drivers/pinctrl/mediatek/pinctrl-mt8183.c
> index 6262fd3678ea..f034574fc593 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt8183.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt8183.c
> @@ -472,6 +472,51 @@ static const struct mtk_pin_field_calc mt8183_pin_r1_range[] = {
>         PIN_FIELD_BASE(133, 133, 8, 0x0D0, 0x10, 13, 1),
>  };
[snip]
>  static const struct mtk_pin_reg_calc mt8183_reg_cals[PINCTRL_PIN_REG_MAX] = {
>         [PINCTRL_PIN_REG_MODE] = MTK_RANGE(mt8183_pin_mode_range),
>         [PINCTRL_PIN_REG_DIR] = MTK_RANGE(mt8183_pin_dir_range),
> @@ -485,6 +530,9 @@ static const struct mtk_pin_reg_calc mt8183_reg_cals[PINCTRL_PIN_REG_MAX] = {
>         [PINCTRL_PIN_REG_PUPD] = MTK_RANGE(mt8183_pin_pupd_range),
>         [PINCTRL_PIN_REG_R0] = MTK_RANGE(mt8183_pin_r0_range),
>         [PINCTRL_PIN_REG_R1] = MTK_RANGE(mt8183_pin_r1_range),
> +       [PINCTRL_PIN_REG_DRV_EN_DIS] = MTK_RANGE(mt8183_pin_e1e0en_range),

I find the name EN_DIS confusing: I think it means ENable_DISable, but
when I read the code, I see stuff like (MANY_WORDS)_DIS = enable ? 1 :
0, which make me think that the polarity is wrong.

Can we just call this PINCTRL_PIN_REG_DRV_EN?

> +       [PINCTRL_PIN_REG_DRV_E0] = MTK_RANGE(mt8183_pin_e0_range),
> +       [PINCTRL_PIN_REG_DRV_E1] = MTK_RANGE(mt8183_pin_e1_range),
>  };
>
[snip]
