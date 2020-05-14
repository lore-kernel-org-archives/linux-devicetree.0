Return-Path: <SRS0=mbMJ=64=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D5CC433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 01:54:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB35020575
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 01:54:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ve4ds2pe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbgENByW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 13 May 2020 21:54:22 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:40090 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbgENByW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 13 May 2020 21:54:22 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B275B51F;
        Thu, 14 May 2020 03:54:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589421258;
        bh=qEH0zFDOVSbJjTPJjmt4ZMetEWnDp9KphFeMzfBDwWQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ve4ds2pebLx0Ok2cBuoPK9L2E/JRfSBT3WrAViJ2Bu/5RUNyVdok1d9XPRo2qu4UY
         My1aRFqGGY3yw3sixUvPiLnYJOFSMxQjtsOEz18vtkG6ANcb4pIsHwVPguI13c3qpk
         STq4dkkqmX3r14IsLu3ghUXWzbEwucaGVm61nTPw=
Date:   Thu, 14 May 2020 04:54:12 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Cc:     kernel@collabora.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, geert+renesas@glider.be,
        robh+dt@kernel.org, xuwei5@hisilicon.com
Subject: Re: [PATCH v2 6/6] dt-bindings: drm: bridge: adi,adv7511.txt:
 convert to yaml
Message-ID: <20200514015412.GF7425@pendragon.ideasonboard.com>
References: <20200511110611.3142-1-ricardo.canuelo@collabora.com>
 <20200511110611.3142-7-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200511110611.3142-7-ricardo.canuelo@collabora.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Mon, May 11, 2020 at 01:06:11PM +0200, Ricardo Cañuelo wrote:
