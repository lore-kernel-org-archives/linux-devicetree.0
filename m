Return-Path: <SRS0=1FHL=2F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B34C43603
	for <linux-devicetree@archiver.kernel.org>; Sun, 15 Dec 2019 05:28:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 33FFE2072B
	for <linux-devicetree@archiver.kernel.org>; Sun, 15 Dec 2019 05:28:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tW5F+Zd5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725827AbfLOF2y (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 15 Dec 2019 00:28:54 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42255 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbfLOF2y (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 15 Dec 2019 00:28:54 -0500
Received: by mail-pl1-f193.google.com with SMTP id x13so3015528plr.9
        for <devicetree@vger.kernel.org>; Sat, 14 Dec 2019 21:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VArzzSYeZEnpsaB9lSQeUL2zfIxu29Y0Zz4FR1tu7JY=;
        b=tW5F+Zd5b48NbircyveTalm3eEyXXvDX8uDfvz88xAzAwDaT8J0Re2vrTvVcLwZ9M3
         vxDPYkpLYoJl8UHGMgbTkJPutIhO+kBbIzpFTp7zA9MFR+UFkvJMvXDyxi/ShlE4MRGE
         SIF6FIvwY22x6q2C5udfBWCTRyU/hmnwrIw1IFQtFWoGrZIl8PASzNODgHp3vfZPakJn
         9opaNNNcdVVzCT79+U3OMO33Jm9wDp4f2SoMmd7prQ+00iwE1TV8qoSL8H8NBgHYtIFd
         cuOJGmKfjLnjasI0pwYp3DmoC/R52MA1On2GVW4lRp9DO6+/3KCK1L4vJhfX7VMr5RW9
         jq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VArzzSYeZEnpsaB9lSQeUL2zfIxu29Y0Zz4FR1tu7JY=;
        b=FpeX+n7DipBlujIuYQkYpq7g/B/u/8srEmXOT2AgpShwHTJ03iHa1fKL6j4U43sFVg
         0oB7m18IG0Utn6gGPM4tXj7X8U+on9X456+LcD4TcBGz7/KevxqHZw19vG6Sb4nYFfcE
         MTOvS+w6P1eBmCTqpWLJG8MsD6Q0aa8eLJFNUJAlWXVvAwgP69TAD/mHlXpseY8Bkgrm
         FEAgSSUqpWEOn+ilZl9KGBkcCQYMJQC2JFBrMCdK7eJsyxBDLSFEqnL0bJBP9CJy4Uxc
         DuMNEVmKn+h9R/5HeJ5qE6fZsaaRuwn+Y/K/cnOzPb6+Ja7jZ2bXo5nVVGw6rrSp/L3G
         Lf2g==
X-Gm-Message-State: APjAAAX+wHG2x+AKpJbXN708W0h08HOWaoqZ9KGS7EMPoGMnRA4R1LBK
        jLPfOEMnjQd7yeKOWsVxQcM=
X-Google-Smtp-Source: APXvYqwSSKqqUXTBl3k08aWoi2vzBg3H+3mYhqmyTE9INsm/dJratjDB0m+59ebJf0tP26Egm92aYg==
X-Received: by 2002:a17:90a:1b45:: with SMTP id q63mr10587989pjq.118.1576387733685;
        Sat, 14 Dec 2019 21:28:53 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a15sm17884108pfh.169.2019.12.14.21.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Dec 2019 21:28:52 -0800 (PST)
Subject: Re: [PATCH 1/5] arm64: zynqmp: Add firmware DT node
To:     Michal Simek <michal.simek@xilinx.com>,
        "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
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
 <d2e63acb-c076-7bfb-c492-0355ec106cbf@roeck-us.net>
 <fa36a9e9-9e44-d1ff-cfdc-22d0484318ff@xilinx.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <573f0472-9779-c5df-f199-4e0958753fd8@roeck-us.net>
Date:   Sat, 14 Dec 2019 21:28:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <fa36a9e9-9e44-d1ff-cfdc-22d0484318ff@xilinx.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 12/9/19 7:02 AM, Michal Simek wrote:
> On 09. 12. 19 15:32, Guenter Roeck wrote:
>> On 12/8/19 11:48 PM, Edgar E. Iglesias wrote:
>>> On Sun, Dec 08, 2019 at 11:19:33PM -0800, Guenter Roeck wrote:
>>>> On 12/8/19 10:42 PM, Michal Simek wrote:
>>>>> Hi, +Edgar
>>>>>
>>>>>
>>>>> On 08. 12. 19 23:38, Guenter Roeck wrote:
>>>>>> On Fri, Oct 18, 2019 at 06:07:31PM +0200, Michael Tretter wrote:
>>>>>>> From: Rajan Vaja <rajan.vaja@xilinx.com>
>>>>>>>
>>>>>>> Add firmware DT node in ZynqMP device tree. This node
>>>>>>> uses bindings as per new firmware interface driver.
>>>>>>>
>>>>>>> Signed-off-by: Rajan Vaja <rajanv@xilinx.com>
>>>>>>> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
>>>>>>> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
>>>>>>
>>>>>> With this patch applied in the mainline kernel, the qemu xlnx-zcu102
>>>>>> emulation crashes (see below). Any idea what it might take to get
>>>>>> qemu back to working ?
>>>>>
>>>>> Driver talks through ATF to PMU unit(microblaze). I don't think A53+MB
>>>>> concept is working with mainline qemu. But crash is too hard. It should
>>>
>>> Yes, QEMU doesn't support the Cortex-A53s along with the PMU MicroBlaze.
>>>
>>> My workaround when using upstream QEMU is a modified DT without the
>>> PMU firmware
>>> and with fixed-clock nodes.
>>>
>>
>> I can't do that for my boot tests. Normally I would just disable
>> ZYNQMP_FIRMWARE,
>> but that is hard enabled with ARCH_ZYNQMP. I'll have to drop those tests,
>> unfortunately, if the firmware driver is considered mandatory.
> 
> We can make it optional.
> Rajan: please send a patch for it.
> 

I'll disable the related boot tests for now. If/when this is fixed, let me know,
and I'll re-enable it.

Guenter
