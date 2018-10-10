Return-Path: <SRS0=Of4m=MW=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com>
 <51491585-16fb-93b1-bb1a-09e89683f2f0@cogentembedded.com> <CAMuHMdWsW-E_a17LJ-i4Wts531B-PyYqW9mqWQmt=jH6fUpOPg@mail.gmail.com>
 <1ef39615-fc82-dc2a-05eb-7b1aed7afa98@cogentembedded.com> <CAMuHMdUqBz_BB3+jDDxO0dXq1RSQQ6KK8CjR0WSQvWjMZBMnXQ@mail.gmail.com>
 <b0304262-8d50-db25-149e-fce348ced51f@cogentembedded.com>
In-Reply-To: <b0304262-8d50-db25-149e-fce348ced51f@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Oct 2018 09:10:54 +0200
Message-ID: <CAMuHMdU0=1X6m7bbSatLhMwMURf8Ffo78hLKzucaw2VX1bjkfA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77970: add thermal support
Content-Type: text/plain; charset="UTF-8"
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Hi Sergei,

On Mon, Oct 8, 2018 at 8:04 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 10/08/2018 07:40 PM, Geert Uytterhoeven wrote:
> >>>> Describe THS/CIVM in the R8A77970 device trees.
> >>>> Based on the original (and large) patches by Vladimir Barinov.

> >>>> +                               0 0xe6190100 0 0x38>;
> >>>
> >>> What about the CIVM status register? DT describes hardware, not driver
> >>> limitations.
> >>
> >>    I wasn't sure whether to put it into a separate "reg" tuple (which would confuse
> >> the driver) or not. After looking into the manual again, I'm going to extend the
> >> 2nd "reg" tuple...
> >
> > The CIVM Status Register indicates the chip internal voltage.
> > As such it's not a per-channel property, and IMHO doesn't belong in the second
> > tuple
>
>    I was looking a the block diagrams (both in the chapters 10A and 10B) and I got a totally different impression...

I stand corrected. So extending the second reg block is fine.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
