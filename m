From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 2/2] clocksource: Add renesas-ostm timer driver
Date: Wed, 25 Jan 2017 09:35:22 +0100
Message-ID: <CAMuHMdXHqDrmvaCBCXy5gHJ9h0_6S7g8R0ji=Sb5TSoH2s57Gw@mail.gmail.com>
References: <20170123135423.28780-1-chris.brandt@renesas.com>
 <20170123135423.28780-3-chris.brandt@renesas.com> <20170123175210.GH2166@mai>
 <SG2PR06MB11657AE9653A4B66B1EA02718A750@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <20170124143222.GA2021@mai> <SG2PR06MB11652097D0BFA1A058F9CFBC8A750@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <SG2PR06MB11652097D0BFA1A058F9CFBC8A750@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Chris,

On Tue, Jan 24, 2017 at 3:43 PM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Tuesday, January 24, 2017, Daniel Lezcano wrote:
>> > > > +early_platform_init("earlytimer", &ostm_timer);
>> > > > +subsys_initcall(ostm_init); module_exit(ostm_exit);
>> > > > +
>> > > > +MODULE_AUTHOR("Chris Brandt");
>> > > > +MODULE_DESCRIPTION("Renesas OSTM Timer Driver");
>> > > > +MODULE_LICENSE("GPL v2");
>> > >
>> > > Maybe you can try with builtin_platform ?
>> >
>> > Good idea. But, now I get a "Section mismatch" during link time so
>> > I'll have to figure out why that is.
>>
>> Mmh, I think it would be more consistent to convert this to:
>>
>> CLOCKSOURCE_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
>>
>> The only problem is to get the struct device associated to the of_node
>> passed as parameter to ostm_init in order to use the devm_* API.
>>
>> I think of_find_device_by_node should return the platform_device, then
>> pdev->dev. If that works the other drivers will benefit from that to
>> pdev->remove all
>> the rollback code everywhere.
>
> So I realized that in order to use builtin_platform, I can't have any of the
> functions in __init because the build system has no idea that I never plan
> on removing or probing again after boot. But, even if I take out all the
> __init from my code, I'm still calling clocksource_mmio_init which is __init
> so I can never escape the "Section mismatch".

For single-probe drivers, you can use builtin_platform_driver_probe().

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
