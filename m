Return-Path: <SRS0=kWYo=3E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A22C33CB2
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 14:35:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 890D8214AF
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 14:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579098926;
	bh=HYCVuym0LRHMtX88d70OcadWflIO4niV05AhWQRqQ+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ME7L3nUIbC7FO+GyaWz1zyrRF9idGDbPDiXDbS5YOntFgQh3SWHewu9L/+PeJ7Qh7
	 25fzMRPU/NS6LdhKPrnfemY1X+NlELAHSuUhHnWQUITydlkbY5FCJxBcHX2f/hSbdP
	 T9/72iLXJPl/6IRpRYoD7KsAVRr2Nt28J5jSXXBk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729134AbgAOOfZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jan 2020 09:35:25 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:33926 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726418AbgAOOfZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jan 2020 09:35:25 -0500
Received: by mail-oi1-f196.google.com with SMTP id l136so15567414oig.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jan 2020 06:35:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vmc4LTv9UhARNZilVqDisUzXdxxex8ZA0E5+WbrzhDk=;
        b=fneq1CUTWhXNS0SZKLIpCIqDK1xRqNF4w2rnNU5b4hN/6jAKsutECyTqmoMvRioQoy
         v7u8ooQ62887ueSMrclsd5PRydET7NmTBrNcQ8AZAEgAq266eYMO77d+ZpVMNCGwUKWw
         ft3Nl0RR2dVBhGPWkXuhLprDR4K3lXT0FJby8jd74veE7B8U4gtzd9Ys2geEEMaJExtl
         PdR65TrOYR4F+Z3Jh8L0lv6wC4QJUBSiu8FrU9Wkhd3aWRHmIJzdoEj+cw0lRRskscAl
         qkU9YfASVDcOhvT6CzUS4YZksnRwkAUB1L5WCIdxT2pUca0uUr5MX+qrLT5RHz1kkiZg
         H3pg==
X-Gm-Message-State: APjAAAV6Kj56u8YYWH+1OX91jWShoyXVVEvhTwQnnRXJTKWjoi0pgFxk
        T3P2cqKIiwQcDNyDpeJdGlVWYTc=
X-Google-Smtp-Source: APXvYqy20CmZWsWjQQdhkAXZgfd1eG75VZZGdPT60gsNdhMXc4otwVX7nbUcIoI6L8oZfG+mHspQWA==
X-Received: by 2002:aca:5608:: with SMTP id k8mr49708oib.88.1579098923922;
        Wed, 15 Jan 2020 06:35:23 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 101sm6595670otj.55.2020.01.15.06.35.22
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 06:35:23 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22040c
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 15 Jan 2020 08:35:21 -0600
Date:   Wed, 15 Jan 2020 08:35:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     daniel.lezcano@linaro.org, tglx@linutronix.de,
        mark.rutland@arm.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux@armlinux.org.uk, p.paillet@st.com,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: timer: Add STM32 Low Power Timer
 bindings
Message-ID: <20200115143521.GA15099@bogus>
References: <20200109145333.12260-1-benjamin.gaignard@st.com>
 <20200109145333.12260-2-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200109145333.12260-2-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jan 09, 2020 at 03:53:31PM +0100, Benjamin Gaignard wrote:
> Document STM32 Low Power bindings.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../bindings/timer/st,stm32-lp-timer.yaml          | 44 ++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/st,stm32-lp-timer.yaml
> 
> diff --git a/Documentation/devicetree/bindings/timer/st,stm32-lp-timer.yaml b/Documentation/devicetree/bindings/timer/st,stm32-lp-timer.yaml
> new file mode 100644
> index 000000000000..ca040b96dc47
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/st,stm32-lp-timer.yaml

Use the compatible for the filename.

> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/st,stm32-lp-timer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 Low Power 16 bits timers bindings
> +
> +maintainers:
> +  - Benjamin Gaignard <benjamin.gaignard@st.com>
> +
> +properties:
> +  compatible:
> +    const: st,stm32-lptimer-clkevent

'clkevent' is a h/w name? Seems redundant and abusing compatible to 
bind to a specific Linux driver. 

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +    clkevent: clkevent@40009000 {

timer@...

> +      compatible = "st,stm32-lptimer-clkevent";
> +      reg = <0x40009000 0x400>;
> +      clocks = <&rcc LPTIM1_K>;
> +      interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
> +    };
> +
> +...
> -- 
> 2.15.0
> 
