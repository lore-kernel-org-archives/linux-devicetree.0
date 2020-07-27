Return-Path: <SRS0=xnVj=BG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B2FC433E1
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 18:08:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07C5720714
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 18:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595873307;
	bh=bhzTL/OhyzHbMd6K4hOMTW/v3n3jX2Kf7QNurtYF4fQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=GMO6Ahw/GdlN8IcompLfJwryf/90p7tGkDBKWDZsv9ft3nN/ZmJyt4HGrCIdL9JXg
	 NwCRrzUh8MD8Ov095chEOEmSQh5jaJeFhjiWwIAjfNxvz4I88YLCXk9N3n7UV2gUPC
	 XdZ+MWmJ4G+AY7IJu+kqTjmliRKNoLwhx/q+B4mk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729618AbgG0SI0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jul 2020 14:08:26 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:40357 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728801AbgG0SI0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jul 2020 14:08:26 -0400
Received: by mail-il1-f194.google.com with SMTP id e18so13875839ilr.7
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 11:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=X5T36Y/Ye9YdL5d2ga8/stkLCBTDL7ZuFmnLlaqBIwI=;
        b=MPzfYAsOfGdm0qkhz5ZCVYjigGOPGY62XBMHR4rFwDGr2bzyGR7l6IH88O21RYmLxh
         qM2jX00dx837jCZ6ZfGmT8lFIT21/7JxEWSae5trlT4EbFOuzgMOG/l09xWiKbBMazc3
         Hqv9c5rFlxZyMGSaANRCFDwxSQY8hF+JDKcE5rUfGmvVV1JVx8+uUmXu0+iUidikNNqs
         DHJDJENX7eJT4Gq3knQbWE6BPzDshU87hKbfaI/odM/zHuwYqSwtObYj07ZPSEQBMT2+
         7n6DmFefA4YJKZGG3odIXqwykSNXzYBZ7Wg9gcVhT+imu81mvTdjUcCdLR9/KmYmwjrw
         XFWw==
X-Gm-Message-State: AOAM532uH9ewX6aadU7ooM0+TRNqGX6Rx6fAMXLxR5eP5HhOVW3E2q1J
        2OLhMXtP6rh5WbQ0rvfx6g==
X-Google-Smtp-Source: ABdhPJzC6Nb/waOm9InRDRBuiix1ClfKXNjJ7RdH+mk9Vd/86y6B1MDvl+71hhoO+dimyrmyHvW49A==
X-Received: by 2002:a05:6e02:666:: with SMTP id l6mr12134945ilt.198.1595873304416;
        Mon, 27 Jul 2020 11:08:24 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id g13sm3623330ilq.18.2020.07.27.11.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 11:08:23 -0700 (PDT)
Received: (nullmailer pid 630225 invoked by uid 1000);
        Mon, 27 Jul 2020 18:08:22 -0000
Date:   Mon, 27 Jul 2020 12:08:22 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lokesh Vutla <lokeshvutla@ti.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Suman Anna <s-anna@ti.com>
Subject: Re: [PATCH v4 05/10] dt-bindings: irqchip: Convert ti,sci-intr
 bindings to yaml
Message-ID: <20200727180822.GB619600@bogus>
References: <20200725163700.20583-1-lokeshvutla@ti.com>
 <20200725163700.20583-6-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200725163700.20583-6-lokeshvutla@ti.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, Jul 25, 2020 at 10:06:55PM +0530, Lokesh Vutla wrote:
