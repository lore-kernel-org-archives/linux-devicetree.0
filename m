From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v4] MAINTAINERS: Add file patterns for x86 device tree bindings
Date: Fri, 22 Jun 2018 22:14:40 +0200
Message-ID: <CAMuHMdVkg3gOkykbZOzW2CpCd+WRdyKqehs9_WKQ8nbtSgwVgw@mail.gmail.com>
References: <20180622100820.29616-1-geert@linux-m68k.org> <alpine.DEB.2.21.1806221753560.2402@nanos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.1806221753560.2402@nanos.tec.linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, the arch/x86 maintainers <x86@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Thomas,

On Fri, Jun 22, 2018 at 5:57 PM Thomas Gleixner <tglx@linutronix.de> wrote:
> On Fri, 22 Jun 2018, Geert Uytterhoeven wrote:
> > Submitters of device tree binding documentation may forget to CC
> > the subsystem maintainer if this is missing.
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
> > v3:
> >   - Update for next-20180622,
> >
> > v2:
> >   - No changes.
> >
> > Impact on "scripts/get_maintainer.pl -f Documentation/devicetree/bindings/x86/":
> >
> > -Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS,commit_signer:1/1=100%)
> > +Thomas Gleixner <tglx@linutronix.de> (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT))
>
> I assume there is no way to make sure that Rob and the device tree folks
> are on top of that list? While it's somehow x86 related most of the
> devicetree details are way over my head. :)

I think the order is from most-specific to least-specific.

> I'll pick it up nevertheless

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
