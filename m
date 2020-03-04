Return-Path: <SRS0=c2W6=4V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7618C3F2D1
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Mar 2020 16:24:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9AE682146E
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Mar 2020 16:24:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ltaenl3T"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729918AbgCDQYH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 4 Mar 2020 11:24:07 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:40880 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729909AbgCDQYG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 4 Mar 2020 11:24:06 -0500
Received: by mail-ed1-f65.google.com with SMTP id a13so2997755edu.7
        for <devicetree@vger.kernel.org>; Wed, 04 Mar 2020 08:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cRSqqyVQcgkFGQEI4WVpqxDQwCK2dLecE852C4OPnck=;
        b=ltaenl3Tu/Uh7cHCpFacONDPzzzqQrkNujMvp58M14/XfVcwRWa9kwro+hgX741c1H
         cHnCwykPCAHfAWZmq+NsVrSJt60Ar5l8PBnPxMnYF4ldkMKjpzHC/rCTzyZ2/Y5h88kv
         bqoO8m4mB+MtaoMBxxJ11DliaahtilK++IfG/BJkK+EQc+WHQeVm17p/OveeUZkNSqe0
         fnvHDULD6vm31OuojQziBWWptXNAKl2Gm5Mmg7LKGLg1WqqMaCjgpG9u/AHjjImliWi0
         gRKjn5q0WJI87Pj4LSzwHtJiNzyN3Axe7z4laTFODANHwTiIBlLYDY4JA7bRQl9r+IBc
         f4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cRSqqyVQcgkFGQEI4WVpqxDQwCK2dLecE852C4OPnck=;
        b=AY5uVQjiF8QwGe6E8ypU2U18GhTE5/+kf1xk8MBNuoM6TVahoj7OGxSBK5NjCTEz1G
         JtsTD7mWp+NxWSkpwSVVIZmNIaTvAqU18LRFpFBQvMBpENS6FPgmtnMaWKlca1xo54PA
         +PDrjPVIGXnCu2znSrtmsImTH+0cXmn5SCGBcHb0u8dlGFXfqVXYnWddkEhROwj0pQzN
         FnK97myCB584VnsbIKhA+8HtCH907VDH+Kqu0YUIwhFv87s4egAqmA1ZTPKvhnxlvCGB
         GX+OpSwqL+Km+7dvZi/Jmt6bRLza9T9c9zBh2Jas8HUIQt9C8qDy+ipb+cAQlBvtk9mV
         pEjA==
X-Gm-Message-State: ANhLgQ2wIgkeTIGrV2MvCnTwtG1wQ5Kr+PpzpC0RQJWiv4MOhsLCGGUy
        4MOxnscULwHQHLP9OFz/935RN3dEY48=
X-Google-Smtp-Source: ADFU+vuKkH6eC/TyjKp82VgLkReuX6Vu6bromPkvOyS874kNDx2MU23u3kTtssmvRyNsQaYULSffiA==
X-Received: by 2002:a17:906:604c:: with SMTP id p12mr3231175ejj.202.1583339044755;
        Wed, 04 Mar 2020 08:24:04 -0800 (PST)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id a40sm1535657edf.90.2020.03.04.08.24.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2020 08:24:03 -0800 (PST)
Subject: Re: [PATCH v7 07/18] dt-bindings: usb: dwc3: Add a gpio-usb-connector
 example
To:     Rob Herring <robh@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
References: <20200303171159.246992-1-bryan.odonoghue@linaro.org>
 <20200303171159.246992-8-bryan.odonoghue@linaro.org>
 <20200304145756.GA17484@bogus>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <1072c2cb-5b09-1725-4246-f19ef3899e4e@linaro.org>
Date:   Wed, 4 Mar 2020 16:24:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200304145756.GA17484@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 04/03/2020 14:57, Rob Herring wrote:
> On Tue,  3 Mar 2020 17:11:48 +0000, Bryan O'Donoghue wrote:
>> A USB connector should be a child node of the USB controller
>> connector/usb-connector.txt. This patch adds an example of how to do this
>> to the dwc3 binding descriptions.
>>
>> It is necessary to declare a connector as a child-node of a USB controller
>> for role-switching to work, so this example should be helpful to others
>> implementing that.
>>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: linux-usb@vger.kernel.org
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Acked-by: Felipe Balbi <balbi@kernel.org>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/usb/dwc3.txt | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
> 
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
> 
> If a tag was not added on purpose, please state why and what changed.
> 

Yep apologies I forgot to add your

Reviewed-by: Rob Herring <robh@kernel.org>

when posting this one
