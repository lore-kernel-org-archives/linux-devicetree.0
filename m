From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] ARM: dts: uniphier: fix pin groups of eMMC pin-mux node
Date: Wed, 22 Mar 2017 08:42:15 +0900
Message-ID: <CAK7LNAR5voXC=xNoLJ7CkrwRHxCFdnqSgZZkM31WJsYU=nrV9A@mail.gmail.com>
References: <1489246616-8060-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1489246616-8060-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>
List-Id: devicetree@vger.kernel.org

2017-03-12 0:36 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> The eMMC devices on UniPhier boards are generally used in the 8-bit
> mode.  So, DAT4-7 pins should be controlled.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  arch/arm/boot/dts/uniphier-pinctrl.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/uniphier-pinctrl.dtsi b/arch/arm/boot/dts/uniphier-pinctrl.dtsi
> index 8ee79da..246f35f 100644
> --- a/arch/arm/boot/dts/uniphier-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/uniphier-pinctrl.dtsi
> @@ -45,7 +45,7 @@
>
>  &pinctrl {
>         pinctrl_emmc: emmc_grp {
> -               groups = "emmc";
> +               groups = "emmc", "emmc_dat8";
>                 function = "emmc";
>         };
>

Applied to linux-uniphier.




-- 
Best Regards
Masahiro Yamada
