Return-Path: <SRS0=d5cD=3G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA00CC3F68F
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 18:40:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B5C432072B
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 18:40:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="YTeCeDAD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728600AbgAQSkq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Jan 2020 13:40:46 -0500
Received: from mail-pj1-f51.google.com ([209.85.216.51]:37131 "EHLO
        mail-pj1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726603AbgAQSkq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 17 Jan 2020 13:40:46 -0500
Received: by mail-pj1-f51.google.com with SMTP id m13so3704283pjb.2
        for <devicetree@vger.kernel.org>; Fri, 17 Jan 2020 10:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=37VhHEnLonN3VBsLsaexRstzJMU5ZwdhXQzpJqxZdAA=;
        b=YTeCeDAD0If4aSccR5cTds2h0Yofh+0CNZ4E7wDWzSQkKcMRd/QWfXzRdg1IS42f7V
         m0EBXwyXXQo8s7bIMsXlTdYoWIG7GLhk96dUC2bDfP65JZhCgT1ygmmwWI8bLdUQyNCT
         ZRTqSzUjekwxPx4cRXeokBf/YCMMc0yRHZGeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=37VhHEnLonN3VBsLsaexRstzJMU5ZwdhXQzpJqxZdAA=;
        b=lDwWO47QbuKZlmANVn8qYBcxb+++zW4zDU43V6iWPpFzlQwuobGq+wf79uSIjhXZwy
         Rk5qOLxIkREzt+sMVjGkdbBKTcDmNbYg8hXY19ef64q2K5/+TXjn1o1SP2+xV4nbvTUf
         BlP5+eDy+C7gVUT6/52Vo/WhHkq+wRIwAq0KmKZ8vyVLxCJfFvXk2MYAT6T7KmCW/IkP
         YDJ/NjBLTUFhIubQ16jozAN1QJEmCNpeuwIwrG/qFOzqwkbnbt6Osf6WX819uk14+udv
         ETS5mpssceMCVpkCPqQBegJGk+5QYPx7GYhwqfvW7PVMsCANMsUoASing0Wrqb9Adjmg
         0MKA==
X-Gm-Message-State: APjAAAV+XRkPpp/zzt8dNAkK0RTOva+OMMVO8wHeP5HG94YT6iGD6b89
        HraIeJmO6P6kYdPc9WyjOfbifw==
X-Google-Smtp-Source: APXvYqz+czzaPdAmyGQUR55S9FX37E6K9gEke+j/f0s3Lhfqy3SMOuqamUcKKsfBRMHOdguyuYNe+A==
X-Received: by 2002:a17:90a:3763:: with SMTP id u90mr7340800pjb.107.1579286445966;
        Fri, 17 Jan 2020 10:40:45 -0800 (PST)
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id a9sm29830335pfn.38.2020.01.17.10.40.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2020 10:40:45 -0800 (PST)
Subject: Re: [PATCH v9 2/2] EDAC: add EDAC driver for DMC520
To:     Shiping Ji <shiping.linux@gmail.com>,
        Borislav Petkov <bp@alien8.de>
Cc:     James Morse <james.morse@arm.com>, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, linux-edac@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        sashal@kernel.org, hangl@microsoft.com,
        Lei Wang <lewan@microsoft.com>, shji@microsoft.com,
        ruizhao@microsoft.com, Yuqing Shen <yuqing.shen@broadcom.com>,
        ray.jui@broadcom.com, wangglei@gmail.com
References: <6a462190-0af2-094a-daa8-f480d54a1fbf@gmail.com>
 <20200117001843.GJ27148@zn.tnic>
 <d5989a4c-8173-2f03-7d20-6fdd32d19591@gmail.com>
From:   Scott Branden <scott.branden@broadcom.com>
Message-ID: <1577ee39-2587-4d61-bbfc-a043e201c15a@broadcom.com>
Date:   Fri, 17 Jan 2020 10:40:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <d5989a4c-8173-2f03-7d20-6fdd32d19591@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 2020-01-17 10:31 a.m., Shiping Ji wrote:
>
>>> +		if (irq >= 0) {
>>> +			ret = devm_request_irq(&pdev->dev, irq,
>>> +							dmc520_isr, IRQF_SHARED,
>>> +							dev_name(&pdev->dev), mci);
>> Align arguments on the opening brace.
> I'm not sure how this can be done perfectly with tabs only :)
tabs are used first, followed by however may spaces (less than 8) needed 
to lineup at the end.
>
> All other comments have been addressed in the next patch, many thanks!
>

