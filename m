From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 01/14] dt-bindings: display: renesas,cmm: Add R-Car CMM documentation
Date: Mon, 26 Aug 2019 10:38:04 +0200
Message-ID: <CAMuHMdWgc2QQu38mqcYrutwKzED-e0-cMUV-vEwa5njqGTB=mg@mail.gmail.com>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-2-jacopo+renesas@jmondi.org> <CAMuHMdVvjrMXap5CQ-grNYpJfOG6QeN26EW4tR_YE=VFv5ozqw@mail.gmail.com>
 <20190826075943.h7ivwagape3glym5@uno.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190826075943.h7ivwagape3glym5@uno.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Simon Horman <horms@verge.net.au>, Ulrich Hecht <uli@fpond.eu>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Koji Matsuoka <koji.matsuoka.xm@renesas.com>, muroya@ksk.co.jp, VenkataRajesh.Kalakodima@in.bosch.com, Harsha.ManjulaMallikarjun@in.bosch.com, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, DRI Development <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Jacopo,

On Mon, Aug 26, 2019 at 9:58 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
> On Mon, Aug 26, 2019 at 09:34:41AM +0200, Geert Uytterhoeven wrote:
> > On Sun, Aug 25, 2019 at 3:50 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> > > Add device tree bindings documentation for the Renesas R-Car Display
> > > Unit Color Management Module.
> > >
> > > CMM is the image enhancement module available on each R-Car DU video
> > > channel on R-Car Gen2 and Gen3 SoCs (V3H and V3M excluded).
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >
> > Thanks for your patch!
> >
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/renesas,cmm.txt
> > > @@ -0,0 +1,33 @@
> > > +* Renesas R-Car Color Management Module (CMM)
> > > +
> > > +Renesas R-Car image enhancement module connected to R-Car DU video channels.
> > > +
> > > +Required properties:
> > > + - compatible: shall be one or more of the following:
> > > +   - "renesas,cmm-r8a7795": for R8A7795 (R-Car H3) compatible CMM.
> > > +   - "renesas,cmm-r8a7796": for R8A7796 (R-Car M3-W) compatible CMM.
> > > +   - "renesas,cmm-r8a77965": for R8A77965 (R-Car M3-N) compatible CMM.
> > > +   - "renesas,cmm-r8a77990": for R8A77990 (R-Car E3) compatible CMM.
> > > +   - "renesas,cmm-r8a77995": for R8A77995 (R-Car D3) compatible CMM.
> >
> > Please use "renesas,<socype->-cmm" instead of "renesas,cmm-<soctype>".
> >
>
> I actually copied it from the r-car gpio bindings, and I liked
> cmm-<soctype> better. If you prefer I can change it though.

We switched from "renesas,cmm-<soctype>" to "renesas,<socype->-cmm"
a few years ago, upon request from the DT people:

    vendor -> family/SoC -> IP core

Unfortunately we cannot change the old style in existing bindings, without
great effort and backwards compatibility ramifications.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
