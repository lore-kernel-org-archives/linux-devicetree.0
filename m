Return-Path: <SRS0=HudI=AZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D964FC433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 10:26:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B09B921D7D
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 10:26:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=semihalf-com.20150623.gappssmtp.com header.i=@semihalf-com.20150623.gappssmtp.com header.b="LZc1Kh4T"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbgGNK0g (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Jul 2020 06:26:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgGNK0f (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Jul 2020 06:26:35 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DFDFC061794
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2020 03:26:34 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id q7so21829491ljm.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2020 03:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wU3WsDZ5z/ReR22OZkjfVgyD9A9a3aDs09Gv8NCOr6k=;
        b=LZc1Kh4Tz6klVSWkSiiyfiAsLQCH3B4VewePqWJl5Efzr0SGRVu07nV/7Ah2EE7KQ3
         YHxqRE5Csr+LCs2H7PgFhO4r5fnYNloyJQvqjR9GjNpstK9WjahUj0bVPo5f8gBY9xG0
         sZSD3LJlrHatNM/jiCsnCM2QIUWr8J1dzMgbSQQIldDFDHrenn+OYkWdIC7c+t9jOANv
         IgI3E0cEdErqHQD1i9TJ5a7hcxaDR4Jz94wauTiSzDwPvrsmeR2pwXbLbIsUIFNYIMuI
         08GWBVOWoEFO17ZERdg8RgEOO0y33KAH5do2ahk43H3uQUiRmW/MDeqdpipZhg5CM1hU
         iDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wU3WsDZ5z/ReR22OZkjfVgyD9A9a3aDs09Gv8NCOr6k=;
        b=ji2vDChwF40vSm4wH7hQkEy3tlUIlVu1z/MnErNQSaOrPOIgwSgxIbpHUcDyjHXx0Y
         yasLy5E/+jkFwL5CKI8ZlPsZfwB1F5Tixb+D5AeEyGlL/a6Tcmo75We204ALN0OHlW2v
         j/zjsl0uv3APK0Uoqe5q0o9nrgU2RrHv/yedKMjFPjB5nYV2dt9GebPDJ1/YLJ7rhi0q
         OdamOZiUj+l5qXEJV64+RfkNDwZnrErgKzd++IxJ23R/PBm39ZjAfSnknfNoAgSh9PmL
         6KAu+WEtZQ7JBJ7YelzY6g8uEaIGK1v+HtKIQZkEHhnaaQ9+461P/LbtS03gCG9u/jOd
         AjEA==
X-Gm-Message-State: AOAM533HSyHV+iMWdU5FB6p+h8DVdJx0fvaDHuK9UkSqH5YcLIglOJ+/
        vt0lQvnbu0r/15gOHYsy5Bce7w==
X-Google-Smtp-Source: ABdhPJyBLUOuAlvhbf1rlm9S6PlB1T6KmXOMQPNV4ajT8nLWMAwHQA2bi1kdmYD2kprduz0zv2lW9Q==
X-Received: by 2002:a2e:99cf:: with SMTP id l15mr2027708ljj.294.1594722392984;
        Tue, 14 Jul 2020 03:26:32 -0700 (PDT)
Received: from [192.168.1.9] ([83.68.95.66])
        by smtp.googlemail.com with ESMTPSA id f19sm4555276lja.84.2020.07.14.03.26.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2020 03:26:32 -0700 (PDT)
Subject: Re: [PATCH v3 0/4] Add system mmu support for Armada-806
To:     Will Deacon <will@kernel.org>
Cc:     robin.murphy@arm.com, joro@8bytes.org, gregory.clement@bootlin.com,
        robh+dt@kernel.org, hannah@marvell.com,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        devicetree@vger.kernel.org, catalin.marinas@arm.com,
        nadavh@marvell.com, linux-arm-kernel@lists.infradead.org,
        mw@semihalf.com
References: <20200702201633.22693-1-tn@semihalf.com>
 <20200714081949.GA4516@willie-the-truck>
From:   Tomasz Nowicki <tn@semihalf.com>
Message-ID: <0d9d734a-84cf-2280-67b6-0c96247e1baf@semihalf.com>
Date:   Tue, 14 Jul 2020 12:26:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200714081949.GA4516@willie-the-truck>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Will,

On 14.07.2020 10:19, Will Deacon wrote:
> Hi Tomasz,
> 
> On Thu, Jul 02, 2020 at 10:16:29PM +0200, Tomasz Nowicki wrote:
>> There were already two versions of series to support SMMU for AP806,
>> including workaround for accessing ARM SMMU 64bit registers.
>> First [1] by Hanna Hawa and second [2] by Gregory CLEMENT.
>> Since it got stuck this is yet another try. I incorporated the V2 comments,
>> mainly by moving workaround code to arm-smmu-impl.c as requested.
>>
>> For the record, AP-806 can't access SMMU registers with 64bit width,
>> this patches split the readq/writeq into two 32bit accesses instead
>> and update DT bindings.
>>
>> The series was successfully tested on a vanilla v5.8-rc3 kernel and
>> Intel e1000e PCIe NIC. The same for platform devices like SATA and USB.
>>
>> [1]: https://lkml.org/lkml/2018/10/15/373
>> [2]: https://lkml.org/lkml/2019/7/11/426
> 
> Do you have a v4 of this series? It looks like there were a few comments
> left to address, but with that I can pick it up for 5.9.

Yes, I will send it out today.

Thanks,
Tomasz
