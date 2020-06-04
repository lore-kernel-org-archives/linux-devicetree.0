Return-Path: <SRS0=QtGe=7R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 814A1C433E1
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 15:03:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5BF4E207D8
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 15:03:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iAHApN9X"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729283AbgFDPDy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 4 Jun 2020 11:03:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728638AbgFDPDy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 4 Jun 2020 11:03:54 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35E4CC08C5C3
        for <devicetree@vger.kernel.org>; Thu,  4 Jun 2020 08:03:54 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id c11so7745414ljn.2
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2020 08:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UF71iF3u1JOe+kOrQShSOyNe1cwY69P05usqFuJCDAw=;
        b=iAHApN9Xsx7GaAat/S33k20HBenl5jKfuKToU60WffKioHh7r72XTO1rR897L6jzzm
         bgVX642J80Bh7DLSOEdemcpPaS7UkWhgUu4jWYkHK+dhVOs2rccpxFXGR+PuDO9H3vqc
         0S9VaKYjrzCU+wRx1s/vZXiq+7VaHCfWP+npZ4LhH7TY+6HUViaTrA8XZg6Q4XemhFdl
         EIZRhTymEFxYXKPIFl5ZDvuM/dETjWvlw/ns1IgMTaaAkC4nQNV9/6X5ztefETvaIviv
         AAfnOt5zeupC+E3aiqQECQT+VJAJQ2YTkAN1xQbWT+uLYFpHSsBKLmjG8VT64kLGPg+0
         YrIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UF71iF3u1JOe+kOrQShSOyNe1cwY69P05usqFuJCDAw=;
        b=JDD6F9ARJSfemaumBC4/FPaPOu/VORLA1vB2hhUvdku12QEZcgm4vBNanKFJF6nhrW
         kQYtv0XpmulFTlmUFX1Ost9yxqY6RTcbSzi8FvdomJCBrJxtMJ/ZlYJK7sQXUTv+pmZs
         DeUMqPZXuyD16jcowXgZPYIQGArPOHhTt6ZwaVDOp9QjwWDhk77pdgY49cSaeZH2If7q
         ZIiqrQX5TzzW9+yfMPLEwHIujZ/tD/8Jg4Xo3MSXzMWdi2vFC8rOXPgndy+ZsbVNlyjt
         WKyGu5uc37/Z8uFwSHMox0zATPEem68wLRXrqyaNbQkzWxK0j72gW17+mXtlguKYeUUd
         cm+A==
X-Gm-Message-State: AOAM5335HTPasws1Kh+6KBfgI6K4LxnM8evrk1maBQ1XBACJW1T4nDAQ
        gkkuCwnYx4C65Wb0DwzAJVvVcQ==
X-Google-Smtp-Source: ABdhPJwiDGJb1z0K+ZKyK2j0xn+T8lAoBDWnXDhCMBp/XGmHB9pF4OxTNL4EFR/dJxY4GgiDkibb1g==
X-Received: by 2002:a2e:8e28:: with SMTP id r8mr2411588ljk.460.1591283032413;
        Thu, 04 Jun 2020 08:03:52 -0700 (PDT)
Received: from [192.168.1.211] ([188.162.64.141])
        by smtp.gmail.com with ESMTPSA id t7sm1522968lfq.64.2020.06.04.08.03.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2020 08:03:51 -0700 (PDT)
Subject: Re: [PATCH 5/7] arm64: dts: qcom: pm8150x: add thermal alarms and
 thermal zones
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        patches@linaro.org, linaro-kernel@lists.linaro.org
References: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
 <20200604004331.669936-5-dmitry.baryshkov@linaro.org>
 <20200604104701.GG3521@vkoul-mobl>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <8df3fe11-867f-b6a3-fe29-5a8ab988e006@linaro.org>
Date:   Thu, 4 Jun 2020 18:03:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200604104701.GG3521@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 04/06/2020 13:47, Vinod Koul wrote:
> On 04-06-20, 03:43, Dmitry Baryshkov wrote:
>> Add temperature alarm and thermal zone configuration to all three
>> pm8150 instances. Configuration is largely based on the msm-4.19 tree.
>> These alarms use main adc of the pmic. Separate temperature adc is not
>> supported yet.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/pm8150.dtsi  | 41 +++++++++++++++++++++++--
>>   arch/arm64/boot/dts/qcom/pm8150b.dtsi | 43 +++++++++++++++++++++++++--
>>   arch/arm64/boot/dts/qcom/pm8150l.dtsi | 43 +++++++++++++++++++++++++--
>>   3 files changed, 119 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/pm8150.dtsi b/arch/arm64/boot/dts/qcom/pm8150.dtsi
>> index c0b197458665..fee2db42f4cb 100644
>> --- a/arch/arm64/boot/dts/qcom/pm8150.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/pm8150.dtsi
>> @@ -30,6 +30,15 @@ pwrkey {
>>   			};
>>   		};
>>   
>> +		pm8150_temp: temp-alarm@2400 {
>> +			compatible = "qcom,spmi-temp-alarm";
>> +			reg = <0x2400>;
>> +			interrupts = <0x0 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
>> +			io-channels = <&pm8150_adc ADC5_DIE_TEMP>;
>> +			io-channel-names = "thermal";
>> +			#thermal-sensor-cells = <0>;
>> +		};
>> +
>>   		pm8150_adc: adc@3100 {
>>   			compatible = "qcom,spmi-adc5";
>>   			reg = <0x3100>;
>> @@ -38,8 +47,6 @@ pm8150_adc: adc@3100 {
>>   			#io-channel-cells = <1>;
>>   			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
>>   
>> -			status = "disabled";
>> -
> 
> This should not be removed, rather than this please add enabled in you
> board dts file
> 
>>   			ref-gnd@0 {
>>   				reg = <ADC5_REF_GND>;
>>   				qcom,pre-scaling = <1 1>;
>> @@ -85,3 +92,33 @@ pmic@1 {
>>   		#size-cells = <0>;
>>   	};
>>   };
>> +
>> +&thermal_zones {
>> +	pm8150_temp {
>> +		polling-delay-passive = <0>;
>> +		polling-delay = <0>;
>> +
>> +		thermal-sensors = <&pm8150_temp>;
>> +
>> +		trips {
>> +			trip0 {
>> +				temperature = <95000>;
>> +				hysteresis = <0>;
>> +				type = "passive";
>> +			};
>> +
>> +			trip1 {
>> +				temperature = <115000>;
>> +				hysteresis = <0>;
>> +				type = "passive";
>> +			};
>> +
>> +			trip2 {
>> +				temperature = <145000>;
>> +				hysteresis = <0>;
>> +				type = "passive";
>> +			};
>> +		};
>> +
>> +	};
> 
> Not sure about this, Amit..? Should this also not be in board dts?
> 
> Similar comments on similar ones for rest of the patch as well..

I'm not so sure. This part of the configuration seems generic to me. 
Unlike adc-tm config, which definitely goes to the board file.

I can split this into a separate pm8150-temp.dtsi file. Does that sound 
better?


-- 
With best wishes
Dmitry
