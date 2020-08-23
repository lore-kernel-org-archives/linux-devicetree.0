Return-Path: <SRS0=sXX/=CB=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6355C433E1
	for <linux-devicetree@archiver.kernel.org>; Sun, 23 Aug 2020 23:27:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B04AD20720
	for <linux-devicetree@archiver.kernel.org>; Sun, 23 Aug 2020 23:27:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="F17HerOm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgHWX1q (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 23 Aug 2020 19:27:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726693AbgHWX1q (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 23 Aug 2020 19:27:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FA12C061573
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2020 16:27:46 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9DA63279;
        Mon, 24 Aug 2020 01:27:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1598225264;
        bh=y5PKWoMR1TCqt9mOcUpEsoGFDWYp1Fdx5FvlPyNutvs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=F17HerOmtF5pq9pFmlFr10kSICNvrjHm8f9K9hZMEIHZs8/2qY13f2v++SCRTbaiB
         cZDWv0oI7r9w4UsJUXkp87NZCxeFFxePntRcbeVBCzvLyWpenyUfonlP6VetoYrvl/
         e+WiEAti3hjSV4wIQpA79C72CsBX7U42zHv1A7hE=
Date:   Mon, 24 Aug 2020 02:27:26 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Stefan Agner <stefan@agner.ch>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>, Rob Herring <robh+dt@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH 4/8] dt-bindings: display: mxsfb: Rename to fsl,lcdif.yaml
Message-ID: <20200823232726.GP6002@pendragon.ideasonboard.com>
References: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
 <20200813012910.13576-5-laurent.pinchart@ideasonboard.com>
 <2a74823ac7b6f978d36185aac34de383@agner.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2a74823ac7b6f978d36185aac34de383@agner.ch>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Stefan,

On Fri, Aug 21, 2020 at 04:55:38PM +0200, Stefan Agner wrote:
> On 2020-08-13 03:29, Laurent Pinchart wrote:
> > Rename the mxsfb.yaml binding schema to fsl,lcdif.yaml to match the
> > usual bindings naming scheme.
> 
> I tend to prefer to just name it fsl,lcdif.yaml from the get-go.
> 
> If you prefer keeping it separate, then it should be patch 2 of the
> series.

I'm certainly fine squashing this with 1/8. Should I submit a v2, or
would you like to squash them locally before applying ? If you would
like a v2, have you reviewed the entire series, or should I still wait ?

> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  .../devicetree/bindings/display/{mxsfb.yaml => fsl,lcdif.yaml}  | 2 +-
> >  MAINTAINERS                                                     | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >  rename Documentation/devicetree/bindings/display/{mxsfb.yaml =>
> > fsl,lcdif.yaml} (98%)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/mxsfb.yaml
> > b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > similarity index 98%
> > rename from Documentation/devicetree/bindings/display/mxsfb.yaml
> > rename to Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > index d15bb8edc29f..60210775c31e 100644
> > --- a/Documentation/devicetree/bindings/display/mxsfb.yaml
> > +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > @@ -1,7 +1,7 @@
> >  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >  %YAML 1.2
> >  ---
> > -$id: http://devicetree.org/schemas/display/mxsfb.yaml#
> > +$id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >  
> >  title: Freescale/NXP i.MX LCD Interface (LCDIF)
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index e3fac23383d2..fe1bda639a39 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -11757,7 +11757,7 @@ M:	Stefan Agner <stefan@agner.ch>
> >  L:	dri-devel@lists.freedesktop.org
> >  S:	Supported
> >  T:	git git://anongit.freedesktop.org/drm/drm-misc
> > -F:	Documentation/devicetree/bindings/display/mxsfb.yaml
> > +F:	Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> >  F:	drivers/gpu/drm/mxsfb/
> >  
> >  MYLEX DAC960 PCI RAID Controller

-- 
Regards,

Laurent Pinchart
