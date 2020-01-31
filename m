Return-Path: <SRS0=rjyW=3U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 407EAC2D0DB
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jan 2020 19:41:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1CF8E22522
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jan 2020 19:41:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725978AbgAaTlg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 31 Jan 2020 14:41:36 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:43938 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbgAaTlg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 31 Jan 2020 14:41:36 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 1D83120024;
        Fri, 31 Jan 2020 20:41:31 +0100 (CET)
Date:   Fri, 31 Jan 2020 20:41:30 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Rob Herring <robh@kernel.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree@vger.kernel.org,
        Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
        Maxime Ripard <mripard@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Steffen Trumtrar <s.trumtrar@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 3/3] dt-bindings: display: convert panel-dpi to DT
 schema
Message-ID: <20200131194130.GA26925@ravnborg.org>
References: <20200125203454.7450-1-sam@ravnborg.org>
 <20200125203454.7450-4-sam@ravnborg.org>
 <CAL_Jsq+JsEk1qz7NQc0ybO0xgmTB+YcmUL_d=u7_Y0A56v18nw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+JsEk1qz7NQc0ybO0xgmTB+YcmUL_d=u7_Y0A56v18nw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
        a=Smb47HSlpyMrLoV_zPMA:9 a=CjuIK1q_8ugA:10
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob.

> > +
> > +properties:
> > +  compatible:
> > +    contains:
> > +      const: panel-dpi
> > +    description:
> > +      Shall contain "panel-dpi" in addition to an optional panel-specific
> > +      compatible string defined in individual panel bindings.
> > +      "panel-dpi" can be used alone, thus no dedicated binding file
> > +      is required for each and every panel.
> 
> While this has occurred, I don't think the schema should allow it. I
> think a 'minItems: 2' should be added here.
> 
> AFAIK, MIPI DPI just defines a spec for what already existed. Maybe it
> constrains things somewhat, but to the extent why we require a panel
> specific compatible in the first place? Doubtful...

You triggered me to re-read some old thread about this.
And I think I got it now.

Based on a proposal you made some weeks ago I did it like this:
properties:
  compatible:
    description:
      Shall contain a panel specific compatible and "panel-dpi"
      in that order.
    items:
      - {}
      - const: panel-dpi

So no constraints on the panel specific compatible, expect that it is present.
And panel-dpi must be listed as the second compatible.

Updated the example too.
Will post a v3.

Thanks!

	Sam
