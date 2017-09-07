From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 14/18] arm64: dts: ulcb-kf: enable PCA9539 on I2C2
Date: Thu, 7 Sep 2017 12:49:29 +0200
Message-ID: <CAMuHMdUYdqKTOF6kUMNKHzcKE=s_UNf-g86z44EvtDQV8Kf+Fg@mail.gmail.com>
References: <1504737267-22829-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1504737415-23386-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1504737415-23386-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Vladimir,

On Thu, Sep 7, 2017 at 12:36 AM, Vladimir Barinov
<vladimir.barinov@cogentembedded.com> wrote:
> This supports PCA9539 gpio expanders on I2C2 bus on ULCB Kingfisher board
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> ---
>  arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> index 71dee77..40885e7 100644
> --- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> @@ -48,6 +48,28 @@
>         status = "okay";
>  };
>
> +&i2c2 {
> +       gpio_exp_74: pca9539@74 {

Please use generic names: gpio@74

> +               compatible = "nxp,pca9539";
> +               reg = <0x74>;
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +               interrupt-controller;
> +               interrupt-parent = <&gpio6>;
> +               interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
> +       };
> +
> +       gpio_exp_75: pca9539@75 {

gpio@75

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
