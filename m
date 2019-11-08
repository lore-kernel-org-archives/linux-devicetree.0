Return-Path: <SRS0=K2IH=ZA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B109EC5DF60
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 10:54:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 870E3218AE
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 10:54:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pyxd4djL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731186AbfKHKyZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 8 Nov 2019 05:54:25 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:47468 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726180AbfKHKyZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 8 Nov 2019 05:54:25 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F2E823F;
        Fri,  8 Nov 2019 11:54:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1573210461;
        bh=tch5r3u7I9cWyiDCA0WMImYY9AdrNacB26E3rPfs04I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pyxd4djLU5jsP6KQJI6SMAIVwYV2hw4ez7dLowTGdcq7N4bhc38/bnQotCZjBZks5
         4GzLVlMnXemNNm7JybJF6ipihkFQ08/VtPi07c1rGYnTwmJ0IPhhY8eI2JCVCGiD1J
         kSQgdusSH6JaqiHRMKYYjWTkbvpGsxegZuBH/83o=
Date:   Fri, 8 Nov 2019 12:54:12 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Peter Rosin <peda@axentia.se>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v3 1/7] dt-bindings: display: bridge: Convert
 lvds-transmitter binding to json-schema
Message-ID: <20191108105412.GB4866@pendragon.ideasonboard.com>
References: <1573157463-14070-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573157463-14070-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191107202052.GM24983@pendragon.ideasonboard.com>
 <TYXPR01MB177554111D58A2F8B94CCFD0C07B0@TYXPR01MB1775.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TYXPR01MB177554111D58A2F8B94CCFD0C07B0@TYXPR01MB1775.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Fabrizio,

