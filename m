From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 14/18] arm64: dts: ulcb-kf: enable PCA9539 on I2C2
Date: Wed, 20 Sep 2017 15:44:40 +0200
Message-ID: <CAMuHMdWvhm_bbLz8cBqPWC-nXrTr6jw4cBV1A_WAsvi6DzsR0w@mail.gmail.com>
References: <1505398760-4774-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1505398760-4774-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Vladimir,

On Thu, Sep 14, 2017 at 4:19 PM, Vladimir Barinov
<vladimir.barinov@cogentembedded.com> wrote:
> This supports PCA9539 gpio expanders on I2C2 bus on ULCB Kingfisher board
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> @@ -48,6 +48,28 @@
>         status = "okay";
>  };
>
> +&i2c2 {
> +       gpio_exp_74: gpio@74 {
> +               compatible = "nxp,pca9539";

According to the schematics, this is the TI TCA9539, an enhanced version
of the NXP PCA9539. So I'd expect "ti,tca9539".

However, using the latter may not work (I didn't try), as pca953x_id[]
lists both parts, while pca953x_dt_ids[] lists only the NXP part number.

> +               reg = <0x74>;
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +               interrupt-controller;
> +               interrupt-parent = <&gpio6>;
> +               interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
> +       };
> +
> +       gpio_exp_75: gpio@75 {
> +               compatible = "nxp,pca9539";

Likewise.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
