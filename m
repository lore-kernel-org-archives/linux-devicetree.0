From: Sean Wang <sean.wang@kernel.org>
Subject: Re: [PATCH v1] pinctrl: mediatek: improve Kconfig dependencies
Date: Wed, 12 Dec 2018 20:21:04 -0800
Message-ID: <CAGp9LzrQoLNonZDHqCJqV8iihxhB1u4vu23HORO0GbN4fz7xzQ@mail.gmail.com>
References: <e4eb66dec2901016e01767932461c5d560762f66.1544666839.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e4eb66dec2901016e01767932461c5d560762f66.1544666839.git.ryder.lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?UnlkZXIgTGVlICjmnY7luproq7op?= <ryder.lee@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, weijie.gao@mediatek.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

It looks good to me. Thanks for bringing the improved version soon.

Acked-by: Sean Wang <sean.wang@kernel.org>

On Wed, Dec 12, 2018 at 6:28 PM Ryder Lee <ryder.lee@mediatek.com> wrote:
>
> Remove prompts to make all pinctrl cores to non-visible symbols and
> make sure the target SoCs would be coupled with the corresponding
> cores.
>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
> Changes since v1:
> - Revise commit message
> - Change all pinctrl cores to non-visible symbols
> - Drop EINT_MTK in PINCTRL_MTK_MOORE
> ---
>  drivers/pinctrl/mediatek/Kconfig | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
> index d8cb584..1817786 100644
> --- a/drivers/pinctrl/mediatek/Kconfig
> +++ b/drivers/pinctrl/mediatek/Kconfig
> @@ -17,7 +17,7 @@ config PINCTRL_MTK
>         select OF_GPIO
>
>  config PINCTRL_MTK_MOORE
> -       bool "MediaTek Moore Core that implements generic binding"
> +       bool
>         depends on OF
>         select GENERIC_PINCONF
>         select GENERIC_PINCTRL_GROUPS
> @@ -26,7 +26,7 @@ config PINCTRL_MTK_MOORE
>         select OF_GPIO
>
>  config PINCTRL_MTK_PARIS
> -       bool "MediaTek Paris Core that implements vendor binding"
> +       bool
>         depends on OF
>         select PINMUX
>         select GENERIC_PINCONF
> @@ -45,14 +45,14 @@ config PINCTRL_MT2701
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
> @@ -93,8 +93,8 @@ config PINCTRL_MT6797
>  config PINCTRL_MT7622
>         bool "MediaTek MT7622 pin control"
>         depends on ARM64 || COMPILE_TEST
> -       depends on PINCTRL_MTK_MOORE
> -       default y
> +       default ARM64 && ARCH_MEDIATEK
> +       select PINCTRL_MTK_MOORE
>
>  config PINCTRL_MT8173
>         bool "Mediatek MT8173 pin control"
> --
> 1.9.1
>
