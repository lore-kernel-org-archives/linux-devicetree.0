Return-Path: <SRS0=kwC1=3S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 204C6C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jan 2020 16:16:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DEB1120720
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jan 2020 16:16:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmmShzgt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbgA2QQv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Jan 2020 11:16:51 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:44232 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726715AbgA2QQv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 29 Jan 2020 11:16:51 -0500
Received: by mail-lf1-f65.google.com with SMTP id v201so57428lfa.11;
        Wed, 29 Jan 2020 08:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ok8Ji8SqnJ445zZBSASQHbGoPp4FTjkHx85GL6b9wuI=;
        b=cmmShzgtfQJkGQNr6q5LeLI2k8hMvzEBNcvLq2aGp4vccimkfgnyL9aIAO7+W2E+H6
         Zq2QCvbi3FgWxwSyvvOz/oLvCzabm5cTIKTA93RMkzEubAUFKb0VBz2NiVxo1fE4vUd6
         5P/3henEH/HA6OvIN4EA4pF4bigepVZo6cB0yQfUtmXGezANdFZYEW9/XMuRQFB9z6tv
         lx/2uOpZbWRVP/urEisTj07R5hnuAY9wSxGaoglfgJ/4HdemudP9515jaE+VsYn6WXTx
         T/9nPfiY1r7VHqd3cWfq2Dqjwnxz7mUjWqjfd/LJzR/vQrTwCUNDikkTuQF9X13jW3u7
         ZlBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ok8Ji8SqnJ445zZBSASQHbGoPp4FTjkHx85GL6b9wuI=;
        b=sPj2jGi50iiHJ22UKxh7DJG0uPLsDcy2WKr+wlisGjgihzIDo/XHjCdbUl9p6fSgFh
         8LKqwRKEMpeFbNMgr7XEWhQchu27mhD8ER0cdqyCJtKWXYy1OFOm1MljDqtFZJpP6H81
         5YaxyDY+egUdSzCNn9pmPY3r886y1FxY8Ah0tLgAzI4czVXewpyupSn96uLk/XCBf8Wp
         in2KEy/E+fhInXe16Ht8QN47L1IE36AS+N/qUT9p4OYx06f2SpsKFp+wP5QeFKHNkw7w
         hDsu+Z59YiMP+iAGHGCT6OwAhgYiJu7tTwd5acurwFtMtAGc7rgFwMpNisLoK7D/grW4
         Bkew==
X-Gm-Message-State: APjAAAWpQXTjPqCyQ+yzYJGXhbLw03Z04oW08Lp2vONge8lvK390WIZ/
        Zr31ivR5Fwh1SqmriSaA1RTRvyS2
X-Google-Smtp-Source: APXvYqy8G1MXLOIC0kplXoL51g1VYStBeAb3j5Ma85aHR2fXk3IHsw6FQNYfBOXqrDCjbd1ZiJjQjQ==
X-Received: by 2002:a19:c697:: with SMTP id w145mr67524lff.54.1580314608198;
        Wed, 29 Jan 2020 08:16:48 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id 11sm1237336lju.103.2020.01.29.08.16.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2020 08:16:47 -0800 (PST)
Subject: Re: [RFC 2/2] dt-bindings: firmware: tegra186-bpmp: Document
 interconnects property
To:     Georgi Djakov <georgi.djakov@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
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
 <0b8692ab-4e06-b277-bbe2-93922e47c2f6@gmail.com>
 <7db91ca2-6ef7-7161-6ec9-f69a8d8d8a34@linaro.org>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <cb1edcc5-b6c5-8d78-8273-9a29b3b35a7a@gmail.com>
Date:   Wed, 29 Jan 2020 19:16:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <7db91ca2-6ef7-7161-6ec9-f69a8d8d8a34@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

29.01.2020 19:13, Georgi Djakov пишет:
> On 1/29/20 18:02, Dmitry Osipenko wrote:
>> 29.01.2020 12:36, Thierry Reding пишет:
>>> On Tue, Jan 28, 2020 at 10:27:00PM +0300, Dmitry Osipenko wrote:
>>>> 27.01.2020 15:21, Thierry Reding пишет:
>>>>> On Tue, Jan 21, 2020 at 11:12:11PM +0300, Dmitry Osipenko wrote:
>>>>>> 21.01.2020 18:54, Thierry Reding пишет:
>>>>>>> On Tue, Jan 21, 2020 at 05:18:43PM +0200, Georgi Djakov wrote:
>>>>>>>> On 1/21/20 16:10, Thierry Reding wrote:
>>>>> [...]
>>>>>>>>> I'm not sure if that TEGRA_ICC_EMEM makes a lot of sense. It's always
>>>>>>>>> going to be the same and it's arbitrarily defined, so it's effectively
>>>>>>>>> useless. But other than that it looks good.
>>>>>>>>
>>>>>>>> Well, in most cases the target would be the EMEM, so that's fine. I have seen
>>>>>>>> that other vendors that may have an additional internal memory, especially
>>>>>>>> dedicated to some DSPs and in such cases the bandwidth needs are different for
>>>>>>>> the two paths (to internal memory and DDR).
>>>>>>>
>>>>>>> Most chips have a small internal memory that can be used, though it
>>>>>>> seldomly is. However, in that case I would expect the target to be a
>>>>>>> completely different device, so it'd look more like this:
>>>>>>>
>>>>>>> 	interconnects = <&mc TEGRA186_MEMORY_CLIENT_BPMPR &iram>,
>>>>>>> 			...;
>>>>>>>
>>>>>>> I don't think EMEM has any "downstream" other than external memory.
>>>>>>
>>>>>> The node ID should be mandatory in terms of interconnect, even if it's a
>>>>>> single node. EMC (provider) != EMEM (endpoint).
>>>>>
>>>>> I don't understand why. An ID only makes sense if you've got multiple
>>>>> endpoints. For example, a regulator is a provider with a single endpoint
>>>>> so we don't specify an ID.
>>>>
>>>> Because this is how ICC binding is defined, unless I'm missing something.
>>>
>>> I don't think so. It's defined as "pairs of phandles and interconnect
>>> provider specifiers", which is equivalent to what pretty much all of the
>>> resource bindings define. The #interconnect-cells property defines the
>>> number of cells used for the specifier. In the normal case this would be
>>> 1, and the value of the one cell would be the ID of the endpoint. But if
>>> there's only a single endpoint, it's customary to set the number of
>>> cells to 0, in which case only the phandle is required.
>>
>> Right, setting interconnect-cells=0 should work. I'll give it a try,
>> thank you!
> 
> Yes, it's fine to have #interconnect-cells = <0>. Here is a patch [1] which is a
> bit related to this.
> 
> Thanks,
> Georgi
> 
> [1] https://patchwork.kernel.org/patch/11305295/

Georgi, thank you very much! This patch will be handy!
