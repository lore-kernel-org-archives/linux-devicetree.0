Return-Path: <SRS0=UIXH=76=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F2DC433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 14:33:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E624206F1
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 14:33:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZgwzByU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726355AbgFQOdH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 17 Jun 2020 10:33:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgFQOdG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 17 Jun 2020 10:33:06 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7481BC06174E;
        Wed, 17 Jun 2020 07:33:06 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id q19so3166257lji.2;
        Wed, 17 Jun 2020 07:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=urh3jMO3hxspx2In4jy3+Cmk3MHOsXNNfNe15GTSFH4=;
        b=gZgwzByUHewbjFSUI3LWfQ4fZpYey04yvSRPDWRLYU6tUHzkBPMrDr1xHyyNTKx1BN
         1hNPDoLxYvk2g/htaKPh3ONkBP+Rfck6C5g9n9PfSNFbWmay7/1CH2+4d651byuhBpU6
         YSplK0A6pVwMZpb1A7ARCx7gT7Xeut69MSsbCjz4uT7FdUH6R7cFB3yGbSu0D+30Ypfv
         PQa04XGc55OEZFebP6XP2mtNm7Bgg0Mtd7AXY1TeVgLy1sK4U8bYw7lwT6DKNBDODFTk
         hZZPBe2jlL3FFvLyRI8qhr8ZHtiRY0zZGt1gyq0XkDiqT6WVFf7jLLV+g2gLTxuEL3Hm
         SmaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=urh3jMO3hxspx2In4jy3+Cmk3MHOsXNNfNe15GTSFH4=;
        b=KZ0nDtL/4b+PF2vz+Mn/YW5CuXpHKxrUuAuAeBuEYb22Y/0iEYImSHmBB/q5cMEqUb
         0UGAt+djMUMmqS04KuqpqFu6aWw/pe8Cgp9vCxQbg/joz30GpxbtUVKCTEw9ZJvShgv8
         lw4muaKL5OW6PWpBd/HiyThi5e/vr59VpU6AnQWpWJinFKJRUbr/igv8O6v79IoMARI0
         15TrQnm3gBI+KQsXi9rwlFmCBxupLv39CfNDiCddtgz/Gp7iQjojFZ5RZUZtNJo0AxQD
         2FUH7v3K1lvOBsOC3ApnJqxrzHwlQ+S9WlSz5qZvfShEnZoj0CkHFT3k65IjYYmmLD0U
         BlmQ==
X-Gm-Message-State: AOAM5331VDviRk/cFSUGPZO/cWJbYvyRK79EsE8UB48jz+3Ewe0c58bc
        nuR2qyHjF6brpRGDGFmAc9RF9hDB
X-Google-Smtp-Source: ABdhPJwfwbsJe9ucXHYh64/N1y53kGaIcm/IyOhtXC72p+KqWRVmDP5zZw5XLP6STG0flGKKd72uHw==
X-Received: by 2002:a2e:b5a3:: with SMTP id f3mr3895088ljn.361.1592404384227;
        Wed, 17 Jun 2020 07:33:04 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id m3sm17111ljb.38.2020.06.17.07.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2020 07:33:01 -0700 (PDT)
Subject: Re: [PATCH 25/38] dt-bindings: gpio: tegra: Convert to json-schema
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-26-thierry.reding@gmail.com>
 <186ceadd-317c-a7b2-d4ab-32473f857545@gmail.com>
 <20200617141706.GC3536291@ulmo>
 <c0cfa39b-054c-8e88-7e5a-233c24f5d5e9@gmail.com>
Message-ID: <a14c2791-83af-1cd0-1d15-0544a4bf490b@gmail.com>
Date:   Wed, 17 Jun 2020 17:33:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <c0cfa39b-054c-8e88-7e5a-233c24f5d5e9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

17.06.2020 17:24, Dmitry Osipenko пишет:
> 17.06.2020 17:17, Thierry Reding пишет:
>> On Wed, Jun 17, 2020 at 07:24:16AM +0300, Dmitry Osipenko wrote:
>>> 12.06.2020 17:18, Thierry Reding пишет:
>>> ...
>>>> +patternProperties:
>>>> +  # GPIO hogs; /schemas/gpio/gpio-hog.yaml will match
>>>> +  "^gpios(-[a-zA-Z0-9-]+)?$":
>>>> +    type: object
>>>> +    required:
>>>> +      - gpio-hog
>>>
>>> There are two problems here:
>>>
>>> 1. This naming limitation didn't exist before this patch, so it's not a
>>> part of the conversion.
>>>
>>> 2. GPIO core uses the node's name for the hog's name. Hence by imposing
>>> the "gpios-" prefix, you're forcing all hogs to be named as gpios-xxx,
>>> which doesn't make much sense to me.
>>>
>>> Please explain the rationale of this change.
>>
>> We could probably do without this if we didn't enforce additional or
>> unevaluated properties. Because if we don't match on a pattern here then
>> all of those GPIO hog nodes would show up as "extra" properties and they
>> are currently not allowed. If we do allow them, then we can drop this,
>> but we then have no way to fail validation for whatever else somebody
>> might want to put into these device tree nodes.
>>
>> That said, I think additionalProperties can be a schema in itself, so
>> maybe there's a way to only allow additional properties if they are of
>> type object and have a gpio-hog property. I'll look into that.
> 
> Isn't it possible to validate the additional properties by checking what
> properties they have?
> 
> For example, if sub-node has a gpio-hog property then this sub-node is
> okay, otherwise fail.
> 

Ah, I haven't finished reading yours last sentence before started to
type :) Yes, it will be nice if we could avoid the naming limitation, or
at least change it to something like xxx-hog.
