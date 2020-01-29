Return-Path: <SRS0=kwC1=3S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96CA0C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jan 2020 16:13:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 612432071E
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jan 2020 16:13:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GC7xeucR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbgA2QN1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Jan 2020 11:13:27 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36166 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726733AbgA2QN0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 29 Jan 2020 11:13:26 -0500
Received: by mail-wm1-f66.google.com with SMTP id p17so396393wma.1
        for <devicetree@vger.kernel.org>; Wed, 29 Jan 2020 08:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sx7VfjRKYYg3FfbtNV7pcsNbEhGPpJfgFaN9AEMvdxI=;
        b=GC7xeucRLZOPweu3cjNmpKgNKCCbCSuEHRtmvbJISXk07GeZgBac0WKD0POJ5rps6d
         /m3+lhBGxDsqF097EEV5UgZAFUixv6+82OxEUS2idPa/04VN3/S9b8L55m6QVcTx3BoF
         Ize5Xxn9kTKE7HDw+n1yWAZ3ewJPtROLZXa57gBl9o0AmbwzE05fgUjdg77OP4f2Kaac
         WssWsY0vPK6qetXqjBNLGgZjVjRAdsxRSsdFytJJNbNNuzfGg1lD9YvPpbCjyv4+N3Dt
         w76DOeZ+GAGmt4LsB7QLCqgVF73IKcTAC4CUL3/PfDqi/Ys3ciM9tV0u6ggKNAXfv57p
         sBuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sx7VfjRKYYg3FfbtNV7pcsNbEhGPpJfgFaN9AEMvdxI=;
        b=EaNx5Pvk/Zhw1dZeOOpfOIhswl/3GLS510kfdSGsfREPq1okAyB6f4Dr4bEudvrkdd
         gc+hMGSO1KdTHCsGZf2ASfre+D5TQ5H7sjWvE7+xyr3k0tJHVFV7V4y4kz9+Buf4BI23
         /yNaIoAU3PGwGfwzdXekf0MVYQXdaD0JxYWbs99mEhWUkSDTQAClFYMP9KCzWg9MPKZ+
         q+AGME1EDeKvNkCO79Ndzb86P6Np3tYT8IRmn08iAuURqunsIES/X9qJhEjcF4eVuUS/
         rfTiV62bvCWq9JlIIOO7GosO+E9lRpcl69AHgbek4/w6oW5Zg0qYepvkJU3VnZlcGV7K
         SUCw==
X-Gm-Message-State: APjAAAVLenwEITFOngfJ+sVXX8CPGqTxGZpOL/4d8maTKCJDUCGrz+wY
        stxjGvzSd3+eSM9c6kyXsHJnaF8vaBs=
X-Google-Smtp-Source: APXvYqxBHO20mwdWMD9rvbsej//E6GMCMM3B7kJBumYJPpWCcp1E4U7/lyOOdzLL5PYJg+IcsS2caw==
X-Received: by 2002:a05:600c:2c53:: with SMTP id r19mr12336591wmg.39.1580314403528;
        Wed, 29 Jan 2020 08:13:23 -0800 (PST)
Received: from [10.44.66.8] ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id i16sm3010913wmb.36.2020.01.29.08.13.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Jan 2020 08:13:22 -0800 (PST)
Subject: Re: [RFC 2/2] dt-bindings: firmware: tegra186-bpmp: Document
 interconnects property
To:     Dmitry Osipenko <digetx@gmail.com>,
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
From:   Georgi Djakov <georgi.djakov@linaro.org>
Openpgp: preference=signencrypt
Autocrypt: addr=georgi.djakov@linaro.org; prefer-encrypt=mutual; keydata=
 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
 KEmKjLDvB0pePJkdTw==
Message-ID: <7db91ca2-6ef7-7161-6ec9-f69a8d8d8a34@linaro.org>
Date:   Wed, 29 Jan 2020 18:13:20 +0200
MIME-Version: 1.0
In-Reply-To: <0b8692ab-4e06-b277-bbe2-93922e47c2f6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 1/29/20 18:02, Dmitry Osipenko wrote:
> 29.01.2020 12:36, Thierry Reding пишет:
>> On Tue, Jan 28, 2020 at 10:27:00PM +0300, Dmitry Osipenko wrote:
>>> 27.01.2020 15:21, Thierry Reding пишет:
>>>> On Tue, Jan 21, 2020 at 11:12:11PM +0300, Dmitry Osipenko wrote:
>>>>> 21.01.2020 18:54, Thierry Reding пишет:
>>>>>> On Tue, Jan 21, 2020 at 05:18:43PM +0200, Georgi Djakov wrote:
>>>>>>> On 1/21/20 16:10, Thierry Reding wrote:
>>>> [...]
>>>>>>>> I'm not sure if that TEGRA_ICC_EMEM makes a lot of sense. It's always
>>>>>>>> going to be the same and it's arbitrarily defined, so it's effectively
>>>>>>>> useless. But other than that it looks good.
>>>>>>>
>>>>>>> Well, in most cases the target would be the EMEM, so that's fine. I have seen
>>>>>>> that other vendors that may have an additional internal memory, especially
>>>>>>> dedicated to some DSPs and in such cases the bandwidth needs are different for
>>>>>>> the two paths (to internal memory and DDR).
>>>>>>
>>>>>> Most chips have a small internal memory that can be used, though it
>>>>>> seldomly is. However, in that case I would expect the target to be a
>>>>>> completely different device, so it'd look more like this:
>>>>>>
>>>>>> 	interconnects = <&mc TEGRA186_MEMORY_CLIENT_BPMPR &iram>,
>>>>>> 			...;
>>>>>>
>>>>>> I don't think EMEM has any "downstream" other than external memory.
>>>>>
>>>>> The node ID should be mandatory in terms of interconnect, even if it's a
>>>>> single node. EMC (provider) != EMEM (endpoint).
>>>>
>>>> I don't understand why. An ID only makes sense if you've got multiple
>>>> endpoints. For example, a regulator is a provider with a single endpoint
>>>> so we don't specify an ID.
>>>
>>> Because this is how ICC binding is defined, unless I'm missing something.
>>
>> I don't think so. It's defined as "pairs of phandles and interconnect
>> provider specifiers", which is equivalent to what pretty much all of the
>> resource bindings define. The #interconnect-cells property defines the
>> number of cells used for the specifier. In the normal case this would be
>> 1, and the value of the one cell would be the ID of the endpoint. But if
>> there's only a single endpoint, it's customary to set the number of
>> cells to 0, in which case only the phandle is required.
> 
> Right, setting interconnect-cells=0 should work. I'll give it a try,
> thank you!

Yes, it's fine to have #interconnect-cells = <0>. Here is a patch [1] which is a
bit related to this.

Thanks,
Georgi

[1] https://patchwork.kernel.org/patch/11305295/
