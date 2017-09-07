From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 16/18] arm64: dts: ulcb-kf: enable PCA9548 on I2C2
Date: Thu, 7 Sep 2017 12:37:02 +0200
Message-ID: <CAMuHMdU8qeM2RXSSsqf5ouPAE2gq_gpSd0iDj7TE2s9O_f-GVw@mail.gmail.com>
References: <1504737267-22829-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1504737430-23465-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1504737430-23465-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 7, 2017 at 12:37 AM, Vladimir Barinov
<vladimir.barinov@cogentembedded.com> wrote:
> This supports PCA9548 I2C switch on I2C2 bus on ULCB Kingfisher board
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> ---
>  arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> index 1cf8466..3bbc490 100644
> --- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> @@ -68,6 +68,14 @@
>                 interrupt-parent = <&gpio6>;
>                 interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
>         };
> +
> +       i2cswitch2: pca9548@71 {

Please use generic node names: i2c-switch@71

> +               compatible = "nxp,pca9548";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               reg = <0x71>;
> +               reset-gpios = <&gpio5 3 GPIO_ACTIVE_LOW>;
> +       };
>  };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
