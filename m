Return-Path: <SRS0=49W1=4N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 522F7C35E0D
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 18:40:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 12E462084E
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 18:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582656038;
	bh=JgqL35VjzbrLuW9Hvuk+O9NLwsyOifSYIdFTq/TcAMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=nSkRG+n2SMqiLAXNhgp9FQnFlJoTA4hNAKe6YhuPVKTXvMyjgCPNShY7Y2mu9qddd
	 bil9EqrHFIKDvfPFLgJaSC4hXlnaWT7bBMM2fAWcMXzNzluvQQ7oY5+Ll0S8GcoCIT
	 8fPZHnJefbqS2tmYRcB6lICWkqEC3aTAtCDZwQGo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731557AbgBYSkh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Feb 2020 13:40:37 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:36144 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731647AbgBYSkg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Feb 2020 13:40:36 -0500
Received: by mail-ot1-f68.google.com with SMTP id j20so497775otq.3
        for <devicetree@vger.kernel.org>; Tue, 25 Feb 2020 10:40:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qX76joXUhhCnDPj/+w38hulCZqtIvMyNHGJ1KsKtiQk=;
        b=nh40glx7tKKRwiwKirJTBhAHtTZxrZMi6gx62YixQ9qFb5QUHvU0sScGTh60DrM4JW
         31LEMFKmKHTXm1L+eSol2hmKoT1mC6ohM8lwATnq5QIQ4vBVd5Anxf+F4alPRhM8abT6
         KT6X6AS86PugCFr0+WCGMn1uPF8qgMueX8/P/jepuyEP146zVLLg/qYo5iDi9lv9ZNRC
         p2QkCP/sVQkVPAqs3xIlm3WqKPEBnSKpmZEmXytSVwYre2m3gNU9Thbg6Qrx5UuDcmct
         D+p4XhqXXtN9QwEPupPMIoydMt1mhBx80fE+/vP15QOipRrkclzmSU5wvjHZZ1OdC/rY
         WHrw==
X-Gm-Message-State: APjAAAWzZkRdQwdMmxR8B8E1QFPcE+2CQ7NHQbz2pZ1GzmloecQnE8Qx
        0sf4gNfiTBeqidohaA3N1w==
X-Google-Smtp-Source: APXvYqx8JsHSQgQggz0EsFIuYeqKtL7X5s/zmlXw9o5wYTvjE/NKUyJ/qLmhyGxEdyos6/dNgXu/fQ==
X-Received: by 2002:a05:6830:4cd:: with SMTP id s13mr44889803otd.181.1582656035214;
        Tue, 25 Feb 2020 10:40:35 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e22sm796588ote.32.2020.02.25.10.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 10:40:34 -0800 (PST)
Received: (nullmailer pid 5200 invoked by uid 1000);
        Tue, 25 Feb 2020 18:40:33 -0000
Date:   Tue, 25 Feb 2020 12:40:33 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
        Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 4/5 v2] dt-bindings: arm: Add Versatile Express and Juno
 YAML schema
Message-ID: <20200225184033.GA24827@bogus>
References: <20200225084627.24825-1-linus.walleij@linaro.org>
 <20200225084627.24825-4-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200225084627.24825-4-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Feb 25, 2020 at 09:46:26AM +0100, Linus Walleij wrote:
