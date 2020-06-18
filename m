Return-Path: <SRS0=Lhmw=77=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 104B6C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 15:07:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB299206C3
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 15:07:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KpL0+GgY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730935AbgFRPH1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 18 Jun 2020 11:07:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730858AbgFRPHZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 18 Jun 2020 11:07:25 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29A00C06174E;
        Thu, 18 Jun 2020 08:07:23 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id c21so3680832lfb.3;
        Thu, 18 Jun 2020 08:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8fVYUlZR4gHbANoFrVJ4MXFqHsqGPHwcZ5jHv3RoxTw=;
        b=KpL0+GgYtocWCYoDSHaruLust5oQSAnCvS8cN7Dn4BsjQu0s8W2lcTC1QeMNDnHuRz
         kWhrrpGiWDblkEFywHXLdAxgii0xTJpaSmj80J84TSg+riiXCM0vaobTIMHaOfVtkyuO
         5HSc3cDKC6pA9dysuvkFu9u5X6qz5SCXeyktRVCMQSkefFu4lskmEttLEBmYGZ8bZpWy
         0oRo2j75bW2uhp3FmdlqU97oTi3lXaoGnG6zkP0SBFwrT5YgUryoRlX31l8DVcq2ARbV
         5AZazFfMrvvKyBs4NC6wof2GLG7pqLwGqZYyptec5PU10N32VUyE3AIbaePbZYFaJtPW
         OfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8fVYUlZR4gHbANoFrVJ4MXFqHsqGPHwcZ5jHv3RoxTw=;
        b=Zp+UQUC10kL+LKwMW/H10ZGO9xLyjrXzhDh1zMDWZ2bTKD5OvMGq2iFtp5Xqxv8/cM
         tO8K5R0rYQIjIkhZH/+mcP2cDxLUjSbtio8j0Eip+CtJpc/vIh5Qqmvwhx87vQ+1PTpA
         mFIDqLaDA9S+Eg+pRJPJMKmgGLr6ObaGk2OsYSVn+1m9wZQ0yav0TzA58C7mt7XSpVqC
         PnvUKvu2UCto1W9nYqQPySIrHQpXgCbPhd7ja277JL0WpQ5wXd2NrXmJcr+TIGqpl+6G
         nSV942CmR25ZPJRJbEbhIi1r4GTHU4Vghw1zxO0jE+6CS4RMxVBFydjSXlwoeViYfEwA
         nj7w==
X-Gm-Message-State: AOAM530y4ss/2x3NDjAgCwVAslW3hJZXpK/BEcsg2mfZZATPrzAmmakM
        u9/4NNy6xggirNyA/IHdmns0Vi83
X-Google-Smtp-Source: ABdhPJwZIv9x/9anCIbuhZwZlKygIpuLvOOlrQ90sxGpYN+YIb4p5QeM66FOj8eHsqD9CCc1MZswqQ==
X-Received: by 2002:ac2:5094:: with SMTP id f20mr2685466lfm.128.1592492838989;
        Thu, 18 Jun 2020 08:07:18 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id t13sm677246ljg.78.2020.06.18.08.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 08:07:18 -0700 (PDT)
Subject: Re: [PATCH 25/38] dt-bindings: gpio: tegra: Convert to json-schema
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-26-thierry.reding@gmail.com>
 <186ceadd-317c-a7b2-d4ab-32473f857545@gmail.com>
 <20200617141706.GC3536291@ulmo>
 <c0cfa39b-054c-8e88-7e5a-233c24f5d5e9@gmail.com>
 <a14c2791-83af-1cd0-1d15-0544a4bf490b@gmail.com>
 <20200617165008.GB3547875@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <66767af4-748e-733e-65b2-1a5df9781a5e@gmail.com>
Date:   Thu, 18 Jun 2020 18:07:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200617165008.GB3547875@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

