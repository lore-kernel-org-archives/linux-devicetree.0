Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B5BAC282DD
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 14:18:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E3F1320720
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 14:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578493139;
	bh=NpIOj2xv7pDBbKJoDzHTLBryZBvAzAOfx4TGCOim4hE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=JhoPij/3Mvg/5a5cCtNNPHEmHHK+/gA/heMqkDgLj7bNM7ZXp6ggWyhvSll16pAkE
	 RSgDgxAMbjds5NWIQGYfMGTS1cLw5W7tfssnXAuPnmvCsJYJPQ3HqynsrCllFLSQfV
	 2DkQaQD1w8ltJyW1m2648RyglSLL9iyTDlSsgRGo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbgAHOS6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 09:18:58 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:44591 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbgAHOS6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 09:18:58 -0500
Received: by mail-ot1-f66.google.com with SMTP id h9so3668803otj.11
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 06:18:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1m7+yDcgBUVIUJLMTIa72YR6jFMUNBts53vV9PcOf7o=;
        b=dnjs9QYwnXjSQmoO+uwlsCjq7rFLpjnAU9JDi4vj3iBr+JknH86cqdkuMZROuUBe4Q
         i1yzXGt8BykTxyQHb5VCOaaqwrsjy6CGI40uoCY3p4PqhPNPgwPvAeVH43/ZU9n0w+at
         1iQ2q3Vy8HWBLJ3D1T69/EZ8w65J4hY+A7eBQ/30VgvsthgXS3iqEeeoC+/xsHT5c/lz
         CDe2SMwkae7rR5RulSe+O30HIwtaY1KIurj9Z+U9C9GGGkb/q5cLpvTjy7N9l2LREwtC
         vvs/nmXz5qd9Z+2uZtJv2ipH/Q0rI4LTuiMgdjz3Njcy2i+sqIW7u/m8OVoVDujimhsf
         dLxw==
X-Gm-Message-State: APjAAAVzpDt72ff4Mc4KbpKKiZ8gQRPlIY98Om3ltZeqUKJTvGLuIe5a
        kD0yOfhnzmvD88jte3w3UZtUpYQ=
X-Google-Smtp-Source: APXvYqxcjWnZ0roX51dFphZr4hV4yrC04DADpYAh/rH/2pSILUh+ReAOUPDp1zK6aHokQIfgGNKGoQ==
X-Received: by 2002:a05:6830:154c:: with SMTP id l12mr4294609otp.275.1578493137005;
        Wed, 08 Jan 2020 06:18:57 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m11sm1098886oie.20.2020.01.08.06.18.56
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 06:18:56 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22001a
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 08:18:55 -0600
Date:   Wed, 8 Jan 2020 08:18:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dilip Kota <eswara.kota@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kishon@ti.com, andriy.shevchenko@intel.com,
        cheol.yong.kim@intel.com, chuanhua.lei@linux.intel.com,
        qi-ming.wu@intel.com, yixin.zhu@intel.com
Subject: Re: [PATCH 1/2] dt-bindings: phy: Add YAML schemas for Intel Combo
 phy
Message-ID: <20200108141855.GA14868@bogus>
References: <9f3df8c403bba3633391551fc601cbcd2f950959.1576824311.git.eswara.kota@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f3df8c403bba3633391551fc601cbcd2f950959.1576824311.git.eswara.kota@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Dec 20, 2019 at 03:28:27PM +0800, Dilip Kota wrote:
> Combo phy subsystem provides PHY support to number of
> controllers, viz. PCIe, SATA and EMAC.
> Adding YAML schemas for the same.
> 
> Signed-off-by: Dilip Kota <eswara.kota@linux.intel.com>
> ---
>  .../devicetree/bindings/phy/intel,combo-phy.yaml   | 147 +++++++++++++++++++++
>  1 file changed, 147 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/intel,combo-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/intel,combo-phy.yaml b/Documentation/devicetree/bindings/phy/intel,combo-phy.yaml
> new file mode 100644
> index 000000000000..fc9cbad9dd88
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/intel,combo-phy.yaml
> @@ -0,0 +1,147 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/intel,combo-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Intel Combo phy Subsystem
> +
> +maintainers:
> +  - Dilip Kota <eswara.kota@linux.intel.com>
> +
> +description: |
> +  Intel combo phy subsystem supports PHYs for PCIe, EMAC and SATA
> +  controllers. A single combo phy provides two PHY instances.
> +
> +properties:
> +  $nodename:
> +    pattern: "^combophy@[0-9]+$"
> +
> +  compatible:
> +    items:
> +      - const: intel,combo-phy
> +      - const: simple-bus

