Return-Path: <SRS0=kwC1=3S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3EFCC33CB7
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jan 2020 20:14:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A8CE320716
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jan 2020 20:14:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbgA2UOc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Jan 2020 15:14:32 -0500
Received: from asavdk4.altibox.net ([109.247.116.15]:42004 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726847AbgA2UOb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 29 Jan 2020 15:14:31 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id E21CE804EB;
        Wed, 29 Jan 2020 21:14:27 +0100 (CET)
Date:   Wed, 29 Jan 2020 21:14:26 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
Cc:     noralf@tronnes.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 2/3] dt-bindings: add binding for tft displays based
 on ilitek,ili9486
Message-ID: <20200129201426.GC29646@ravnborg.org>
References: <cover.1580134320.git.kamlesh.gurudasani@gmail.com>
 <a37d95cbfc9603265ed15916cdd2fb69e8c5f041.1580134320.git.kamlesh.gurudasani@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a37d95cbfc9603265ed15916cdd2fb69e8c5f041.1580134320.git.kamlesh.gurudasani@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8
        a=gEfo2CItAAAA:8 a=XVKnMrC0qe7PrV5dD3AA:9 a=7Zwj6sZBwVKJAoWSPKxL6X1jA+E=:19
        a=CjuIK1q_8ugA:10 a=sptkURWiP4Gy88Gu7hUp:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Kamlesh

Thanks for the conversion to DT Schema format.

On Mon, Jan 27, 2020 at 07:56:14PM +0530, Kamlesh Gurudasani wrote:
> This binding is for the tft displays based on ilitek,ili9486.
> ozzmaker,piscreen and waveshare,rpi-lcd-35 are such displays
> 
> Signed-off-by: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
> ---
> 
> v2 changes:
> * Changing file from txt to yaml format
> * removed ilitek,ili9486 from compatible string
> 
> v3 changes:
> * no changes
> 
> v4 changes:
> * no changes
> ---
>  .../bindings/display/ilitek,ili9486.yaml           | 79 ++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/ilitek,ili9486.yaml b/Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
> new file mode 100644
> index 0000000..dd306c88
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/ilitek,ili9486.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ilitek ILI9486 display panels device tree bindings
> +
> +maintainers:
> +  - Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
> +
> +description:
> +  This binding is for display panels using an Ilitek ILI9486 controller in SPI
> +  mode.
> +
> +allOf:
> +  - $ref: panel/panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - description:
> +          Waveshare 3.5" 320x480 Color TFT LCD
> +        items:
> +          - enum:
> +              - waveshare,rpi-lcd-35
> +          - const: ilitek,ili9486
> +      - description:
> +          Ozzmaker 3.5" 320x480 Color TFT LCD
> +        items:
> +          - enum:
> +              - ozzmaker,piscreen
> +          - const: ilitek,ili9486

This parts looks a bit too complicated.
I think the following would do the trick:

    compatible:
      items:
        - enum:
            # Waveshare 3.5" 320x480 Color TFT LCD
          - waveshare,rpi-lcd-35
            # Ozzmaker 3.5" 320x480 Color TFT LCD
          - ozzmaker,piscreen
        - const: ilitek,ili9486

This makes it more obvious that you try to say that the binding should
include one of the enum values and ilitek,ili9486

With this your example would also rightfully fail as it is missing
the ilitek,ili9486 compatible.


	Sam

> +
> +  spi-max-frequency:
> +    maximum: 32000000
> +
> +  dc-gpios:
> +    maxItems: 1
> +    description: Display data/command selection (D/CX)
> +
> +  backlight: true
> +  reg: true
> +  reset-gpios: true
> +  rotation: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - dc-gpios
> +  - reset-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    backlight: backlight {
> +            compatible = "gpio-backlight";
> +            gpios = <&gpio 22 GPIO_ACTIVE_HIGH>;
> +    };
> +    spi {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +
> +            display@0{
> +                    compatible = "waveshare,rpi-lcd-35";
> +                    reg = <0>;
> +                    spi-max-frequency = <32000000>;
> +                    dc-gpios = <&gpio0 24 GPIO_ACTIVE_HIGH>;
> +                    reset-gpios = <&gpio0 25 GPIO_ACTIVE_HIGH>;
> +                    rotation = <180>;
> +                    backlight = <&backlight>;
> +            };
> +    };
> +
> +...
> -- 
> 2.7.4
