Return-Path: <SRS0=a8L4=54=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E52C2D0EC
	for <linux-devicetree@archiver.kernel.org>; Sun, 12 Apr 2020 20:04:55 +0000 (UTC)
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AAE1520708
	for <linux-devicetree@archiver.kernel.org>; Sun, 12 Apr 2020 20:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAE1520708
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=devicetree-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728002AbgDLUEy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 12 Apr 2020 16:04:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:59640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727315AbgDLUEy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 12 Apr 2020 16:04:54 -0400
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3CC2C0A3BF0
        for <devicetree@vger.kernel.org>; Sun, 12 Apr 2020 13:04:53 -0700 (PDT)
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 7FE5E80478;
        Sun, 12 Apr 2020 22:04:51 +0200 (CEST)
Date:   Sun, 12 Apr 2020 22:04:50 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        devicetree@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 01/36] dt-bindings: display: allow port and ports in
 panel-lvds
Message-ID: <20200412200450.GB711@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-2-sam@ravnborg.org>
 <CAL_JsqKp9r6sQuyKtqZnx26-2kzwkQSaa7N6Lbs2g6rC-Rpx1w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqKp9r6sQuyKtqZnx26-2kzwkQSaa7N6Lbs2g6rC-Rpx1w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
        a=yC-0_ovQAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8
        a=FrqY3B3J1LyIZVayq4MA:9 a=CjuIK1q_8ugA:10 a=CojVow1nldcA:10
        a=E9Po1WZjFZOl8hwRPBS3:22 a=QsnFDINu91a9xkgZirup:22
        a=AjGcO6oz07-iQ99wixmX:22 a=Vxmtnl_E_bksehYqCbjh:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob.

On Thu, Apr 09, 2020 at 10:11:10AM -0600, Rob Herring wrote:
> On Wed, Apr 8, 2020 at 1:51 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > Both port and ports names may be used.
> > port - for a single port
> > ports - if there is more than one port in sub-nodes
> >
> > Fixes the following warning:
> > advantech,idk-2121wr.example.dt.yaml: panel-lvds: 'port' is a required property
> >
> > advantech,idk-2121wr.yaml needs several ports, so uses a ports node.
> >
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > ---
> >  Documentation/devicetree/bindings/display/panel/lvds.yaml | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> 
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/lvds.yaml b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> > index d0083301acbe..f9132d50821c 100644
> > --- a/Documentation/devicetree/bindings/display/panel/lvds.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> > @@ -102,6 +102,12 @@ required:
> >    - width-mm
> >    - height-mm
> >    - panel-timing
> > -  - port
> > +
> > +if:
> > +  required:
> > +    - port
> > +else:
> > +  required:
> > +    - ports
> 
> Humm, I guess 'then' is not required. That's a bit weird IMO.
> 
> I usually do a 'oneOf' for these cases.

For the record, I re-did this patch using oneOf - much nicer.
And since the patch was re-written I dropped you r-b.

> 
> Either way, please apply this to drm-misc-fixes (or
> drm-misc-next-fixes depending on the state of the tree). Or I can take
> it. I'd like to get all the warnings cleared up by rc2.

Will take care after -rc1 is out. Needs drm-fixes to be updated with -rc1 first.
Will make sure to cover all bindings warnigns in panel/

	Sam

> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> Rob
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
