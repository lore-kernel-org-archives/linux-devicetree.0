Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C9CC2BA19
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 16:24:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27EA92076B
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 16:24:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391464AbgDNQYu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 12:24:50 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:44784 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391431AbgDNQYU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Apr 2020 12:24:20 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 19CB02001F;
        Tue, 14 Apr 2020 18:24:15 +0200 (CEST)
Date:   Tue, 14 Apr 2020 18:24:13 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Rob Herring <robh@kernel.org>
Cc:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: display: allow port and ports in
 panel-lvds
Message-ID: <20200414162413.GA31129@ravnborg.org>
References: <20200412132139.11418-1-sam@ravnborg.org>
 <20200412132139.11418-2-sam@ravnborg.org>
 <20200414135501.GA22903@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200414135501.GA22903@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8
        a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=Ccqcp6awhqx6kVkmrOQA:9
        a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22 a=AjGcO6oz07-iQ99wixmX:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob.

> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: dri-devel@lists.freedesktop.org
> > ---
> >  .../devicetree/bindings/display/panel/lvds.yaml        | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> One nit below...
> 
> > 
> > diff --git a/Documentation/devicetree/bindings/display/panel/lvds.yaml b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> > index d0083301acbe..a5587c4f5ad0 100644
> > --- a/Documentation/devicetree/bindings/display/panel/lvds.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> > @@ -96,12 +96,20 @@ properties:
> >        If set, reverse the bit order described in the data mappings below on all
> >        data lanes, transmitting bits for slots 6 to 0 instead of 0 to 6.
> >  
> > +  port: true
> > +  ports: true
> > +
> >  required:
> >    - compatible
> >    - data-mapping
> >    - width-mm
> >    - height-mm
> >    - panel-timing
> > -  - port
> > +
> > +oneOf:
> > +  - required:
> > +    - port
> > +  - required:
> > +    - ports
> 
> Should be indented 2 more spaces. It only matters for any scripted 
> processing we do on the files.

Fixed and pushed to drm-misc-next.
Will cherry-pick to drm-fixes.

	Sam