> In order to automate the verification of DT nodes convert
> ti,sci-intr.txt ti,sci-intr.yaml.
> 
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
>  .../interrupt-controller/ti,sci-intr.txt      |  83 --------------
>  .../interrupt-controller/ti,sci-intr.yaml     | 102 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 103 insertions(+), 84 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.txt b/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.txt
> deleted file mode 100644
> index 8b56b2de1c73..000000000000
> --- a/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.txt
> +++ /dev/null
> @@ -1,83 +0,0 @@
> -Texas Instruments K3 Interrupt Router
> -=====================================
> -
> -The Interrupt Router (INTR) module provides a mechanism to mux M
> -interrupt inputs to N interrupt outputs, where all M inputs are selectable
> -to be driven per N output. An Interrupt Router can either handle edge triggered
> -or level triggered interrupts and that is fixed in hardware.
> -
> -                                 Interrupt Router
> -                             +----------------------+
> -                             |  Inputs     Outputs  |
> -        +-------+            | +------+    +-----+  |
> -        | GPIO  |----------->| | irq0 |    |  0  |  |       Host IRQ
> -        +-------+            | +------+    +-----+  |      controller
> -                             |    .           .     |      +-------+
> -        +-------+            |    .           .     |----->|  IRQ  |
> -        | INTA  |----------->|    .           .     |      +-------+
> -        +-------+            |    .        +-----+  |
> -                             | +------+    |  N  |  |
> -                             | | irqM |    +-----+  |
> -                             | +------+             |
> -                             |                      |
> -                             +----------------------+
> -
> -There is one register per output (MUXCNTL_N) that controls the selection.
> -Configuration of these MUXCNTL_N registers is done by a system controller
> -(like the Device Memory and Security Controller on K3 AM654 SoC). System
> -controller will keep track of the used and unused registers within the Router.
> -Driver should request the system controller to get the range of GIC IRQs
> -assigned to the requesting hosts. It is the drivers responsibility to keep
> -track of Host IRQs.
> -
> -Communication between the host processor running an OS and the system
> -controller happens through a protocol called TI System Control Interface
> -(TISCI protocol). For more details refer:
> -Documentation/devicetree/bindings/arm/keystone/ti,sci.txt
> -
> -TISCI Interrupt Router Node:
> -----------------------------
> -Required Properties:
> -- compatible:		Must be "ti,sci-intr".
> -- ti,intr-trigger-type:	Should be one of the following:
> -			1: If intr supports edge triggered interrupts.
> -			4: If intr supports level triggered interrupts.
> -- interrupt-controller:	Identifies the node as an interrupt controller
> -- #interrupt-cells:	Specifies the number of cells needed to encode an
> -			interrupt source. The value should be 1.
> -			First cell should contain interrupt router input number
> -			as specified by hardware.
> -- ti,sci:		Phandle to TI-SCI compatible System controller node.
> -- ti,sci-dev-id:	TISCI device id of interrupt controller.
> -- ti,interrupt-ranges:	Set of triplets containing ranges that convert
> -			the INTR output interrupt numbers to parent's
> -			interrupt number. Each triplet has following entries:
> -			- First entry specifies the base for intr output irq
> -			- Second entry specifies the base for parent irqs
> -			- Third entry specifies the limit
> -
> -For more details on TISCI IRQ resource management refer:
> -http://downloads.ti.com/tisci/esd/latest/2_tisci_msgs/rm/rm_irq.html
> -
> -Example:
> ---------
> -The following example demonstrates both interrupt router node and the consumer
> -node(main gpio) on the AM654 SoC:
> -
> -main_gpio_intr: interrupt-controller0 {
> -	compatible = "ti,sci-intr";
> -	ti,intr-trigger-type = <1>;
> -	interrupt-controller;
> -	interrupt-parent = <&gic500>;
> -	#interrupt-cells = <1>;
> -	ti,sci = <&dmsc>;
> -	ti,sci-dev-id = <131>;
> -	ti,interrupt-ranges = <0 360 32>;
> -};
> -
> -main_gpio0: gpio@600000 {
> -	...
> -	interrupt-parent = <&main_gpio_intr>;
> -	interrupts = <192>, <193>, <194>, <195>, <196>, <197>;
> -	...
> -};
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml b/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml
> new file mode 100644
> index 000000000000..f7a3e51a5212
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml
> @@ -0,0 +1,102 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/ti,sci-intr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments K3 Interrupt Router
> +
> +maintainers:
> +  - Lokesh Vutla <lokeshvutla@ti.com>
> +
> +allOf:
> +  - $ref: /schemas/arm/keystone/ti,k3-sci-common.yaml#
> +
> +description: |
> +  The Interrupt Router (INTR) module provides a mechanism to mux M
> +  interrupt inputs to N interrupt outputs, where all M inputs are selectable
> +  to be driven per N output. An Interrupt Router can either handle edge
> +  triggered or level triggered interrupts and that is fixed in hardware.
> +
> +                                   Interrupt Router
> +                               +----------------------+
> +                               |  Inputs     Outputs  |
> +          +-------+            | +------+    +-----+  |
> +          | GPIO  |----------->| | irq0 |    |  0  |  |       Host IRQ
> +          +-------+            | +------+    +-----+  |      controller
> +                               |    .           .     |      +-------+
> +          +-------+            |    .           .     |----->|  IRQ  |
> +          | INTA  |----------->|    .           .     |      +-------+
> +          +-------+            |    .        +-----+  |
> +                               | +------+    |  N  |  |
> +                               | | irqM |    +-----+  |
> +                               | +------+             |
> +                               |                      |
> +                               +----------------------+
> +
> +  There is one register per output (MUXCNTL_N) that controls the selection.
> +  Configuration of these MUXCNTL_N registers is done by a system controller
> +  (like the Device Memory and Security Controller on K3 AM654 SoC). System
> +  controller will keep track of the used and unused registers within the Router.
> +  Driver should request the system controller to get the range of GIC IRQs
> +  assigned to the requesting hosts. It is the drivers responsibility to keep
> +  track of Host IRQs.
> +
> +  Communication between the host processor running an OS and the system
> +  controller happens through a protocol called TI System Control Interface
> +  (TISCI protocol).
> +
> +properties:
> +  compatible:
> +    const: ti,sci-intr
> +
> +  ti,intr-trigger-type:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 4]
> +    description: |
> +      Should be one of the following.
> +        1 = If intr supports edge triggered interrupts.
> +        4 = If intr supports level triggered interrupts.
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 1
> +    description: |
> +      The 1st cell should contain interrupt router input hw number.
> +
> +  ti,interrupt-ranges:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    description: |
> +      Interrupt ranges that converts the INTR output hw irq numbers
> +      to parents's input interrupt numbers.
> +      - items:
> +          items:
> +            - description: |
> +                "output_irq" specifies the base for intr output irq
> +            - description: |
> +                "parent's input irq" specifies the base for parent irq
> +            - description: |
> +                "limit" specifies the limit for translation