This will cause the schema to be applied to every 'simple-bus'. You need 
a custom 'select' to prevent that. There's several examples in the tree.

Though I'm not sure you need child nodes here.

> +
> +  cell-index:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Index of Combo phy hardware instance.

Drop this. Not used for FDT.

> +
> +  resets:
> +    maxItems: 2
> +
> +  reset-names:
> +    items:
> +      - const: phy
> +      - const: core
> +
> +  intel,syscfg:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Chip configuration registers handle
> +
> +  intel,hsio:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: HSIO registers handle
> +
> +  intel,bid:
> +    description: Index of HSIO bus
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - minimum: 0
> +      - maximum: 1

If this is related to intel,hsio, just make it an args cell for 
intel,hsio.

> +
> +  intel,cap-pcie-only:
> +    description: |
> +      This flag specifies capability of the combo phy.
> +      If it is set, combo phy has only PCIe capability.
> +      Else it has PCIe, XPCS and SATA PHY capabilities.
> +    type: boolean
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges: true
> +
> +patternProperties:
> +  "^cb[0-9]phy@[0-9]+$":
> +    type: object
> +
> +    properties:
> +      compatible:
> +        const: intel,phydev
> +
> +      "#phy-cells":
> +        const: 0
> +
> +      reg:
> +        description: Offset and size of pcie phy control registers
> +
> +      intel,phy-mode:
> +        description: |
> +          Configure the mode of the PHY.
> +            0 - PCIe
> +            1 - xpcs
> +            2 - sata

PHY mode is normally a cell in the client's phys property. There's 
already common defines for this.

> +        allOf:
> +          - $ref: /schemas/types.yaml#/definitions/uint32
> +          - minimum: 0
> +          - maximum: 2
> +
> +      clocks:
> +        description: |
> +          List of phandle and clock specifier pairs as listed
> +          in clock-names property. Configure the clocks according
> +          to the PHY mode.
> +
> +      resets:
> +        description: |
> +          reset handle according to the PHY mode.
> +          See ../reset/reset.txt for details.
> +
> +    required:
> +      - compatible
> +      - reg
> +      - "#phy-cells"
> +      - clocks
> +      - intel,phy-mode
> +
> +required:
> +  - compatible
> +  - cell-index
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +  - intel,syscfg
> +  - intel,hsio
> +  - intel,bid
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    combophy@0 {
> +        compatible = "intel,combo-phy", "simple-bus";
> +        cell-index = <0>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +        resets = <&rcu0 0x50 6>,
> +        	 <&rcu0 0x50 17>;
> +        reset-names = "phy", "core";
> +        intel,syscfg = <&sysconf>;
> +        intel,hsio = <&hsiol>;
> +        intel,bid = <0>;
> +
> +        cb0phy0:cb0phy@0 {
> +            compatible = "intel,phydev";
> +            #phy-cells = <0>;
> +            reg = <0xd0a40000 0x1000>;
> +            clocks = <&cgu0 1>;
> +            resets = <&rcu0 0x50 23>;
> +            intel,phy-mode = <0>;
> +        };

If you only have 1 child, then you don't need a child node here. Is this 
example complete?

> +    };
> +
> +
> -- 
> 2.11.0
> 
