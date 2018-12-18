Return-Path: <SRS0=Xrcn=O3=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20181129130559.66732-1-chris.brandt@renesas.com>
 <20181129130559.66732-3-chris.brandt@renesas.com> <20181212021549.GA26333@bogus>
 <TYXPR01MB1568DD386FE18BD1F985E5178AA70@TYXPR01MB1568.jpnprd01.prod.outlook.com>
 <CAL_Jsq+Ah7Xg0VnEaYyn4giFeQme9r9GyRsFDucq78BP+Cw2=A@mail.gmail.com>
 <TY2SPR01MB0015C0AC923F1CDEC44061D88AA70@TY2SPR01MB0015.jpnprd01.prod.outlook.com>
 <CAL_JsqL5rLb+6Qhet0zqpHuqeU42wsFRJ+S48N0KPg43KxOiDg@mail.gmail.com>
 <TYXPR01MB156894C0FEE2A2CF02820A018ABC0@TYXPR01MB1568.jpnprd01.prod.outlook.com>
 <CAL_JsqLkqUTWh7RkG8tdTNhaTOMTOovDstZCqC=croQbAWmJSg@mail.gmail.com> <TYXPR01MB1568A2C057989ADB17FA07B88ABC0@TYXPR01MB1568.jpnprd01.prod.outlook.com>
In-Reply-To: <TYXPR01MB1568A2C057989ADB17FA07B88ABC0@TYXPR01MB1568.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Dec 2018 08:42:36 +0100
Message-ID: <CAMuHMdW8otcCzZiHw-QySWNtk=dn=m8FFbH2=2a5u6TN=GZnMA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: r7s9210-rza2mevb: Add support for RZ/A2M EVB
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Kumar Gala <kumar.gala@linaro.org>, Simon Horman <horms@verge.net.au>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Mon, Dec 17, 2018 at 8:40 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Monday, December 17, 2018 1, linux-renesas-soc-owner@vger.kernel.org wrote:
> > > Yup...there's the killer!
> > > You'll notice that in mainline RZ/A devices, there is no QSPI driver,
> > > and also the QSPI clock is left out of the list of HW clocks. Otherwise,
> > > as you mentioned, that 'unused' clock would get shut off at the end of
> > > boot...and you're whole system would stop immediately.
> >
> > If you had a simple driver with the binding as I proposed, then it
> > could do the ioremap and clock management. And you could also have
> > specific SPI and flash drivers for when you need to flashing without
> > changing the DT.
>
> I agree.
>
> At the same time, this particular XIP-QSPI HW is now used in the latest
> Renesas R-Car devices, and there has been some talk of upstreaming the
> driver for it (as in, using it in SPI mode instead of XIP mode).
> I'm waiting to see where that ends up, and if I should just use that
> SPI mode driver for the RZ/A series but simply put in a new property like
> "use-xip-mode;" that basically tells the driver to do nothing except enable
> the clock (again) so it doesn't get shut off at the end of boot.

The "clock management" should simply be calls to pm_runtime_enable()
and pm_runtime_get_sync().

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
