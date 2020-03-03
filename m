Return-Path: <SRS0=BDx3=4U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA6E8C3F2D1
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 18:48:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 84BC220848
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 18:48:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kio74RpW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730052AbgCCSs3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Mar 2020 13:48:29 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:52976 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729203AbgCCSs2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Mar 2020 13:48:28 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C28F2AF;
        Tue,  3 Mar 2020 19:48:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1583261306;
        bh=xjKfkm7MxwxqOq3hL/YppNzZPfz7ORMU2D6/8zU5i0c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kio74RpWJCIG2E3/srA2XV969ivzkOnx8qTgtvnpNEgFX0ue4/9dKtz0NtevE7t0e
         V2sUj56NQWIv2cri1AxUBek2MaoGLvuwzj9xpMHSXv/WQLn6XzHpK/kVRjBwZB4uhK
         WzAC3wL3usPjAIub2XrxFJXerni1TDZjctYwnUwE=
Date:   Tue, 3 Mar 2020 20:48:05 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: Re: [PATCH v3 0/5] dt-bindings: convert timing + panel-dpi to DT
 schema
Message-ID: <20200303184805.GI11333@pendragon.ideasonboard.com>
References: <20200216181513.28109-1-sam@ravnborg.org>
 <20200229181320.GA14589@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200229181320.GA14589@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Sam,

On Sat, Feb 29, 2020 at 07:13:20PM +0100, Sam Ravnborg wrote:
> On Sun, Feb 16, 2020 at 07:15:08PM +0100, Sam Ravnborg wrote:
> > This set of patches convert display-timing.txt to DT schema.
> > To do that add a panel-timing.yaml file that include all the
> > panel-timing properties and use this in panel-common and in display-timings.
> > 
> > panel-dpi was also converted so we have no .txt users left of panel-timing
> > in panel/
> > 
> > Everything passed dt_binding_check - and the trivial errors I tried in
> > the examples was all catched during validation.
> > 
> > This work was triggered by a patch-set from Oleksandr Suvorov aiming
> > at updating panel-lvds to support panel-dpi.
> > This will make it simple to add additional properties to panel-dpi.
> > 
> > Thanks for the quick responses on v2 and likewise the quick
> > feedback on the request for the license change!
> > 
> > Highlight from v3 - se individual patches for details.
> > - Added panel-dpi support to panel-simple.
> >   We can now add a simple panel just by addding timing parameters
> >   in a DT node
> >   The patch [5/5] is RFC as test is pending
> > - To support panel-dpi in panel-simple - add a data-mapping
> >   property to panel-dpi
> > 
> > Highlights from v2 - see individual patches for details.
> > - Got acks for the license change
> > - Simplfied panel-timings bindings
> > - panel-dpi can now be used without a panel specific compatible
> >   So panel-dpi can be used as a generic binding for dumb panels
> > 
> > Feedback welcome!
> > 
> > 	Sam
> > 
> > Sam Ravnborg (5):
> >       dt-bindings: display: add panel-timing.yaml
> >       dt-bindings: display: convert display-timings to DT schema
> >       dt-bindings: display: convert panel-dpi to DT schema
> >       dt-bindings: display: add data-mapping to panel-dpi
> >       drm/panel: simple: add panel-dpi support
> 
> All patches now pushed to drm-misc-next.
> Dropped lvds666 when applying the patches.

My feedback is a bit late. Would you like to still take it into
consideration yourself, or would you like me to submit patches ?

> > 
> >  .../bindings/display/panel/display-timing.txt      | 124 +----------
> >  .../bindings/display/panel/display-timings.yaml    |  77 +++++++
> >  .../bindings/display/panel/panel-common.yaml       |  15 +-
> >  .../bindings/display/panel/panel-dpi.txt           |  50 -----
> >  .../bindings/display/panel/panel-dpi.yaml          |  82 ++++++++
> >  .../bindings/display/panel/panel-timing.yaml       | 227 +++++++++++++++++++++
> >  drivers/gpu/drm/panel/panel-simple.c               |  74 ++++++-
> >  7 files changed, 470 insertions(+), 179 deletions(-)

-- 
Regards,

Laurent Pinchart
