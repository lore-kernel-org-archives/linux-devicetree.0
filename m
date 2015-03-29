From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: Re: [PATCH/RFC] ARM: shmobile: r8a7791: Remove MSIOF address from
 device tree
Date: Sun, 29 Mar 2015 22:22:13 +0900
Message-ID: <CAH1o70JyBbmQ9vDrpamtL=09nq64B9RM1asWOWRXEL0LdgrxMQ@mail.gmail.com>
References: <1426430633-3867-1-git-send-email-ykaneko0929@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1426430633-3867-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Linux-sh list <linux-sh@vger.kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Geert-san,

I'm wondering if you could find a moment to look over this patch.

Regards,
Kaneko

2015-03-15 23:43 GMT+09:00 Yoshihiro Kaneko <ykaneko0929@gmail.com>:
> From: Ryo Kataoka <ryo.kataoka.wt@renesas.com>
>
> MSIOF Base Address H'E6xx can be accessed by CPU and DMAC.
> MSIOF Base Address H'E7xx for DMAC was removed from H/W manual.
>
> Signed-off-by: Ryo Kataoka <ryo.kataoka.wt@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> ---
>
> This patch is based on devel branch of Simon Horman's renesas tree.
>
>  arch/arm/boot/dts/r8a7791.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
> index 4696062..3e9f824 100644
> --- a/arch/arm/boot/dts/r8a7791.dtsi
> +++ b/arch/arm/boot/dts/r8a7791.dtsi
> @@ -1288,7 +1288,7 @@
>
>         msiof0: spi@e6e20000 {
>                 compatible = "renesas,msiof-r8a7791";
> -               reg = <0 0xe6e20000 0 0x0064>, <0 0xe7e20000 0 0x0064>;
> +               reg = <0 0xe6e20000 0 0x0064>;
>                 interrupts = <0 156 IRQ_TYPE_LEVEL_HIGH>;
>                 clocks = <&mstp0_clks R8A7791_CLK_MSIOF0>;
>                 dmas = <&dmac0 0x51>, <&dmac0 0x52>;
> @@ -1300,7 +1300,7 @@
>
>         msiof1: spi@e6e10000 {
>                 compatible = "renesas,msiof-r8a7791";
> -               reg = <0 0xe6e10000 0 0x0064>, <0 0xe7e10000 0 0x0064>;
> +               reg = <0 0xe6e10000 0 0x0064>;
>                 interrupts = <0 157 IRQ_TYPE_LEVEL_HIGH>;
>                 clocks = <&mstp2_clks R8A7791_CLK_MSIOF1>;
>                 dmas = <&dmac0 0x55>, <&dmac0 0x56>;
> @@ -1312,7 +1312,7 @@
>
>         msiof2: spi@e6e00000 {
>                 compatible = "renesas,msiof-r8a7791";
> -               reg = <0 0xe6e00000 0 0x0064>, <0 0xe7e00000 0 0x0064>;
> +               reg = <0 0xe6e00000 0 0x0064>;
>                 interrupts = <0 158 IRQ_TYPE_LEVEL_HIGH>;
>                 clocks = <&mstp2_clks R8A7791_CLK_MSIOF2>;
>                 dmas = <&dmac0 0x41>, <&dmac0 0x42>;
> --
> 1.9.1
>
