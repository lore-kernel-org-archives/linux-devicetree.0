Return-Path: <SRS0=DFaX=3O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5995FC35244
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Jan 2020 19:39:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3760420708
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Jan 2020 19:39:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbgAYTjL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 25 Jan 2020 14:39:11 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:42904 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbgAYTjL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 25 Jan 2020 14:39:11 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 356AC2002B;
        Sat, 25 Jan 2020 20:39:07 +0100 (CET)
Date:   Sat, 25 Jan 2020 20:39:05 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Rob Herring <robh@kernel.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree@vger.kernel.org,
        Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
        Maxime Ripard <mripard@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 3/3] dt-bindings: display: convert panel-dpi to DT
 schema
Message-ID: <20200125193905.GC31645@ravnborg.org>
References: <20200120200641.15047-1-sam@ravnborg.org>
 <20200120200641.15047-4-sam@ravnborg.org>
 <CAL_JsqJz+aG-_AkY2nOn3mSMowhAHHHGGxYSvZyxzevkpjhRjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqJz+aG-_AkY2nOn3mSMowhAHHHGGxYSvZyxzevkpjhRjw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
        a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=P1BnusSwAAAA:8 a=gEfo2CItAAAA:8
        a=wKNdQRUzjenphSg_WccA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
        a=AjGcO6oz07-iQ99wixmX:22 a=D0XLA9XvdZm18NrgonBM:22
        a=sptkURWiP4Gy88Gu7hUp:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob.

On Tue, Jan 21, 2020 at 08:50:25AM -0600, Rob Herring wrote:
> On Mon, Jan 20, 2020 at 2:07 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > With panel-timing converted, now convert the single
> > remaining .txt user in panel/ of panel-timing to DT schema.
> >
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > ---
> >  .../bindings/display/panel/panel-dpi.txt      | 50 -------------
> >  .../bindings/display/panel/panel-dpi.yaml     | 71 +++++++++++++++++++
> >  2 files changed, 71 insertions(+), 50 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/display/panel/panel-dpi.txt
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> 
> [...]
> 
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > new file mode 100644
> > index 000000000000..4e19c1fd52c3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > @@ -0,0 +1,71 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/panel-dpi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Generic MIPI DPI Panel
> > +
> > +maintainers:
> > +  - Sam Ravnborg <sam@ravnborg.org>
> > +  - Thierry Reding <thierry.reding@gmail.com>
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    contains:
> > +      const: panel-dpi
> > +    description:
> > +      Shall contain "panel-dpi" in addition to a mandatory panel-specific
> > +      compatible string defined in individual panel bindings. The "panel-dpi"
> > +      value shall never be used on its own.
> 
> Yet we have 3 cases where it is...
> 
> A 'minItems: 2' should be enough to catch these. Or do:

The above was a verbatim copy from another binding.
Thinking more about this I went with this:

  compatible:
    contains:
      const: panel-dpi
    description:
      Shall contain "panel-dpi" in addition to an optional panel-specific
      compatible string defined in individual panel bindings.
      "panel-dpi" can be used alone, thus no dedicated binding file
      is required for each and every panel.

So a DT file with:
panel@0 {
      compatible = "panel-dpi";
      ...
      panel-timing {
        ...
      };

Is in many cases enough - and then people do not have
to either cheat or wait until their panel is included in the kernel.
The panel market i big, and there are new panels each and every day.
With panel-dpi we can support the dumb panels that
do not require any special delays etc.

	Sam
