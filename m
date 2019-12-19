Return-Path: <SRS0=R1yt=2J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71317C2D0C0
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 14:11:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3DA0E227BF
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 14:11:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n5WKHtOj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbfLSOLP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Dec 2019 09:11:15 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:40646 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726695AbfLSOLP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 19 Dec 2019 09:11:15 -0500
Received: by mail-ed1-f68.google.com with SMTP id b8so4993340edx.7
        for <devicetree@vger.kernel.org>; Thu, 19 Dec 2019 06:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=clZzE5oWuHu58s8VOdHWBVy38e2LT2FNqa0IOiJ8Pno=;
        b=n5WKHtOjKZAcEpXknaKrANkMjPc5I9UKtCBGQ78HA2khJ4nfDTYRJYEc2+fj3I1Fkn
         ha25hcVjnIDI+wrc1oFeWcvd8eBNuapXSPBoqY0nKHI2V03hwHZ+Ay/jFSkkEO0kW0BY
         NM4Ql8kso4wGnxO+V0PrRoGr9hO1a01H9GkjcfQT9QoLwVBLDtwQ3BuUjW6y9sAv8lfg
         Syr9yRHqd5u7Kv6K8ZUFm1qm3zv1yySq8mPCo+epWPqtyIG/zDpvLIPKs6ntJSWfWhFI
         fZiZASZTwE6EYJBxtv269hcaO52Mwo7k67Mkh1PtyRFg1Fdleszn9rB/L30T79sxc40C
         cc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=clZzE5oWuHu58s8VOdHWBVy38e2LT2FNqa0IOiJ8Pno=;
        b=VYab9qdNH36LhPlxtqz7mXwOLTeHPvLpGjokeVdMwyu+NDEp/biOPHt2cgNLVoS39s
         vSzvnXfQ3K/LCJF/sSGM/SRiZIPWPWi3Yo1ucv5YjjlCVVvG1i7JWGcCSdhKq+Nv0b02
         ROQfiUMhpG9+oF3ISVbodUxmafhpSMlRssx6kXRA/i6VQ7c+IM5XVid58VcsRTp+Vukw
         YyF1gO2riJf7gIt6t8HW1rezzW1mVJmm1DvV5LRsG+S4RK/KYJLAz8GUfSVqnC6htuBs
         Wfdflo40KvTEPnxiX9OzGuhw2C8RCwwcLOmSq3xysX+E/ruCKi9pTh9Sy7dB+/lyFGfZ
         y46w==
X-Gm-Message-State: APjAAAW68QRWM03thFeNXJj3o3Pl7A6BfLyC3T5ozOFvE0GO+A1g00ps
        VCrPBWSo66C5K44B0baj1ax0ow==
X-Google-Smtp-Source: APXvYqxl9SNHmQvO1V2+yKIouleHiF6c6w+NSNZDRU8V+Hpd4Y0zEbiUkVrTKUgdQk/MjFnTiDxYXQ==
X-Received: by 2002:a05:6402:1251:: with SMTP id l17mr9406658edw.54.1576764672969;
        Thu, 19 Dec 2019 06:11:12 -0800 (PST)
Received: from [192.168.27.209] ([37.157.136.193])
        by smtp.googlemail.com with ESMTPSA id i9sm418056edl.34.2019.12.19.06.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2019 06:11:11 -0800 (PST)
Subject: Re: [PATCH v2 06/12] dt-bindings: media: venus: Convert msm8916 to DT
 schema
To:     Rob Herring <robh@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        dikshita@codeaurora.org
References: <20191218132251.24161-1-stanimir.varbanov@linaro.org>
 <20191218132251.24161-7-stanimir.varbanov@linaro.org>
 <CAL_Jsq+1Z72J03tZa9T4DLzR7skFweV8Xe4vBd_QBUktVOekrA@mail.gmail.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <0d11ce8f-cd34-624f-e1be-0f533968adbd@linaro.org>
Date:   Thu, 19 Dec 2019 16:11:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+1Z72J03tZa9T4DLzR7skFweV8Xe4vBd_QBUktVOekrA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob,

Thanks for the review!

On 12/19/19 12:51 AM, Rob Herring wrote:
> On Wed, Dec 18, 2019 at 7:24 AM Stanimir Varbanov
> <stanimir.varbanov@linaro.org> wrote:
>>
>> Convert qcom,msm8916-venus Venus binding to DT schema
>>
>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> ---
>>  .../bindings/media/qcom,venus-msm8916.yaml    | 115 ++++++++++++++++++
>>  1 file changed, 115 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/media/qcom,venus-msm8916.yaml
> 
> Make the filename match the compatible.
> 
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,venus-msm8916.yaml b/Documentation/devicetree/bindings/media/qcom,venus-msm8916.yaml
>> new file mode 100644
>> index 000000000000..f82a8d968202
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,venus-msm8916.yaml
>> @@ -0,0 +1,115 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/media/qcom,venus-msm8916.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: Qualcomm Venus video encode and decode accelerators
>> +
>> +maintainers:
>> +  - Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> +
>> +description: |
>> +  The Venus IP is a video encode and decode accelerator present
>> +  on Qualcomm platforms
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,msm8916-venus
> 
> Not likely a 2nd compatible here?, so you can use 'const' instead.

I don't expect more compatibles here. I split every compatible on
separate .yaml file to make bindings clearer.

> 
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 3
>> +
>> +  clock-names:
>> +    maxItems: 3
> 
> Don't need this. Implied with the length of 'items'.
> 
>> +    items:
>> +      - const: core
>> +      - const: iface
>> +      - const: bus
>> +
>> +  iommus:
>> +    minItems: 1
>> +    maxItems: 20
>> +
>> +  memory-region:
>> +    maxItems: 1
>> +
>> +  video-decoder:
>> +    type: object
>> +
>> +    properties:
>> +      compatible:
>> +        const: "venus-decoder"
>> +
>> +    required:
>> +      - compatible
> 
>        additionalProperties: false
> 
>> +
>> +  video-encoder:
>> +    type: object
>> +
>> +    properties:
>> +      compatible:
>> +        const: "venus-encoder"
>> +
>> +    required:
>> +      - compatible
> 
> Here too.

I guess the above comments are valid for the the other DT schema
conversions in this series? If so I'll correct them as well in next version.

-- 
regards,
Stan
