Return-Path: <SRS0=geGc=WT=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ot1-f68.google.com ([209.85.210.68]:35306 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728519AbfHWHZp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 23 Aug 2019 03:25:45 -0400
MIME-Version: 1.0
References: <20190822195600.30787-1-jacopo+renesas@jmondi.org>
 <20190823001209.GO5027@pendragon.ideasonboard.com> <20190823063227.7soxv2gx7t7acsqq@uno.localdomain>
In-Reply-To: <20190823063227.7soxv2gx7t7acsqq@uno.localdomain>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Aug 2019 09:25:32 +0200
Message-ID: <CAMuHMdWA6R93obZ+cq9M2XOn-vHGXaPxwP_Nzp_t1CfDE5mDHw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: Add LIF channel index to 'vsps'
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Jacopo,

On Fri, Aug 23, 2019 at 8:31 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
> On Fri, Aug 23, 2019 at 03:12:09AM +0300, Laurent Pinchart wrote:
> > On Thu, Aug 22, 2019 at 09:56:00PM +0200, Jacopo Mondi wrote:
> > > According to the Renesas R-Car DU bindings documentation, the 'vsps'
> > > property should be composed by a phandle to the VSP instance and the
> >
> > > index of the LIF channel assigned to the DU channel. Some SoC device
> > > tree source files do not specify any LIF channel index, relying on the
> > > driver defaulting it to 0 if not specified.
> > >
> > > Align all device tree files by specifying the LIF channel index as
> > > prescribed by the bindings documentation. While at it, add a comment to
> > > the 'vsps' property parsing routine to point out the LIF channel index
> > > is still defaulted to 0 for backward compatibility with non-standard DTB
> > > found in the wild.
> >
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

> > Note that Simon or Geert will likely ask you to split this patch in two,
> > in which case I'll take the driver part in my tree.
>
> I was not sure how to split this in facts.. Simon, Geert, would you
> like a v2 with DT changes separated from the driver comment update?

Yes please.

> (for the DT changes, one patch per SoC, or a single one?)

One patch for all SoCs is fine:

    arm64: dts: renesas: Add LIF channel indices to vsps properties

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
