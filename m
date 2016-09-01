From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 0/12] arm64: renesas: add H3ULCB board
Date: Thu, 1 Sep 2016 21:25:08 +0200
Message-ID: <CAMuHMdWXfb1uVRebDAmHbh23SEAGhsCMAsFNo4hYOLH3VhWCMw@mail.gmail.com>
References: <1472637712-14583-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <CAMuHMdX4sxY4_FKemcQfYtvCr5ZZ52nTqnRtp5G42X93UTT8aw@mail.gmail.com> <20160901141711.GE14300@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20160901141711.GE14300@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Vladimir Barinov <vladimir.barinov@cogentembedded.com>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
List-Id: devicetree@vger.kernel.org

Hi Simon,

On Thu, Sep 1, 2016 at 4:17 PM, Simon Horman <horms@verge.net.au> wrote:
>> > [01/12] dt: arm: shmobile: add H3ULCB board DT bindings
>
> I have queued up the above patch after renaming it
> arm64: dts: h3ulcb: enable USB2.0 Host channel 1
>
>> > [02/12] arm64: dts: h3ulcb: initial device tree
>> > [03/12] arm64: dts: h3ulcb: enable SCIF clk and pins
>> > [04/12] arm64: dts: h3ulcb: enable EthernetAVB
>> > [05/12] arm64: dts: h3ulcb: enable GPIO leds
>> > [06/12] arm64: dts: h3ulcb: enable SDHI0
>> > [07/12] arm64: dts: h3ulcb: enable I2C2
>> > [08/12] arm64: dts: h3ulcb: enable EXTALR clk
>> > [09/12] arm64: dts: h3ulcb: enable WDT
>> > [10/12] arm64: dts: h3ulcb: enable USB2 PHY of channel 1
>> > [11/12] arm64: dts: h3ulcb: enable USB2.0 Host channel 1
>>
>> I went through all of the above...
>
> I have also queued up 02,03,04,07,08,09,11/12.

Any specific reason you skipped 10/12? I'm afraid it's a prerequisite for
11/12.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
