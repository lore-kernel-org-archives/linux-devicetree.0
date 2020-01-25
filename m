Return-Path: <SRS0=DFaX=3O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30EB2C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Jan 2020 18:26:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0942F2071A
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Jan 2020 18:26:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgAYS0s (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 25 Jan 2020 13:26:48 -0500
Received: from asavdk4.altibox.net ([109.247.116.15]:47358 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726300AbgAYS0s (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 25 Jan 2020 13:26:48 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 60F828055C;
        Sat, 25 Jan 2020 19:26:44 +0100 (CET)
Date:   Sat, 25 Jan 2020 19:26:43 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org,
        Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: display: add panel-timing.yaml
Message-ID: <20200125182642.GA31645@ravnborg.org>
References: <20200120200641.15047-1-sam@ravnborg.org>
 <20200120200641.15047-2-sam@ravnborg.org>
 <20200121072930.6qk2ylrb3p4qjfqz@gilmour.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200121072930.6qk2ylrb3p4qjfqz@gilmour.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
        a=C9uTFCPKrCGP_rPuPcAA:9 a=CjuIK1q_8ugA:10
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Maxime.

Thanks for your comments!
> 
> > +      - allOf:
> > +        - $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        - minItems: 3
> > +          maxItems: 3
> > +          items:
> > +            description: min, typ, max number of pixels
> 
> When minItems and maxitems are equal, you can just set one, the other
> one will be filled by the DT schemas tools.

I tried to drop minItems: 3
But it just did not work - I could not make it
accept <xx> and <xx xx xx>.

And the schema should, and does, reject <xx xx> and <xx xx xx xx>

I do not know why - I just did a trial-and-error on this.

> > +  hsync-active:
> > +    description: |
> > +      Horizontal sync pulse.
> > +      If omitted then it is not used by the hardware
> > +    oneOf:
> > +      - const: 0
> > +        description: active low
> > +      - const: 1
> > +        description: active high
> 
> You probably should use an enum here (and in other similar
> places). oneOf / anyOf / allOF errors are pretty cryptic, while it
> will it's really better with an enum.

Yep - enum: [0, 1] is much nicer.

	Sam
