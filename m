Return-Path: <SRS0=xVPa=NE=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <HE1PR0402MB3323967BD6C0E11C738BFF38F1F40@HE1PR0402MB3323.eurprd04.prod.outlook.com>
 <20181022082906.GE7068@kroah.com> <HE1PR0402MB3323E108AF8810DEC38B7691F1F40@HE1PR0402MB3323.eurprd04.prod.outlook.com>
 <20181022103426.GA4546@kroah.com> <CADRPPNQyxKpz8QY0myVOz9+sA-aAnwJptcaxxxBnXUskT=f6Lg@mail.gmail.com>
 <2f64ffc4477a4f17b4f8188e61c52ae8@HQMAIL107.nvidia.com> <958f281574ad4d89a14ee8ef28ebf175@HQMAIL107.nvidia.com>
In-Reply-To: <958f281574ad4d89a14ee8ef28ebf175@HQMAIL107.nvidia.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Oct 2018 11:27:35 +0200
Message-ID: <CAMuHMdX+hHmJWYwuZiHxNvb+8ycNPmHOTPGtjgpVsMhL-1wv5Q@mail.gmail.com>
Subject: Re: using interrupt controller dt-bindings macros in Non GPL dts files
Content-Type: text/plain; charset="UTF-8"
To: Stephen Warren <swarren@nvidia.com>
Cc: Leo Li <leoyang.li@nxp.com>, Greg KH <gregkh@linuxfoundation.org>, pankaj.bansal@nxp.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Thierry Reding <treding@nvidia.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, V.Sethi@nxp.com, udit.kumar@nxp.com
List-ID: <devicetree@vger.kernel.org>

On Tue, Oct 23, 2018 at 11:39 PM Stephen Warren <swarren@nvidia.com> wrote:
> Stephen Warren wrote at Tuesday, October 23, 2018 1:40 PM:
> > Li Yang wrote at Tuesday, October 23, 2018 1:10 PM:
> > > On Mon, Oct 22, 2018 at 5:35 AM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Mon, Oct 22, 2018 at 09:18:02AM +0000, Pankaj Bansal wrote:
> > > > > 2. Would it be possible for the copyright owners of these header files
> > > > > to make these files dual licensed, so that we are able to use these
> > > > > files in our dts/dtsi files?
> > > >
> > > > You are going to have to deal with the legal departments of the
> > > > companies that own those copyrights.  Again, talk to your legal
> > > > department about how that would even work, or if they even wish for you
> > > > to be asking people and companies to do that.
> > >
> > > Right, we should work with the author/contributor of these two files.
> > >
> > > Hi Stephen and Geert,
> > >
> > > Are you ok with relicensing these two files with (GPL-2.0 OR MIT)?
> > > Given that many dts files in arm/arm64 are dual licensed with GPL and
> > > MIT/X11/BSD, it makes more sense that these header files are dual
> > > licensed with a permissive license too.
> >
> > FWIW, I have filed an internal bug to our IP audit team to see what they
> > think. I cannot predict the answer or timeline for an answer.
>
> It turns out I got a very quick answer from our legal department. The
> joy of filing a bug right before their scheduled meeting! We're fine
> either:
>
> a) Sending the files direct to you with an MIT license (we'd send a copy
> of the last version only touched by me, un less Geert also ack's the
> license change).
>
> b) Sending a patch to convert these files to just MIT (preferable), or
> perhaps dual GPLv2/MIT if that's what the kernel maintainers want.
>
> Let me know which option works best for you.

I think option b) makes most sense, to fix this for good.

I have no objections. I don't think my spelling fixes in commit
d6613aa750ad66b2 ("ARM: dt: GIC: Spelling s/specific/specifier/,
s/flaggs/flags/")
are copyrightable anyway ;-)

> That said, have you thought about all the other files you'll likely
> need; those two IRQ related files are unlikely to be the only files that
> are useful. Don't you want/need to relicense "everything" in include/dt/
> and arch/*/boot/dts/?

+1

Originally, the files were introduced without a license, thus defaulting to
GPL v2, and this was made "official" in Greg's commit b24413180f5600bc
("License cleanup: add SPDX GPL-2.0 license identifier to files with
no license").

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
