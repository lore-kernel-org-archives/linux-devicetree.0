Return-Path: <SRS0=ioLT=AU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C83C0C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 09:26:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C78B206A1
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 09:26:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O7MDbSYz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbgGIJ0r (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jul 2020 05:26:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbgGIJ0p (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Jul 2020 05:26:45 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B441FC061A0B
        for <devicetree@vger.kernel.org>; Thu,  9 Jul 2020 02:26:44 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id a6so5827519wmm.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2020 02:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:subject:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=APNj3GH7SrabYcEbM6zu61jJ3pHiq7qsRHWWCs2umoo=;
        b=O7MDbSYzWGIlCaFtrOHXfNKetcTFX1AW9XD+/fzkTl8NVLoxj095nAGoucA8OJnDJU
         Zm/uWAu5mingySdpmLF4k89X7Vsdj5aEMi2ceiyM0xBOb4jj2XY15fvY+mRdzGuX6iJP
         pvCPPbzegHlqAealEJJlgXcmpC25RyB9orMrDTIspKgpE6ftC67lHDNXcTtXRJ1euK4j
         HI4RjLBOyxDgw8aMO2lRN4BmY0N2t9wgyfQfmdBfgeCs8bu/vYvjS78tisAWHY+RthJz
         Td9Ipg3cvGs/bzD5zWXtlsd+NG/zvR33hcIoyW9s16Hl0mLeLvVPLvWRwd/zwBgDiDd/
         2ILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=APNj3GH7SrabYcEbM6zu61jJ3pHiq7qsRHWWCs2umoo=;
        b=FxEijDNtXfY+14r3FlPxunI/8F6QkL30n4GviagwI3P3je/VxjCplxBPQnOJZHbQ62
         jZeZOGzatMM4oRrmYCd1+qTwuGgMc8c+gUb4qhiahoaAoDA/Ip96f8KfQgr9NOXsOt+k
         wcEiGBInvh5YkpAmTl1Zne9dWRo2oiNgeBjVWJ0YcLHt9OGa78zOyLDpWgV3dXcvRL5q
         lD1OVpmVruR1xFi5UZM+F9uIfSHav5GRygclsSGyXCgypbtPi2YwD7scibs4WKOGGeKq
         CUqOqyonBt/fogG9x5qyguzmmFuMCE8n+ySmSXZ8U4NYSXVfOdsRZEle7x840grzRcqc
         ykTw==
X-Gm-Message-State: AOAM533OW+bdCqTahdGHN39bR5nVFNEeQgYfp0OI8hHhd1FHvpTqH4U5
        JzL7s/m7H7q1FS+brBPop+xqoA==
X-Google-Smtp-Source: ABdhPJwnQpg9nhUUvpf38ZMNkjv6EHAR8fOG/O494veiFS1mA+NS7MTvp9pVE9MP+AVMlD4JyLMohg==
X-Received: by 2002:a05:600c:2219:: with SMTP id z25mr14249418wml.154.1594286803124;
        Thu, 09 Jul 2020 02:26:43 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id 26sm3725194wmj.25.2020.07.09.02.26.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Jul 2020 02:26:42 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 2/8] ASoC: qcom: lpass-cpu: Move ahbix clk to platform
 specific function
To:     Rohit kumar <rohitkr@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1594184896-10629-1-git-send-email-rohitkr@codeaurora.org>
 <1594184896-10629-3-git-send-email-rohitkr@codeaurora.org>
Message-ID: <f50135bd-18e5-6a1e-0b39-d0cf51b05cc4@linaro.org>
Date:   Thu, 9 Jul 2020 10:26:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1594184896-10629-3-git-send-email-rohitkr@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 08/07/2020 06:08, Rohit kumar wrote:
> Ahbix clock is optional clock and not needed for all platforms.
> Move it to lpass-apq8016/ipq806x as it is not needed for sc7180.
> 
> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
> ---
>   sound/soc/qcom/lpass-apq8016.c | 27 ++++++++++++++++++++++++++
>   sound/soc/qcom/lpass-cpu.c     | 40 ++++++++++-----------------------------
>   sound/soc/qcom/lpass-ipq806x.c | 43 ++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 80 insertions(+), 30 deletions(-)
> 

LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

