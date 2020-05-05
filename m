Return-Path: <SRS0=A/SL=6T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01FF0C47247
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 18:56:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B8B7F2068E
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 18:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588704971;
	bh=zC/Ej+uTkHImXQzZNcyWdce9vzCuef0eLJ/AP/QvlzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=HfZGuVl2VVu3Bv9DTHTMKN+Aku2DwLIQR2c2evla/Ob/5YKHgPncnETUUEGaaKyAX
	 f8Lua+kLzmcbOEIaWfuQNJipEDEE0bDvQjOdD3ByTvkZf66AloPUEgtKslmKgkV5g1
	 d7soJl4QCRnoxuWh3i7sugkIMzuk3wyaMushsXpg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727857AbgEES4L (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 May 2020 14:56:11 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:45831 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727785AbgEES4K (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 5 May 2020 14:56:10 -0400
Received: by mail-oi1-f196.google.com with SMTP id k133so2761907oih.12
        for <devicetree@vger.kernel.org>; Tue, 05 May 2020 11:56:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=d0cu7WNUYtFmviXXT9Num+FiM1gPbKHgwu8i5uezLlI=;
        b=QtZE3QrObsXO6cPeEY6+GnsTVgMItgJvYy26lKW+rFWjd/KLiNf22NyqVycNp7LJcL
         MA4SZmzErUznGxTKPyUVF8L5fwfCOGUXhypafpfP5TmA9uucUT+RbXZl8YrXVcCZTDwv
         KS+6Z0+ZhdWKnaot26WtOrkiLdYMMLKcUfXlVPxhqrCXubkpXlEhLB3Zd8xxKcX7Rs42
         RWYRQ7X/tk8UZMIYvFGWpKgE9F1bUukRQIiw3gO/GT7HK7wyJLt2GblGfaJWaDukU71H
         H86CRzLrVDc3A38jigUvtzUuMAvLpiV3pja2Ki9UtZz+o5/SaEgJsdarOle9CpFtyaFb
         3haA==
X-Gm-Message-State: AGi0PubmcH+kqjxcbJR38+98JQqfb5zBXT64xEbY9zisHrVdfDwGN0o7
        zrbvxVhhgSbYZwuVEIy2GKoCL7I=
X-Google-Smtp-Source: APiQypL70F5QwvoXL/avKkUzgOGFWSVdW9U+ZDOeutJO0lTmvaMfYuHHmj2SAJbOdmD6FKRTcrfm6Q==
X-Received: by 2002:aca:5588:: with SMTP id j130mr111394oib.144.1588704969198;
        Tue, 05 May 2020 11:56:09 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y198sm782496oia.20.2020.05.05.11.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 11:56:08 -0700 (PDT)
Received: (nullmailer pid 31489 invoked by uid 1000);
        Tue, 05 May 2020 18:56:07 -0000
Date:   Tue, 5 May 2020 13:56:07 -0500
From:   Rob Herring <robh@kernel.org>
To:     Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
Cc:     laurent.pinchart@ideasonboard.com, kernel@collabora.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        geert+renesas@glider.be, xuwei5@hisilicon.com
Subject: Re: [RFT PATCH 5/5] dt-bindings: drm: bridge: adi,adv7511.txt:
 convert to yaml
Message-ID: <20200505185607.GA25651@bogus>
References: <20200501083227.10886-1-ricardo.canuelo@collabora.com>
 <20200501083227.10886-6-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200501083227.10886-6-ricardo.canuelo@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, May 01, 2020 at 10:32:27AM +0200, Ricardo Cañuelo wrote:
> Convert the ADV7511/11w/13/33/35 DT bindings to json-schema.
> 
> Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
> ---
>  .../bindings/display/bridge/adi,adv7511.txt   | 143 ---------
>  .../bindings/display/bridge/adi,adv7511.yaml  | 293 ++++++++++++++++++
>  2 files changed, 293 insertions(+), 143 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/adi,adv7511.yaml


> diff --git a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.yaml b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.yaml
> new file mode 100644
> index 000000000000..0654c3a35281
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.yaml
> @@ -0,0 +1,293 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices ADV7511(W)/13/33/35 HDMI Encoders
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +
> +description: |
> +  The ADV7511, ADV7511W, ADV7513, ADV7533 and ADV7535 are HDMI audio and
> +  video transmitters compatible with HDMI 1.4 and DVI 1.0. They support
> +  color space conversion, S/PDIF, CEC and HDCP. ADV7533/5 supports the
> +  DSI interface for input pixels, while the others support RGB
> +  interface.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,adv7511
> +      - adi,adv7511w
> +      - adi,adv7513
> +      - adi,adv7533
> +      - adi,adv7535
> +
> +  reg:
> +    description: |
> +      I2C slave addresses.
> +
> +      The ADV7511 internal registers are split into four pages exposed
> +      through different I2C addresses, creating four register maps. Each
> +      map has it own I2C address and acts as a standard slave device on
> +      the I2C bus. The main address is mandatory, others are optional
> +      and revert to defaults if not specified.
> +    minItems: 1
> +    maxItems: 4
> +
> +  clocks:
> +    description: Reference to the CEC clock.
> +    maxItems: 1
> +
> +  clock-names:
> +    const: cec
> +
> +  reg-names:
> +    description:
> +      Names of maps with programmable addresses. It can contain any map
> +      needing a non-default address.
> +    minItems: 1
> +    items:
> +      - const: main
> +      - const: edid
> +      - const: cec
> +      - const: packet
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  pd-gpios:
> +    description: GPIO connected to the power down signal.
> +    maxItems: 1
> +
> +  avdd-supply:
> +    description: A 1.8V supply that powers up the AVDD pin.
> +    maxItems: 1

Drop. Supplies are always a single item.

> +
> +  dvdd-supply:
> +    description: A 1.8V supply that powers up the DVDD pin.
> +    maxItems: 1
> +
> +  pvdd-supply:
> +    description: A 1.8V supply that powers up the PVDD pin.
> +    maxItems: 1
> +
> +  ports:
> +    description:
> +      The ADV7511 has two video ports and one audio port. This node
> +      models their connections as documented in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
> +      Documentation/devicetree/bindings/graph.txt
> +    type: object
> +    properties:
> +      port@0:
> +        description:
> +          Video port for the RGB, YUV or DSI input. In the case of
> +          ADV7533/5, the remote endpoint phandle should be a reference
> +          to a valid mipi_dsi_host_device.
> +        type: object
> +
> +      port@1:
> +        description: Video port for the HDMI output.
> +        type: object
> +
> +      port@2:
> +        description: Audio port for the HDMI output.
> +        type: object
> +
> +
> +allOf:
> +  # ADV7511/11w/13-specific parameters
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - adi,adv7511
> +              - adi,adv7511w
> +              - adi,adv7513
> +
> +    then:
> +      properties:
> +        dvdd-3v-supply:
> +          description: A 3.3V supply that powers up the DVDD_3V pin.
> +          maxItems: 1
> +
> +        bgvdd-supply:
> +          description: A 1.8V supply that powers up the BGVDD pin.
> +          maxItems: 1
> +
> +        adi,input-depth:
> +          description: Number of bits per color component at the input.
> +          allOf:
> +            - $ref: /schemas/types.yaml#/definitions/uint32
> +            - enum: [ 8, 10, 12 ]
> +
> +        adi,input-colorspace:
> +          description: Input color space.
> +          allOf:
> +            - $ref: /schemas/types.yaml#/definitions/string
> +            - enum: [ rgb, yuv422, yuv444 ]
> +
> +        adi,input-clock:
> +          description: |
> +            Input clock type.
> +              "1x": one clock cycle per pixel
> +              "2x": two clock cycles per pixel
> +              "dd": one clock cycle per pixel, data driven on both edges
> +          allOf:
> +            - $ref: /schemas/types.yaml#/definitions/string
> +            - enum: [ 1x, 2x, dd ]
> +
> +        adi,clock-delay:
> +          description:
> +            Video data clock delay relative to the pixel clock, in ps
> +            (-1200ps .. 1600 ps).
> +          allOf:
> +            - $ref: /schemas/types.yaml#/definitions/uint32
> +            - default: 0
> +
> +        adi,embedded-sync:
> +          description:
> +            The input uses synchronization signals embedded in the data
> +            stream (similar to BT.656). Defaults to 0 (separate H/V
> +            synchronization signals).
> +          allOf:
> +            - $ref: /schemas/types.yaml#/definitions/uint32
> +            - enum: [ 0, 1 ]
> +            - default: 0
> +
> +      required:
> +        - adi,input-depth
> +        - adi,input-colorspace
> +        - adi,input-clock
> +
> +  # adi,input-style and adi,input-justification are required except in
> +  # "rgb 1x" and "yuv444 1x" modes.
> +  - if:
> +      not:
> +        properties:
> +          adi,input-colorspace:
> +            contains:
> +              enum: [ rgb, yuv444 ]
> +          adi,input-clock:
> +            contains:
> +              const: 1x

I believe this will be true (before the not) if the properties are not 
present. You need 'required' if that's not what you want.

> +
> +    then:
> +      properties:
> +        adi,input-style:
> +          description:
> +            Input components arrangement variant as listed in the input
> +            format tables in the datasheet.
> +          allOf:
> +            - $ref: /schemas/types.yaml#/definitions/uint32
> +            - enum: [ 1, 2, 3 ]
> +
> +        adi,input-justification:
> +          description: Input bit justification.
> +          allOf:
> +            - $ref: /schemas/types.yaml#/definitions/string
> +            - enum: [ left, evenly, right ]
> +
> +      required:
> +        - adi,input-style
> +        - adi,input-justification
> +
> +  # ADV7533/35-specific parameters
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - adi,adv7533
> +              - adi,adv7535
> +
> +    then:
> +      properties:
> +        adi,disable-timing-generator:
> +          description:
> +            Disables the interal timing generator. The chip will rely on
> +            the sync signals in the DSI data lanes, rather than generate
> +            its own timings for HDMI output.
> +          type: boolean
> +
> +        adi,dsi-lanes:
> +          description: Number of DSI data lanes connected to the DSI host.
> +          allOf:
> +            - $ref: /schemas/types.yaml#/definitions/uint32
> +            - enum: [ 1, 2, 3, 4 ]
> +
> +        a2vdd-supply:
> +          description: A 1.8V supply that powers up the A2VDD pin.
> +          maxItems: 1
> +
> +        v3p3-supply:
> +          description: A 3.3V supply that powers up the V3P3 pin.
> +          maxItems: 1
> +
> +        v1p2-supply:
> +          description:
> +            A supply that powers up the V1P2 pin. It can be either 1.2V
> +            or 1.8V for ADV7533 but only 1.8V for ADV7535.
> +          maxItems: 1
> +
> +      required:
> +        - adi,dsi-lanes
> +
> +required:
> +  - compatible
> +  - reg
> +  - ports
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    adv7511w: hdmi@39 {
> +        compatible = "adi,adv7511w";
> +        /*
> +         * The EDID page will be accessible on address 0x66 on the I2C
> +         * bus. All other maps continue to use their default addresses.
> +         */
> +        reg = <0x39>, <0x66>;
> +        reg-names = "main", "edid";
> +        interrupt-parent = <&gpio3>;
> +        interrupts = <29 IRQ_TYPE_EDGE_FALLING>;
> +        clocks = <&cec_clock>;
> +        clock-names = "cec";
> +
> +        adi,input-depth = <8>;
> +        adi,input-colorspace = "rgb";
> +        adi,input-clock = "1x";
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                adv7511w_in: endpoint {
> +                    remote-endpoint = <&dpi_out>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +                adv7511_out: endpoint {
> +                    remote-endpoint = <&hdmi_connector_in>;
> +                };
> +            };
> +
> +            port@2 {
> +                reg = <2>;
> +                codec_endpoint: endpoint {
> +                    remote-endpoint = <&i2s0_cpu_endpoint>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.18.0
> 
