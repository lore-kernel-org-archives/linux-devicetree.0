Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00F94C432C0
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 17:09:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C4D0D20675
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 17:09:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zJPRWJCQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbfLCRJu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Dec 2019 12:09:50 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:41394 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbfLCRJu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Dec 2019 12:09:50 -0500
Received: by mail-qt1-f193.google.com with SMTP id v2so4493897qtv.8
        for <devicetree@vger.kernel.org>; Tue, 03 Dec 2019 09:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=01XTZm3AS7koka7w5jivDQ2JG2pQ51gmspKmJxBqM1Q=;
        b=zJPRWJCQ9gSKKHtNoQkPpkVhPb6G6MprpMmhaSzr6kW4vteKLinPQTkgn9416FJR69
         5lV9+1PlE7XPHwUgdc3JuwuwuZvFSTrGcqQjeYO4B2EHn5o42yH79D91//r/DHMnYHjE
         p0sxOGpehEgghxcN3sWqp0qnnfvr8q1HOAsQNWL3Ni4U0Q27bRl6xGlxGD22EBtadzDN
         njofEhekijY8AqIt+naPajyVpehpTo7eElacvXb636tGr/odwDcpVtXcCIxFcDZs7Sj8
         zd9+xfqnP5ZIfrnOs0Ra4M6KZM1gVOuXjIayqFfAmY0W2fkycELAp2a4uSvbtYRbdMxN
         v8OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=01XTZm3AS7koka7w5jivDQ2JG2pQ51gmspKmJxBqM1Q=;
        b=rh5Q25PhFXyLrDW1eAmeCkFV/FkcgVBpx/EhXGgNJzn0C0e12iYn9RIp0t32nJYn4Q
         m17MeTTtl+kYlYI8FhShJoqxQdDpZUj6Mc7NZzrk4Oh0WrK1pvskT8epCbEbMURVfMOW
         idV/tx0A7GCZcH5ZCCjcLxcwS97csSxsxfCKgW1dS64RBx1qKSpOQ/el0HkRo9qhRby2
         MGz9BBcYvfZzLi4saXWWKpYvWDAY6zCkxaPK3aj6M/4TQHDy8MD9m9/mAeTT6vfMZ1v3
         FdSzNlEk4jvrrQCn7aaZxn47n9bRUvBxKlu6lqNgVpMpi2PqSo1/BC09T6yWZTr5qZoW
         DV5Q==
X-Gm-Message-State: APjAAAWCFgltbfm34Ys4sKGnpXsshsqRAlJAGcjX6B/43nVxSARa9Uk4
        0+ZB1aDpHqy8rDW7ME5VagG51w==
X-Google-Smtp-Source: APXvYqxswEP7BWTESkF+xDQwJvwSyualWlw2Wic9gRROnndJ/Dzzf7wxni2jTzryB5DqNqTh3dTqYA==
X-Received: by 2002:ac8:47cc:: with SMTP id d12mr5995726qtr.246.1575392988911;
        Tue, 03 Dec 2019 09:09:48 -0800 (PST)
Received: from [192.168.1.169] (pool-71-255-246-27.washdc.fios.verizon.net. [71.255.246.27])
        by smtp.gmail.com with ESMTPSA id s189sm2058727qke.41.2019.12.03.09.09.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Dec 2019 09:09:48 -0800 (PST)
Subject: Re: [PATCH v3 3/7] thermal: core: Add late init hook to cooling
 device ops
To:     Amit Kucheria <amit.kucheria@verdurent.com>
References: <1571254641-13626-1-git-send-email-thara.gopinath@linaro.org>
 <1571254641-13626-4-git-send-email-thara.gopinath@linaro.org>
 <CAHLCerOCt9VBizAHu+y+CmzFmz-ktqCJgcB_NeC3WC4W9YBvAQ@mail.gmail.com>
Cc:     Eduardo Valentin <edubezval@gmail.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Linux PM list <linux-pm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <5DE696DB.7020308@linaro.org>
Date:   Tue, 3 Dec 2019 12:09:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAHLCerOCt9VBizAHu+y+CmzFmz-ktqCJgcB_NeC3WC4W9YBvAQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 12/03/2019 12:04 PM, Amit Kucheria wrote:
> On Thu, Oct 17, 2019 at 1:07 AM Thara Gopinath
> <thara.gopinath@linaro.org> wrote:
>>
>> Add a hook in thermal_cooling_device_ops to be called after
>> the cooling device has been initialized and registered
>> but before binding it to a thermal zone.
>>
>> In this patch series it is used to hook up a power domain
>> to the device pointer of cooling device.
>>
>> It can be used for any other relevant late initializations
>> of a cooling device as well.
> 
> Please describe WHY this hook is needed.
Hi Amit,

Thanks for the review. This patch is no longer relevant.
I had posted a v4 of this series based on other review comments[1]

1. https://lkml.org/lkml/2019/11/20/355

-- 
Warm Regards
Thara
