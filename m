From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/6] arm64: dts: renesas: ulcb: Enable I2C4
Date: Mon, 10 Jul 2017 10:20:02 +0200
Message-ID: <CAMuHMdVPNoCZz3fiqXOQ6Rx_jzAa4-rDAE9XD3jZH-mkZJmUhg@mail.gmail.com>
References: <1499393396-11594-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1499393396-11594-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 7, 2017 at 4:09 AM, Vladimir Barinov
<vladimir.barinov@cogentembedded.com> wrote:
> From: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
>
> This enables I2C4 for ULCB board
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
> @@ -189,6 +189,12 @@
>         };
>  };
>
> +&i2c4 {
> +       status = "okay";
> +
> +       clock-frequency = <400000>;

Is this a bus limitation, or a limitation for the VC6 that's added in a later
patch?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
