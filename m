Return-Path: <SRS0=skvR=3Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50556C3524D
	for <linux-devicetree@archiver.kernel.org>; Tue,  4 Feb 2020 23:54:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 27FB520659
	for <linux-devicetree@archiver.kernel.org>; Tue,  4 Feb 2020 23:54:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TLCMKNZ0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727714AbgBDXyF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 4 Feb 2020 18:54:05 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:34084 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727674AbgBDXyE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 4 Feb 2020 18:54:04 -0500
Received: by mail-wm1-f68.google.com with SMTP id s144so3246997wme.1
        for <devicetree@vger.kernel.org>; Tue, 04 Feb 2020 15:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cvoP7lZgiwSyZwuJ6SgoCnR+QwZx+ZUXmOk9VybwWHc=;
        b=TLCMKNZ0axj3G166T58C7Sp4+/lPY9ERE4TqklTXOUd1T5UYNseLgzUkR0vgGtRRkV
         kNcrF2cDKVlBBGtuMpbLwkXyOb8rZRQ6y2dPEwbpQ9bIE3kajAlVA3soOdK1lNyjlrDA
         WGJmxCrJvnt30F5kraxb7BbzIaP0m/IL9zTm+GVXjdSqyskpvlTiDbNQjzQbgt5ij25d
         w3M8iG8ti11aQeSWIHyxkmRuA4R5EZ217lUskN7dfSjSZxeohHZGcW4Y+ZhTLDIvlMz0
         K6YpG1C+DDO60oNVoj0oh9NOgECcCj4m89UEzBf0vUmNlq3l86Zk2OpU9vUSzqv85j8q
         7oSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cvoP7lZgiwSyZwuJ6SgoCnR+QwZx+ZUXmOk9VybwWHc=;
        b=EgGB2LuPdOQu5CbSGs32+par2Rj1z6bNTuuJ2Ky0C8PPRH1y1g60qPfQuhTZJn1l2+
         tqU1dtkrRgLecZn6k4PUekVj6gKyPytDeXqLZQF5jIJerDOuFRJhEzlMPUjZfzXEF15r
         nHW3eXa2cG0IQs8ArccOz7/53SA0aFR05zBsolV0M3uwYosmX/+yHhC14FN3pAdtPuLU
         jYu1rz65KHBAWyzTmGsF94ZUjMAJ7QfBtCYb/h0sjq1oR/yHwLtg/NrDORP837eRseZn
         sibQAdELMCqn4svyG3dZuQ0/VCXqTSMriPAvduINtD8DvCxjzpmEcyuPm8jomTiQP33u
         3J6Q==
X-Gm-Message-State: APjAAAV89tDeBzInnjks1Ydh/k8x6M+2cbHOhg38YyMtcUEybFZoAw0Z
        tYm3ugD0/o6TDYAGnUfHoyuwT0pIlvI=
X-Google-Smtp-Source: APXvYqyOXzkai8qWgypxtKPWk6WKI4lwtfqFxlYd+cqmJP1x94P3MZO3zqLYUDXUsWBTP/ztsSlKnA==
X-Received: by 2002:a05:600c:20f:: with SMTP id 15mr1491633wmi.128.1580860440987;
        Tue, 04 Feb 2020 15:54:00 -0800 (PST)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id d204sm5718653wmd.30.2020.02.04.15.53.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2020 15:54:00 -0800 (PST)
Subject: Re: [PATCH v3 06/19] dt-bindings: usb: dwc3: Add a gpio-usb-connector
 description
To:     Rob Herring <robh@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
References: <20200122185610.131930-1-bryan.odonoghue@linaro.org>
 <20200122185610.131930-7-bryan.odonoghue@linaro.org>
 <20200127184347.GA27080@bogus>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <25c146fd-26f9-dee5-a693-45cc5774dbef@linaro.org>
Date:   Tue, 4 Feb 2020 23:54:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200127184347.GA27080@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 27/01/2020 18:43, Rob Herring wrote:
> On Wed, Jan 22, 2020 at 06:55:57PM +0000, Bryan O'Donoghue wrote:
>> A USB connector should be a child node of the USB controller
>> connector/usb-connector.txt. This patch adds a property
>> "gpio_usb_connector" which declares a connector child device. Code in the
>> DWC3 driver will then
>>
>> - Search for "gpio_usb_controller"
>> - Do an of_platform_populate() if found
>>
>> This will have the effect of making the declared node a child of the USB
>> controller and will make sure that USB role-switch events detected with the
>> gpio_usb_controller driver propagate into the DWC3 controller code
>> appropriately.
> 
> This is all driver specifics. This is a binding patch.
> 
>>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: linux-usb@vger.kernel.org
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/usb/dwc3.txt | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
>> index 66780a47ad85..b019bd472f83 100644
>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
>> @@ -108,6 +108,9 @@ Optional properties:
>>   			When just one value, which means INCRX burst mode enabled. When
>>   			more than one value, which means undefined length INCR burst type
>>   			enabled. The values can be 1, 4, 8, 16, 32, 64, 128 and 256.
>> + - gpio_usb_connector: Declares a USB connector named 'gpio_usb_connector' as a
>> +		       child node of the DWC3 block. Use when modelling a USB
>> +		       connector based on the gpio-usb-b-connector driver.
> 
> Should be just 'connector'. That's already implicitly allowed for any
> USB controller, so you don't really need a binding change. And the
> specific type of connector is outside the scope of the DWC3 binding.
> 
>>   
>>    - in addition all properties from usb-xhci.txt from the current directory are
>>      supported as well
>> @@ -121,4 +124,12 @@ dwc3@4a030000 {
>>   	interrupts = <0 92 4>
>>   	usb-phy = <&usb2_phy>, <&usb3,phy>;
>>   	snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
>> +	usb_con: gpio_usb_connector {
>> +		compatible = "gpio-usb-b-connector";
>> +		id-gpio = <&tlmm 116 GPIO_ACTIVE_HIGH>;
>> +		vbus-gpio = <&pms405_gpios 12 GPIO_ACTIVE_HIGH>;
> 
> *-gpios is the preferred form and should be what's documented.

Hi Rob,

If I've understood you right here you don't favour documenting a new 
binding but you're OK with adding an example ?

---
bod

