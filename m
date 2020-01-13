Return-Path: <SRS0=lLbR=3C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30B29C33CA9
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 21:05:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0050124672
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 21:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578949518;
	bh=HGYYgpOTg+9FgZ6pYyCmgYJxIzU8UhftsPUKpqFAfw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=FJoG8wgILpSO7GgWhbeyEXKJatkFVa++veNU3Neu+GGyOaw2n/40fVZorgsp5e2C/
	 sKAw5VauDgQpyQ0Bwgyjg6y93cQChfE1e9eGrSb/NaKdOkJ7JWN/C+p9s14jZOq/UG
	 FlcJ/m3/DzRKGelQgmpU6XwEZAkbXPq4smKcufus=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728765AbgAMVFR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jan 2020 16:05:17 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:38010 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726086AbgAMVFR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jan 2020 16:05:17 -0500
Received: by mail-oi1-f195.google.com with SMTP id l9so9690182oii.5
        for <devicetree@vger.kernel.org>; Mon, 13 Jan 2020 13:05:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zoMuCqrtbq7pL6Vxs6+VLfL47ToDJhTtq6v+uJlisK8=;
        b=EDVVfW2lA+ZAGY0f16MFw4Ee4srnvh4oGwlQPypMiQGCmlU7ttMvsXafcmK0URXf4A
         /70SNSNLkUq1I7eM0X+po0l6hPnwBF/bVJqOmR5L3qpRQ0QyWOKJTq+YVNVwsTmeOEJX
         5+usYFeXMYNosWzqn1IA+8uNYR8PmyA1WtOXO+5i388cp79fnHl593ljlangxLCETt+X
         c1VzTVIyk3Bwh5pk8uZPQZNpxAl1RWrfC1mAUrbpEwQH/TY4eH55uHW4eKUB89P7X2f1
         XTaLf118XbSzW0IcWyci2WLoObjoGl78Vbu4AERIzMhg5aRY1J8VgoAbIqoXUun6C5Vg
         MwJg==
X-Gm-Message-State: APjAAAUkWR0btHIfaO8XaTjJdy9QO4oKz0BY84BWcUhJdroG7+9D6umk
        XNc51p4KMU1XDDLWuPl3qkfub6E=
X-Google-Smtp-Source: APXvYqzvC2BTVuXV7qCt5s/PKmOEtPIhA3rlvNK2ALrjSnfGK9LkRLC7gt11uVbocOg/qCHVQ3yMxg==
X-Received: by 2002:a05:6808:10d:: with SMTP id b13mr14565640oie.69.1578949516176;
        Mon, 13 Jan 2020 13:05:16 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h1sm4529508otm.34.2020.01.13.13.05.15
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 13:05:16 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220b00
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 15:03:44 -0600
Date:   Mon, 13 Jan 2020 15:03:44 -0600
From:   Rob Herring <robh@kernel.org>
To:     Joakim Zhang <qiangqing.zhang@nxp.com>
Cc:     maz@kernel.org, jason@lakedaemon.net, tglx@linutronix.de,
        mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        fugang.duan@nxp.com
Subject: Re: [PATCH V4 RESEND 1/2] dt-bindings/irq: add binding for NXP
 INTMUX interrupt multiplexer
Message-ID: <20200113210344.GA4615@bogus>
References: <1578899321-1365-1-git-send-email-qiangqing.zhang@nxp.com>
 <1578899321-1365-2-git-send-email-qiangqing.zhang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578899321-1365-2-git-send-email-qiangqing.zhang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Jan 13, 2020 at 03:08:40PM +0800, Joakim Zhang wrote:
> This patch adds the DT bindings for the NXP INTMUX interrupt multiplexer
> for i.MX8 family SoCs.
> 
> Signed-off-by: Joakim Zhang <qiangqing.zhang@nxp.com>
> ---
>  .../interrupt-controller/fsl,intmux.yaml      | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,intmux.yaml

Please run 'make dt_binding_check' and fix the errors:

Documentation/devicetree/bindings/interrupt-controller/fsl,intmux.yaml:  
while scanning for the next token found character that cannot start any token 
  in "<unicode string>", line 60, column 1

> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,intmux.yaml b/Documentation/devicetree/bindings/interrupt-controller/fsl,intmux.yaml
> new file mode 100644
> index 000000000000..4dba532fe0bd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,intmux.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/fsl,intmux.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale INTMUX interrupt multiplexer
> +
> +maintainers:
> +  - Marc Zyngier <maz@kernel.org>
> +
> +properties:
> +  compatible:
> +    items:
> +      const: fsl,imx-intmux
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 8
> +    description: |
> +      Should contain the parent interrupt lines (up to 8) used to multiplex
> +      the input interrupts.
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  clocks:
> +    maxItems: 1
> +    description: ipg clock.
> +
> +  clock-names:
> +    items:
> +      const: ipg
> +
> +  fsl,intmux_chans:

Don't use '_' in property names.

Is this any different from the length of 'interrupts' which you can 
count?

> +    maxItems: 1
> +    description: |
> +      The number of channels used for interrupt source. The Maximum value is 8.
> +      If this property is not set in DT then driver uses 1 channel by default.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - clocks
> +  - clock-name
> +  - fsl,intmux_chans
> +
> +additionalProperties: false
> +
> +Example:
> +
> +	intmux@37400000 {

interrupt-controller@...

> +		compatible = "fsl,imx-intmux";
> +		reg = <0x37400000 0x1000>;
> +		interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		clocks = <&clk IMX8QM_CM40_IPG_CLK>;
> +		clock-names = "ipg";
> +		fsl,intmux_chans = <8>;
> +	};
> +
> -- 
> 2.17.1
> 
