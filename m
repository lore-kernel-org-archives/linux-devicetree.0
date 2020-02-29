Return-Path: <SRS0=QVf9=4R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97AD7C3F2CD
	for <linux-devicetree@archiver.kernel.org>; Sat, 29 Feb 2020 18:13:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 747EC2467D
	for <linux-devicetree@archiver.kernel.org>; Sat, 29 Feb 2020 18:13:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727487AbgB2SNZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 29 Feb 2020 13:13:25 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:46786 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727177AbgB2SNZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 29 Feb 2020 13:13:25 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 0317B20020;
        Sat, 29 Feb 2020 19:13:21 +0100 (CET)
Date:   Sat, 29 Feb 2020 19:13:20 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: Re: [PATCH v3 0/5] dt-bindings: convert timing + panel-dpi to DT
 schema
Message-ID: <20200229181320.GA14589@ravnborg.org>
References: <20200216181513.28109-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200216181513.28109-1-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8
        a=QBz0WmAjK130PHwwYnYA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, Feb 16, 2020 at 07:15:08PM +0100, Sam Ravnborg wrote:
> This set of patches convert display-timing.txt to DT schema.
> To do that add a panel-timing.yaml file that include all the
> panel-timing properties and use this in panel-common and in display-timings.
> 
> panel-dpi was also converted so we have no .txt users left of panel-timing
> in panel/
> 
> Everything passed dt_binding_check - and the trivial errors I tried in
> the examples was all catched during validation.
> 
> This work was triggered by a patch-set from Oleksandr Suvorov aiming
> at updating panel-lvds to support panel-dpi.
> This will make it simple to add additional properties to panel-dpi.
> 
> Thanks for the quick responses on v2 and likewise the quick
> feedback on the request for the license change!
> 
> Highlight from v3 - se individual patches for details.
> - Added panel-dpi support to panel-simple.
>   We can now add a simple panel just by addding timing parameters
>   in a DT node
>   The patch [5/5] is RFC as test is pending
> - To support panel-dpi in panel-simple - add a data-mapping
>   property to panel-dpi
> 
> Highlights from v2 - see individual patches for details.
> - Got acks for the license change
> - Simplfied panel-timings bindings
> - panel-dpi can now be used without a panel specific compatible
>   So panel-dpi can be used as a generic binding for dumb panels
> 
> Feedback welcome!
> 
> 	Sam
> 
> Sam Ravnborg (5):
>       dt-bindings: display: add panel-timing.yaml
>       dt-bindings: display: convert display-timings to DT schema
>       dt-bindings: display: convert panel-dpi to DT schema
>       dt-bindings: display: add data-mapping to panel-dpi
>       drm/panel: simple: add panel-dpi support

All patches now pushed to drm-misc-next.
Dropped lvds666 when applying the patches.

	Sam

> 
>  .../bindings/display/panel/display-timing.txt      | 124 +----------
>  .../bindings/display/panel/display-timings.yaml    |  77 +++++++
>  .../bindings/display/panel/panel-common.yaml       |  15 +-
>  .../bindings/display/panel/panel-dpi.txt           |  50 -----
>  .../bindings/display/panel/panel-dpi.yaml          |  82 ++++++++
>  .../bindings/display/panel/panel-timing.yaml       | 227 +++++++++++++++++++++
>  drivers/gpu/drm/panel/panel-simple.c               |  74 ++++++-
>  7 files changed, 470 insertions(+), 179 deletions(-)
> 
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
