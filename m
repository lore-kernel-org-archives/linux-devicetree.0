Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30E56C43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 14:21:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E9EF2206C3
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 14:21:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WkfdIhga"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729614AbfLLOVL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Dec 2019 09:21:11 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38443 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729597AbfLLOVL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 12 Dec 2019 09:21:11 -0500
Received: by mail-lf1-f65.google.com with SMTP id r14so1843685lfm.5;
        Thu, 12 Dec 2019 06:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fPdLaS98BnYYlPHOQgsT45YcBODksgKJiMhSSAO42YU=;
        b=WkfdIhgaOrZVv1nYC0iXgxp5ezUR5OQ3mxZR7Fwbs6d5ZFPYFuz8WvGLUzQ2c361ux
         urnTQxJdNnbxo0yH4kDjQhXJZ/DJatc19XGER1IpewAOj9S4S/+bMeroJd90HD6jRQIM
         QCAQKFmsGUyeAgte6WmR+3o4Icnw0kAUhu02NNZyTeezcWTn8FrfxXDqlCkP6nDVKFPW
         CddQbcmGhOPhcVWHrHXdRaG9voqrRrcv3HYEYOVBU9yPqWaqYpbGTbo8uac7An1Jf2NW
         CEZNStjj1Hs2r/KEYlmB7JPfcDQjz4+7ywmoks6sBnvbPipkDBgyboTGtZ2yfVBnJBRg
         xvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fPdLaS98BnYYlPHOQgsT45YcBODksgKJiMhSSAO42YU=;
        b=SdONGcXyXwq9/ANnVD+BoupbqAh6rXH51acbBUD5DeQxzqpTBZA7E6udLvyjsqAGaO
         9tRiax3y98mNXDfsbfypFmerA3h2ee6xHdUhNfEoX6EKs7VZvx2Od2CbhwWT6hKcgCYW
         UILdi8Wv9cc4XLOe+wTlXrSRf+u4FcX4PpdD9EI25u+MFB64rgcAyUOs/Dlpx9C8Fj5C
         ZDv49U387Z8srKB0JFpPJUa0pIu+6bhhqDOICSa45ScxqbTyHKYgnioLmKo5rnZUOxo7
         o1lbA2QEF6VDX9wmyPlSTqNxUJ7SPERQJv1mp7LWCKEBGWuTyyteyRCg0dJ+YsvbQBBj
         RL7Q==
X-Gm-Message-State: APjAAAU0S9Uh132ZcB37PeGUX247Q6qoAE7fZanoinM+CLHvS4EPKUPv
        Fr53+Vf7OGGNiVnp8BeeG6GIS5bA
X-Google-Smtp-Source: APXvYqzro6ophjFLphSmLxxdELI4uFq9CWKBObdnwB3lXmXHDJ/sGDzFMSVKBDvjoHPNNCzZreC32w==
X-Received: by 2002:a19:c210:: with SMTP id l16mr6126565lfc.35.1576160468283;
        Thu, 12 Dec 2019 06:21:08 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id t9sm2942671lfl.51.2019.12.12.06.21.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2019 06:21:07 -0800 (PST)
Subject: Re: [PATCH] dt-bindings: memory-controllers: tegra: Fix type
 references
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
References: <20191211163210.9778-1-robh@kernel.org>
 <099dcb4e-265c-7789-1b10-d8aa6f1d6922@gmail.com>
 <CAL_JsqL9d1kSxtHf-DKutnfmNK3Bsy1sFAqov1ugcgX30JJ0Rw@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <cd2430c2-863a-248a-7590-6d36b4040506@gmail.com>
Date:   Thu, 12 Dec 2019 17:21:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqL9d1kSxtHf-DKutnfmNK3Bsy1sFAqov1ugcgX30JJ0Rw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

