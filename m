Return-Path: <SRS0=kwC1=3S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 135B2C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jan 2020 16:02:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DAF4220732
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jan 2020 16:02:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pPhAuwVl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbgA2QCp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Jan 2020 11:02:45 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36290 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726564AbgA2QCp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 29 Jan 2020 11:02:45 -0500
Received: by mail-lj1-f196.google.com with SMTP id r19so19055372ljg.3;
        Wed, 29 Jan 2020 08:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=N+MKS0QqOJoA0eOJOaHUYlnBXvBICnO29YkZyoxX/PA=;
        b=pPhAuwVltDLZJ+6Kv/jCZXbXA8kCcd2CpwKY+7GrlENCYV4ioZ1u80TA84knH5Gkhx
         zgA83vfmPFB8JuDgrUT7qZGiCnC8odoxtEm+6mFMBaPe3+icq7mwt0Hkcy6qC178pu9m
         TdKvUpn+3VF+o5lH4/a4wBJghwg3ObfETdVXSywsolwLI4TgeDxnlx+N5gi3WYSQxf9g
         fg5+Mw7YGqr8I+Aahv6RN9OsZYR0uutN+E/CsumK0otoWuLIHr+nQdpCyOFaDlPdbOg3
         rDHZFz/oj5TyMrgXcc9+W8ZHNEQnG2o8G+xKYf31HRNSjB4WydW9rMJCV28U098+a7FZ
         KsxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=N+MKS0QqOJoA0eOJOaHUYlnBXvBICnO29YkZyoxX/PA=;
        b=ZLbKfPda4I0UOLy+tILjFtRshD5hJBgctLQH5mJSC+AXzMimDcDAROGnqyJrN4YJPC
         I9KQ9GTVHdXV4l8HvhW3UxHNUJ4t1vhgr/fl04XBRWz2Krb2hnnQpZhBltd6JxeDyqUX
         y+3X/0023lcOxc5Cv7wxUeK6F9ZLn5p0y6Slncl/xtonHT3TMbO0pXh6rTnTTj0JFEMJ
         Riq7Whs4Ed2hzhYfFUt4OBOhY8QgjoVkZTVf4EXZf2o1hpKDafwJ8y4553jPftv+nkdR
         LkPz8auR5QpLXbXR2L2cwIIb8mo/trtCMAnnHqi1VQaILTneDhh5vGBTZm2rtIovJQVD
         dY6A==
X-Gm-Message-State: APjAAAVqhpr2hrUYMTKz4SAmSq9VFySsSXX8FN4f1b3sZYI69Zfk83uV
        rdiBrudO10QFSq2omzkBXfvhhCCr
X-Google-Smtp-Source: APXvYqwl6vjvgK/AqMvdHTh2H7qiBUaVOVGyIwaBt+/7Nt3t41WQhwHmp2Pn0PZ4AgO2OMw/UWgjxQ==
X-Received: by 2002:a2e:99c5:: with SMTP id l5mr16328583ljj.88.1580313762448;
        Wed, 29 Jan 2020 08:02:42 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id a12sm1194349ljk.48.2020.01.29.08.02.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2020 08:02:41 -0800 (PST)
Subject: Re: [RFC 2/2] dt-bindings: firmware: tegra186-bpmp: Document
 interconnects property
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Georgi Djakov <georgi.djakov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20200114181519.3402385-2-thierry.reding@gmail.com>
 <7aefac6c-092c-b5a6-2fa6-e283d2147fc3@linaro.org>
 <20200120150605.GA712203@ulmo>
 <57c37b3c-1473-d444-db59-8c6650241188@gmail.com>
 <20200121141027.GE899558@ulmo>
 <83d94918-bc01-131b-924c-9750767d3b29@linaro.org>
 <20200121155432.GA912205@ulmo>
 <ffc22502-0e7e-522c-543d-0e74cc25f4b1@gmail.com>
 <20200127122115.GA2117209@ulmo>
 <d56618e1-8940-65ae-381e-796e44bcf537@gmail.com>
 <20200129093602.GC2479935@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0b8692ab-4e06-b277-bbe2-93922e47c2f6@gmail.com>
Date:   Wed, 29 Jan 2020 19:02:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200129093602.GC2479935@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

29.01.2020 12:36, Thierry Reding пишет:
> On Tue, Jan 28, 2020 at 10:27:00PM +0300, Dmitry Osipenko wrote:
>> 27.01.2020 15:21, Thierry Reding пишет:
>>> On Tue, Jan 21, 2020 at 11:12:11PM +0300, Dmitry Osipenko wrote:
>>>> 21.01.2020 18:54, Thierry Reding пишет:
>>>>> On Tue, Jan 21, 2020 at 05:18:43PM +0200, Georgi Djakov wrote:
>>>>>> On 1/21/20 16:10, Thierry Reding wrote:
>>> [...]
>>>>>>> I'm not sure if that TEGRA_ICC_EMEM makes a lot of sense. It's always
>>>>>>> going to be the same and it's arbitrarily defined, so it's effectively
>>>>>>> useless. But other than that it looks good.
>>>>>>
>>>>>> Well, in most cases the target would be the EMEM, so that's fine. I have seen
>>>>>> that other vendors that may have an additional internal memory, especially
>>>>>> dedicated to some DSPs and in such cases the bandwidth needs are different for
>>>>>> the two paths (to internal memory and DDR).
>>>>>
>>>>> Most chips have a small internal memory that can be used, though it
>>>>> seldomly is. However, in that case I would expect the target to be a
>>>>> completely different device, so it'd look more like this:
>>>>>
>>>>> 	interconnects = <&mc TEGRA186_MEMORY_CLIENT_BPMPR &iram>,
>>>>> 			...;
>>>>>
>>>>> I don't think EMEM has any "downstream" other than external memory.
>>>>
>>>> The node ID should be mandatory in terms of interconnect, even if it's a
>>>> single node. EMC (provider) != EMEM (endpoint).
>>>
>>> I don't understand why. An ID only makes sense if you've got multiple
>>> endpoints. For example, a regulator is a provider with a single endpoint
>>> so we don't specify an ID.
>>
>> Because this is how ICC binding is defined, unless I'm missing something.
> 
> I don't think so. It's defined as "pairs of phandles and interconnect
> provider specifiers", which is equivalent to what pretty much all of the
> resource bindings define. The #interconnect-cells property defines the
> number of cells used for the specifier. In the normal case this would be
> 1, and the value of the one cell would be the ID of the endpoint. But if
> there's only a single endpoint, it's customary to set the number of
> cells to 0, in which case only the phandle is required.

Right, setting interconnect-cells=0 should work. I'll give it a try,
thank you!
