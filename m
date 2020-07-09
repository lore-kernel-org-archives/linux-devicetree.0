Return-Path: <SRS0=ioLT=AU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 255BCC433E0
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 10:08:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F29BA2074B
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 10:08:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qn/Yqd4s"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbgGIKIH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jul 2020 06:08:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726315AbgGIKIH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Jul 2020 06:08:07 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0FC9C08C5CE
        for <devicetree@vger.kernel.org>; Thu,  9 Jul 2020 03:08:06 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id o11so1701316wrv.9
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2020 03:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=JjKVHO1k5x52mPl9MQPkeK0c6PmSLam18blFZkKOw/o=;
        b=Qn/Yqd4sMNB1Dt3OO0i55SPIfFAoJlwYB8ZQBscEDiY6iVKMZLcUhWVYnovxjTSkOi
         MVe6Ix2mUDb3Sxfgt+fL+u/h8xnSpfc7WjdzTz/YaImys+o8IOxRIcalTZCMonT9JiNU
         d4EkZ48hD0Srbjk62AUGu/4atgEaJjCLQPQ08nM5bWHGnVh7z8b87aVmhfFgXHJidVJa
         R8/ke1nR45bLvZf7o0A+Qq8RK3/dpCJDHNUD7+19cIRKx5OkW3mln8yAf//JVais7LtZ
         ziGYMXsSjPuXi9ERpNeDO6yEwtldJlV4P2LVn2czFZ2HWwKlzF2yC64Ly0XbOF4sw5Zw
         NEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JjKVHO1k5x52mPl9MQPkeK0c6PmSLam18blFZkKOw/o=;
        b=cOfk4Z+eNq9KucTtXyaWhTkiehXorY60LU1vBZDv3vUfrd850bwjTxl2lWov3n81tr
         x9NTTRwtpJwf1548tMQCC8ECkwL8pgoGN7Q4uaUZj9leJGAJlbeyhiBraOEeWDt0r/l7
         wlvti+nAhlSCaNMNdPBPSnJ2ioMNl+EHnF3hkFFWgDsc5Cliy+qilRzYDLqk8zJ+B2a7
         zSfbTg9V1+yU2h4ZY4DrIH5x5SI8t6W/cX3SGFzMr3FvPkpAkbFdUuKCfLfQF4VSuzgW
         wQidO2kC9It+VuLlIRSGU79TbOiLRmwG3tJaYaPjj16/xjrFyqkrgIe7knXwRZgdtl6m
         64KA==
X-Gm-Message-State: AOAM532PxM35lyQ8pe9ASfF4xoi3QpCKn8YWICI82f9xrtvSpBcgBt/i
        aEoWbgNHEpkUzPUTiJVD+y55AA==
X-Google-Smtp-Source: ABdhPJzsyr80M22TsA9o73abnx9q/28mo6g8jAZPiIIkKycC86esPT4I01tjiaBvuW/qUrs/Pt+xmg==
X-Received: by 2002:adf:9524:: with SMTP id 33mr61596613wrs.156.1594289285409;
        Thu, 09 Jul 2020 03:08:05 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id p14sm5216290wrj.14.2020.07.09.03.08.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Jul 2020 03:08:04 -0700 (PDT)
Subject: Re: [PATCH v3 6/8] dt-bindings: sound: lpass-cpu: Add sc7180 lpass
 cpu node
To:     Rohit Kumar <rohitkr@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1594184896-10629-1-git-send-email-rohitkr@codeaurora.org>
 <1594184896-10629-7-git-send-email-rohitkr@codeaurora.org>
 <6b6b0e38-9c04-e065-8a43-ccfec260d60c@linaro.org>
 <430e0d24-c5c2-84ec-fe7b-b6b27192666d@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <de07f84b-40bc-d9ae-932d-623a5e8341e2@linaro.org>
Date:   Thu, 9 Jul 2020 11:08:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <430e0d24-c5c2-84ec-fe7b-b6b27192666d@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 09/07/2020 11:01, Rohit Kumar wrote:
> 
> On 7/9/2020 2:57 PM, Srinivas Kandagatla wrote:
>>
>>
>> On 08/07/2020 06:08, Rohit kumar wrote:
>>> Add dt-bindings to support "qcom,lpass-cpu-sc7180" node.
>>>
>>> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
>>> ---
>>>   Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt 
>>> b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>>> index 32c2cdb..04e34cc 100644
>>> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>>> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>>> @@ -4,7 +4,8 @@ This node models the Qualcomm Technologies Low-Power 
>>> Audio SubSystem (LPASS).
>>>     Required properties:
>>>   -- compatible        : "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu"
>>> +- compatible        : "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu" or
>>> +              "qcom,lpass-cpu-sc7180"
>>>   - clocks        : Must contain an entry for each entry in clock-names.
>>>   - clock-names        : A list which must include the following 
>>> entries:
>>>                   * "ahbix-clk"
>>
>> Can you also list the clocks that are mandatory for this SoC.
>>
>> --srini
>>
> Will it be fine if I update it in patch 8 only where we have moved to 
> yaml format?
> 
May be reverse the order, Convert to Yaml first and then add sc7180!

--srini
> Thanks,
> 
> Rohit
> 
>>
>>>
