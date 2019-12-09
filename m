Return-Path: <SRS0=leSB=Z7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BFF7C43603
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 14:33:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 35B572077B
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 14:33:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+6OgH3w"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727268AbfLIOdA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Dec 2019 09:33:00 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:41292 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727038AbfLIOdA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Dec 2019 09:33:00 -0500
Received: by mail-pj1-f66.google.com with SMTP id ca19so5979967pjb.8
        for <devicetree@vger.kernel.org>; Mon, 09 Dec 2019 06:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uGbO5eA/EvkEthYW5iN8u16ydFfTV3nGR0kns1YSEq8=;
        b=P+6OgH3wRjDpQ2U5Q0rrRheWAfDz6brjGOolhAYrfI+XHpr9AJQXkrzLt5mnTANHHe
         6kjX5lrvWFn+Kzh7mCA2waxwenvqV2z7zOjWnVxPg5kZzDGIzdDBKdauuIKS687GFel4
         lK7kd6xWyU7bCZUz7nx79DGRRGBGE8rneh8ccRlEgXlT9lqhlgFzNMThTeTMquZgkga1
         77j618VNUcC6v9kkNAgOgrstKBJQc/7I2f1rcIHJiSrZfm+by5G7EgSWAtKROXXhSxqu
         kN/3KOK/W8oKCvmZHZjenE/aAPytUZ0+q/o31lIBe87UNs4W3H4i0sbAltwNvF26dfMu
         VmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uGbO5eA/EvkEthYW5iN8u16ydFfTV3nGR0kns1YSEq8=;
        b=nSqRqJhCgRTuMLH526CnlvCyGGaaQQQ4Jrnav1DrWprf4Iheu53ikIrb5nCD4dKLvG
         hlJiOaqzYS8LfYtq68YLLRSBRWX7ZQGAFHXCV54hpPbTEyB9viO8/FI8Pp44xzek/RJA
         FR2QMPLbQ+J0Oo3He+/vU9UrGwbzaPcuEai93yIEPWYHXxffru7PmpTyb4WBzd+EaUzs
         9BWFA6+Sd8MDdodB0AwKj8ZeItsjmFAt1yPya6ZXstbVk4LTBFxOf12JWranlnN8//O8
         j+PHEsbf5Y2KYgrIcX7Y+5aLM9/zQx86y9AqzyOWaxCPdDWXY/m7EfKAW0PPm3cug8um
         8nCw==
X-Gm-Message-State: APjAAAXTh9jaSBKawznWkV8vwEwSAdSe4OViP/lDhcyDBziwVJTrms1T
        mmDT7CRZrVWh7oDEPj5PCec=
X-Google-Smtp-Source: APXvYqy4RVacHM5VEz6sKAsm+VK1Q9vv8Q+gX/BUj6bRNoFploDMVpcSqufihDBKA8rygFotaghXYQ==
X-Received: by 2002:a17:90b:8c6:: with SMTP id ds6mr18053912pjb.33.1575901980001;
        Mon, 09 Dec 2019 06:33:00 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h3sm12682121pfr.15.2019.12.09.06.32.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2019 06:32:58 -0800 (PST)
Subject: Re: [PATCH 1/5] arm64: zynqmp: Add firmware DT node
To:     "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
Cc:     Michal Simek <michal.simek@xilinx.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Edgar Iglesias <edgari@xilinx.com>, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        Rajan Vaja <rajanv@xilinx.com>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        linux-arm-kernel@lists.infradead.org, qemu-devel@nongnu.org
References: <20191018160735.15658-1-m.tretter@pengutronix.de>
 <20191018160735.15658-2-m.tretter@pengutronix.de>
 <20191208223814.GA21260@roeck-us.net>
 <dbba2a25-cbf7-60f4-99f7-056512e28d00@xilinx.com>
 <4821742f-2d60-b722-b954-263de975bf2e@roeck-us.net>
 <20191209074840.GP32392@toto>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <d2e63acb-c076-7bfb-c492-0355ec106cbf@roeck-us.net>
Date:   Mon, 9 Dec 2019 06:32:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191209074840.GP32392@toto>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 12/8/19 11:48 PM, Edgar E. Iglesias wrote:
> On Sun, Dec 08, 2019 at 11:19:33PM -0800, Guenter Roeck wrote:
>> On 12/8/19 10:42 PM, Michal Simek wrote:
>>> Hi, +Edgar
>>>
>>>
>>> On 08. 12. 19 23:38, Guenter Roeck wrote:
>>>> On Fri, Oct 18, 2019 at 06:07:31PM +0200, Michael Tretter wrote:
>>>>> From: Rajan Vaja <rajan.vaja@xilinx.com>
>>>>>
>>>>> Add firmware DT node in ZynqMP device tree. This node
>>>>> uses bindings as per new firmware interface driver.
>>>>>
>>>>> Signed-off-by: Rajan Vaja <rajanv@xilinx.com>
>>>>> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
>>>>> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
>>>>
>>>> With this patch applied in the mainline kernel, the qemu xlnx-zcu102
>>>> emulation crashes (see below). Any idea what it might take to get
>>>> qemu back to working ?
>>>
>>> Driver talks through ATF to PMU unit(microblaze). I don't think A53+MB
>>> concept is working with mainline qemu. But crash is too hard. It should
> 
> Yes, QEMU doesn't support the Cortex-A53s along with the PMU MicroBlaze.
> 
> My workaround when using upstream QEMU is a modified DT without the PMU firmware
> and with fixed-clock nodes.
> 

I can't do that for my boot tests. Normally I would just disable ZYNQMP_FIRMWARE,
but that is hard enabled with ARCH_ZYNQMP. I'll have to drop those tests,
unfortunately, if the firmware driver is considered mandatory.

Guenter
