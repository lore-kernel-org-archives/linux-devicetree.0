From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 2/2] clocksource: Add renesas-ostm timer driver
Date: Wed, 25 Jan 2017 09:37:00 +0100
Message-ID: <CAMuHMdXHWtSP00nHXPmiPS0qjihizXEjoP_C+AMmQVJTKfiD6A@mail.gmail.com>
References: <20170123135423.28780-1-chris.brandt@renesas.com>
 <20170123135423.28780-3-chris.brandt@renesas.com> <20170123175210.GH2166@mai>
 <SG2PR06MB11657AE9653A4B66B1EA02718A750@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <20170124143222.GA2021@mai> <SG2PR06MB1165F79A1675FAC9ABEF12998A750@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <SG2PR06MB1165F79A1675FAC9ABEF12998A750@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 24, 2017 at 9:19 PM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
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
> It was a good idea....but it will not work.
>
> While CLOCKSOURCE_OF_DECLARE is good at putting the driver at the
> front of the line for loading, it's too early in boot to detect
> a platform_device.

That's correct. All those *_OF_DECLARE() style initializations start
to break as soon as power and/or clock domains are involved.
That's one reason why some subsystems (e.g. clock) are moving away from it.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
