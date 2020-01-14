Return-Path: <SRS0=kXJJ=3D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48BA0C33C9E
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jan 2020 23:43:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0F0A62075B
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jan 2020 23:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579045407;
	bh=XfYabh4i0NaLNPGUF39VCwePgxfqKXBlNVF6rWy8kLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=epUYtoHZieMu/Eeg0kd2EY50RkkCgAvziBaKBKfjQkY04pe56uxbcljZNRQsHsCJf
	 EEXaa5sMt3q1AfJmBvmj4uOT47G+nq+b+lMF9uegEnYNeb+JDax1JYZQNuK4rA7PP9
	 SRJAWaXyMv4cA3k9+tdXiGDCcHf/DQk7r5L6T07Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729021AbgANXn0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Jan 2020 18:43:26 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:45899 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728978AbgANXn0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Jan 2020 18:43:26 -0500
Received: by mail-oi1-f196.google.com with SMTP id n16so13635221oie.12
        for <devicetree@vger.kernel.org>; Tue, 14 Jan 2020 15:43:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MKlK2szQ42loiytEFafzt++ib8OsDGlgenNJAhJSpmM=;
        b=Puq8zuY9/mJz9PqMyR+iqt+0kQowOUUROMBS/PNUKdDFmZ99kMtVTqzyV0atwWva2p
         5DUw1sa6xpp29Gc6CXF3RTqdbhZLDIfCxmF/6s9I2AJ5na+v0dK8kO7ivEIwPEmWBm6Q
         51jmQ/QJCkmEY6/wgznIlm6tVfLjk1kzlkNiON43snuWUfHmTGidqx3eJD6OktAgQmfy
         Z0QPnQxr2Pq0aWy2QT9ibQkx+bIKidZyWIekCTeIBKULK+AYGHGwQg0MtNKO1lhDJyzd
         WFaocW6/E77U2RVupb20W3abaQU045jelqlHxdmY6bYkOWj2AUA5HLPWSXu8YH3MITiA
         P8LA==
X-Gm-Message-State: APjAAAU+vTJftc3HqO+jODabWPOM1BShSzST32Dw9r7VeFdpT61o5PkG
        l8UpAA0sDkt1EvRvYe0aer9co04=
X-Google-Smtp-Source: APXvYqxpzK1U4+7z+vWoqdSxnz3IcCf7ShKowxrgUQiRpSkJDgVsB3a1/E4mtSlrRQPDml31CIQFhQ==
X-Received: by 2002:a54:488d:: with SMTP id r13mr18121359oic.115.1579045405215;
        Tue, 14 Jan 2020 15:43:25 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k17sm5153153oic.45.2020.01.14.15.43.24
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 15:43:24 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220a2e
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Tue, 14 Jan 2020 17:43:23 -0600
Date:   Tue, 14 Jan 2020 17:43:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Shawn Lin <shawn.lin@rock-chips.com>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Jingoo Han <jingoohan1@gmail.com>, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, William Wu <william.wu@rock-chips.com>,
        Simon Xue <xxm@rock-chips.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/6] dt-bindings: add binding for Rockchip combo phy
 using an Innosilicon IP
Message-ID: <20200114234323.GA5823@bogus>
References: <1578986580-71974-1-git-send-email-shawn.lin@rock-chips.com>
 <1578986580-71974-2-git-send-email-shawn.lin@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578986580-71974-2-git-send-email-shawn.lin@rock-chips.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jan 14, 2020 at 03:22:55PM +0800, Shawn Lin wrote:
> This IP could supports USB3.0 and PCIe.
> 
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> 
> ---
> 
>  .../bindings/phy/rockchip,inno-combophy.yaml       | 84 ++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/rockchip,inno-combophy.yaml

Fails 'make dt_binding_check':

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/rockchip,inno-combophy.yaml: 
ignoring, error in schema: properties: rockchip,combphygrf
Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: 
Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/rockchip,inno-combophy.yaml: 
properties:rockchip,combphygrf: {'items': [{'description': 'The grf for 
COMBPHY configuration and state registers.'}]} is not valid under any of 
the given schemas (Possible causes of the failure):
	
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/rockchip,inno-combophy.yaml: 
properties:rockchip,combphygrf: 'description' is a required property


> 
> diff --git a/Documentation/devicetree/bindings/phy/rockchip,inno-combophy.yaml b/Documentation/devicetree/bindings/phy/rockchip,inno-combophy.yaml
> new file mode 100644
> index 0000000..d647ab3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/rockchip,inno-combophy.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/rockchip,inno-combophy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip USB3.0/PCI-e combo phy
> +
> +maintainers:
> +        - Shawn Lin <shawn.lin@rock-chips.com>
> +        - William Wu <william.wu@rock-chips.com>

2 space indent.

> +
> +properties:
> +  "#phy-cells":
> +    const: 1
> +
> +  compatible:
> +    enum:
> +      - rockchip,rk1808-combphy
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: PLL reference clock
> +
> +  clock-names:
> +    items:
> +      - const: refclk
> +
> +  resets:
> +    items:
> +      - description: OTG unit reset line
> +      - description: POR unit reset line
> +      - description: APB interface reset line
> +      - description: PIPE unit reset line
> +
> +  reset-names:
> +    items:
> +      - const: otg-rst
> +      - const: combphy-por
> +      - const: combphy-apb
> +      - const: combphy-pipe
> +
> +  rockchip,combphygrf:
> +    items:
> +      - description: The grf for COMBPHY configuration and state registers.
> +
> +required:
> +  - "#phy-cells"
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - rockchip,combphygrf
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    combphy_grf: syscon@fe018000 {
> +        compatible = "rockchip,usb3phy-grf", "syscon";
> +        reg = <0x0 0xfe018000 0x0 0x8000>;
> +    };
> +
> +    combphy: phy@ff380000 {
> +        compatible = "rockchip,rk1808-combphy";
> +        reg = <0x0 0xff380000 0x0 0x10000>;
> +        #phy-cells = <1>;
> +        clocks = <&cru SCLK_PCIEPHY_REF>;
> +        clock-names = "refclk";
> +        assigned-clocks = <&cru SCLK_PCIEPHY_REF>;
> +        assigned-clock-rates = <25000000>;
> +        resets = <&cru SRST_USB3_OTG_A>, <&cru SRST_PCIEPHY_POR>,
> +                 <&cru SRST_PCIEPHY_P>, <&cru SRST_PCIEPHY_PIPE>;
> +        reset-names = "otg-rst", "combphy-por",
> +                      "combphy-apb", "combphy-pipe";
> +        rockchip,combphygrf = <&combphy_grf>;
> +    };
> +
> +...
> -- 
> 1.9.1
> 
> 
> 
