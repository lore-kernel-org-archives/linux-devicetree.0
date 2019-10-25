Return-Path: <SRS0=V00+=YS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2992CA9EBC
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 19:20:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ADA67222BD
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 19:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572031259;
	bh=I1FdOuk1NYJ0RcMWwdzKPHA7hHLDs1hq2MBoUgCY1YM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=wLdZ5qTsw3LxDighXKmaNLn5gZTXE4D6ksgHCrmmpstVTEefnREQAfo7vt018Cdlf
	 RGRlgUheGUeOmmgcFlOfOaIjjw2tXGujxiONAiRxKACrx45N4aiQ/6yZ0VIkq4JBj3
	 IHMkQKysZB7oR2jxsdfKH+x3cfBHhfbZlfmZqutM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbfJYTU6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 25 Oct 2019 15:20:58 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:42872 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbfJYTU4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 25 Oct 2019 15:20:56 -0400
Received: by mail-ot1-f66.google.com with SMTP id b16so2788157otk.9
        for <devicetree@vger.kernel.org>; Fri, 25 Oct 2019 12:20:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=awZBJFM5hxVsWrcVyprTa0xEbkVsklo6wi+ICtVaARk=;
        b=YQ2GOAzLXZ9sWRIFKecW1pTpCDrxYy/z/cQcELVUbOxaJ9UHIgNhMIGpPnTj0B0s+K
         Z6YmTADd3Kk0uW1REOj/bZkxdqvKRac9gFwezbPdyK1akqq6gyt1tooncCP2X945axGY
         wPrGcWwbTyfdBAv0Sv+m5/V5L5BLSVdxoFo7gVnzMI8YnXLgd1zT3l6l1QBhWCRDReyw
         lMbzqdAr43J01i2gFrJFR7a76C3FkDCLkLAzYtKIuqHfNC23U0YYZ1UuffkJEVSWxHzm
         ty7H+JyRZqP8XtcvQq9am3i3va7ioaKh44/S7Yon//TuYe5NDfvZyHtjQCkB4CElFuv7
         ESkg==
X-Gm-Message-State: APjAAAWLqOxRx1tSuNK3psS9N/tiwtqMH8SCnmpNB/CZ32ls1NAmzdmu
        Ziy2tv4IRLn+EAwxRYFQEw==
X-Google-Smtp-Source: APXvYqxjUo7nFpr8YFudE+cAZiX9i4cJurw1DvFBgjwRrf3qy5VIGCkuPr9HWjnNY3+TYPBIn8pD1Q==
X-Received: by 2002:a9d:111:: with SMTP id 17mr4186666otu.172.1572031255710;
        Fri, 25 Oct 2019 12:20:55 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 15sm736052otd.29.2019.10.25.12.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 12:20:55 -0700 (PDT)
Date:   Fri, 25 Oct 2019 14:20:54 -0500
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3 v4] drm/panel: Add generic DSI panel YAML bindings
Message-ID: <20191025192054.GA7415@bogus>
References: <20191024114305.15581-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191024114305.15581-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Oct 24, 2019 at 01:43:03PM +0200, Linus Walleij wrote:
> This adds a starting point for processing and defining generic
> bindings used by DSI panels. We just define one single bool
> property to force the panel into video mode for now.
> 
> Cc: devicetree@vger.kernel.org
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v3->v4:
> - Rename into display/dsi-controller.yaml
> - Require a virtual channel number for the DSI panel, as
>   DSI have this 2-bit virtual address field.
> - Bring in some but not all properties from the existing MIPI
>   DSI bindings. This schema can be used with simpler panels but
>   not complex panels with multiple virtual channels for the
>   moment. Let's handle it when we get there.
> - Add an example.

A broken example...

> ChangeLog v2->v3:
> - Make a more complete DSI panel binding including the controller
>   and its address-cells and size-cells and a pattern for the panel
>   nodes. The panel is one per DSI master, the reg property is
>   compulsory but should always be 0 (as far as I can tell) as
>   only one panel can be connected. The bus doesn't really have
>   any addresses for the panel, the address/reg notation seems
>   to be cargo-culted from the port graphs and is not necessary
>   to parse some device trees, it is used to tell whether the
>   node is a panel or not rather than any addressing.
> - I have no idea how many displays you can daisychain on a single
>   DSI master, I just guess 15 will be enough. The MIPI-specs
>   are memberwalled. Someone who knows can tell perhaps?
> ChangeLog v1->v2:
> - New patch after feedback.
> ---
>  .../bindings/display/dsi-controller.yaml      | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/dsi-controller.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/dsi-controller.yaml b/Documentation/devicetree/bindings/display/dsi-controller.yaml
> new file mode 100644
> index 000000000000..2a6d872a40c5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/dsi-controller.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/panel-dsi-common.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common Properties for DSI Display Panels
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +description: |
> +  This document defines device tree properties common to DSI, Display
> +  Serial Interface panels. It doesn't constitute a device tree binding
> +  specification by itself but is meant to be referenced by device tree
> +  bindings.
> +
> +  When referenced from panel device tree bindings the properties defined in
> +  this document are defined as follows. The panel device tree bindings are
> +  responsible for defining whether each property is required or optional.
> +
> +  Notice: this binding concerns DSI panels connected directly to a master
> +  without any intermediate port graph to the panel. Each DSI master
> +  can control exactly one panel. They should all just have a node "panel"
> +  for their panel with their reg-property set to 0.
> +
> +properties:
> +  $nodename:
> +    pattern: "^dsi-controller(@.*)?$"
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^panel@[0-3]$":
> +    type: object
> +
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 3
> +        description:
> +          The virtual channel number of a DSI peripheral. Must be in the range
> +          from 0 to 3, as DSI uses a 2-bit addressing scheme. Some DSI
> +          peripherals respond to more than a single virtual channel. In that
> +          case the reg property can take multiple entries, one for each virtual
> +          channel that the peripheral responds to.
> +
> +      clock-master:
> +        type: boolean
> +        description:
> +           Should be enabled if the host is being used in conjunction with
> +           another DSI host to drive the same peripheral. Hardware supporting
> +           such a configuration generally requires the data on both the busses
> +           to be driven by the same clock. Only the DSI host instance
> +           controlling this clock should contain this property.
> +
> +      enforce-video-mode:
> +        type: boolean
> +        description:
> +          The best option is usually to run a panel in command mode, as this
> +          gives better control over the panel hardware. However for different
> +          reasons like broken hardware, missing features or testing, it may be
> +          useful to be able to force a command mode-capable panel into video
> +          mode.
> +
> +    required:
> +      - reg
> +
> +examples:
> +  - |
> +    dsi-controller@55aa55aa {
> +      compatible = "acme,foo";

Eventually, I want to start reporting if compatible strings aren't 
documented (i.e. matched to a schema). This will break then...

> +      reg = <0x55aa55aa>;

This will fail because a size cell is expected.

I'd just drop both properties here. A 'dsi-controller' node name is 
enough to select this schema.

> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      panel@0 {
> +        compatible = "acme,bar";

Just pick a real one. (Or drop the example because the binding for the 
real panel will have the same example).

> +        reg = <0>;
> +        vddi-supply = <&foo>;
> +        reset-gpios = <&foo_gpio 0 GPIO_ACTIVE_LOW>;
> +      };
> +    };
> +
> +...
> -- 
> 2.21.0
> 