> This implements the top-level schema for the ARM Versatile
> Express and Juno platforms.
> 
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Acked-by: Sudeep Holla <sudeep.holla@arm.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Add missing platforms: VE RTSM, FVP, foundation model
> - Properly define the arm,vexpress,site arm,vexpress,position
>   and arm,vexpress,dcc attributes. Maybe these are not the most
>   elegant bindings but they are used so we need to contain it
>   properly.
> - Add a patternProperty for the SMB (Static Memory Bus) which
>   was only described in text in the Vexpress bindings. It is a
>   "simple-bus" so just reference the existing bindings.
> - Define the layout of the "motherboard" node sometimes but
>   not always found below the SMB node, using two address-cells
>   with one for chipselect.
> - Make the arm,hbi property required on the ARMv7 variants.
> ---
>  .../bindings/arm/arm,vexpress-juno.yaml       | 212 ++++++++++++++++++
>  1 file changed, 212 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml b/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
> new file mode 100644
> index 000000000000..0aa21e86a873
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
> @@ -0,0 +1,212 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/arm,vexpress-juno.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM Versatile Express and Juno Boards Device Tree Bindings
> +
> +maintainers:
> +  - Sudeep Holla <sudeep.holla@arm.com>
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +description: |+
> +  ARM's Versatile Express platform were built as reference designs for exploring
> +  multicore Cortex-A class systems. The Versatile Express family contains both
> +  32 bit (Aarch32) and 64 bit (Aarch64) systems.
> +
> +  The board consist of a motherboard and one or more daughterboards (tiles). The
> +  motherboard provides a set of peripherals. Processor and RAM "live" on the
> +  tiles.
> +
> +  The motherboard and each core tile should be described by a separate Device
> +  Tree source file, with the tile's description including the motherboard file
> +  using an include directive. As the motherboard can be initialized in one of
> +  two different configurations ("memory maps"), care must be taken to include
> +  the correct one.
> +
> +  When a new generation of boards were introduced under the name "Juno", these
> +  shared to many common characteristics with the Versatile Express that the
> +  "arm,vexpress" compatible was retained in the root node, and these are
> +  included in this binding schema as well.
> +
> +  The root node indicates the CPU SoC on the core tile, and this
> +  is a daughterboard to the main motherboard. The name used in the compatible
> +  string shall match the name given in the core tile's technical reference
> +  manual, followed by "arm,vexpress" as an additional compatible value. If
> +  further subvariants are released of the core tile, even more fine-granular
> +  compatible strings with up to three compatible strings are used.
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - description: CoreTile Express A9x4 (V2P-CA9) has 4 Cortex A9 CPU cores
> +          in MPCore configuration in a test chip on the core tile. See ARM
> +          DUI 0448I. This was the first Versatile Express platform.
> +        items:
> +          - const: arm,vexpress,v2p-ca9
> +          - const: arm,vexpress
> +      - description: CoreTile Express A5x2 (V2P-CA5s) has 2 Cortex A5 CPU cores
> +          in a test chip on the core tile. It is intended to evaluate NEON, FPU
> +          and Jazelle support in the Cortex A5 family. See ARM DUI 0541C.
> +        items:
> +          - const: arm,vexpress,v2p-ca5s
> +          - const: arm,vexpress
> +      - description: Coretile Express A15x2 (V2P-CA15) has 2 Cortex A15 CPU
> +          cores in a MPCore configuration in a test chip on the core tile. See
> +          ARM DUI 0604F.
> +        items:
> +          - const: arm,vexpress,v2p-ca15
> +          - const: arm,vexpress
> +      - description: CoreTile Express A15x4 (V2P-CA15, HBI-0237A) has 4 Cortex
> +          A15 CPU cores in a test chip on the core tile. This is the first test
> +          chip called "TC1".
> +        items:
> +          - const: arm,vexpress,v2p-ca15,tc1
> +          - const: arm,vexpress,v2p-ca15
> +          - const: arm,vexpress
> +      - description: Coretile Express A15x2 A7x3 (V2P-CA15_A7) has 2 Cortex A15
> +          CPU cores and 3 Cortex A7 cores in a big.LITTLE MPCore configuration
> +          in a test chip on the core tile. See ARM DDI 0503I.
> +        items:
> +          - const: arm,vexpress,v2p-ca15_a7
> +          - const: arm,vexpress
> +      - description: LogicTile Express 20MG (V2F-1XV7) has 2 Cortex A53 CPU
> +          cores in a test chip on the core tile. See ARM DDI 0498D.
> +        items:
> +          - const: arm,vexpress,v2f-1xv7,ca53x2
> +          - const: arm,vexpress,v2f-1xv7
> +          - const: arm,vexpress
> +      - description: Arm Versatile Express Juno "r0" (the first Juno board,
> +          V2M-Juno) was introduced as a vehicle for evaluating big.LITTLE on
> +          AArch64 CPU cores. It has 2 Cortex A57 CPU cores and 4 Cortex A53
> +          cores in a big.LITTLE configuration. It also features the MALI T624
> +          GPU. See ARM document 100113_0000_07_en.
> +        items:
> +          - const: arm,juno
> +          - const: arm,vexpress
> +      - description: Arm Versatile Express Juno r1 Development Platform
> +          (V2M-Juno r1) was introduced mainly aimed at development of PCIe
> +          based systems. Juno r1 also has support for AXI masters placed on
> +          the TLX connectors to join the coherency domain. Otherwise it is the
> +          same configuration as Juno r0. See ARM document 100122_0100_06_en.
> +        items:
> +          - const: arm,juno-r1
> +          - const: arm,juno
> +          - const: arm,vexpress
> +      - description: Arm Versatile Express Juno r2 Development Platform
> +          (V2M-Juno r2). It has the same feature set as Juno r0 and r1. See
> +          ARM document 100114_0200_04_en.
> +        items:
> +          - const: arm,juno-r2
> +          - const: arm,juno
> +          - const: arm,vexpress
> +      - description: Arm AEMv8a Versatile Express Real-Time System Model
> +          (VE RTSM) is a programmers view of the Versatile Express with Arm
> +          v8A hardware. See ARM DUI 0575D.
> +        items:
> +          - const: arm,rtsm_ve,aemv8a
> +          - const: arm,vexpress
> +      - description: Arm FVP (Fixed Virtual Platform) base model revision C
> +          See ARM Document 100964_1190_00_en.
> +        items:
> +          - const: arm,fvp-base-revc
> +          - const: arm,vexpress
> +      - description: Arm Foundation model for Aarch64
> +        items:
> +          - const: arm,foundation-aarch64
> +          - const: arm,vexpress
> +
> +  arm,hbi:
> +    $ref: '/schemas/types.yaml#/definitions/uint32'
> +    description: This indicates the ARM HBI (Hardware Board ID), this is
> +      ARM's unique board model ID, visible on the PCB's silkscreen.
> +
> +  arm,vexpress,site:
> +    description: As Versatile Express can be configured in number of physically
> +      different setups, the device tree should describe platform topology.
> +      For this reason the root node and main motherboard node must define this
> +      property, describing the physical location of the children nodes.
> +      0 means motherboard site, while 1 and 2 are daughterboard sites, and
> +      0xf means "sisterboard" which is the site containing the main CPU tile.
> +    allOf:
> +      - $ref: '/schemas/types.yaml#/definitions/uint32'
> +      - minimum: 0
> +      - maximum: 15

