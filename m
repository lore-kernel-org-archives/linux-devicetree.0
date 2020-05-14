Return-Path: <SRS0=mbMJ=64=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DADDDC433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 15:22:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AEABA20657
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 15:22:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gu6rgtYH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbgENPWs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 May 2020 11:22:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726056AbgENPWs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 14 May 2020 11:22:48 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09D2FC061A0C
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 08:22:48 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5950A259;
        Thu, 14 May 2020 17:22:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589469766;
        bh=ZLiAsW2fvZDK3RmJW7oppWjyRSxXsJIuja60mtyiDpU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gu6rgtYHEJ7MKLEyce7pyCLdSV+e8/4AITElfulTuPgFfKGEXgGwMcDoJUEDWS9j4
         RLROSUohZ1QMSGBbSs6HTQv9CnivDc3Q+KkjMZJkoDtmhNmE7XgrPsx49ZFZuaNv4c
         Rx+l5BAfWjmZ/dG0m7goLBJDrBb7e84IG5dgX+/o=
Date:   Thu, 14 May 2020 18:22:39 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Cc:     kernel@collabora.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, geert+renesas@glider.be,
        robh+dt@kernel.org, xuwei5@hisilicon.com
Subject: Re: [PATCH v2 6/6] dt-bindings: drm: bridge: adi,adv7511.txt:
 convert to yaml
Message-ID: <20200514152239.GG5955@pendragon.ideasonboard.com>
References: <20200511110611.3142-1-ricardo.canuelo@collabora.com>
 <20200511110611.3142-7-ricardo.canuelo@collabora.com>
 <20200514015412.GF7425@pendragon.ideasonboard.com>
 <20200514093617.dwhmqaasc3z5ixy6@rcn-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200514093617.dwhmqaasc3z5ixy6@rcn-XPS-13-9360>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Ricardo,

On Thu, May 14, 2020 at 11:36:17AM +0200, Ricardo Cañuelo wrote:
> Hi Laurent, thanks for the thorough review. Some comments below:
> 
> On jue 14-05-2020 04:54:12, Laurent Pinchart wrote:
> > > +description: |
> > > +  The ADV7511, ADV7511W and ADV7513 are HDMI audio and video
> > > +  transmitters compatible with HDMI 1.4 and DVI 1.0. They support color
> > > +  space conversion, S/PDIF, CEC and HDCP. They support RGB input
> > > +  interface.
> > 
> > I would write the last sentence as "The transmitter input is parallel
> > RGB or YUV data." as YUV is also supported.
> 
> Ok.
> 
> > > +  adi,input-colorspace:
> > > +    description: Input color space.
> > > +    allOf:
> > > +      - $ref: /schemas/types.yaml#/definitions/string
> > > +      - enum: [ rgb, yuv422, yuv444 ]
> > 
> > Isn't string implied ? Can't you write
> > 
> >   adi,input-colorspace:
> >     description: Input color space.
> >     enum: [ rgb, yuv422, yuv444 ]
> 
> example-schema.yaml says that
> 
>     Vendor specific properties have slightly different schema
>     requirements than common properties. They must have at least a type
>     definition and 'description'.
> 
> However, dt_binding_check doesn't seem to enforce this rule for string
> properties, and I saw a couple of vendor-specific string properties in
> other bindings that don't define the type either, so I'm going to follow
> your suggestion but only for string properties, the rest need a type
> definition.

I'll defer to Rob to tell the law here :-)

