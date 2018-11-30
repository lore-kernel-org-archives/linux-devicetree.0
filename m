Return-Path: <SRS0=qqZh=OJ=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20181129130559.66732-1-chris.brandt@renesas.com>
 <20181129130559.66732-2-chris.brandt@renesas.com> <20181130115500.twmtwnu352ukjm73@verge.net.au>
 <OSAPR01MB15534822E5E9CC52AA0BCE778AD30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
 <20181130122229.4iv6qgsnjyswoiiq@verge.net.au>
In-Reply-To: <20181130122229.4iv6qgsnjyswoiiq@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Nov 2018 17:03:19 +0100
Message-ID: <CAMuHMdWDa-_8-DQzLa6KnoFTk+23oKVwo4Wq0TQNunsA1ubXMQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: r7s9210: Initial SoC device tree
Content-Type: text/plain; charset="UTF-8"
To: Simon Horman <horms@verge.net.au>
Cc: Chris Brandt <Chris.Brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Simon,

On Fri, Nov 30, 2018 at 1:23 PM Simon Horman <horms@verge.net.au> wrote:
> On Fri, Nov 30, 2018 at 12:04:57PM +0000, Chris Brandt wrote:
> > On Friday, November 30, 2018, Simon Horman wrote:
> > > > + ostm0: timer@e803b000 {
> > > > +         compatible = "renesas,r7s9210-ostm", "renesas,ostm";
> > > > +         reg = <0xe803b000 0x30>;
> > >
> > >
> > > Its not clear to me why the size of the register range is 0x30.
> >
> > Because when reviewing the bindings docs, I was putting in 'exact'
> > values, but Geert said "those are ugly, just round up to make it look
> > nicer".
> > So instead of 0x21, I put 0x30.
> >
> > You know...the standard answer: Throw Geert under the bus ;)
>
> Lets leave 0x30 :)

Pfew...

BTW, I'd be surprised the hardware address decoder would route all
addresses in the range 0xe803b000..0xe803b02f to the OSTM.
0xe803b000..0xe803b03f sounds more logical to me, as it requires less gates.
But hey, who said hardware designers are logical? ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
