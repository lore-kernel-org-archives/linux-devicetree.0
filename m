Return-Path: <SRS0=deyM=Y4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF3BECA9EC9
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 Nov 2019 23:30:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8C5C420663
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 Nov 2019 23:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572910253;
	bh=VuRyZefH1GJ2W7lKyuG3yWFjwEAZHZSAsFVMNtx8YiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=p2g2Z5J6z1r19Do0xKCTVGyq/xLjx/49FPwVYafdslEukhzVnSMAbf6p2kbIgz90T
	 AlFtNgEC/5zL3FgyfB+Bcb8cZGTINWT0e+I3wNMj/6+KPFJmD8lyFg4lL7phJmbQQJ
	 Oyo6UV0uNiFarDAUrUwdt+30AJf/+yBn34JEIIZU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729428AbfKDXax (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 4 Nov 2019 18:30:53 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:34905 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728810AbfKDXaw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 4 Nov 2019 18:30:52 -0500
Received: by mail-ot1-f65.google.com with SMTP id z6so16037312otb.2
        for <devicetree@vger.kernel.org>; Mon, 04 Nov 2019 15:30:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Kr4KEmsrM4VGWU3xHSwQWOz/VEaTTxyuxi7Mcc77Shw=;
        b=KpRKLgvaiobfJHPAiH/mKmSjBKAYTTElV6ksUf/z1se0EcyFaI1Q2oMwr/QR7yVshn
         js5oQdA11Q9QV+hBen/wxP5zVUsqmo4mFPLzWk4+QJsnwiJJBePaCi0Y9SJ6+IPnVooW
         nUnBq//w9Bi09IVZTRtT6nsDOwqFGzLIJzEynrDYvlPVZxXorZhRlpINCaOnXbAMFx+X
         7UfzAmu1KAfDwizLvuDYh/gCnZ76e9Zaq8RFyQ38VTrok2lPRPXh0d4Ozk5Q0SOeI8a2
         x9XjZ+hadUZIdgMoNkM53D8RlMKCAN/F4Rr9Dn7EY19/vxcg/s0fVgRLFnVB1jHXXXCG
         BXDA==
X-Gm-Message-State: APjAAAV/OXYyQtQQKIx++SR2G2PA9MEexSthi9/7vN31+D51NnOGIjNV
        4PrbZ37rdXhSI97vYz79Ww==
X-Google-Smtp-Source: APXvYqw/1xKwncI+AnjTUpBT7XUAlFOICSYrLNGUNz+zIpp/Ce59w4hlGuebT/AEtu+Z4eU/V77ffw==
X-Received: by 2002:a05:6830:1e16:: with SMTP id s22mr10590291otr.30.1572909776610;
        Mon, 04 Nov 2019 15:22:56 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i11sm5722258otj.17.2019.11.04.15.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 15:22:56 -0800 (PST)
Date:   Mon, 4 Nov 2019 17:22:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2 v5] drm/panel: Add generic DSI panel YAML bindings
Message-ID: <20191104232255.GB14609@bogus>
References: <20191103205459.24965-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191103205459.24965-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, Nov 03, 2019 at 09:54:58PM +0100, Linus Walleij wrote:
> This adds a starting point for processing and defining generic
> bindings used by DSI panels. We just define one single bool
> property to force the panel into video mode for now.
> 
> Cc: devicetree@vger.kernel.org
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v4->v5:
> - Drop the example.
> - I still have a vert annoying error message in the Sony
>   panel bindings that uses this schema:
>   sony,acx424akp.example.dt.yaml: panel@0: $nodename:0: 'panel@0' does not match '^dsi-controller(@.*)?$'
>   As this is modeled very closely to
>   Documentation/devicetree/bindings/net/mdio.yaml
>   and that one doesn't emit this type of warning for its ethernet-phy@0
>   etc I am pretty much clueless and just can't see what the problem
>   is.
> - If I can't figure this out the only viable next step is to drop the
>   ambition to create yaml bindings simply because I'm unable to do
>   it, and go back to traditional text bindings :(
> ChangeLog v3->v4:
> - Rename into display/dsi-controller.yaml
> - Require a virtual channel number for the DSI panel, as
>   DSI have this 2-bit virtual address field.
> - Bring in some but not all properties from the existing MIPI
>   DSI bindings. This schema can be used with simpler panels but
>   not complex panels with multiple virtual channels for the
>   moment. Let's handle it when we get there.
> - Add an example.
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
>  .../bindings/display/dsi-controller.yaml      | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/dsi-controller.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/dsi-controller.yaml b/Documentation/devicetree/bindings/display/dsi-controller.yaml
> new file mode 100644
> index 000000000000..9e2bf7776c15
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/dsi-controller.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/dsi-controller.yaml#
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

Controllers and attached panels.

> +  specification by itself but is meant to be referenced by device tree
> +  bindings.
> +
> +  When referenced from panel device tree bindings the properties defined in

When referenced from panel bindings, you'll get errors. ;)

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
> +    description: Panels connected to the DSI link
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
> +...
> -- 
> 2.21.0
> 
