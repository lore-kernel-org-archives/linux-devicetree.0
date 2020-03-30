Return-Path: <SRS0=ov7W=5P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08BDFC43331
	for <linux-devicetree@archiver.kernel.org>; Mon, 30 Mar 2020 20:44:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CBE1520757
	for <linux-devicetree@archiver.kernel.org>; Mon, 30 Mar 2020 20:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1585601098;
	bh=sDsW8uneTQDfS7c+/SfXMBhezIxEy6/VKBXvZvsi85s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=GeatPdvNjVHDjwG3v+ir47UlwEJ6K9PLnns6r3j3n00n0n0kC8VtvUExXl8fKIbAY
	 pOTHjjZbsatKRistVB2UAiq8U7FwS//EiEcJjWi+wKosqJufc5H1/GmbVAQjDyhzr2
	 Fh40BnTHxgDqIdSEZ7ma2BlxDcb6m0uyid9EOEAI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728047AbgC3Uo6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 30 Mar 2020 16:44:58 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:35003 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727328AbgC3Uo6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 30 Mar 2020 16:44:58 -0400
Received: by mail-il1-f193.google.com with SMTP id 7so17273829ill.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2020 13:44:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=l36hbTviCJO4CHJIHk/epKBvj80epxT6yi/PCZehM4s=;
        b=Hwyg6EPkEFwXK/tHm5Bo7+sy1IVwq3KejjQSLzAhfuoisI1dDXmfcZCvF30qjqyCwM
         b/FHh7aOttGWprXIcBLD7q9w810kQArELbFkRALDoOeBY7MDU8aibbjXL56DVmz+X2zy
         G1BSE/kplRzw5l/iJsg/80yWGAJsyHUHLbttv6SEjVkTzNrhC8pWc5UYHn0FewxeqwVK
         RMwUBaACF/kA7CEzQ8jN0ypO/5kiUk6bDARaiHSkO3VxKrQZ4vxQnMX3CNy76KBsc3S5
         F5/pZzczN1A66z76KXOMF2zSucT83caKj2RJM0FUJGxvtUzjD8tOr8a3/VvbsEzpnkc/
         71Ng==
X-Gm-Message-State: ANhLgQ0CLTJNz7kUz+GOrGs8/7R8yv32q/4Ak7nXd/Iz5ObS3iMn4QpU
        Cuk6bdH8m+iYox07/Qd53tidsQc=
X-Google-Smtp-Source: ADFU+vueG9ZV7JYC4OiU5Ma/yDq1M0PnMDLnhzlbbEeN0NkJgyLXBc8je8EhJazkpvPGj5y0aOvazg==
X-Received: by 2002:a92:1b59:: with SMTP id b86mr13224264ilb.291.1585601097079;
        Mon, 30 Mar 2020 13:44:57 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id d15sm4352040ioe.49.2020.03.30.13.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 13:44:56 -0700 (PDT)
Received: (nullmailer pid 11433 invoked by uid 1000);
        Mon, 30 Mar 2020 20:44:55 -0000
Date:   Mon, 30 Mar 2020 14:44:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Michal Simek <michal.simek@xilinx.com>,
        Dhaval Shah <dshah@xilinx.com>, kernel@pengutronix.de
Subject: Re: [PATCH 4/6] dt-bindings: soc: xlnx: extract xlnx,vcu-settings to
 separate binding
Message-ID: <20200330204455.GA6329@bogus>
References: <20200317094115.15896-1-m.tretter@pengutronix.de>
 <20200317094115.15896-5-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200317094115.15896-5-m.tretter@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Mar 17, 2020 at 10:41:13AM +0100, Michael Tretter wrote:
> The xlnx,vcu binding comprises two adjacent register banks:
> 
> The first register bank ("vcu_slcr") contains registers for setting the
> clocks of the vcu and controlling the performance monitors. The second
> bank ("logicoreip") contains the configuration settings of the video codec
> unit, which are set before synthesizing the bitstream.
> 
> Drivers that drive the actual video codec unit need to to read the
> registers from the logicoreip register bank for configuring the vcu
> firmware.
> 
> As logicoreip is a too generic name for this register bank, use
> "vcu-settings" as a binding name, because the register bank basically
> provides the configuration settings of the VCU.
> 
> Therefore, add the vcu-settings binding to provide a syscon interface
> for other drivers to read these registers.
> 
> The alternative would have been to merge the two register banks of the
> xlnx,vcu binding into one register bank and make xlnx,vcu provide a
> syscon interface, but that would lead to more incompatibility than
> making second register bank of xlnx,vcu optional.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  .../soc/xilinx/xlnx,vcu-settings.yaml         | 45 +++++++++++++++++++
>  .../bindings/soc/xilinx/xlnx,vcu.txt          |  9 +---
>  2 files changed, 47 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu-settings.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu-settings.yaml b/Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu-settings.yaml
> new file mode 100644
> index 000000000000..a38ab180854e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu-settings.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/xilinx/xlnx,vcu-settings.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Xilinx VCU Settings
> +
> +maintainers:
> +  - Michael Tretter <kernel@pengutronix.de>
> +
> +# Custom select to avoid matching all nodes with 'syscon'
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - xlnx,vcu-settings
> +  required:
> +    - compatible

You can drop this. The tooling now avoids this issue for 'syscon'.

> +
> +
> +description: |
> +  The Xilinx VCU Settings provides information about the configuration of the
> +  video codec unit.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: xlnx,vcu-settings
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    xlnx_vcu: vcu@a0041000 {
> +          compatible = "xlnx,vcu-settings", "syscon";
> +          reg = <0x0 0xa0041000 0x0 0x1000>;
> +    };
> diff --git a/Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu.txt b/Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu.txt
> index 6786d6715df0..2417b13ba468 100644
> --- a/Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu.txt
> +++ b/Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu.txt
> @@ -12,10 +12,7 @@ Required properties:
>  - compatible: shall be one of:
>  	"xlnx,vcu"
>  	"xlnx,vcu-logicoreip-1.0"
> -- reg, reg-names: There are two sets of registers need to provide.
> -	1. vcu slcr
> -	2. Logicore
> -	reg-names should contain name for the each register sequence.
> +- reg : The base offset and size of the VCU_PL_SLCR register space.
>  - clocks: phandle for aclk and pll_ref clocksource
>  - clock-names: The identification string, "aclk", is always required for
>     the axi clock. "pll_ref" is required for pll.
> @@ -23,9 +20,7 @@ Example:
>  
>  	xlnx_vcu: vcu@a0040000 {
>  		compatible = "xlnx,vcu-logicoreip-1.0";
> -		reg = <0x0 0xa0040000 0x0 0x1000>,
> -			 <0x0 0xa0041000 0x0 0x1000>;
> -		reg-names = "vcu_slcr", "logicore";
> +		reg = <0x0 0xa0040000 0x0 0x1000>;
>  		clocks = <&si570_1>, <&clkc 71>;
>  		clock-names = "pll_ref", "aclk";
>  	};
> -- 
> 2.20.1
> 
