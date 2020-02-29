Return-Path: <SRS0=QVf9=4R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ADF5C3F2C6
	for <linux-devicetree@archiver.kernel.org>; Sat, 29 Feb 2020 13:08:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 67931246A2
	for <linux-devicetree@archiver.kernel.org>; Sat, 29 Feb 2020 13:08:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbgB2NIF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 29 Feb 2020 08:08:05 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:53496 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726933AbgB2NIF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 29 Feb 2020 08:08:05 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 9DB3520023;
        Sat, 29 Feb 2020 14:08:02 +0100 (CET)
Date:   Sat, 29 Feb 2020 14:08:01 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        dri-devel@lists.freedesktop.org, Rob Herring <robh@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3 v2] drm/panel: Add DT bindings for Novatek
 NT35510-based panels
Message-ID: <20200229130801.GE5447@ravnborg.org>
References: <20200223121841.26836-1-linus.walleij@linaro.org>
 <20200223121841.26836-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200223121841.26836-2-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=j8Cu_9a8AAAA:8
        a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=gEfo2CItAAAA:8 a=2Pge5cGlz_rskII7FHUA:9
        a=CjuIK1q_8ugA:10 a=A2jcf3dkIZPIRbEE90CI:22 a=AjGcO6oz07-iQ99wixmX:22
        a=cvBusfyB2V15izCimMoJ:22 a=sptkURWiP4Gy88Gu7hUp:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, Feb 23, 2020 at 01:18:40PM +0100, Linus Walleij wrote:
> This adds device tree bindings for the Novatek NT35510-based
> family of panels. Since several such panels are in existence
> we define bindings common for all, and define the compatible
> string for one certain panel (Hydis HVA40WV1).
> 
> As other panels are discovered and investigated, we can add
> more compatibles to the binding using oneOf constructions.
> 
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied to drm-misc-next.

	Sam

> ---
> ChangeLog v1->v2:
> - Rename file to novatek,nt35510,yaml to match the first
>   compatible.
> - Require both the specific display manufacturer compatible
>   and the novatek,nt35510 compatible in strict sequence.
> ---
>  .../display/panel/novatek,nt35510.yaml        | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
> new file mode 100644
> index 000000000000..791fc9daa68b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/novatek,nt35510.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Novatek NT35510-based display panels
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: hydis,hva40wv1
> +      - const: novatek,nt35510
> +    description: This indicates the panel manufacturer of the panel
> +      that is in turn using the NT35510 panel driver. The compatible
> +      string determines how the NT35510 panel driver shall be configured
> +      to work with the indicated panel. The novatek,nt35510 compatible shall
> +      always be provided as a fallback.
> +  reg: true
> +  reset-gpios: true
> +  vdd-supply:
> +     description: regulator that supplies the vdd voltage
> +  vddi-supply:
> +     description: regulator that supplies the vddi voltage
> +  backlight: true
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi@a0351000 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        panel {
> +            compatible = "hydis,hva40wv1", "novatek,nt35510";
> +            reg = <0>;
> +            vdd-supply = <&ab8500_ldo_aux4_reg>;
> +            vddi-supply = <&ab8500_ldo_aux6_reg>;
> +            reset-gpios = <&gpio4 11 GPIO_ACTIVE_LOW>;
> +            backlight = <&gpio_bl>;
> +        };
> +    };
> +
> +...
> -- 
> 2.21.1
