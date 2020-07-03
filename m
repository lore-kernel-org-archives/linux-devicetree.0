Return-Path: <SRS0=QVA0=AO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 837D4C433E2
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Jul 2020 09:26:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 63481208E4
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Jul 2020 09:26:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=semihalf-com.20150623.gappssmtp.com header.i=@semihalf-com.20150623.gappssmtp.com header.b="cvmjkqJe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbgGCJ0i (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Jul 2020 05:26:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725764AbgGCJ0h (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 Jul 2020 05:26:37 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D4FEC08C5C1
        for <devicetree@vger.kernel.org>; Fri,  3 Jul 2020 02:26:37 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id t74so18110424lff.2
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2020 02:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zO0GcSjV+DoJTBjOrWxT1/ANl2QKnx4z2PRw1DUFok4=;
        b=cvmjkqJen9Yiv5VkwBU8n4ik0P/2IHfyjUyCwY6lDqZFCgWfBHnT1yqGtbu8HM81vu
         OdBKPFPAy+952G0+bi12xVtvgBtLNmoP27Ow3P2by0VXShv7xGeyYZewK730kb7AiMyk
         YIwv4JtWVtKCtxQLlWxJJxgGkoHmssf41/A+qiKNmUrQxAB21CLMRuPmVHnHerziZE2x
         isew032rkp6Bm1wzOaiTERyzwtIyOhqct7lz0t7ATel5rUwXG5m6zP9fVDrHXxd3aqTy
         7wHIdpLOFRwt0qkEwan/O4mymPRLbNHxL/k0HLdsxtuRMtacVzyhOMs1Kf0TWTFhsbGh
         y19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zO0GcSjV+DoJTBjOrWxT1/ANl2QKnx4z2PRw1DUFok4=;
        b=YaW1kgrNSp4LYzj6TaRTScJDxOIiQ8a7Bm7ieN21KRzH5SD5xJGvrQc1j8rNhfhMvP
         VMI87xSgcjbqBZdfXIxqvjx8/UZbn3gnXdlu7TlWzysZOKtbqoDhBcch6mEhufl2AROr
         MdqMis6CPKLIzUobLQ4oDt531HJw6JfUmxaFQtOXjf1NNgQ81P7609XHJZLzWYISBAXi
         FYyKMoR+ydaO6gD3pLx+YUh91/v0BSEVjKbF+gCjX4qo1rDEls5ospYuz5JOHMQPJTDh
         WglIxsmvZOaXpOivvEqPnW9LKMaDnMF7d+yOUntKlwgUnKdFqjCvlR8tzPkQKedA5rom
         a3+Q==
X-Gm-Message-State: AOAM5327XWiIKeBjZ52W+AjDYK6wDXjIyYm2/Gplb/JBEN6jQSXoyyOp
        UVdsAv+fKCMDG06I9CRmcBx9ZQ==
X-Google-Smtp-Source: ABdhPJyIGppCefmxj8fTRRtxz2K/PWcGR2BmqZOk0LbePzJxgW7tKvDo9qI60CWqvjE7deprzGXjKg==
X-Received: by 2002:ac2:5e6c:: with SMTP id a12mr21462673lfr.35.1593768394546;
        Fri, 03 Jul 2020 02:26:34 -0700 (PDT)
Received: from [192.168.1.9] ([83.68.95.66])
        by smtp.googlemail.com with ESMTPSA id j4sm4453721lfb.94.2020.07.03.02.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2020 02:26:33 -0700 (PDT)
Subject: Re: [PATCH v3 3/4] dt-bindings: arm-smmu: add compatible string for
 Marvell Armada-AP806 SMMU-500
To:     Robin Murphy <robin.murphy@arm.com>, will@kernel.org,
        joro@8bytes.org, gregory.clement@bootlin.com, robh+dt@kernel.org,
        hannah@marvell.com
Cc:     linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        devicetree@vger.kernel.org, catalin.marinas@arm.com,
        nadavh@marvell.com, linux-arm-kernel@lists.infradead.org,
        mw@semihalf.com
References: <20200702201633.22693-1-tn@semihalf.com>
 <20200702201633.22693-4-tn@semihalf.com>
 <3172ec21-d773-7fcb-f1ee-f557f72f20c5@arm.com>
From:   Tomasz Nowicki <tn@semihalf.com>
Message-ID: <972f5cbd-705b-e18a-7477-5f6922804361@semihalf.com>
Date:   Fri, 3 Jul 2020 11:26:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <3172ec21-d773-7fcb-f1ee-f557f72f20c5@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 03.07.2020 11:05, Robin Murphy wrote:
> On 2020-07-02 21:16, Tomasz Nowicki wrote:
>> Add specific compatible string for Marvell usage due to errata of
>> accessing 64bits registers of ARM SMMU, in AP806.
>>
>> AP806 SoC uses the generic ARM-MMU500, and there's no specific
>> implementation of Marvell, this compatible is used for errata only.
>>
>> Signed-off-by: Hanna Hawa <hannah@marvell.com>
>> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
>> Signed-off-by: Tomasz Nowicki <tn@semihalf.com>
>> ---
>>   Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml 
>> b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> index d7ceb4c34423..7beca9c00b12 100644
>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> @@ -38,6 +38,11 @@ properties:
>>                 - qcom,sc7180-smmu-500
>>                 - qcom,sdm845-smmu-500
>>             - const: arm,mmu-500
>> +      - description: Marvell SoCs implementing "arm,mmu-500"
>> +        items:
>> +          - enum:
>> +              - marvell,ap806-smmu-500
> 
> Isn't a single-valued enum just a constant? :P

That's how copy-paste engineering ends up :)

Thanks,
Tomasz
