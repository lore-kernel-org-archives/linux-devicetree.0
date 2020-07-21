Return-Path: <SRS0=jMr8=BA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41E13C433EA
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 15:55:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1749E20720
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 15:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595346957;
	bh=DtIcY0/6elhF6ViLs0u4RDZ0VzruYrz8tMEq1lXx43Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Y+AjpiJwmhd7zpMvAvO02ofdm1xcTBi3PYsIi/AaQOLSvNliR/DRJtMJJ9Lx2HE3E
	 71N3gnXxcvOVsCWltNHhKvV+RpgBPGG7KW4RqVjr5sFb/M6z7KSgo4Yetu2A7HY3g/
	 aGK4fFaPh0JKjR9QeEaIU3hhWuVmXLDKN79BnRDE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728362AbgGUPz4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Jul 2020 11:55:56 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:37975 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726892AbgGUPz4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 21 Jul 2020 11:55:56 -0400
Received: by mail-il1-f194.google.com with SMTP id s21so16808743ilk.5
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2020 08:55:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dvlYko5OfIP8lrI8XOGQfnCLndyt/xqnxyajLZzgv3s=;
        b=Ghx7SVLpq4AgEGOVnkcCe9KjU1xIWtXSanTS2NWSJILFVskG+bCIUd6aBFzeY+zoPs
         SHvMy/SkFWB9QLv/CJiQjii81a80KzGB8MTXGI5y8YYtY15B3NZMlpnwNYLmHfJsaa5I
         aqVn7iFMhW2lKqf52FHN6p+gnj0tE40uj1g/0w7XDLguWo50vH4PrkdRBx8ORpG0lDoE
         h85VAmbcDFEZw7MpyiN+xklDiO3keLKOr7ZLa3DBAtsNXmv/FEImBjpwW92dwUxE2Da2
         QBwvWfewWBHY/OGeghdA79X4LpuM5l9ZgEB2VpWXTOs2qIEKtyUKMBmaDxIYDEDrvWNX
         hN9A==
X-Gm-Message-State: AOAM533ghSESHbrf9ujUeAmYCoO4oq/N+dYzM65/0rbB1zT8OEyyJZi1
        b7MXlSt6/ms1VGmGE7HQgQ==
X-Google-Smtp-Source: ABdhPJxgdXoGBuEtLkr77THt9WevERX8Ux/6Vn1A2GflALoOmLd+imCojCPGR8p+QhfrC+vpz7b1Pg==
X-Received: by 2002:a92:8492:: with SMTP id y18mr26530282ilk.27.1595346954188;
        Tue, 21 Jul 2020 08:55:54 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id i12sm11219930ioi.48.2020.07.21.08.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 08:55:52 -0700 (PDT)
Received: (nullmailer pid 365901 invoked by uid 1000);
        Tue, 21 Jul 2020 15:55:50 -0000
Date:   Tue, 21 Jul 2020 09:55:50 -0600
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
        Device Tree Mailing List <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 5/9] dt-bindings: irqchip: Convert ti,sci-intr
 bindings to yaml
Message-ID: <20200721155550.GA358222@bogus>
References: <20200721061007.28324-1-lokeshvutla@ti.com>
 <20200721061007.28324-6-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200721061007.28324-6-lokeshvutla@ti.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jul 21, 2020 at 11:40:03AM +0530, Lokesh Vutla wrote:
> In order to automate the verification of DT nodes convert
> ti,sci-intr.txt ti,sci-intr.yaml.
> 
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
>  .../interrupt-controller/ti,sci-intr.txt      |  83 -------------
>  .../interrupt-controller/ti,sci-intr.yaml     | 113 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 114 insertions(+), 84 deletions(-)
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
> index 000000000000..fbc1e8631d6f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml
> @@ -0,0 +1,113 @@
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
> +  - $ref: /schemas/interrupt-controller.yaml#

Don't need this. It is selected by the node name.

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
> +    description: |
> +      Should be one of the following.
> +        1 = If intr supports edge triggered interrupts.
> +        4 = If intr supports level triggered interrupts.

Looks like constraints.

> +    allOf:

You can drop 'allOf' now.

> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 1
> +    description: |
> +      The 1st cell should contain interrupt router input hw number.
> +

> +  ti,sci:
> +    description: phandle to TI-SCI compatible System controller node
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  ti,sci-dev-id:
> +    description: TI-SCI device id of Interrupt Controller
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32

Use the common definition Suman did.

> +
> +  ti,interrupt-ranges:
> +    description: |
> +      Interrupt ranges that converts the INTR output hw irq numbers
> +      to parents's input interrupt numbers.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +      - items:
> +          items:
> +            - description: |
> +                "output_irq" specifies the base for intr output irq
> +            - description: |
> +                "parent's input irq" specifies the base for parent irq
> +            - description: |
> +                "limit" specifies the limit for translation
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
> index d53db30d1365..2f18fbccd71a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16905,7 +16905,7 @@ S:	Maintained
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
