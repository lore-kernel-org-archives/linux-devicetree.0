Return-Path: <SRS0=7PY0=2Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53C20C00523
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Jan 2020 23:40:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 20F4421835
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Jan 2020 23:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578094847;
	bh=YVTFAYz3giJ1u1dlO2paEJHjx80aSYUSc3WheWccZmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=pqR9qAMxiHSmsmhfbjCNbC+H8qGfSuLcZF1tROY5iQulZa2bmT+2zZTDNB1TebDjU
	 9jkaENEXbvZl2WyDwHsccT+oIoVnxnCO2VQfFilAg/jvABZ3vdqqQJ+kUE8S2Bwpt4
	 9T8/kBkdkNuiEAeOM9xNB8/sJ1l2/O3Qm7aKCX+k=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726229AbgACXkq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Jan 2020 18:40:46 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:47079 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726264AbgACXkq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 Jan 2020 18:40:46 -0500
Received: by mail-il1-f195.google.com with SMTP id t17so37905099ilm.13
        for <devicetree@vger.kernel.org>; Fri, 03 Jan 2020 15:40:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1G7HBZ/lx4jhuYMngmAkk5nXPN0Gyvary5PxJkGPU+Q=;
        b=Dy1iwl8WsKgFyzG9DwhenZI8ZHAOra43UkcMgDq6tcRVEdrX7lyONiKOe8MC40IueP
         s3oSuJfpWQR9F/FsC7X4lezyVPC87AMRp7ITnIb1ccjCMNMc355JuWlGJ84HM66/W2Zt
         svCFFUplL+h0pQ2fQuk9/gUhTcPOTWMPhw1eryXCyoNB9AVS111KBW4HmT+lKKZ2RVas
         mDVL4xUXHzYeUsJpJtAntLBOS2ph2cioM4uCUUc3hZ6H/q+d9Npl8G0LgFt2yNFsEfyr
         bPtsEIhMimO7UCCNYUosc/+FjFGEeN46jUlG4JVbZNFqBG8XHL94q567g7gRMJcXDuIc
         Ubdw==
X-Gm-Message-State: APjAAAU7T9pGemQkLLaUNnfqNhUOQOBe89zIKHOac1ycr6khrjG7MaaK
        886D8P7nra7pWJzokpSpIMcyMkg=
X-Google-Smtp-Source: APXvYqw7W4c/f6DUBNnEuyApBNDK9f253G0/u2MWf2ZK+hu5EVzd5Dp3+jGzkXwcB9B4SFWUtcdNHw==
X-Received: by 2002:a92:d982:: with SMTP id r2mr54471996iln.98.1578094845270;
        Fri, 03 Jan 2020 15:40:45 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id u80sm17932418ili.77.2020.01.03.15.40.44
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 15:40:44 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219a5
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 16:40:42 -0700
Date:   Fri, 3 Jan 2020 16:40:42 -0700
From:   Rob Herring <robh@kernel.org>
To:     Khouloud Touil <ktouil@baylibre.com>
Cc:     bgolaszewski@baylibre.com, mark.rutland@arm.com,
        srinivas.kandagatla@linaro.org, baylibre-upstreaming@groups.io,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linus.walleij@linaro.org
Subject: Re: [PATCH v3 1/4] dt-bindings: nvmem: new optional property
 write-protect-gpios
Message-ID: <20200103234042.GA14976@bogus>
References: <20191219115141.24653-1-ktouil@baylibre.com>
 <20191219115141.24653-2-ktouil@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191219115141.24653-2-ktouil@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Dec 19, 2019 at 12:51:38PM +0100, Khouloud Touil wrote:
> Several memories have a write-protect pin, that when pulled high, it
> blocks the write operation.

Subject doesn't match the actual property name.

> 
> On some boards, this pin is connected to a GPIO and pulled high by
> default, which forces the user to manually change its state before
> writing.
> 
> Instead of modifying all the memory drivers to check this pin, make
> the NVMEM subsystem check if the write-protect GPIO being passed
> through the nvmem_config or defined in the device tree and pull it
> low whenever writing to the memory.
> 
> Add a new optional property to the device tree binding document, which
> allows to specify the GPIO line to which the write-protect pin is
> connected.
> 
> Signed-off-by: Khouloud Touil <ktouil@baylibre.com>
> ---
>  Documentation/devicetree/bindings/nvmem/nvmem.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/nvmem.yaml b/Documentation/devicetree/bindings/nvmem/nvmem.yaml
> index 1c75a059206c..b43c6c65294e 100644
> --- a/Documentation/devicetree/bindings/nvmem/nvmem.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/nvmem.yaml
> @@ -34,6 +34,14 @@ properties:
>      description:
>        Mark the provider as read only.
>  
> +  wp-gpios:
> +    description:
> +      GPIO to which the write-protect pin of the chip is connected.
> +      The write-protect GPIO is asserted, when it's driven high
> +      (logical '1') to block the write operation. It's deasserted,
> +      when it's driven low (logical '0') to allow writing.
> +    maxItems: 1
> +
>  patternProperties:
>    "^.*@[0-9a-f]+$":
>      type: object
> @@ -63,9 +71,12 @@ patternProperties:
>  
>  examples:
>    - |
> +      #include <dt-bindings/gpio/gpio.h>
> +
>        qfprom: eeprom@700000 {
>            #address-cells = <1>;
>            #size-cells = <1>;
> +          wp-gpios = <&gpio1 3 GPIO_ACTIVE_HIGH>;
>  
>            /* ... */
>  
> -- 
> 2.17.1
> 
