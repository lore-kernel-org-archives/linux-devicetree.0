Return-Path: <SRS0=+eHa=B3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 945E5C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Aug 2020 00:09:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74A7520708
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Aug 2020 00:09:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZevMh0c0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726585AbgHQAJ1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 16 Aug 2020 20:09:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726108AbgHQAJZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 16 Aug 2020 20:09:25 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BC56C061786
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2020 17:09:25 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A3BA6F9;
        Mon, 17 Aug 2020 02:09:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597622963;
        bh=0DixlhBTmdxj8HBI+2zbq1LpGmNVk/QcrtOPxI8AWFQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZevMh0c0dITM3LShxTFexCYRkfoZtdr0lEwEUM5vy0ipgtGdAQa191F83HX/KTtFP
         MHdKiIiwMdbo8wAGMN/syGo46kKPZ0xvp+gc2M6xYelLOTl/UcPJNznZjA3x+NPsRp
         SqC6QGgMacHEvI/X8Ql7RbC88ZceKTB8FIcpIEz0=
Date:   Mon, 17 Aug 2020 03:09:08 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/8] dt-bindings: display: mxsfb: Add a bus-width
 endpoint property
Message-ID: <20200817000908.GD7729@pendragon.ideasonboard.com>
References: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
 <20200813012910.13576-4-laurent.pinchart@ideasonboard.com>
 <20200815212838.GC134339@bogon.m.sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200815212838.GC134339@bogon.m.sigxcpu.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Guido,

On Sat, Aug 15, 2020 at 11:28:38PM +0200, Guido Günther wrote:
> On Thu, Aug 13, 2020 at 04:29:05AM +0300, Laurent Pinchart wrote:
> > When the PCB routes the display data signals in an unconventional way,
> > the output bus width may differ from the bus width of the connected
> > panel or encoder. For instance, when a 18-bit RGB panel has its R[5:0],
> > G[5:0] and B[5:0] signals connected to LCD_DATA[7:2], LCD_DATA[15:10]
> > and LCD_DATA[23:18], the output bus width is 24 instead of 18 when the
> > signals are routed to LCD_DATA[5:0], LCD_DATA[11:6] and LCD_DATA[17:12].
> > 
> > Add a bus-width property to describe this data routing.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  Documentation/devicetree/bindings/display/mxsfb.yaml | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/mxsfb.yaml b/Documentation/devicetree/bindings/display/mxsfb.yaml
> > index ec6533b1d4a3..d15bb8edc29f 100644
> > --- a/Documentation/devicetree/bindings/display/mxsfb.yaml
> > +++ b/Documentation/devicetree/bindings/display/mxsfb.yaml
> > @@ -58,6 +58,18 @@ properties:
> >          type: object
> >  
> >          properties:
> > +          data-shift:
>
> Shouldn't that be bus-width ?

Absolutely. I'll fix that.

> > +            enum: [16, 18, 24]
> > +            description: |
> > +              The output bus width. This value overrides the configuration
> > +              derived from the connected device (encoder or panel). It should
> > +              only be specified when PCB routing of the data signals require a
> > +              different bus width on the LCDIF and the connected device. For
> > +              instance, when a 18-bit RGB panel has its R[5:0], G[5:0] and
> > +              B[5:0] signals connected to LCD_DATA[7:2], LCD_DATA[15:10] and
> > +              LCD_DATA[23:18] instead of LCD_DATA[5:0], LCD_DATA[11:6] and
> > +              LCD_DATA[17:12], bus-width should be set to 24.
> > +
> >            remote-endpoint:
> >              $ref: /schemas/types.yaml#/definitions/phandle
> >  

-- 
Regards,

Laurent Pinchart
