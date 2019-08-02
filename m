Return-Path: <SRS0=tfCq=V6=vger.kernel.org=devicetree-owner@kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:47820 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728211AbfHBJKQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 2 Aug 2019 05:10:16 -0400
Date: Fri, 2 Aug 2019 12:10:12 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH/RFC 10/12] arm64: dts: renesas: r8a774c0: Point LVDS0 to
 its companion LVDS1
Message-ID: <20190802091012.GN5008@pendragon.ideasonboard.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-11-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190802082754.GK5008@pendragon.ideasonboard.com>
 <CAMuHMdUFHddHJW=FsF8Ha0PZUiAyKrWGy6yg-0PtevB7HiHoHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdUFHddHJW=FsF8Ha0PZUiAyKrWGy6yg-0PtevB7HiHoHg@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Geert,

On Fri, Aug 02, 2019 at 11:03:54AM +0200, Geert Uytterhoeven wrote:
> On Fri, Aug 2, 2019 at 10:27 AM Laurent Pinchart wrote:
> > On Fri, Aug 02, 2019 at 08:34:07AM +0100, Fabrizio Castro wrote:
> > > Add the new renesas,companion property to the LVDS0 node to point to the
> > > companion LVDS encoder LVDS1.
> > > Based on similar work from Laurent Pinchart for the r8a7799[05].
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > and taken in my tree.
> 
> Shouldn't this go through renesas-devel and arm-soc?

I'm collecting multimedia-related DT patches for v5.4, but if you or
Simon want to take this patch, it will save me from sending a pull
request, so please go ahead :-)

-- 
Regards,

Laurent Pinchart
