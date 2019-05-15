Return-Path: <SRS0=4cVb=TP=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20190514145605.19112-1-chris.brandt@renesas.com>
 <20190514145605.19112-16-chris.brandt@renesas.com> <CAMuHMdXx=7v5v3tHwS-01eNnzz6NSfs=M02jU1tNJMdcRbGScg@mail.gmail.com>
 <TYXPR01MB15689E3664801057DFCA09EA8A090@TYXPR01MB1568.jpnprd01.prod.outlook.com>
In-Reply-To: <TYXPR01MB15689E3664801057DFCA09EA8A090@TYXPR01MB1568.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 May 2019 16:33:03 +0200
Message-ID: <CAMuHMdWLB-JE=2f=Mq9np_b5Wuj6=nB2ywWquBFheoBVxPaAfQ@mail.gmail.com>
Subject: Re: [PATCH v3 15/15] ARM: dts: rza2mevb: Add USB host support
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, USB list <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Wed, May 15, 2019 at 4:03 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Wed, May 15, 2019, Geert Uytterhoeven wrote:
> > > +/* USB-0 as Host */
> > > +/* NOTE: Requires JP3 to be fitted */
> >
> > This not applies to the dr_mode property below, right?
> > So perhaps it should be moved there...
> >
> > > +&usb2_phy0 {
> > > +       pinctrl-names = "default";
> > > +       pinctrl-0 = <&usb0_pins>;
> > > +       dr_mode = "host";
> >
> > ... like:
> >
> >     dr_mode = "host";    /* Requires JP3 to be fitted */
>
> OK, if you think it makes more sense there.
>
> > Does resistor R78 need to be mounted, too?
>
> By default, R78 and R79 are not populated on these boards, and both Host
> and Function work fine without board modification, so I would say
> populating R78 is not a requirement as far as I can tell.

I asked because after reading Section 2.4 USB Interface in the RZ/A2M CPU
Board  User's Manual, it's not clear to me when one needs to
populate one of these resistors. Especially in relation to JP3, which
talks about 2 possible modes (host vs. function), while the resistor
paragraph talks about 3 possible modes (dual-role vs. host vs.
function).

Perhaps I just need to drink more USB Kool-Aid?
(no Kool-Aid sold in local shops, though; we live on Coke ;-)

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
