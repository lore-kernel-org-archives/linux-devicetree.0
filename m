Return-Path: <SRS0=9+2E=TA=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20190430132309.12473-1-chris.brandt@renesas.com> <20190430132309.12473-7-chris.brandt@renesas.com>
In-Reply-To: <20190430132309.12473-7-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Apr 2019 17:21:57 +0200
Message-ID: <CAMuHMdWzN_1XmO8w_otDseJ+bxk+AKNouk-ycPPyM2XWMWritQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] ARM: dts: r7s9210-rza2mevb: Add Ethernet support
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux I2C <linux-i2c@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Tue, Apr 30, 2019 at 3:33 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> The RZ/A2M EVB sub board has 2 Ethernet jacks on it.
>
> Set switch SW6_4        to ON to use Ethernet Ch-0
> Set switch SW6_5        to ON to use Ethernet Ch-1
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm/boot/dts/r7s9210-rza2mevb.dts
> +++ b/arch/arm/boot/dts/r7s9210-rza2mevb.dts

Perhaps you want to add an "ethernet0" alias, so U-Boot can find the
device-node and add an appropriate "local-mac-address" property?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
