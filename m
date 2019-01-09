From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] arm64/hisilicon: fix SDcard detection
Date: Wed, 9 Jan 2019 19:27:48 +0100
Message-ID: <CACRpkdbA8cvoaG_5=JCrpQd2k1HYRxUjqGsoGJLLvroGGQukkA@mail.gmail.com>
References: <1547056892-16527-1-git-send-email-vincent.guittot@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1547056892-16527-1-git-send-email-vincent.guittot@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Xu Wei <xuwei5@hisilicon.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Vincent!

On Wed, Jan 9, 2019 at 7:01 PM Vincent Guittot
<vincent.guittot@linaro.org> wrote:

> commit 89a5e15bcba8 ("gpio/mmc/of: Respect polarity in the device tree")
> has changed how cd_gpios phandle and cd-inverted are used to set gpio's flags.
>
> Since this change, hikey960 SDcard is not detected anymore because flags
> are not set correctly. Updating cd-gpios to set GPIO_ACTIVE_LOW instead
> of high, fixes the problem.
>
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>

Please check if this patch fixes your problem:
https://marc.info/?l=linux-mmc&m=154637189021211&w=2

> --- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> +++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> @@ -582,7 +582,7 @@
>         sd-uhs-sdr104;
>         disable-wp;
>         cd-inverted;
> -       cd-gpios = <&gpio25 3 0>;
> +       cd-gpios = <&gpio25 3 GPIO_ACTIVE_LOW>;

This is also a good change, but the old device tree should
continue to work so we need to fix the real bug.

If you also remove "cd-inverted" above, this patch should
hopefully still work and be fine to apply as well.

Yours,
Linus Walleij
