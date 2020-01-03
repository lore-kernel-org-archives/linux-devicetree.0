Return-Path: <SRS0=7PY0=2Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 853B3C00523
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Jan 2020 23:44:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5C7E921835
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Jan 2020 23:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578095074;
	bh=Mg3TQ5nbJqbt3keDFCXdnTMad0SO85xjOLMwAZ4VpnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=WQp91vIjONn+qNrc9XCiwqhCS+Nfb9ga0wBTBtTKCVWPI4Z/o7CUZqHubWvCcIqeq
	 P5HnZ027rCiX4wzmdHdncKEL+E+AJs4lKcFifWVe/9ZfLDB96ThSssEaJFkZMgbryR
	 yZJ1n8ZxYcYJfIJnJ9mnzk/jojejpThtsidZfsAk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgACXo3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Jan 2020 18:44:29 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:42365 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbgACXo2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 Jan 2020 18:44:28 -0500
Received: by mail-io1-f65.google.com with SMTP id n11so36307885iom.9
        for <devicetree@vger.kernel.org>; Fri, 03 Jan 2020 15:44:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oHVJcbfywZ2wbBBx9DgqhrtkzwrTvD4xChukN5BH1kY=;
        b=lMWC3bqnp/G+F5aao0hvnM0CFWxW/e5+KFopvb4G/vt3dfXYZN5p/W/7smVdjyH1KN
         aaG6DEBVMgdNl/WiMWlFxwf4uwUS/0k98yzjfUnth08JjU8ZxD28Oh1BqUcj7ge7yK1A
         Xbi3WC7sJ6k3nholZYaUfvcDYqeworfKHgrmwIWt0SjjK9YcwMqX0dm6F6f2CBmgMeEA
         lDoPikM6pEzGthUt+Ssb+PXbVfjXUcpbQqbtdBk3MdzIbYewiI/1H4LrRVmlxNfEYDhe
         EjHlYefsO4Jxd1zRzJH/p3pPjFgYeI1r5FkYpSN9+Pu7OU0B+k0M7FqctcmXw0/eUm8H
         fv6g==
X-Gm-Message-State: APjAAAW4cJm3eJCHLHKXtRGHyvBgarszgWpT338Y/gZSsmC98p6DTak6
        LZdoUXxC4OPrqwNbzqT7vopDus4=
X-Google-Smtp-Source: APXvYqxx0UPQ6FXGCVdlngczDosQ5mi5dvzBtakaTjr5txj920MgEDzwP8nA4Z3xTbiRTt2RPb1QaQ==
X-Received: by 2002:a02:cd0d:: with SMTP id g13mr73709023jaq.110.1578095067718;
        Fri, 03 Jan 2020 15:44:27 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id j17sm21563730ild.45.2020.01.03.15.44.26
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 15:44:26 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219b7
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 16:44:25 -0700
Date:   Fri, 3 Jan 2020 16:44:25 -0700
From:   Rob Herring <robh@kernel.org>
To:     Khouloud Touil <ktouil@baylibre.com>
Cc:     bgolaszewski@baylibre.com, mark.rutland@arm.com,
        srinivas.kandagatla@linaro.org, baylibre-upstreaming@groups.io,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linus.walleij@linaro.org
Subject: Re: [PATCH v3 3/4] dt-bindings: at24: remove the optional property
 write-protect-gpios
Message-ID: <20200103234425.GA17746@bogus>
References: <20191219115141.24653-1-ktouil@baylibre.com>
 <20191219115141.24653-4-ktouil@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191219115141.24653-4-ktouil@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Dec 19, 2019 at 12:51:40PM +0100, Khouloud Touil wrote:
> NVMEM framework is an interface for the at24 EEPROMs as well as for
> other drivers, instead of passing the wp-gpios over the different
> drivers each time, it would be better to pass it over the NVMEM
> subsystem once and for all.
> 
> Removing the optional property form the device tree binding document.
> 
> Signed-off-by: Khouloud Touil <ktouil@baylibre.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
> index e8778560d966..75de83708146 100644
> --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> @@ -145,10 +145,7 @@ properties:
>        over reads to the next slave address. Please consult the manual of
>        your device.
>  
> -  wp-gpios:
> -    description:
> -      GPIO to which the write-protect pin of the chip is connected.
> -    maxItems: 1
> +  wp-gpios: true
>  
>    address-width:
>      allOf:
> @@ -181,7 +178,6 @@ examples:
>            compatible = "microchip,24c32", "atmel,24c32";
>            reg = <0x52>;
>            pagesize = <32>;
> -          wp-gpios = <&gpio1 3 0>;

This is still valid, why is it being removed?

>            num-addresses = <8>;
>        };
>      };
> -- 
> 2.17.1
> 
