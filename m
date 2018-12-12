From: Sean Wang <sean.wang@kernel.org>
Subject: Re: [PATCH] pinctrl: mediatek: improve dependencies for PINCTRL_MTK_MOORE
Date: Wed, 12 Dec 2018 11:52:48 -0800
Message-ID: <CAGp9Lzqz6ZpbZ+241HKGZxLA7EwBnw+6s2EgTy3VXaoh6Xo6Hg@mail.gmail.com>
References: <d80dd05f6dbfc8fe7e85509cc00ebd8ec739b4d2.1544608681.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d80dd05f6dbfc8fe7e85509cc00ebd8ec739b4d2.1544608681.git.ryder.lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?UnlkZXIgTGVlICjmnY7luproq7op?= <ryder.lee@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, weijie.gao@mediatek.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 12, 2018 at 1:59 AM Ryder Lee <ryder.lee@mediatek.com> wrote:
>
> Improve dependencies for the pinctrl drivers which select
> PINCTRL_MTK_MOORE as its core layer.
> ---
>  drivers/pinctrl/mediatek/Kconfig | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
> index d8cb584..3a41dc8 100644
> --- a/drivers/pinctrl/mediatek/Kconfig
> +++ b/drivers/pinctrl/mediatek/Kconfig
> @@ -23,6 +23,7 @@ config PINCTRL_MTK_MOORE
>         select GENERIC_PINCTRL_GROUPS
>         select GENERIC_PINMUX_FUNCTIONS
>         select GPIOLIB
> +       select EINT_MTK

The change can be taken away from the patch as the patch EINT_MTK is
optional to the moore core.

>         select OF_GPIO
>
>  config PINCTRL_MTK_PARIS
> @@ -45,14 +46,14 @@ config PINCTRL_MT2701
>  config PINCTRL_MT7623
>         bool "Mediatek MT7623 pin control with generic binding"
>         depends on MACH_MT7623 || COMPILE_TEST
> -       depends on PINCTRL_MTK_MOORE
> -       default y
> +       default MACH_MT7623
> +       select PINCTRL_MTK_MOORE
>
>  config PINCTRL_MT7629
>         bool "Mediatek MT7629 pin control"
>         depends on MACH_MT7629 || COMPILE_TEST
> -       depends on PINCTRL_MTK_MOORE
> -       default y
> +       default MACH_MT7629
> +       select PINCTRL_MTK_MOORE
>
>  config PINCTRL_MT8135
>         bool "Mediatek MT8135 pin control"
> @@ -93,8 +94,8 @@ config PINCTRL_MT6797
>  config PINCTRL_MT7622
>         bool "MediaTek MT7622 pin control"
>         depends on ARM64 || COMPILE_TEST
> -       depends on PINCTRL_MTK_MOORE
> -       default y
> +       default ARM64 && ARCH_MEDIATEK
> +       select PINCTRL_MTK_MOORE
>

We can add a change allowing PINCTRL_MTK_MOORE to be a non-visible
symbol in the same patch according to the general rules
kconfig-language.txt defines. And also turn PINCTRL_MTK_PARIS to
non-visible in another patch would be good.

Apart from that, the above three changes are fine with me, it helps to
be more consistent with other driver and the target SoC would be
coupled with the corresponding essential pinctrl driver.

>  config PINCTRL_MT8173
>         bool "Mediatek MT8173 pin control"
> --
> 1.9.1
>
