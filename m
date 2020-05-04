Return-Path: <SRS0=58Ja=6S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 741B2C3A5A9
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 May 2020 19:56:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E5B8206B8
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 May 2020 19:56:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726419AbgEDT4R (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 4 May 2020 15:56:17 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:35466 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726111AbgEDT4Q (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 4 May 2020 15:56:16 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 682AE80445;
        Mon,  4 May 2020 21:56:13 +0200 (CEST)
Date:   Mon, 4 May 2020 21:56:11 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Adrian Ratiu <adrian.ratiu@collabora.com>
Cc:     devicetree@vger.kernel.org, kernel@collabora.com,
        Philippe CORNU <philippe.cornu@st.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v4] dt-bindings: display: dw_mipi_dsi.txt: convert to yaml
Message-ID: <20200504195611.GB8122@ravnborg.org>
References: <20200423100058.1734009-1-adrian.ratiu@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200423100058.1734009-1-adrian.ratiu@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=8b9GpE9nAAAA:8 a=VwQbUJbxAAAA:8
        a=P1BnusSwAAAA:8 a=QX4gbG5DAAAA:8 a=gEfo2CItAAAA:8 a=e5mUnYsNAAAA:8
        a=DnhdGLIzMOaqX5MExm4A:9 a=3HZsMFU8-sG1ni-G:21 a=FP6V20R-gSP7gWPn:21
        a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=T3LWEMljR5ZiDmsYVIUa:22
        a=AjGcO6oz07-iQ99wixmX:22 a=D0XLA9XvdZm18NrgonBM:22
        a=AbAUZ8qAyYyZVLSsDulk:22 a=sptkURWiP4Gy88Gu7hUp:22
        a=Vxmtnl_E_bksehYqCbjh:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Apr 23, 2020 at 01:00:58PM +0300, Adrian Ratiu wrote:
> This converts the Synopsis MIPI DSI binding documentation to yaml and
> should be quite straightforward. I've added a missing ref clk and also
> added Philippe as maintainer b/c he's the original txt author following
> the algorithm provided in Message-ID 20200420175909.GA5810@ravnborg.org.
> 
> Cc: Philippe CORNU <philippe.cornu@st.com>
> Cc: devicetree@vger.kernel.org
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
Applied to drm-misc-next.

	Sam


> ---
> Changes in v4:
>   - Dropped panel patternProperties (Rob)
> 
> Changes in v3:
>   - Added ports property and its children which are required (Laurent)
>   - Sorted required list alphabetically
> 
> Changes in v2:
>   - Removed unnecessary descriptions and maxItems (Rob)
>   - Changed maintainers entry / dropped Mark (Rob)
>   - Added dsi-controller.yaml ref (Rob)
> ---
>  .../bindings/display/bridge/dw_mipi_dsi.txt   | 32 ---------
>  .../display/bridge/snps,dw-mipi-dsi.yaml      | 68 +++++++++++++++++++
>  2 files changed, 68 insertions(+), 32 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt b/Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt
> deleted file mode 100644
> index b13adf30b8d3b..0000000000000
> --- a/Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -Synopsys DesignWare MIPI DSI host controller
> -============================================
> -
> -This document defines device tree properties for the Synopsys DesignWare MIPI
> -DSI host controller. It doesn't constitue a device tree binding specification
> -by itself but is meant to be referenced by platform-specific device tree
> -bindings.
> -
> -When referenced from platform device tree bindings the properties defined in
> -this document are defined as follows. The platform device tree bindings are
> -responsible for defining whether each optional property is used or not.
> -
> -- reg: Memory mapped base address and length of the DesignWare MIPI DSI
> -  host controller registers. (mandatory)
> -
> -- clocks: References to all the clocks specified in the clock-names property
> -  as specified in [1]. (mandatory)
> -
> -- clock-names:
> -  - "pclk" is the peripheral clock for either AHB and APB. (mandatory)
> -  - "px_clk" is the pixel clock for the DPI/RGB input. (optional)
> -
> -- resets: References to all the resets specified in the reset-names property
> -  as specified in [2]. (optional)
> -
> -- reset-names: string reset name, must be "apb" if used. (optional)
> -
> -- panel or bridge node: see [3]. (mandatory)
> -
> -[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> -[2] Documentation/devicetree/bindings/reset/reset.txt
> -[3] Documentation/devicetree/bindings/display/mipi-dsi-bus.txt
> diff --git a/Documentation/devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml
> new file mode 100644
> index 0000000000000..012aa8e7cb8cd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/snps,dw-mipi-dsi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synopsys DesignWare MIPI DSI host controller
> +
> +maintainers:
> +  - Philippe CORNU <philippe.cornu@st.com>
> +
> +description: |
> +  This document defines device tree properties for the Synopsys DesignWare MIPI
> +  DSI host controller. It doesn't constitue a device tree binding specification
> +  by itself but is meant to be referenced by platform-specific device tree
> +  bindings.
> +
> +  When referenced from platform device tree bindings the properties defined in
> +  this document are defined as follows. The platform device tree bindings are
> +  responsible for defining whether each property is required or optional.
> +
> +allOf:
> +  - $ref: ../dsi-controller.yaml#
> +
> +properties:
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Module clock
> +      - description: DSI bus clock for either AHB and APB
> +      - description: Pixel clock for the DPI/RGB input
> +    minItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: ref
> +      - const: pclk
> +      - const: px_clk
> +    minItems: 2
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    const: apb
> +
> +  ports:
> +    type: object
> +
> +    properties:
> +      port@0:
> +        type: object
> +        description: Input node to receive pixel data.
> +      port@1:
> +        type: object
> +        description: DSI output node to panel.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - clock-names
> +  - clocks
> +  - ports
> +  - reg
> -- 
> 2.26.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
