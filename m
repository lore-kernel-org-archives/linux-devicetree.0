Return-Path: <SRS0=9zIi=6I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB25CC54FCB
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Apr 2020 14:08:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B89BB21473
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Apr 2020 14:08:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbgDXOIQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 24 Apr 2020 10:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726698AbgDXOIQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 24 Apr 2020 10:08:16 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3CC1C09B045
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2020 07:08:15 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id AAA372A2D55
Subject: Re: [PATCH] dt-bindings: display: anx7814.txt: convert to yaml
To:     =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>,
        devicetree@vger.kernel.org
Cc:     kernel@collabora.com, dri-devel@lists.freedesktop.org,
        robh+dt@kernel.org
References: <20200424065354.23781-1-ricardo.canuelo@collabora.com>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <481401ed-93a4-6918-3d8b-6c769d8c7617@collabora.com>
Date:   Fri, 24 Apr 2020 16:08:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200424065354.23781-1-ricardo.canuelo@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Ricardo,

Thank you for your patch.

On 24/4/20 8:53, Ricardo Cañuelo wrote:
> This converts the Analogix ANX7814 bridge DT binding to yaml. Port
> definitions and descriptions were expanded, apart from that it's a
> direct translation from the original binding.
> 
> Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
> ---
> Tested with:
> make dt_binding_check ARCH=arm64 DT_SCHEMA_FILES=<.../anx7814.yaml>
> make dtbs_check ARCH=arm64 DT_SCHEMA_FILES=<.../anx7814.yaml>
> 
>  .../bindings/display/bridge/anx7814.txt       |  42 ------
>  .../bindings/display/bridge/anx7814.yaml      | 133 ++++++++++++++++++
>  2 files changed, 133 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/anx7814.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/anx7814.yaml

Use the full compatible string: analogix,anx7814.yaml

> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/anx7814.txt b/Documentation/devicetree/bindings/display/bridge/anx7814.txt
> deleted file mode 100644
> index 17258747fff6..000000000000
> --- a/Documentation/devicetree/bindings/display/bridge/anx7814.txt
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -Analogix ANX7814 SlimPort (Full-HD Transmitter)
> ------------------------------------------------
> -
> -The ANX7814 is an ultra-low power Full-HD (1080p60) SlimPort transmitter
> -designed for portable devices.
> -
> -Required properties:
> -
> - - compatible		: Must be one of:
> -			  "analogix,anx7808"
> -			  "analogix,anx7812"
> -			  "analogix,anx7814"
> -			  "analogix,anx7818"
> - - reg			: I2C address of the device
> - - interrupts		: Should contain the INTP interrupt
> - - hpd-gpios		: Which GPIO to use for hpd
> - - pd-gpios		: Which GPIO to use for power down
> - - reset-gpios		: Which GPIO to use for reset
> -
> -Optional properties:
> -
> - - dvdd10-supply	: Regulator for 1.0V digital core power.
> - - Video port for HDMI input, using the DT bindings defined in [1].
> -
> -[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
> -
> -Example:
> -
> -	anx7814: anx7814@38 {
> -		compatible = "analogix,anx7814";
> -		reg = <0x38>;
> -		interrupt-parent = <&gpio0>;
> -		interrupts = <99 IRQ_TYPE_LEVEL_LOW>;   /* INTP */
> -		hpd-gpios = <&pio 36 GPIO_ACTIVE_HIGH>;
> -		pd-gpios = <&pio 33 GPIO_ACTIVE_HIGH>;
> -		reset-gpios = <&pio 98 GPIO_ACTIVE_HIGH>;
> -		port {
> -			anx7814_in: endpoint {
> -				remote-endpoint = <&hdmi0_out>;
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/display/bridge/anx7814.yaml b/Documentation/devicetree/bindings/display/bridge/anx7814.yaml
> new file mode 100644
> index 000000000000..53d3c778c893
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/anx7814.yaml
> @@ -0,0 +1,133 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/anx7814.yaml#

Don't forget to update this too.


> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analogix ANX7814 SlimPort (Full-HD Transmitter)
> +
> +maintainers:
> +  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
> +
> +description: |
> +  The ANX7814 is an ultra-low power Full-HD (1080p60) SlimPort transmitter
> +  designed for portable devices.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - analogix,anx7808
> +      - analogix,anx7812
> +      - analogix,anx7814
> +      - analogix,anx7818
> +
> +  reg:
> +    maxItems: 1
> +    description: I2C address of the device.
> +

Can drop the description as there's nothing specific to this device.

> +  interrupts:
> +    maxItems: 1
> +    description: Should contain the INTP interrupt.
> +
> +  hpd-gpios:
> +    maxItems: 1
> +    description: Which GPIO to use for hpd.
> +
> +  pd-gpios:
> +    maxItems: 1
> +    description: Which GPIO to use for power down.
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: Which GPIO to use for reset.
> +
> +  dvdd10-supply:
> +    maxItems: 1
> +    description: Regulator for 1.0V digital core power.
> +
> +  ports:
> +    type: object
> +    description:
> +      A node containing input and output port nodes with endpoint
> +      definitions as documented in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
> +      Documentation/devicetree/bindings/graph.txt
> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +

I don't' think you need to specify this. You can drop it (better double check
with Rob, though)

> +      "#size-cells":
> +        const: 0
> +

I don't' think you need to specify this. You can drop it (better double check
with Rob, though)

> +      port@0:
> +        type: object
> +        description: Video port for HDMI input.
> +
> +        properties:
> +          reg:
> +            const: 0
> +
> +      port@1:
> +        type: object
> +        description:
> +          Video port for SlimPort, DisplayPort, eDP or MyDP output.
> +
> +        properties:
> +          reg:
> +            const: 1
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - hpd-gpios
> +  - pd-gpios
> +  - reset-gpios
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        anx7814: anx7814@38 {

This should be "bridge@38 {", since node names are supposed to
match the class of the device instead of the name of the device. I guess.

> +            compatible = "analogix,anx7814";
> +            reg = <0x38>;
> +            interrupt-parent = <&gpio0>;
> +            interrupts = <99 IRQ_TYPE_LEVEL_LOW>;   /* INTP */
> +            hpd-gpios = <&pio 36 GPIO_ACTIVE_HIGH>;
> +            pd-gpios = <&pio 33 GPIO_ACTIVE_HIGH>;
> +            reset-gpios = <&pio 98 GPIO_ACTIVE_HIGH>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    anx7814_in: endpoint {
> +                        remote-endpoint = <&hdmi0_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    anx7814_out: endpoint {
> +                        remote-endpoint = <&edp_out>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +...
> 