While this kind of looks like a schema, it's all just a description.

The first 'items' needs to be at the same indentation as 'description'.

> +
> +required:
> +  - compatible
> +  - ti,intr-trigger-type
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - ti,sci
> +  - ti,sci-dev-id
> +  - ti,interrupt-ranges
> +
> +examples:
> +  - |
> +    main_gpio_intr: interrupt-controller0 {
> +        compatible = "ti,sci-intr";
> +        ti,intr-trigger-type = <1>;
> +        interrupt-controller;
> +        interrupt-parent = <&gic500>;
> +        #interrupt-cells = <1>;
> +        ti,sci = <&dmsc>;
> +        ti,sci-dev-id = <131>;
> +        ti,interrupt-ranges = <0 360 32>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c76fd456aaba..bc88886c05c6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16919,7 +16919,7 @@ F:	Documentation/devicetree/bindings/arm/keystone/ti,k3-sci-common.yaml
>  F:	Documentation/devicetree/bindings/arm/keystone/ti,sci.txt
>  F:	Documentation/devicetree/bindings/clock/ti,sci-clk.txt
>  F:	Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.txt
> -F:	Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.txt
> +F:	Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml
>  F:	Documentation/devicetree/bindings/reset/ti,sci-reset.txt
>  F:	Documentation/devicetree/bindings/soc/ti/sci-pm-domain.txt
>  F:	drivers/clk/keystone/sci-clk.c
> -- 
> 2.27.0
> 
