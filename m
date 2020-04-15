Return-Path: <SRS0=bvxT=57=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D393AC2BB85
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 08:46:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF0AE2078A
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 08:46:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F3qihdN+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2894959AbgDOIqW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Apr 2020 04:46:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2894947AbgDOIqJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 15 Apr 2020 04:46:09 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DCC9C061A0E
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2020 01:46:09 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id i10so18088910wrv.10
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2020 01:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lb3moszYSo2LYaFHhhjcM4cay/uCeXv+Lh9QwOM6xww=;
        b=F3qihdN+hdMsdaequFznceWvdWp2yRYp6M0u/gv/QPRYwCuF2F2BEBTam/Ubmu2DiB
         kQ2LjUBrvbB+hZ2Jj1eu4mFZ8lgMGCOHya0X7hcjtf2QIDKHwMw0QARNb0d9qPXd+H4I
         KzgFFFraGgC73Dd8b8TRiZAIG+0uejxT3AGlQH/8z+9cTcMJoqQAB/+D9Fwl/9kgWGgM
         pbIPOW14C/NSHaQOOIT46SiQp5B1gjfncnD/JwBI5gQngJ/wO4Hun+WdyU+9z+ggwde4
         ix0LeV+ClcRiv6mtmh4ZHgkbvoB3cWAPQNo0I+1y8hu2CnRhT0BLqu3NhQUbKAcDcgEP
         zRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lb3moszYSo2LYaFHhhjcM4cay/uCeXv+Lh9QwOM6xww=;
        b=GwDnxnaF+lM5dtguSVMQF2+ph7mOkPCnOydlfvBFVUptVUYdv/AqqcrtO8o+ZWhlSu
         7ccAY6vsxL/mUiizluRm5KOXVvCqHdKu0LyMK8LF0rmIjAHhqNA0WhStB3ACG7XZXxYj
         rRobtf+x0b4exMOVdzi0jbnrLJMTXZdoF/hUGVWr1CdUrAltukSO4YRmv8LCvHGkkDY9
         OA8863nu7ekwoVfERRmm8SrzYUmNLFBkrrV4T4M8GiiEHZsafYXjWIZiOBqQlTvqXTya
         fo445Xbbxm8b2R4GuRsZSmq5Xv07djVs1B9CpWL53Y5H0j59/ZL8M9DIOAerNECtt51+
         x/qA==
X-Gm-Message-State: AGi0PubcOc9SqGa6rtQii8tX8f3uSotymGSPWnUaPgFNrnNaZxfF0hRh
        UL3u+M8+U02fpa432nUI+ewlxA==
X-Google-Smtp-Source: APiQypJX2Hn8rvIm/Bda14cICmCTQkvC79OqyYyl28y3z6WA9exR5415whsbX7Vr7wHEoZBySMlD3g==
X-Received: by 2002:adf:ce0a:: with SMTP id p10mr12446654wrn.89.1586940368320;
        Wed, 15 Apr 2020 01:46:08 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id n124sm22480815wma.11.2020.04.15.01.46.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Apr 2020 01:46:07 -0700 (PDT)
Subject: Re: [PATCH v2] nvmem: core: don't consider subnodes not matching
 binding
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc:     devicetree@vger.kernel.org, Christian Eggers <CEggers@arri.de>,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de
References: <20200323152850.32657-1-a.fatoum@pengutronix.de>
 <d59007d1-f4e3-f550-cecd-64b788a534bc@linaro.org>
 <bb0dcf33-f67d-7078-9341-08282d8da217@pengutronix.de>
 <4e861088-c17d-0eca-6efa-c50b55fdecd1@pengutronix.de>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <d0dc571f-4faf-f75c-1388-d1fab10f4aa8@linaro.org>
Date:   Wed, 15 Apr 2020 09:46:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4e861088-c17d-0eca-6efa-c50b55fdecd1@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 15/04/2020 09:05, Ahmad Fatoum wrote:
>> - If the cell has a compatible node, it must be "nvmem-cell".
>>    Otherwise, a cell with a compatible node is skipped.
>>
This one sounds more sensible!
If we go this way, it needs to be properly documented in the bindings too.


>> - Adding a nvmem cell container with a compatible and making support for
>>    the old binding configurable

Older bindings should be still supported but we should encourage to use 
compatible string for new additions.

>>
>> - Skipping cells that are malformed and lack a reg = < > property_without_
>>    error
Currently we only support Offset and Size with address cell and size 
cells of 1. Adding an extra check here to see if its malformed makes 
sense too!


Thanks,
srini

> gentle ping. I can prepare another patch if you indicate which approach
> you'd prefer.
> 