> I noticed I can remove the "allOf" keywords from these too.
> 
> > > +  adi,embedded-sync:
> > > +    description:
> > > +      The input uses synchronization signals embedded in the data
> > > +      stream (similar to BT.656). Defaults to 0 (separate H/V
> > > +      synchronization signals).
> > > +    allOf:
> > > +      - $ref: /schemas/types.yaml#/definitions/uint32
> > > +      - enum: [ 0, 1 ]
> > > +      - default: 0
> > 
> > This be a boolean property (it is read as a bool by the driver, the
> > property being absent means false, the property being present means
> > true).
> 
> You're completely right.
> 
> > > +  ports:
> > > +    description:
> > > +      The ADV7511(W)/13 has two video ports and one audio port. This node
> > > +      models their connections as documented in
> > > +      Documentation/devicetree/bindings/media/video-interfaces.txt
> > > +      Documentation/devicetree/bindings/graph.txt
> > > +    type: object
> > > +    properties:
> > > +      port@0:
> > > +        description: Video port for the RGB, YUV or DSI input.
> > 
> > s/RGB, YUV or DSI/RGB or YUV/
> 
> Ok.
> 
> > > +if:
> > > +  not:
> > > +    properties:
> > > +      adi,input-colorspace:
> > > +        contains:
> > > +          enum: [ rgb, yuv444 ]
> > > +      adi,input-clock:
> > > +        contains:
> > > +          const: 1x
> > 
> > As both properties take a single value, I think you can omit
> > "contains:".
> 
> I think it's required here, removing it makes the test fail.

I thought the following could work:

if:
  not:
    properties:
      adi,input-colorspace:
        enum: [ rgb, yuv444 ]
      adi,input-clock:
        items:
          - const: 1x

But no big deal, contains: is ok too.

> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - ports
> > > +  - adi,input-depth
> > > +  - adi,input-colorspace
> > > +  - adi,input-clock
> > 
> > Shouldn't the power supplies be required ?
> 
> Good question. The original binding is not completely clear on
> this. There's a "Required properties" section at the top that doesn't
> include the supplies, the supplies block for the ADV7511/11w/13 looks
> like a gray area in that regard, while the same block for ADV7533/35 is
> more explicit in that they are required, and they are not listed in the
> "Optional properties" section.
> 
> However, most of the DTs that use this binding don't define any
> supplies. And AFAICT from looking at the code, regulator_get() will use
> a dummy regulator and show a warning for every expected regulator that's
> not defined in the DT.
> 
> If we want to be more strict and require the definition of all the
> supplies, there will be many more DTs changes in the series, and I'm not
> sure I'll be able to do that in a reasonable amount of time. I'm looking
> at them and it's not always clear which regulators to use or if they are
> even defined.

We can decouple the two though (I think). The bindings should reflect
what we consider right, and the dts files could be fixed on top.

> > > +description: |
> > > +  The ADV7533 and ADV7535 are HDMI audio and video transmitters
> > > +  compatible with HDMI 1.4 and DVI 1.0. They support color space
> > > +  conversion, S/PDIF, CEC and HDCP. They support DSI for input pixels.
> > 
> > I would write the last sentence as "The transmitter input is MIPI DSI.".
> >
> > ...
> >
> > > +      Disables the interal timing generator. The chip will rely on the
> > 
> > s/interal/internal/
> > 
> > > +      sync signals in the DSI data lanes, rather than generate its own
> > 
> > s/generate/generating/
> >
> > ...
> >
> > > +    properties:
> > > +      port@0:
> > > +        description:
> > > +          Video port for the RGB, YUV or DSI input. The remote endpoint
> > 
> > s/RGB, YUV or //
> 
> Ok.
> 
> > > +        ports {
> > > +            #address-cells = <1>;
> > > +            #size-cells = <0>;
> > > +
> > > +            port@0 {
> > > +                reg = <0>;
> > > +                adv7511w_in: endpoint {
> > > +                    remote-endpoint = <&dpi_out>;
> > > +                };
> > > +            };
> > > +
> > > +            port@1 {
> > > +                reg = <1>;
> > > +                adv7511_out: endpoint {
> > > +                    remote-endpoint = <&hdmi_connector_in>;
> > > +                };
> > > +            };
> > 
> > The name of the two endpoints doesn't match the adv7533. The remote
> > endpoint phandle for port 0 should have dsi in its name.
> 
> Oops, thanks for catching these.

-- 
Regards,

Laurent Pinchart
