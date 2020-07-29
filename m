Return-Path: <SRS0=UHbD=BI=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72373C433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jul 2020 16:59:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A65B207F5
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jul 2020 16:59:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726615AbgG2Q7I (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Jul 2020 12:59:08 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:42130 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbgG2Q7I (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 29 Jul 2020 12:59:08 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id D6107806BC;
        Wed, 29 Jul 2020 18:59:05 +0200 (CEST)
Date:   Wed, 29 Jul 2020 18:59:04 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Marek Vasut <marex@denx.de>
Cc:     dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH V2 1/2] dt-bindings: Add DT bindings for Toshiba TC358762
 DSI-to-DPI bridge
Message-ID: <20200729165904.GB1372716@ravnborg.org>
References: <20200729164554.114735-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200729164554.114735-1-marex@denx.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8 a=-VAfIpHNAAAA:8 a=VwQbUJbxAAAA:8
        a=7gkXJVJtAAAA:8 a=gEfo2CItAAAA:8 a=wLk5mgfxucYYyhUj8NMA:9
        a=-9lf9JVBwhYZPLep:21 a=NXM7E4vtB9kfhu_y:21 a=CjuIK1q_8ugA:10
        a=Vxmtnl_E_bksehYqCbjh:22 a=srlwD-8ojaedGGhPAyx8:22
        a=AjGcO6oz07-iQ99wixmX:22 a=E9Po1WZjFZOl8hwRPBS3:22
        a=sptkURWiP4Gy88Gu7hUp:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Marek.

On Wed, Jul 29, 2020 at 06:45:53PM +0200, Marek Vasut wrote:
> Add DT bindings for Toshiba TC358762 DSI-to-DPI bridge, this
> one is used in the Raspberry Pi 7" touchscreen display unit.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> To: dri-devel@lists.freedesktop.org
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: devicetree@vger.kernel.org
> ---
> V2: Fix dt_binding_check errors
> ---
>  .../display/bridge/toshiba,tc358762.yaml      | 125 ++++++++++++++++++
>  1 file changed, 125 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.yaml
> new file mode 100644
> index 000000000000..6cd4c0d86c13
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.yaml
> @@ -0,0 +1,125 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/toshiba,tc358762.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Toshiba TC358762 MIPI DSI to MIPI DPI bridge
> +
> +maintainers:
> +  - Marek Vasut <marex@denx.de>
> +
> +description: |
> +  The TC358762 is bridge device which converts MIPI DSI to MIPI DPI.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - toshiba,tc358762
> +
> +  reg:
> +    maxItems: 1
> +    description: virtual channel number of a DSI peripheral
> +
> +  vddc-supply:
> +    description: Regulator for 1.2V internal core power.
> +
> +  ports:
> +    type: object
> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +      port@0:
> +        type: object
> +        additionalProperties: false
> +
> +        description: |
> +          Video port for MIPI DSI input
> +
> +        properties:
> +          reg:
> +            const: 0
> +
> +        patternProperties:
Not happy with the use of "patternProperties" when there is no pattern.

> +          endpoint:
> +            type: object
> +            additionalProperties: false
> +
> +            properties:
> +              remote-endpoint: true
> +
> +        required:
> +          - reg
> +
> +      port@1:
> +        type: object
> +        additionalProperties: false
> +
> +        description: |
> +          Video port for MIPI DPI output (panel or connector).
> +
> +        properties:
> +          reg:
> +            const: 1
> +
> +        patternProperties:
Same here.

> +          endpoint:
> +            type: object
> +            additionalProperties: false
> +
> +            properties:
> +              remote-endpoint: true
> +
> +        required:
> +          - reg
> +
> +    required:
> +      - "#address-cells"
> +      - "#size-cells"
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - vddc-supply
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c1 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      bridge@0 {
> +        reg = <0>;
> +        compatible = "toshiba,tc358762";
> +        vddc-supply = <&vcc_1v2_reg>;
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +            bridge_in: endpoint {
> +              remote-endpoint = <&dsi_out>;
> +            };
> +          };
> +
> +          port@1 {
> +            reg = <1>;
> +            bridge_out: endpoint {
> +              remote-endpoint = <&panel_in>;
> +            };
> +          };
> +        };
> +      };
> +    };

Add:
<empty line>
...

Where "..." is the end-marker (or somethig like that in yaml).

> -- 
> 2.27.0
