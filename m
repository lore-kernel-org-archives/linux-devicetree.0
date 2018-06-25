From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: uniphier: add headphone detect gpio
 for LD20 global board
Date: Tue, 26 Jun 2018 00:46:55 +0900
Message-ID: <CAK7LNARnMkTj3i=P80uiikhuD8xnX1wD85S9RRyFZzQ1BafpEA@mail.gmail.com>
References: <20180625034505.1404-1-suzuki.katsuhiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180625034505.1404-1-suzuki.katsuhiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

2018-06-25 12:45 GMT+09:00 Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>:
> This patch adds GPIO for headphone detection on LD20 global board.
>
> Signed-off-by: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>

Applied.  Thanks!

> ---
>  arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts b/arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts
> index 6a074a20c924..8aeb59486ff2 100644
> --- a/arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts
> +++ b/arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts
> @@ -60,6 +60,7 @@
>                         &i2s_port4
>                         &spdif_port0
>                         &comp_spdif_port0>;
> +               hp-det-gpio = <&gpio UNIPHIER_GPIO_IRQ(0) GPIO_ACTIVE_LOW>;
>         };
>
>         spdif-out {
> --
> 2.18.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
