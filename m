Return-Path: <SRS0=leSB=Z7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55F4DC43603
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 18:03:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2E4DE2080D
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 18:03:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Sz+/fCjq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726342AbfLISC7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Dec 2019 13:02:59 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:44773 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726637AbfLISC7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Dec 2019 13:02:59 -0500
Received: by mail-pl1-f194.google.com with SMTP id bh2so4988495plb.11
        for <devicetree@vger.kernel.org>; Mon, 09 Dec 2019 10:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0YsPAtOD2B97kYz+aPx1oxns46408201TPj5O/tIazQ=;
        b=Sz+/fCjqYOiJDd/7AcP5OSR6UajygLGcCbKT5Stg6Oz8XAY2WmjrCBd/m1SYfnEEnQ
         Luf4Qn4e2hwf+WkdL15QyOYY1iVTaWzz1KevnrW4qtzYHKf6a4LyKSwXUu4niXhRVQmh
         sjoLhkzMwb2ozNPJAIJsygJ6dLZ8T+Peg0Xb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0YsPAtOD2B97kYz+aPx1oxns46408201TPj5O/tIazQ=;
        b=J5i/WA2hTs7q9B3PmZq5UY1MU72kmPCi9QS1QbFW9wBftn8AGNVPwHpSezmURY2CjO
         cJOkDau1jGo53MdGL/cqHoOnKVIc3RSCyOLX9XDm7h99EOc7PfdfkcvhUN3geIVyMB+e
         KrBBsN4hpPR9SCXcslbAzAMdv2BYGMho3xVU9hwfDXkOO677yMFTHanLykLqHrOSEO5H
         HPBN9C9V8/g++Ng9/fnroICTdqRuq1s8AZ65UUfxXf7NKFQRlpJHpRYCu+vVVHC+zjqG
         Wg27flz0QxW7ieq15nS5DAq/YtEpW/JYvpAx1uWfT3nZrTzft/UGGV7Yw1pz2Wt+7Egp
         V5VQ==
X-Gm-Message-State: APjAAAUatuaHhwdgPW5w54EtdEiWwFo3cbXPGyJzf6vpjE+hk9y16niw
        WxyEjU5rtUGEt2QcRMWwJEG78Q==
X-Google-Smtp-Source: APXvYqxsvzB6CFv06nZv5X+fP4cX+FzYXhiKJAS60N31poBuk0qfyxhmyAij3weEl98sWCL57RWQFg==
X-Received: by 2002:a17:902:9f98:: with SMTP id g24mr31305945plq.325.1575914577974;
        Mon, 09 Dec 2019 10:02:57 -0800 (PST)
Received: from rj-aorus.ric.broadcom.com ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id h128sm114062pfe.172.2019.12.09.10.02.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2019 10:02:56 -0800 (PST)
Subject: Re: [PATCH 0/2] Add iProc IDM device support
To:     Marc Zyngier <maz@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org
References: <20191202233127.31160-1-ray.jui@broadcom.com>
 <20191207173914.353f768d@why>
From:   Ray Jui <ray.jui@broadcom.com>
Message-ID: <bd90ba80-9aac-e406-9066-64e975e5b10b@broadcom.com>
Date:   Mon, 9 Dec 2019 10:02:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191207173914.353f768d@why>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 12/7/19 9:39 AM, Marc Zyngier wrote:
> On Mon,  2 Dec 2019 15:31:25 -0800
> Ray Jui <ray.jui@broadcom.com> wrote:
> 
>> The Broadcom iProc IDM device allows control and monitoring of ASIC internal
>> bus transactions. Most importantly, it can be configured to detect bus
>> transaction timeout. In such case, critical information such as transaction
>> address that caused the error, bus master ID of the transaction that caused
>> the error, and etc., are made available from the IDM device.
> 
> This seems to have many of the features of an EDAC device reporting
> uncorrectable errors.
> 
> Is there any reason why it is not implemented as such?
> 
> Thanks,
> 
> 	M.
> 

I thought EDAC errors (in fact, in our case, that's fatal rather than 
uncorrectable) are mostly for DDR. Is my understanding incorrect?

Thanks,

Ray
