Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1779C282DD
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 16:17:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 835A620678
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 16:17:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IYN11j2i"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728724AbgAHQRa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 11:17:30 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:34540 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728001AbgAHQR3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 11:17:29 -0500
Received: by mail-ed1-f67.google.com with SMTP id l8so3058705edw.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 08:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ixNLloMM7MEsta6mQM3CnnoI5zVcxQu1H3iGtxld7Kc=;
        b=IYN11j2i2b3yDnBf7f+iDcswMuW/81T76Q/ozJTLIk0XuvyeDwwSw3JwBU6setSBRD
         M4c1qsBA5BaTA+pUkJsOuHyJG1aegZXhnzDCpNvdaeH6L8tysTVA+ymH53FRFXXCzHiU
         2n23JOOooOkuOKHvlQG7bnkvczZJRKZzfhG/9rjU5yNi33ZDxgUk+NO6iCTaYA+wRK0c
         cbjaYWyjFQPc3lcQTNCdiE/v9XIjEb7FFN61NZj9FrPgxiYQgO0Y3si9ZNMp7reKiNoz
         w9To10GYO48mMyUUwaCuHFt/lwb30c2MJRScrjk+wSHxdPfQ1dEvmurQW92dEbBsVYfC
         nqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ixNLloMM7MEsta6mQM3CnnoI5zVcxQu1H3iGtxld7Kc=;
        b=bbjq1kq/vdjPbE/OQxevu0eqSVWNPc0J5AcI5znW9oPPdWt1f6CKVP9+Tv+kRlHIR0
         E5zokWrPDhZo9Xcxd8vBKyukQDDrzdKFVCAPvlGEG3Dy8JxtWvXiWHdZDPczbWlRtHga
         GB27fe1RreWZlv9IFCLK1aEPnrdGi1LHd/Q59F2cL9A0vLxI/MrfJGc9l8FmXrduBUpO
         KuxpI0N9n18iZFkgUttuT5UQja4DNHIZ/cDPCX66egUnuQ9BEWa5yd+ACgdqEFEksGlU
         8zRMIh238bogTBeq2pqbrDTo+VwCCgHGOgYOdyi37I1s/6xRN49/tdlM/pYbbT+WiWMj
         uhlQ==
X-Gm-Message-State: APjAAAUqYFEol0IrhsSAIGUUZgpyCBpqV+B3mAy7c07NIE9wsWFIAPb4
        GF9x1xpYVENT+n8YLIyd5MF6Pw==
X-Google-Smtp-Source: APXvYqyNCsBoBb6b0+/VFgEFHT6BCXMQhc38kBy0a5iYr3sUoeSElD5NnXUq55ySz//tov60JWmR9g==
X-Received: by 2002:a17:906:229b:: with SMTP id p27mr5692899eja.21.1578500248323;
        Wed, 08 Jan 2020 08:17:28 -0800 (PST)
Received: from [192.168.27.209] ([37.157.136.193])
        by smtp.googlemail.com with ESMTPSA id dn12sm89884edb.89.2020.01.08.08.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2020 08:17:27 -0800 (PST)
Subject: Re: [PATCH v4 06/12] dt-bindings: media: venus: Convert msm8916 to DT
 schema
To:     Rob Herring <robh@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        dikshita@codeaurora.org
References: <20200106154929.4331-1-stanimir.varbanov@linaro.org>
 <20200106154929.4331-7-stanimir.varbanov@linaro.org>
 <20200106220414.GA10744@bogus>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <a224bad9-2eee-a906-80ba-573c1525afb1@linaro.org>
Date:   Wed, 8 Jan 2020 18:17:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200106220414.GA10744@bogus>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob,

Thanks for the review!

On 1/7/20 12:04 AM, Rob Herring wrote:
> On Mon,  6 Jan 2020 17:49:23 +0200, Stanimir Varbanov wrote:
>> Convert qcom,msm8916-venus Venus binding to DT schema
>>
>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> ---
>>  .../bindings/media/qcom,msm8916-venus.yaml    | 119 ++++++++++++++++++
>>  1 file changed, 119 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
>>
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 

I guess you are agree with merging dt-binding patches from this series
through linux-media tree, right?

-- 
regards,
Stan
