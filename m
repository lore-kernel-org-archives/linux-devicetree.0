Return-Path: <SRS0=sXX/=CB=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D56C433DF
	for <linux-devicetree@archiver.kernel.org>; Sun, 23 Aug 2020 23:26:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D11920720
	for <linux-devicetree@archiver.kernel.org>; Sun, 23 Aug 2020 23:26:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kOIZkfXL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726737AbgHWX0Y (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 23 Aug 2020 19:26:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726693AbgHWX0X (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 23 Aug 2020 19:26:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 746CCC061573
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2020 16:26:23 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC160279;
        Mon, 24 Aug 2020 01:26:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1598225181;
        bh=j95pElnESYCX30E2SE8Ad9EQbgQWT6k8KuqUviG92Tw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kOIZkfXLKzc45KI4X227eqB/o2OnHF3xIepJZTqUBMksikgV0fFuVsRMauhsUSJKY
         A5x7FWdDQxB+KbHtTPXLaNqwkmo1cuIl7xnlS5WqyYkSPNicGlqDYJUfT3iFkYI5IU
         K3+CH12kgV3mkwjfTXX2LD1s+tC8C6MECkJy5mVA=
Date:   Mon, 24 Aug 2020 02:26:03 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Stefan Agner <stefan@agner.ch>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>, Rob Herring <robh+dt@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH 2/8] dt-bindings: display: mxsfb: Add and fix compatible
 strings
Message-ID: <20200823232603.GO6002@pendragon.ideasonboard.com>
References: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
 <20200813012910.13576-3-laurent.pinchart@ideasonboard.com>
 <c9e8e63c2ac1e1ecfd8e664e2605b81f@agner.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c9e8e63c2ac1e1ecfd8e664e2605b81f@agner.ch>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Stefan,

On Fri, Aug 21, 2020 at 04:53:56PM +0200, Stefan Agner wrote:
> On 2020-08-13 03:29, Laurent Pinchart wrote:
> > Additional compatible strings have been added in DT source for the
> > i.MX6SL, i.MX6SLL, i.MX6UL and i.MX7D without updating the bindings.
> > Most of the upstream DT sources use the fsl,imx28-lcdif compatible
> > string, which mostly predates the realization that the LCDIF in the
> > i.MX6 and newer SoCs have extra features compared to the i.MX28.
> 
> Agreed, we should add fsl,imx6sx-lcdif for those devices.
> 
> But shouldn't we also keep fsl,imx28-lcdif? From what I can tell, the
> devices can be driven by a driver only supporting fsl,imx28-lcdif
> semantics, right?

Isn't it kept by this patch ?

> > Update the bindings to add the missing compatible strings, with the
> > correct fallback values. This fails to validate some of the upstream DT
> > sources. Instead of adding the incorrect compatible fallback to the
> > binding, the sources should be updated separately.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  .../devicetree/bindings/display/mxsfb.yaml     | 18 +++++++++++++-----
> >  1 file changed, 13 insertions(+), 5 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/mxsfb.yaml
> > b/Documentation/devicetree/bindings/display/mxsfb.yaml
> > index 202381ec5bb7..ec6533b1d4a3 100644
> > --- a/Documentation/devicetree/bindings/display/mxsfb.yaml
> > +++ b/Documentation/devicetree/bindings/display/mxsfb.yaml
> > @@ -15,11 +15,19 @@ description: |
> >  
> >  properties:
> >    compatible:
> > -    enum:
> > -      - fsl,imx23-lcdif
> > -      - fsl,imx28-lcdif
> > -      - fsl,imx6sx-lcdif
> > -      - fsl,imx8mq-lcdif
> > +    oneOf:
> > +      - enum:
> > +          - fsl,imx23-lcdif
> > +          - fsl,imx28-lcdif

Here -----------------^

The binding now support any of "fsl,imx23-lcdif", "fsl,imx28-lcdif" or
"fsl,imx6sx-lcdif" alone, or "fsl,imx6sx-lcdif" with another
device-specific compatible string. The driver supports the three base
compatible strings, for V3, V4 and V6 of the IP core.

> > +          - fsl,imx6sx-lcdif
> > +      - items:
> > +        - enum:
> > +          - fsl,imx6sl-lcdif
> > +          - fsl,imx6sll-lcdif
> > +          - fsl,imx6ul-lcdif
> > +          - fsl,imx7d-lcdif
> > +          - fsl,imx8mq-lcdif
> > +        - const: fsl,imx6sx-lcdif
> >  
> >    reg:
> >      maxItems: 1

-- 
Regards,

Laurent Pinchart
