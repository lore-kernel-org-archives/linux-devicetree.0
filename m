Return-Path: <SRS0=5/ta=3R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8AE7C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jan 2020 19:27:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A7B8C24681
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jan 2020 19:27:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDDtF7Ax"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbgA1T1H (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Jan 2020 14:27:07 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33219 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbgA1T1G (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 28 Jan 2020 14:27:06 -0500
Received: by mail-wr1-f66.google.com with SMTP id b6so17451434wrq.0;
        Tue, 28 Jan 2020 11:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KK/QnJQ2fTtitcD/Jlhct9mxdOBq9GtY24agm/Esizs=;
        b=HDDtF7AxzmxL1U08amAIlwJIsuf022cxEsf4H58+kzIQfNiq9MjCZEUGUWAvhVxsSB
         0KIWmMDegOHCzBgNErWmiqZK2v2+iJd8L82bHyyyLujkB4XH6OzeuNeiTSxl9PnOXAo9
         Y7Fg8urcYCHv6evxA9FLKWK8NLQlwL6/ehLjGeF2o0umQZbT1eDjWfeSUs2bP5aY8E9k
         KkMKsCjzscF/MOWX0jx06syj67haFqfxQsYWq3VL4KuSa78JpApyKKlMVZRn0cVFips4
         3FwgGwSaTH5J/QPb9Gra/wBfC1bkmC+Yzd58uCwGfpD6mvpXsfPA9iSJcnRbGBJpnQrx
         zboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KK/QnJQ2fTtitcD/Jlhct9mxdOBq9GtY24agm/Esizs=;
        b=MriyGsjzGcE4F84B37xT0/GI8gldbzFH8pUNygNLTh2NTZtDNfsfvzEvXGtJQ6PIUi
         TmvZUd1ERuDQOEOkVSmmuHPEGj1yw6qlgr7isBEygcBE7/qRTVkpRmRHg/dxxmOoGC5F
         LpNPDaK/YfmNQOlmFnh5PpFclWKOFF0vP1uA/KeauwcMrmhbUUWM0yGvb0O/KO+BW1zI
         LI1+ERoq/mdR8oWdRbaz0+4adBB0wUUojp4Yha67WdQJ914E9nloxwU+l2WnmhNttfDA
         eo18CdHP/qBfsm8z4d7k30MKhVxt/zkgDzz41hKmTbloqYm6B5d2d5AvC/eKhPBRBYKh
         2F3A==
X-Gm-Message-State: APjAAAVJmcUaWJ1ZJ+fmuLrXfKF6KYFFNjYcTryggM2cT4GfoD1fpQMg
        4LK9KxpAn/sT/Q6V/jwop1pNwkS8
X-Google-Smtp-Source: APXvYqx5m170iRufjPc2mVY7Xx7GWanphGcDIIm3dLvW8z9KtviLBhCVcEfhR4a95rJb9Dv80fV9Mw==
X-Received: by 2002:adf:fe90:: with SMTP id l16mr30097175wrr.265.1580239624453;
        Tue, 28 Jan 2020 11:27:04 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id w7sm4032148wmi.9.2020.01.28.11.27.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2020 11:27:03 -0800 (PST)
Subject: Re: [RFC 2/2] dt-bindings: firmware: tegra186-bpmp: Document
 interconnects property
To:     Thierry Reding <thierry.reding@gmail.com>,
        Georgi Djakov <georgi.djakov@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20200114181519.3402385-1-thierry.reding@gmail.com>
 <20200114181519.3402385-2-thierry.reding@gmail.com>
 <7aefac6c-092c-b5a6-2fa6-e283d2147fc3@linaro.org>
 <20200120150605.GA712203@ulmo>
 <57c37b3c-1473-d444-db59-8c6650241188@gmail.com>
 <20200121141027.GE899558@ulmo>
 <83d94918-bc01-131b-924c-9750767d3b29@linaro.org>
 <20200121155432.GA912205@ulmo>
 <ffc22502-0e7e-522c-543d-0e74cc25f4b1@gmail.com>
 <20200127122115.GA2117209@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d56618e1-8940-65ae-381e-796e44bcf537@gmail.com>
Date:   Tue, 28 Jan 2020 22:27:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200127122115.GA2117209@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

27.01.2020 15:21, Thierry Reding пишет:
> On Tue, Jan 21, 2020 at 11:12:11PM +0300, Dmitry Osipenko wrote:
>> 21.01.2020 18:54, Thierry Reding пишет:
>>> On Tue, Jan 21, 2020 at 05:18:43PM +0200, Georgi Djakov wrote:
>>>> On 1/21/20 16:10, Thierry Reding wrote:
> [...]
>>>>> I'm not sure if that TEGRA_ICC_EMEM makes a lot of sense. It's always
>>>>> going to be the same and it's arbitrarily defined, so it's effectively
>>>>> useless. But other than that it looks good.
>>>>
>>>> Well, in most cases the target would be the EMEM, so that's fine. I have seen
>>>> that other vendors that may have an additional internal memory, especially
>>>> dedicated to some DSPs and in such cases the bandwidth needs are different for
>>>> the two paths (to internal memory and DDR).
>>>
>>> Most chips have a small internal memory that can be used, though it
>>> seldomly is. However, in that case I would expect the target to be a
>>> completely different device, so it'd look more like this:
>>>
>>> 	interconnects = <&mc TEGRA186_MEMORY_CLIENT_BPMPR &iram>,
>>> 			...;
>>>
>>> I don't think EMEM has any "downstream" other than external memory.
>>
>> The node ID should be mandatory in terms of interconnect, even if it's a
>> single node. EMC (provider) != EMEM (endpoint).
> 
> I don't understand why. An ID only makes sense if you've got multiple
> endpoints. For example, a regulator is a provider with a single endpoint
> so we don't specify an ID.

Because this is how ICC binding is defined, unless I'm missing something.

> By its very definition an ID is used to identify something and we use it
> with a phandle to create a unique pair that identifies a resource within
> whatever the phandle represents, with the goal to differentiate it from
> other resources within the same provider. However, if there's only one
> such resource, the ID becomes redundant because the phandle without an
> ID is already unique and there's no need to differentiate with an extra
> ID.

Georgi, do you think it is possible to support what Thierry is asking for?