12.12.2019 17:05, Rob Herring пишет:
> On Thu, Dec 12, 2019 at 7:36 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> 11.12.2019 19:32, Rob Herring пишет:
>>> Json-schema requires a $ref to be under an 'allOf' if there are
>>> additional constraints otherwise the additional constraints are
>>> ignored. (Note that this behavior will be changed in draft8.)
>>>
>>> Fixes: 641262f5e1ed ("dt-bindings: memory: Add binding for NVIDIA Tegra30 External Memory Controller")
>>> Fixes: 785685b7a106 ("dt-bindings: memory: Add binding for NVIDIA Tegra30 Memory Controller")
>>> Fixes: 8da65c377b21 ("dt-bindings: memory: tegra30: Convert to Tegra124 YAML")
>>> Cc: Dmitry Osipenko <digetx@gmail.com>
>>> Cc: Thierry Reding <treding@nvidia.com>
>>> Cc: Jonathan Hunter <jonathanh@nvidia.com>
>>> Cc: linux-tegra@vger.kernel.org
>>> Signed-off-by: Rob Herring <robh@kernel.org>
>>> ---
>>> I'll take this via the DT tree for rc2.
>>>
>>>  .../bindings/memory-controllers/nvidia,tegra124-mc.yaml  | 3 ++-
>>>  .../bindings/memory-controllers/nvidia,tegra30-emc.yaml  | 9 ++++++---
>>>  .../bindings/memory-controllers/nvidia,tegra30-mc.yaml   | 3 ++-
>>>  3 files changed, 10 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml
>>> index 30d9fb193d7f..22a94b6fdbde 100644
>>> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml
>>> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml
>>> @@ -60,7 +60,8 @@ patternProperties:
>>>              maximum: 1066000000
>>>
>>>            nvidia,emem-configuration:
>>> -            $ref: /schemas/types.yaml#/definitions/uint32-array
>>> +            allOf:
>>> +              - $ref: /schemas/types.yaml#/definitions/uint32-array
>>>              description: |
>>>                Values to be written to the EMEM register block. See section
>>>                "15.6.1 MC Registers" in the TRM.
>>> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
>>> index 7fe0ca14e324..e4135bac6957 100644
>>> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
>>> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
>>> @@ -56,7 +56,8 @@ patternProperties:
>>>              maximum: 900000000
>>>
>>>            nvidia,emc-auto-cal-interval:
>>> -            $ref: /schemas/types.yaml#/definitions/uint32
>>> +            allOf:
>>> +              - $ref: /schemas/types.yaml#/definitions/uint32
>>>              description:
>>>                Pad calibration interval in microseconds.
>>>              minimum: 0
>>> @@ -78,7 +79,8 @@ patternProperties:
>>>                Mode Register 0.
>>>
>>>            nvidia,emc-zcal-cnt-long:
>>> -            $ref: /schemas/types.yaml#/definitions/uint32
>>> +            allOf:
>>> +              - $ref: /schemas/types.yaml#/definitions/uint32
>>>              description:
>>>                Number of EMC clocks to wait before issuing any commands after
>>>                sending ZCAL_MRW_CMD.
>>> @@ -96,7 +98,8 @@ patternProperties:
>>>                FBIO "read" FIFO periodic resetting enabled.
>>>
>>>            nvidia,emc-configuration:
>>> -            $ref: /schemas/types.yaml#/definitions/uint32-array
>>> +            allOf:
>>> +              - $ref: /schemas/types.yaml#/definitions/uint32-array
>>>              description:
>>>                EMC timing characterization data. These are the registers
>>>                (see section "18.13.2 EMC Registers" in the TRM) whose values
>>> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.yaml
>>> index 84fd57bcf0dc..4b9196c83291 100644
>>> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.yaml
>>> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.yaml
>>> @@ -77,7 +77,8 @@ patternProperties:
>>>              maximum: 900000000
>>>
>>>            nvidia,emem-configuration:
>>> -            $ref: /schemas/types.yaml#/definitions/uint32-array
>>> +            allOf:
>>> +              - $ref: /schemas/types.yaml#/definitions/uint32-array
>>>              description: |
>>>                Values to be written to the EMEM register block. See section
>>>                "18.13.1 MC Registers" in the TRM.
>>>
>>
>> But the "nvidia,emem-configuration" doesn't have any extra constraints.
>> Or you just added the "allOf" for consistency to avoid possible future
>> copy-paste bugs?
> 
> It does have constraints. It has the 'items' list.

Right, I missed that array-size is also a constraint.

> Note that fixing it introduces an error which I'm in the process of
> fixing in the schema tool.

Okay!

>> Otherwise LGTM, thanks!
>>
>> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> 
> Thanks.
> 
> Rob
> 