> Convert the ADV7511/11w/13/33/35 DT bindings to json-schema. The
> original binding has been split into two files: adi,adv7511.yaml for
> ADV7511/11W/13 and adi,adv7533.yaml for ADV7533/35.
> 
> Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
> ---
>  .../bindings/display/bridge/adi,adv7511.txt   | 143 -----------
>  .../bindings/display/bridge/adi,adv7511.yaml  | 230 ++++++++++++++++++
>  .../bindings/display/bridge/adi,adv7533.yaml  | 166 +++++++++++++
>  3 files changed, 396 insertions(+), 143 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/adi,adv7511.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
> deleted file mode 100644
> index 659523f538bf..000000000000
> --- a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
> +++ /dev/null
> @@ -1,143 +0,0 @@
> -Analog Devices ADV7511(W)/13/33/35 HDMI Encoders
> -------------------------------------------------
> -
> -The ADV7511, ADV7511W, ADV7513, ADV7533 and ADV7535 are HDMI audio and video
> -transmitters compatible with HDMI 1.4 and DVI 1.0. They support color space
> -conversion, S/PDIF, CEC and HDCP. ADV7533/5 supports the DSI interface for input
> -pixels, while the others support RGB interface.
> -
> -Required properties:
> -
> -- compatible: Should be one of:
> -		"adi,adv7511"
> -		"adi,adv7511w"
> -		"adi,adv7513"
> -		"adi,adv7533"
> -		"adi,adv7535"
> -
> -- reg: I2C slave addresses
> -  The ADV7511 internal registers are split into four pages exposed through
> -  different I2C addresses, creating four register maps. Each map has it own
> -  I2C address and acts as a standard slave device on the I2C bus. The main
> -  address is mandatory, others are optional and revert to defaults if not
> -  specified.
> -
> -
> -The ADV7511 supports a large number of input data formats that differ by their
> -color depth, color format, clock mode, bit justification and random
> -arrangement of components on the data bus. The combination of the following
> -properties describe the input and map directly to the video input tables of the
> -ADV7511 datasheet that document all the supported combinations.
> -
> -- adi,input-depth: Number of bits per color component at the input (8, 10 or
> -  12).
> -- adi,input-colorspace: The input color space, one of "rgb", "yuv422" or
> -  "yuv444".
> -- adi,input-clock: The input clock type, one of "1x" (one clock cycle per
> -  pixel), "2x" (two clock cycles per pixel), "ddr" (one clock cycle per pixel,
> -  data driven on both edges).
> -
> -The following input format properties are required except in "rgb 1x" and
> -"yuv444 1x" modes, in which case they must not be specified.
> -
> -- adi,input-style: The input components arrangement variant (1, 2 or 3), as
> -  listed in the input format tables in the datasheet.
> -- adi,input-justification: The input bit justification ("left", "evenly",
> -  "right").
> -
> -- avdd-supply: A 1.8V supply that powers up the AVDD pin on the chip.
> -- dvdd-supply: A 1.8V supply that powers up the DVDD pin on the chip.
> -- pvdd-supply: A 1.8V supply that powers up the PVDD pin on the chip.
> -- dvdd-3v-supply: A 3.3V supply that powers up the pin called DVDD_3V
> -  on the chip.
> -- bgvdd-supply: A 1.8V supply that powers up the BGVDD pin. This is
> -  needed only for ADV7511.
> -
> -The following properties are required for ADV7533 and ADV7535:
> -
> -- adi,dsi-lanes: Number of DSI data lanes connected to the DSI host. It should
> -  be one of 1, 2, 3 or 4.
> -- a2vdd-supply: 1.8V supply that powers up the A2VDD pin on the chip.
> -- v3p3-supply: A 3.3V supply that powers up the V3P3 pin on the chip.
> -- v1p2-supply: A supply that powers up the V1P2 pin on the chip. It can be
> -  either 1.2V or 1.8V for ADV7533 but only 1.8V for ADV7535.
> -
> -Optional properties:
> -
> -- interrupts: Specifier for the ADV7511 interrupt
> -- pd-gpios: Specifier for the GPIO connected to the power down signal
> -
> -- adi,clock-delay: Video data clock delay relative to the pixel clock, in ps
> -  (-1200 ps .. 1600 ps). Defaults to no delay.
> -- adi,embedded-sync: The input uses synchronization signals embedded in the
> -  data stream (similar to BT.656). Defaults to separate H/V synchronization
> -  signals.
> -- adi,disable-timing-generator: Only for ADV7533 and ADV7535. Disables the
> -  internal timing generator. The chip will rely on the sync signals in the
> -  DSI data lanes, rather than generate its own timings for HDMI output.
> -- clocks: from common clock binding: reference to the CEC clock.
> -- clock-names: from common clock binding: must be "cec".
> -- reg-names : Names of maps with programmable addresses.
> -	It can contain any map needing a non-default address.
> -	Possible maps names are : "main", "edid", "cec", "packet"
> -
> -Required nodes:
> -
> -The ADV7511 has two video ports. Their connections are modelled using the OF
> -graph bindings specified in Documentation/devicetree/bindings/graph.txt.
> -
> -- Video port 0 for the RGB, YUV or DSI input. In the case of ADV7533/5, the
> -  remote endpoint phandle should be a reference to a valid mipi_dsi_host device
> -  node.
> -- Video port 1 for the HDMI output
> -- Audio port 2 for the HDMI audio input
> -
> -
> -Example
> --------
> -
> -	adv7511w: hdmi@39 {
> -		compatible = "adi,adv7511w";
> -		/*
> -		 * The EDID page will be accessible on address 0x66 on the I2C
> -		 * bus. All other maps continue to use their default addresses.
> -		 */
> -		reg = <0x39>, <0x66>;
> -		reg-names = "main", "edid";
> -		interrupt-parent = <&gpio3>;
> -		interrupts = <29 IRQ_TYPE_EDGE_FALLING>;
> -		clocks = <&cec_clock>;
> -		clock-names = "cec";
> -
> -		adi,input-depth = <8>;
> -		adi,input-colorspace = "rgb";
> -		adi,input-clock = "1x";
> -		adi,input-style = <1>;
> -		adi,input-justification = "evenly";
> -
> -		ports {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -
> -			port@0 {
> -				reg = <0>;
> -				adv7511w_in: endpoint {
> -					remote-endpoint = <&dpi_out>;
> -				};
> -			};
> -
> -			port@1 {
> -				reg = <1>;
> -				adv7511_out: endpoint {
> -					remote-endpoint = <&hdmi_connector_in>;
> -				};
> -			};
> -
> -			port@2 {
> -				reg = <2>;
> -				codec_endpoint: endpoint {
> -					remote-endpoint = <&i2s0_cpu_endpoint>;
> -				};
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.yaml b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.yaml
> new file mode 100644
> index 000000000000..a306adba105f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.yaml
> @@ -0,0 +1,233 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices ADV7511/11W/13 HDMI Encoders
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +
> +description: |
> +  The ADV7511, ADV7511W and ADV7513 are HDMI audio and video
> +  transmitters compatible with HDMI 1.4 and DVI 1.0. They support color
> +  space conversion, S/PDIF, CEC and HDCP. They support RGB input
> +  interface.

I would write the last sentence as "The transmitter input is parallel
RGB or YUV data." as YUV is also supported.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,adv7511
> +      - adi,adv7511w
> +      - adi,adv7513
> +
> +  reg:
> +    description: |
> +      I2C slave addresses.
> +
> +      The ADV7511/11W/13 internal registers are split into four pages
> +      exposed through different I2C addresses, creating four register
> +      maps. Each map has it own I2C address and acts as a standard slave
> +      device on the I2C bus. The main address is mandatory, others are
> +      optional and revert to defaults if not specified.
> +    minItems: 1
> +    maxItems: 4
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
> +  clocks:
> +    description: Reference to the CEC clock.
> +    maxItems: 1
> +
> +  clock-names:
> +    const: cec
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
> +
> +  dvdd-supply:
> +    description: A 1.8V supply that powers up the DVDD pin.
> +
> +  pvdd-supply:
> +    description: A 1.8V supply that powers up the PVDD pin.
> +
> +  dvdd-3v-supply:
> +    description: A 3.3V supply that powers up the DVDD_3V pin.
> +
> +  bgvdd-supply:
> +    description: A 1.8V supply that powers up the BGVDD pin.
> +
> +  adi,input-depth:
> +    description: Number of bits per color component at the input.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [ 8, 10, 12 ]
> +
> +  adi,input-colorspace:
> +    description: Input color space.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/string
> +      - enum: [ rgb, yuv422, yuv444 ]

Isn't string implied ? Can't you write

  adi,input-colorspace:
    description: Input color space.
    enum: [ rgb, yuv422, yuv444 ]

Same for the other properties below.

> +
> +  adi,input-clock:
> +    description: |
> +      Input clock type.
> +        "1x": one clock cycle per pixel
> +        "2x": two clock cycles per pixel
> +        "dd": one clock cycle per pixel, data driven on both edges
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/string
> +      - enum: [ 1x, 2x, dd ]
> +
> +  adi,clock-delay:
> +    description:
> +      Video data clock delay relative to the pixel clock, in ps
> +      (-1200ps .. 1600 ps).
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - default: 0
> +
> +  adi,embedded-sync:
> +    description:
> +      The input uses synchronization signals embedded in the data
> +      stream (similar to BT.656). Defaults to 0 (separate H/V
> +      synchronization signals).
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [ 0, 1 ]
> +      - default: 0

This be a boolean property (it is read as a bool by the driver, the
property being absent means false, the property being present means
true).

> +
> +  adi,input-style:
> +    description:
> +      Input components arrangement variant as listed in the input
> +      format tables in the datasheet.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [ 1, 2, 3 ]
> +
> +  adi,input-justification:
> +    description: Input bit justification.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/string
> +      - enum: [ left, evenly, right ]
> +
> +  ports:
> +    description:
> +      The ADV7511(W)/13 has two video ports and one audio port. This node
> +      models their connections as documented in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
> +      Documentation/devicetree/bindings/graph.txt
> +    type: object
> +    properties:
> +      port@0:
> +        description: Video port for the RGB, YUV or DSI input.

s/RGB, YUV or DSI/RGB or YUV/

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
> +# adi,input-colorspace and adi,input-clock are required except in
> +# "rgb 1x" and "yuv444 1x" modes, in which case they must not be
> +# specified.
> +if:
> +  not:
> +    properties:
> +      adi,input-colorspace:
> +        contains:
> +          enum: [ rgb, yuv444 ]
> +      adi,input-clock:
> +        contains:
> +          const: 1x

As both properties take a single value, I think you can omit
"contains:".

> +
> +then:
> +  required:
> +    - adi,input-style
> +    - adi,input-justification
> +
> +else:
> +  properties:
> +    adi,input-style: false
> +    adi,input-justification: false
> +
> +
> +required:
> +  - compatible
> +  - reg
> +  - ports
> +  - adi,input-depth
> +  - adi,input-colorspace
> +  - adi,input-clock

Shouldn't the power supplies be required ?

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
> +        adi,input-colorspace = "yuv422";
> +        adi,input-clock = "1x";
> +
> +        adi,input-style = <3>;
> +        adi,input-justification = "right";
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
> diff --git a/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml b/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
> new file mode 100644
> index 000000000000..dfcc63dfc5c5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
> @@ -0,0 +1,166 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices ADV7533/35 HDMI Encoders
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +
> +description: |
> +  The ADV7533 and ADV7535 are HDMI audio and video transmitters
> +  compatible with HDMI 1.4 and DVI 1.0. They support color space
> +  conversion, S/PDIF, CEC and HDCP. They support DSI for input pixels.

I would write the last sentence as "The transmitter input is MIPI DSI.".

> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,adv7533
> +      - adi,adv7535
> +
> +  reg:
> +    description: |
> +      I2C slave addresses.
> +
> +      The ADV7533/35 internal registers are split into four pages
> +      exposed through different I2C addresses, creating four register
> +      maps. Each map has it own I2C address and acts as a standard slave
> +      device on the I2C bus. The main address is mandatory, others are
> +      optional and revert to defaults if not specified.
> +    minItems: 1
> +    maxItems: 4
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
> +  clocks:
> +    description: Reference to the CEC clock.
> +    maxItems: 1
> +
> +  clock-names:
> +    const: cec
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
> +
> +  dvdd-supply:
> +    description: A 1.8V supply that powers up the DVDD pin.
> +
> +  pvdd-supply:
> +    description: A 1.8V supply that powers up the PVDD pin.
> +
> +  a2vdd-supply:
> +    description: A 1.8V supply that powers up the A2VDD pin.
> +
> +  v3p3-supply:
> +    description: A 3.3V supply that powers up the V3P3 pin.
> +
> +  v1p2-supply:
> +    description:
> +      A supply that powers up the V1P2 pin. It can be either 1.2V
> +      or 1.8V for ADV7533 but only 1.8V for ADV7535.
> +
> +  adi,disable-timing-generator:
> +    description:
> +      Disables the interal timing generator. The chip will rely on the

s/interal/internal/

> +      sync signals in the DSI data lanes, rather than generate its own

s/generate/generating/

> +      timings for HDMI output.
> +    type: boolean
> +
> +  adi,dsi-lanes:
> +    description: Number of DSI data lanes connected to the DSI host.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [ 1, 2, 3, 4 ]
> +
> +  ports:
> +    description:
> +      The ADV7533/35 has two video ports and one audio port. This node
> +      models their connections as documented in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
> +      Documentation/devicetree/bindings/graph.txt
> +    type: object
> +    properties:
> +      port@0:
> +        description:
> +          Video port for the RGB, YUV or DSI input. The remote endpoint

s/RGB, YUV or //

> +          phandle should be a reference to a valid mipi_dsi_host_device.
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
> +required:
> +  - compatible
> +  - reg
> +  - ports
> +  - adi,dsi-lanes

Shouldn't the power supplies be required ?

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    adv7533: hdmi@39 {
> +        compatible = "adi,adv7533";
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
> +        adi,dsi-lanes = <4>;
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

The name of the two endpoints doesn't match the adv7533. The remote
endpoint phandle for port 0 should have dsi in its name.

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

-- 
Regards,

Laurent Pinchart
