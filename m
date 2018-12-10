Return-Path: <SRS0=EUt7=OT=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41517 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727058AbeLJMDr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 10 Dec 2018 07:03:47 -0500
Date: Mon, 10 Dec 2018 13:03:43 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/2] ARM: dts: stout: Convert to new LVDS DT bindings
Message-ID: <20181210120343.bcutoupwlbfxesta@verge.net.au>
References: <20181203151242.25875-1-geert+renesas@glider.be>
 <2301881.HCRvWxNAtB@avalon>
 <9715f969-2487-6699-70af-3e3c4d176f72@gmail.com>
 <6335524.oXJRfKre9U@avalon>
 <6326f516-5cb9-5ff7-308e-4e539b7f00fd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6326f516-5cb9-5ff7-308e-4e539b7f00fd@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Dec 07, 2018 at 07:36:42PM +0100, Marek Vasut wrote:
> On 12/05/2018 06:41 AM, Laurent Pinchart wrote:
> > Hi Marek,
> > 
> > On Wednesday, 5 December 2018 03:10:18 EET Marek Vasut wrote:
> >> On 12/03/2018 11:48 PM, Laurent Pinchart wrote:
> >>> On Tuesday, 4 December 2018 00:24:32 EET Marek Vasut wrote:
> >>>> On 12/03/2018 10:48 PM, Laurent Pinchart wrote:
> >>>>> On Monday, 3 December 2018 17:12:41 EET Geert Uytterhoeven wrote:
> >>>>>> As of commit 6d2ca85279becdff ("dt-bindings: display: renesas:
> >>>>>> Deprecate LVDS support in the DU bindings"), the internal LVDS encoder
> >>>>>> has DT bindings separate from the DU.  The Lager device tree was ported
> >>>>>> over to the new model, but the Stout device tree was forgotten.
> >>>>>>
> >>>>>> Fixes: 15a1ff30d8f9bd83 ("ARM: dts: r8a7790: Convert to new LVDS DT
> >>>>>> bindings") Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >>>>>> ---
> >>>>>> Compile-tested only.
> >>>>>
> >>>>> I can't test the patch either but it looks fine to me.
> >>>>>
> >>>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>>>>
> >>>>> I assume you will send this directly to Simon, so I don't plan to take
> >>>>> the patch in my tree.
> >>>>
> >>>> I have a Stout if you need me to test something.
> >>>
> >>> Could you test HDMI output ? We just need to ensure that everything is
> >>> probed correctly, so display anything on the HDMI output will do.
> >>
> >> Sure, can you push me a branch somewhere, so I don't have to hunt down
> >> patches ?
> > 
> > Only this patch should be needed. You can get it from https://
> > patchwork.kernel.org/patch/10709781/ and apply it on top of v4.19. Please 
> > don't use v4.20-rc is there's one missing regression fix there (it has been 
> > merged in the media tree and should make it to the final release).
> 
> On R8A7790 H2 ES3.0 Stout
> 
> Tested-by: Marek Vasut <marek.vasut@gmail.com>

Thanks, applied for v4.22.