On Fri, Nov 08, 2019 at 09:15:02AM +0000, Fabrizio Castro wrote:
> On 07 November 2019 20:21 Laurent Pinchart wrote:
> > On Thu, Nov 07, 2019 at 08:10:57PM +0000, Fabrizio Castro wrote:
> > > Convert the lvds-transmitter binding to DT schema format using
> > > json-schema.
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > >
> > > ---
> > > v2->v3:
> > > * Extracted conversion to dt-schema as per Rob's comment
> > > v1->v2:
> > > * Converted to dt-schema as per Neil's comment
> > > ---
> > >  .../bindings/display/bridge/lvds-transmitter.txt   | 66 ----------------
> > >  .../bindings/display/bridge/lvds-transmitter.yaml  | 91 ++++++++++++++++++++++
> > >  2 files changed, 91 insertions(+), 66 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
> > >  create mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
> > > deleted file mode 100644
> > > index 60091db..0000000
> > > --- a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
> > > +++ /dev/null
> > > @@ -1,66 +0,0 @@
> > > -Parallel to LVDS Encoder
> > > -------------------------
> > > -
> > > -This binding supports the parallel to LVDS encoders that don't require any
> > > -configuration.
> > > -
> > > -LVDS is a physical layer specification defined in ANSI/TIA/EIA-644-A. Multiple
> > > -incompatible data link layers have been used over time to transmit image data
> > > -to LVDS panels. This binding targets devices compatible with the following
> > > -specifications only.
> > > -
> > > -[JEIDA] "Digital Interface Standards for Monitor", JEIDA-59-1999, February
> > > -1999 (Version 1.0), Japan Electronic Industry Development Association (JEIDA)
> > > -[LDI] "Open LVDS Display Interface", May 1999 (Version 0.95), National
> > > -Semiconductor
> > > -[VESA] "VESA Notebook Panel Standard", October 2007 (Version 1.0), Video
> > > -Electronics Standards Association (VESA)
> > > -
> > > -Those devices have been marketed under the FPD-Link and FlatLink brand names
> > > -among others.
> > > -
> > > -
> > > -Required properties:
> > > -
> > > -- compatible: Must be "lvds-encoder"
> > > -
> > > -  Any encoder compatible with this generic binding, but with additional
> > > -  properties not listed here, must list a device specific compatible first
> > > -  followed by this generic compatible.
> > > -
> > > -Required nodes:
> > > -
> > > -This device has two video ports. Their connections are modeled using the OF
> > > -graph bindings specified in Documentation/devicetree/bindings/graph.txt.
> > > -
> > > -- Video port 0 for parallel input
> > > -- Video port 1 for LVDS output
> > > -
> > > -
> > > -Example
> > > --------
> > > -
> > > -lvds-encoder {
> > > -	compatible = "lvds-encoder";
> > > -
> > > -	ports {
> > > -		#address-cells = <1>;
> > > -		#size-cells = <0>;
> > > -
> > > -		port@0 {
> > > -			reg = <0>;
> > > -
> > > -			lvds_enc_in: endpoint {
> > > -				remote-endpoint = <&display_out_rgb>;
> > > -			};
> > > -		};
> > > -
> > > -		port@1 {
> > > -			reg = <1>;
> > > -
> > > -			lvds_enc_out: endpoint {
> > > -				remote-endpoint = <&lvds_panel_in>;
> > > -			};
> > > -		};
> > > -	};
> > > -};
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml
> > > new file mode 100644
> > > index 0000000..5be163a
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml
> > > @@ -0,0 +1,91 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/bridge/lvds-transmitter.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Parallel to LVDS Encoder
> > > +
> > > +maintainers:
> > > +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > +
> > > +description: |
> > > +  This binding supports the parallel to LVDS encoders that don't require any
> > > +  configuration.
> > > +
> > > +  LVDS is a physical layer specification defined in ANSI/TIA/EIA-644-A. Multiple
> > > +  incompatible data link layers have been used over time to transmit image data
> > > +  to LVDS panels. This binding targets devices compatible with the following
> > > +  specifications only.
> > > +
> > > +  [JEIDA] "Digital Interface Standards for Monitor", JEIDA-59-1999, February
> > > +  1999 (Version 1.0), Japan Electronic Industry Development Association (JEIDA)
> > > +  [LDI] "Open LVDS Display Interface", May 1999 (Version 0.95), National
> > > +  Semiconductor
> > > +  [VESA] "VESA Notebook Panel Standard", October 2007 (Version 1.0), Video
> > > +  Electronics Standards Association (VESA)
> > > +
> > > +  Those devices have been marketed under the FPD-Link and FlatLink brand names
> > > +  among others.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    description: |
> > > +      Any encoder or decoder compatible with this generic binding, but with
> > 
> > I think "or decoder" should be added in patch 3/7.
> 
> Good catch, will fix.
> 
> > > +      additional properties not listed here, must define its own binding and
> > > +      list a device specific compatible first followed by the generic compatible
> > 
> > s/compatible/compatible./
> 
> Will change
> 
> > > +    enum:
> > > +      - lvds-encoder
> > > +
> > 
> > How is this binding supposed to be used, should LVDS encoder bindings
> > reference it with $ref ? If so, how do those bindings extend the
> > compatible property ?
> 
> I think for the time being we could simply list the compatible devices straight
> into this binding and forget about referencing this with ref until we have a
> use case that requires an extension that's not suitable for the generic case
> (but this is probably highly unlikely as this is for transparent devices, which
> means that if there is anything missing is probably worth implementing in the
> generic driver as others may benefit from it).
> 
> Is this going to require a tidy? For example, should we absorb
> Documentation/devicetree/bindings/display/bridge/ti,ds90c185.txt ?
> Also, I have found an undocumented compatible ("ti,sn75lvds83") used
> in a node with "lvds-encoder" as generic fallback, shall we incorporate
> that one too?

I think we should, yes.

> We should also describe powerdown-gpio, somehow its documentation was
> left behind.

That would be useful, yes.

> > > +  ports:
> > > +    type: object
> > > +    description: |
> > > +      This device has two video ports. Their connections are modeled using the
> > > +      OF graph bindings specified in Documentation/devicetree/bindings/graph.txt
> > > +    properties:
> > > +      port@0:
> > > +        type: object
> > > +        description: |
> > > +          Port 0 is for parallel input
> > > +
> > > +      port@1:
> > > +        type: object
> > > +        description: |
> > > +          Port 1 is for LVDS output
> > > +
> > > +    required:
> > > +      - port@0
> > > +      - port@1
> > > +
> > > +required:
> > > +  - compatible
> > > +  - ports
> > > +
> > > +examples:
> > > +  - |
> > > +    lvds-encoder {
> > > +      compatible = "lvds-encoder";
> > > +
> > > +      ports {
> > > +        #address-cells = <1>;
> > > +        #size-cells = <0>;
> > > +
> > > +        port@0 {
> > > +          reg = <0>;
> > > +
> > > +          lvds_enc_in: endpoint {
> > > +            remote-endpoint = <&display_out_rgb>;
> > > +          };
> > > +        };
> > > +
> > > +        port@1 {
> > > +          reg = <1>;
> > > +
> > > +          lvds_enc_out: endpoint {
> > > +            remote-endpoint = <&lvds_panel_in>;
> > > +          };
> > > +        };
> > > +      };
> > > +    };
> > > +
> > > +...

-- 
Regards,

Laurent Pinchart