Drop the last '-'. It should be a list of 2 entries with min/max being a 
single schema.

> +
> +  arm,vexpress,position:
> +    description: When daughterboards are stacked on one site, their position
> +      in the stack be be described this attribute.
> +    allOf:
> +      - $ref: '/schemas/types.yaml#/definitions/uint32'
> +      - minimum: 0
> +      - maximum: 3

ditto

> +
> +  arm,vexpress,dcc:
> +    description: When describing tiles consisting of more than one DCC, its
> +      number can be specified with this attribute.
> +    allOf:
> +      - $ref: '/schemas/types.yaml#/definitions/uint32'
> +      - minimum: 0
> +      - maximum: 3

ditto

> +
> +patternProperties:
> +  "^smb@[0-9a-f]+$":

bus@...

Use generic node names. 'ahb' or 'axi' is also allowed if that matches 
the bus type.

> +    description: Static Memory Bus (SMB) node, if this exists it describes
> +      the connection between the motherboard and any tiles.
> +    type: object
> +
> +    properties:
> +      compatible:
> +        $ref: '/schemas/simple-bus.yaml'

This is at the wrong level and defines 'compatible' as a node with 
property 'compatible' having a value of 'simple-bus'. This should be 
under 'smb@...' with an 'allOf'.

> +      motherboard:
> +        type: object
> +        description: The motherboard description provides a single "motherboard"
> +          node using 2 address cells corresponding to the Static Memory Bus
> +          used between the motherboard and the tile. The first cell defines the
> +          Chip Select (CS) line number, the second cell address offset within
> +          the CS. All interrupt lines between the motherboard and the tile
> +          are active high and are described using single cell.
> +        properties:
> +          "#address-cells":
> +            const: 2
> +          "#size-cells":
> +            const: 1
> +          compatible:
> +            oneOf:
> +              - items:
> +                - const: arm,vexpress,v2m-p1
> +                - const: simple-bus
> +              - items:
> +                - const: arm,vexpress,v2p-p1
> +                - const: simple-bus

enum:
  - arm,vexpress,v2m-p1
  - arm,vexpress,v2p-p1
const: simple-bus

> +          arm,v2m-memory-map:
> +            description: This describes the memory map type.
> +            allOf:
> +              - $ref: '/schemas/types.yaml#/definitions/string'
> +              - enum:
> +                - rs1
> +                - rs2

Should be indented 2 more spaces.

> +        required:
> +          - compatible
> +    required:
> +      - compatible
> +
> +allOf:
> +  - if:
> +     properties:

Indent 1 more space (and then everything below too).

> +       compatible:
> +         contains:
> +           enum:
> +             - arm,vexpress,v2p-ca9
> +             - arm,vexpress,v2p-ca5s
> +             - arm,vexpress,v2p-ca15
> +             - arm,vexpress,v2p-ca15_a7
> +             - arm,vexpress,v2f-1xv7,ca53x2
> +    then:
> +      required:
> +        - arm,hbi
> +
> +...
> -- 
> 2.24.1
> 