17.06.2020 19:50, Thierry Reding пишет:
> On Wed, Jun 17, 2020 at 05:33:00PM +0300, Dmitry Osipenko wrote:
>> 17.06.2020 17:24, Dmitry Osipenko пишет:
>>> 17.06.2020 17:17, Thierry Reding пишет:
>>>> On Wed, Jun 17, 2020 at 07:24:16AM +0300, Dmitry Osipenko wrote:
>>>>> 12.06.2020 17:18, Thierry Reding пишет:
>>>>> ...
>>>>>> +patternProperties:
>>>>>> +  # GPIO hogs; /schemas/gpio/gpio-hog.yaml will match
>>>>>> +  "^gpios(-[a-zA-Z0-9-]+)?$":
>>>>>> +    type: object
>>>>>> +    required:
>>>>>> +      - gpio-hog
>>>>>
>>>>> There are two problems here:
>>>>>
>>>>> 1. This naming limitation didn't exist before this patch, so it's not a
>>>>> part of the conversion.
>>>>>
>>>>> 2. GPIO core uses the node's name for the hog's name. Hence by imposing
>>>>> the "gpios-" prefix, you're forcing all hogs to be named as gpios-xxx,
>>>>> which doesn't make much sense to me.
>>>>>
>>>>> Please explain the rationale of this change.
>>>>
>>>> We could probably do without this if we didn't enforce additional or
>>>> unevaluated properties. Because if we don't match on a pattern here then
>>>> all of those GPIO hog nodes would show up as "extra" properties and they
>>>> are currently not allowed. If we do allow them, then we can drop this,
>>>> but we then have no way to fail validation for whatever else somebody
>>>> might want to put into these device tree nodes.
>>>>
>>>> That said, I think additionalProperties can be a schema in itself, so
>>>> maybe there's a way to only allow additional properties if they are of
>>>> type object and have a gpio-hog property. I'll look into that.
>>>
>>> Isn't it possible to validate the additional properties by checking what
>>> properties they have?
>>>
>>> For example, if sub-node has a gpio-hog property then this sub-node is
>>> okay, otherwise fail.
>>>
>>
>> Ah, I haven't finished reading yours last sentence before started to
>> type :) Yes, it will be nice if we could avoid the naming limitation, or
>> at least change it to something like xxx-hog.
> 
> So according to the json-schema specification, both additionalProperties
> and unevaluatedProperties must be a valid JSON schema, which means they
> can be objects rather than just booleans. Unfortunately, dt-schema tools
> don't allow these to be objects, so the below currently fails with these
> tools at the moment.
> 
> I can make it work with the following patch against dt-schema.git:
> 
> --- >8 ---
> diff --git a/meta-schemas/keywords.yaml b/meta-schemas/keywords.yaml
> index ed543235d7e7..aa88f726ea3b 100644
> --- a/meta-schemas/keywords.yaml
> +++ b/meta-schemas/keywords.yaml
> @@ -79,7 +79,11 @@ properties:
>    additionalItems:
>      type: boolean
>    additionalProperties:
> -    type: boolean
> +    oneOf:
> +      - type: object
> +        allOf:
> +          - $ref: "#/definitions/sub-schemas"
> +      - type: boolean
>    allOf:
>      items:
>        $ref: "#/definitions/sub-schemas"
> @@ -140,7 +144,11 @@ properties:
>    type: true
>    typeSize: true
>    unevaluatedProperties:
> -    type: boolean
> +    oneOf:
> +      - type: object
> +        allOf:
> +          - $ref: "#/definitions/sub-schemas"
> +      - type: boolean
>    uniqueItems:
>      type: boolean
>  
> --- >8 ---
> 
> With that applied, I can make validation of gpio-hog nodes work without
> requiring the names to change, which incidentally will allow me to drop
> one of the fixup patches from the ARM/arm64 DTS series.
> 
> Here's a hunk that applies on top of this patch and makes this work.
> I'll squash it in for the next version.
> 
> --- >8 ---
> diff --git a/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.yaml b/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.yaml
> index b2debdb0caff..3f8a9c988305 100644
> --- a/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.yaml
> @@ -57,13 +57,6 @@ properties:
>    interrupt-controller:
>      description: Marks the device node as an interrupt controller.
>  
> -patternProperties:
> -  # GPIO hogs; /schemas/gpio/gpio-hog.yaml will match
> -  "^gpios(-[a-zA-Z0-9-]+)?$":
> -    type: object
> -    required:
> -      - gpio-hog
> -
>  allOf:
>    - if:
>        properties:
> @@ -90,7 +83,10 @@ required:
>    - "#interrupt-cells"
>    - interrupt-controller
>  
> -unevaluatedProperties: false
> +unevaluatedProperties:
> +  type: object
> +  required:
> +    - gpio-hog
>  
>  examples:
>    - |
> --- >8 ---

Thank you for figuring this out! I see that the dt-schema tool is
already updated in the git, very nice!
