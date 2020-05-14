Return-Path: <SRS0=mbMJ=64=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2D27C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 09:36:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B3B0A206A5
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 09:36:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbgENJgY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 May 2020 05:36:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725935AbgENJgY (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 14 May 2020 05:36:24 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD6C7C061A0C
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 02:36:23 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: rcn)
        with ESMTPSA id 0244F2A06B8
Date:   Thu, 14 May 2020 11:36:17 +0200
From:   Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     kernel@collabora.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, geert+renesas@glider.be,
        robh+dt@kernel.org, xuwei5@hisilicon.com
Subject: Re: [PATCH v2 6/6] dt-bindings: drm: bridge: adi,adv7511.txt:
 convert to yaml
Message-ID: <20200514093617.dwhmqaasc3z5ixy6@rcn-XPS-13-9360>
Mail-Followup-To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        kernel@collabora.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, geert+renesas@glider.be,
        robh+dt@kernel.org, xuwei5@hisilicon.com
References: <20200511110611.3142-1-ricardo.canuelo@collabora.com>
 <20200511110611.3142-7-ricardo.canuelo@collabora.com>
 <20200514015412.GF7425@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200514015412.GF7425@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20171215
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Laurent, thanks for the thorough review. Some comments below:

On jue 14-05-2020 04:54:12, Laurent Pinchart wrote:
> > +description: |
> > +  The ADV7511, ADV7511W and ADV7513 are HDMI audio and video
> > +  transmitters compatible with HDMI 1.4 and DVI 1.0. They support color
> > +  space conversion, S/PDIF, CEC and HDCP. They support RGB input
> > +  interface.
> 
> I would write the last sentence as "The transmitter input is parallel
> RGB or YUV data." as YUV is also supported.

Ok.

> > +  adi,input-colorspace:
> > +    description: Input color space.
> > +    allOf:
> > +      - $ref: /schemas/types.yaml#/definitions/string
> > +      - enum: [ rgb, yuv422, yuv444 ]
> 
> Isn't string implied ? Can't you write
> 
>   adi,input-colorspace:
>     description: Input color space.
>     enum: [ rgb, yuv422, yuv444 ]

example-schema.yaml says that

    Vendor specific properties have slightly different schema
    requirements than common properties. They must have at least a type
    definition and 'description'.

However, dt_binding_check doesn't seem to enforce this rule for string
properties, and I saw a couple of vendor-specific string properties in
other bindings that don't define the type either, so I'm going to follow
your suggestion but only for string properties, the rest need a type
definition.

I noticed I can remove the "allOf" keywords from these too.

> > +  adi,embedded-sync:
> > +    description:
> > +      The input uses synchronization signals embedded in the data
> > +      stream (similar to BT.656). Defaults to 0 (separate H/V
> > +      synchronization signals).
> > +    allOf:
> > +      - $ref: /schemas/types.yaml#/definitions/uint32
> > +      - enum: [ 0, 1 ]
> > +      - default: 0
> 
> This be a boolean property (it is read as a bool by the driver, the
> property being absent means false, the property being present means
> true).

You're completely right.

> > +  ports:
> > +    description:
> > +      The ADV7511(W)/13 has two video ports and one audio port. This node
> > +      models their connections as documented in
> > +      Documentation/devicetree/bindings/media/video-interfaces.txt
> > +      Documentation/devicetree/bindings/graph.txt
> > +    type: object
> > +    properties:
> > +      port@0:
> > +        description: Video port for the RGB, YUV or DSI input.
> 
> s/RGB, YUV or DSI/RGB or YUV/

Ok.

> > +if:
> > +  not:
> > +    properties:
> > +      adi,input-colorspace:
> > +        contains:
> > +          enum: [ rgb, yuv444 ]
> > +      adi,input-clock:
> > +        contains:
> > +          const: 1x
> 
> As both properties take a single value, I think you can omit
> "contains:".

I think it's required here, removing it makes the test fail.

> > +required:
> > +  - compatible
> > +  - reg
> > +  - ports
> > +  - adi,input-depth
> > +  - adi,input-colorspace
> > +  - adi,input-clock
> 
> Shouldn't the power supplies be required ?

Good question. The original binding is not completely clear on
this. There's a "Required properties" section at the top that doesn't
include the supplies, the supplies block for the ADV7511/11w/13 looks
like a gray area in that regard, while the same block for ADV7533/35 is
more explicit in that they are required, and they are not listed in the
"Optional properties" section.

However, most of the DTs that use this binding don't define any
supplies. And AFAICT from looking at the code, regulator_get() will use
a dummy regulator and show a warning for every expected regulator that's
not defined in the DT.

If we want to be more strict and require the definition of all the
supplies, there will be many more DTs changes in the series, and I'm not
sure I'll be able to do that in a reasonable amount of time. I'm looking
at them and it's not always clear which regulators to use or if they are
even defined.

> > +description: |
> > +  The ADV7533 and ADV7535 are HDMI audio and video transmitters
> > +  compatible with HDMI 1.4 and DVI 1.0. They support color space
> > +  conversion, S/PDIF, CEC and HDCP. They support DSI for input pixels.
> 
> I would write the last sentence as "The transmitter input is MIPI DSI.".
>
> ...
>
> > +      Disables the interal timing generator. The chip will rely on the
> 
> s/interal/internal/
> 
> > +      sync signals in the DSI data lanes, rather than generate its own
> 
> s/generate/generating/
>
> ...
>
> > +    properties:
> > +      port@0:
> > +        description:
> > +          Video port for the RGB, YUV or DSI input. The remote endpoint
> 
> s/RGB, YUV or //

Ok.

> > +        ports {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            port@0 {
> > +                reg = <0>;
> > +                adv7511w_in: endpoint {
> > +                    remote-endpoint = <&dpi_out>;
> > +                };
> > +            };
> > +
> > +            port@1 {
> > +                reg = <1>;
> > +                adv7511_out: endpoint {
> > +                    remote-endpoint = <&hdmi_connector_in>;
> > +                };
> > +            };
> 
> The name of the two endpoints doesn't match the adv7533. The remote
> endpoint phandle for port 0 should have dsi in its name.

Oops, thanks for catching these.

Cheers,
Ricardo
