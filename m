Return-Path: <SRS0=2ZKK=7K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB22BC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 22:14:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B05302074B
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 22:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590704056;
	bh=Gui8dTEccNj+rJHiJXl4XRU7aDW5Qu6VuTIEZXn4Vpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=QjTbwMEkO+Sj5TfZt+wTb4+9RehIJzvOH2vfs7IB84JBFswY73JtoWMcAnM13b3rW
	 PseKXSIy/mJ880vFqvmMe8HrWXTLqIhw7uUx6UYIRKwLhW3dnDKOhtDcD1hNcrgmg4
	 ZthMrA2bex1jbwUtueexgf7HZLwI+TJItN8NojL0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436882AbgE1WOO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 May 2020 18:14:14 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:40038 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436911AbgE1WOM (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 May 2020 18:14:12 -0400
Received: by mail-io1-f68.google.com with SMTP id q8so201083iow.7
        for <devicetree@vger.kernel.org>; Thu, 28 May 2020 15:14:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eZt6S4Voc1GVGbmZ9OSkpYu147Jwa8sfxjXcTtEMq88=;
        b=RK1VjeNrXz1UAGXjlrOoqPmtJmMqs67kY8riSBcvPwRUeJxr9gYyYuKqV6eVqCEaaK
         MYhy1D1B7gQV7ZIRNw7rVJDgX7ELH4xJnVjE2uZ75ro+7yg0gtUH7zHJfJWzfzn8bLLN
         mPpytGjDrpCy/X3ICFcujc+S7DsNfzu8dTe4i9eq94Gi91/FIx9KtClGSLwSHpbanrsz
         XBR42xq5MYOwlSQCs1RJK3KWJQIud7JFV/oW2MhFrNFZvb5PJmT+sD05VIQ53xt51ASb
         j8WVJi1RqlPanI5DduDf9aSR+3MbJKlVpPuUEZtP/9xSo4ZN0dwWh0jJ1oVkjf4MgJbh
         DgBg==
X-Gm-Message-State: AOAM531Px7PBI7HHO+4Vf5HPuxVIIPpwYq13GUiHeEhbganKFLF8LwIY
        HPWjpD6Ekox/SqpEVfgtSw==
X-Google-Smtp-Source: ABdhPJy3G7A8UkjiY37GNsMp60BJHw4S4Y4hMohQN9/R5R0vFSwjndJxazHP9bVDM7DganPPCmGqRg==
X-Received: by 2002:a5d:8ad8:: with SMTP id e24mr4044872iot.41.1590704050154;
        Thu, 28 May 2020 15:14:10 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id s71sm3905985ilc.32.2020.05.28.15.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 15:14:09 -0700 (PDT)
Received: (nullmailer pid 776909 invoked by uid 1000);
        Thu, 28 May 2020 22:14:06 -0000
Date:   Thu, 28 May 2020 16:14:06 -0600
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
Subject: Re: [PATCH 04/12] dt-bindings: irqchip: ti,sci-intr: Update bindings
 to drop the usage of gic as parent
Message-ID: <20200528221406.GA769073@bogus>
References: <20200520124454.10532-1-lokeshvutla@ti.com>
 <20200520124454.10532-5-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520124454.10532-5-lokeshvutla@ti.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, May 20, 2020 at 06:14:46PM +0530, Lokesh Vutla wrote:
> Drop the firmware related dt-bindings and use the hardware specified
> interrupt numbers within Interrupt Router. This ensures interrupt router
> DT node need not assume any interrupt parent type.

I didn't like this binding to begin with, but now you're breaking 
compatibility.

> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
>  .../interrupt-controller/ti,sci-intr.txt      | 31 ++++++++++---------
>  1 file changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.txt b/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.txt
> index 1a8718f8855d..8b56b2de1c73 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.txt
> @@ -44,15 +44,17 @@ Required Properties:
>  			4: If intr supports level triggered interrupts.
>  - interrupt-controller:	Identifies the node as an interrupt controller
>  - #interrupt-cells:	Specifies the number of cells needed to encode an
> -			interrupt source. The value should be 2.
> -			First cell should contain the TISCI device ID of source
> -			Second cell should contain the interrupt source offset
> -			within the device.
> +			interrupt source. The value should be 1.
> +			First cell should contain interrupt router input number
> +			as specified by hardware.
>  - ti,sci:		Phandle to TI-SCI compatible System controller node.
> -- ti,sci-dst-id:	TISCI device ID of the destination IRQ controller.
> -- ti,sci-rm-range-girq:	Array of TISCI subtype ids representing the host irqs
> -			assigned to this interrupt router. Each subtype id
> -			corresponds to a range of host irqs.
> +- ti,sci-dev-id:	TISCI device id of interrupt controller.
> +- ti,interrupt-ranges:	Set of triplets containing ranges that convert
> +			the INTR output interrupt numbers to parent's
> +			interrupt number. Each triplet has following entries:
> +			- First entry specifies the base for intr output irq
> +			- Second entry specifies the base for parent irqs
> +			- Third entry specifies the limit

Humm, sounds like what interrupt-map does.

>  
>  For more details on TISCI IRQ resource management refer:
>  http://downloads.ti.com/tisci/esd/latest/2_tisci_msgs/rm/rm_irq.html
> @@ -62,21 +64,20 @@ Example:
>  The following example demonstrates both interrupt router node and the consumer
>  node(main gpio) on the AM654 SoC:
>  
> -main_intr: interrupt-controller0 {
> +main_gpio_intr: interrupt-controller0 {
>  	compatible = "ti,sci-intr";
>  	ti,intr-trigger-type = <1>;
>  	interrupt-controller;
>  	interrupt-parent = <&gic500>;
> -	#interrupt-cells = <2>;
> +	#interrupt-cells = <1>;
>  	ti,sci = <&dmsc>;
> -	ti,sci-dst-id = <56>;
> -	ti,sci-rm-range-girq = <0x1>;
> +	ti,sci-dev-id = <131>;
> +	ti,interrupt-ranges = <0 360 32>;
>  };
>  
>  main_gpio0: gpio@600000 {
>  	...
> -	interrupt-parent = <&main_intr>;
> -	interrupts = <57 256>, <57 257>, <57 258>,
> -		     <57 259>, <57 260>, <57 261>;
> +	interrupt-parent = <&main_gpio_intr>;
> +	interrupts = <192>, <193>, <194>, <195>, <196>, <197>;
>  	...
>  };
> -- 
> 2.17.1
> 
