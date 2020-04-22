Return-Path: <SRS0=0pfk=6G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A28BBC54FCB
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Apr 2020 20:06:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 745E22077D
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Apr 2020 20:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587586001;
	bh=0FtickJH33zo7rOmBxZNOUqSRmWNX5fCBm5T7vBhBIg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=J57PhbNzt+lFHoiEROeLwlZkSVsf4Wvq0veeLe+USFpaFru356YwuvDf17pFY9wIw
	 S4+m07wi4EghLIgf3SGv6XiawBX8sJ71cjDjjpf7c7ZCi0zkbB9NQ659f1WO0cvzQt
	 TfADW2ZOA2fZmh9jvySLy3e23ncXrfgPPJZRavLI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbgDVUGl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Apr 2020 16:06:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:59024 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726109AbgDVUGk (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 22 Apr 2020 16:06:40 -0400
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CCC8D20857
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2020 20:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587585999;
        bh=0FtickJH33zo7rOmBxZNOUqSRmWNX5fCBm5T7vBhBIg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=bL4uO11Sc6g9qclg+3e8De6vLLWI6B43+7B+PAA+MudixXS2Z3kJN9NQSxvHkoq+0
         +VU+Wu0AMpese9BG+zr/4MXohS7fxGm+BVWFUlB1h9vpJWaao9SL+cpzTxJnVRKv6m
         6dRuzkWTMi6GrT/IhE97904tivfNJz2/sEFFI1gk=
Received: by mail-qt1-f182.google.com with SMTP id o10so2843814qtr.6
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2020 13:06:39 -0700 (PDT)
X-Gm-Message-State: AGi0PuYdrpckX+uGU8aYt23l1jOW5TUyYfi/WC/6TCTlfdzZA26w5v6h
        Vt3Kj2Oh81fbjEJZuCGLdweP3W2+WQ+neZi/0g==
X-Google-Smtp-Source: APiQypKpZC5oYh4Day8VRkXcMufLykh0niakd6Sp2Y1oKVuyJtTvKSG6ZMl+i+p7SSsWpFF/vaqrhy6wuszJO5mDHik=
X-Received: by 2002:ac8:4907:: with SMTP id e7mr395174qtq.300.1587585998943;
 Wed, 22 Apr 2020 13:06:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200422180028.1702996-1-adrian.ratiu@collabora.com> <20200422180028.1702996-2-adrian.ratiu@collabora.com>
In-Reply-To: <20200422180028.1702996-2-adrian.ratiu@collabora.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 22 Apr 2020 15:06:27 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKdDgjNahrcRhxLcMXy+8GR3P6v2OXiEtrA-1Uia-XXRA@mail.gmail.com>
Message-ID: <CAL_JsqKdDgjNahrcRhxLcMXy+8GR3P6v2OXiEtrA-1Uia-XXRA@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: display: dw_mipi_dsi.txt: convert to yaml
To:     Adrian Ratiu <adrian.ratiu@collabora.com>
Cc:     devicetree@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Collabora Kernel ML <kernel@collabora.com>,
        Philippe CORNU <philippe.cornu@st.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Apr 22, 2020 at 12:59 PM Adrian Ratiu
<adrian.ratiu@collabora.com> wrote:
>
> This converts the Synopsis MIPI DSI binding documentation to yaml and
> should be quite straightforward. I've added a missing ref clk and also
> added Philippe as maintainer b/c he's the original txt author following
> the algorithm provided in Message-ID 20200420175909.GA5810@ravnborg.org.
>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Philippe CORNU <philippe.cornu@st.com>
> Cc: devicetree@vger.kernel.org
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> ---
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
>  .../display/bridge/snps,dw-mipi-dsi.yaml      | 72 +++++++++++++++++++
>  2 files changed, 72 insertions(+), 32 deletions(-)
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
> index 0000000000000..076567d8d8ec1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml
> @@ -0,0 +1,72 @@
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
> +patternProperties:
> +  "^panel@[0-3]$":

It's not always a panel attached. dsi-controller.yaml covers child
nodes anyways, so you can just drop this.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +    type: object
> +
> +required:
> +  - clock-names
> +  - clocks
> +  - ports
> +  - reg
> --
> 2.26.0
>
