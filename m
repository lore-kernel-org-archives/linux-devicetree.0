From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 15/18] arm64: dts: ulcb-kf: enable PCA9539 on I2C4
Date: Thu, 7 Sep 2017 12:50:25 +0200
Message-ID: <CAMuHMdWGdaYLH8y0TeEiQigjWwJY8Yxu2v-1NFnztRJk7tFo8A@mail.gmail.com>
References: <1504737267-22829-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1504737423-23426-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1504737423-23426-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 7, 2017 at 12:37 AM, Vladimir Barinov
<vladimir.barinov@cogentembedded.com> wrote:
> This supports PCA9539 gpio expanders on I2C4 bus on ULCB Kingfisher board
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>

> --- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> @@ -70,6 +70,28 @@
>         };
>  };
>
> +&i2c4 {
> +       gpio_exp_76: pca9539@76 {

gpio@76

> +       gpio_exp_77: pca9539@77 {

gpio@77

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
