From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 0/12] arm64: renesas: add H3ULCB board
Date: Thu, 1 Sep 2016 10:39:04 +0200
Message-ID: <CAMuHMdX4sxY4_FKemcQfYtvCr5ZZ52nTqnRtp5G42X93UTT8aw@mail.gmail.com>
References: <1472637712-14583-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1472637712-14583-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
List-Id: devicetree@vger.kernel.org

Hi Vladimir,

On Wed, Aug 31, 2016 at 12:01 PM, Vladimir Barinov
<vladimir.barinov@cogentembedded.com> wrote:
> This adds the folowing:
> - R8A7795 SoC based H3ULCB low cost board device tree
> - Document DT bindings

Thanks for your split series!

> Vladimir Barinov (12):
> [01/12] dt: arm: shmobile: add H3ULCB board DT bindings
> [02/12] arm64: dts: h3ulcb: initial device tree
> [03/12] arm64: dts: h3ulcb: enable SCIF clk and pins
> [04/12] arm64: dts: h3ulcb: enable EthernetAVB
> [05/12] arm64: dts: h3ulcb: enable GPIO leds
> [06/12] arm64: dts: h3ulcb: enable SDHI0
> [07/12] arm64: dts: h3ulcb: enable I2C2
> [08/12] arm64: dts: h3ulcb: enable EXTALR clk
> [09/12] arm64: dts: h3ulcb: enable WDT
> [10/12] arm64: dts: h3ulcb: enable USB2 PHY of channel 1
> [11/12] arm64: dts: h3ulcb: enable USB2.0 Host channel 1

I went through all of the above...

> [12/12] arm64: dts: h3ulcb: Sound SSI support

... but I'm leaving this one for Morimoto-san.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
