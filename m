Return-Path: <SRS0=49W1=4N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C96E0C35E01
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 13:50:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9E9B120726
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 13:50:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729789AbgBYNuj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Feb 2020 08:50:39 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:36409 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726019AbgBYNuj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Feb 2020 08:50:39 -0500
Received: from [192.168.178.56] ([109.104.32.141]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MQMm9-1ikP2y02U5-00MHZm; Tue, 25 Feb 2020 14:50:21 +0100
Subject: Re: [PATCH] ARM: dts: bcm283x: Add missing properties to the PWR LED
To:     Peter Robinson <pbrobinson@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Scott Branden <sbranden@broadcom.com>,
        Ray Jui <rjui@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
References: <1582480985-6773-1-git-send-email-stefan.wahren@i2se.com>
 <CALeDE9P3ksuvLeiki5HSnAjQTs4tM_bhspB-ktMWiy85SZocSg@mail.gmail.com>
From:   Stefan Wahren <stefan.wahren@i2se.com>
Message-ID: <d6550364-a9e6-afeb-76dd-436fbf4d0f66@i2se.com>
Date:   Tue, 25 Feb 2020 14:50:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CALeDE9P3ksuvLeiki5HSnAjQTs4tM_bhspB-ktMWiy85SZocSg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:zh/lhPbDTMBR2wwqi88n/Y1Le1BNJevvVDN08/rxKfTvFziQSm9
 SU8vtPwXNtuoIXOMny38Zuevmt5b4FTo9PP4/3HFixkvPnc+U70bEGsq+g37YJLZCM3YvFi
 IqBBXxRSd9QyZyaRTDUA2wWcYBqdkbiU0mxlA0F6UXQa8y5jCiO0IbGkbQKgWTLzVFNIDRy
 W9nyC760c+/RQTH1WL4LQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lgvznwyGZ1A=:41Vq6khd8gR2OOxNwqQiYU
 C9ShaCnnK3ZxwoSeXB5l4611GdArHXzvH9q1B3Lp8QWeasMMpWKXIXxWkvdlCPni7YPjchy/e
 wbW16MuNH+DktRuvbWcEcn+h23yJKAYVwe/KOuPnwnlJfAOVY/839kf8ZjlX0YDpspYiEIN1O
 PTheOxoG1csGf9IvuufF8dHgG03ZenbrWAszEFT0uYVL+sO9h2EEAlwmRPaJ0IG8mbELjssIl
 3xzOmovFcaINE5w2roxCL5HVY+gdI0R+4mQnfGmLDVW5cV2bK0hh7T245gUdt7Qw1eMHFI4f+
 rr1ixwlIdn9QhBmG2ocRDvWOj6I3Ur7t3VscTAaZaQdSRyUPKZ3iam+8KpLwYSH3K/NtEULuj
 dVWHxGe+bCgGhOecfbQ2Kt9bGsFRCqJigVdwCOodD9ZM61TlEh7WijDa3oF9NVK4+lRh7e9La
 sVteIs3ufLRvrB6+9KiGrSNUlgn8B0YeRaoNEicvNvr7h8uLr2q9ZdiVo2ihrzSN2FNmk0kdz
 41TNUcWE2UqlBayRxAR39HvNpSVJXN40xi5xceBfeoCRg1EcbY9ss1U83Iino/TuPodUPZ6mW
 8jgUDH9brcT6R/2tKWomWZdQ0bO2skdHhGIDbifXm+85lgo36MLR3BqBtJ/DNiYuYPnHO7NH7
 9N0X7weu2Jm813WseEiYVJ3PIfVCaEQQULTl0TgtTb3dhcv+sUrpwM1b99BPY3VNl0KqeTQUD
 4z83IOR7ZVZz7GL5dB8jb4Bbh2hYpxwNE1qUR8am7amGJc/VJAJsf2wdtLktWnH85+1sqxT+c
 Rx+RlF0VFsv8expsORlUKZ4pThbiZO4WB1VDO+hHv4zPzatfPw3GZ7mckoXO/7UFbl6bLK+
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Peter,

On 25.02.20 14:29, Peter Robinson wrote:
>> This adds the missing properties to the PWR LED for the RPi 3 & 4 boards,
>> which are already set for the other boards. Without them we will lose
>> the LED state after suspend.
>>
>> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> Tested-by: Peter Robinson <pbrobinson@gmail.com>
thanks
>
> Tested on a 3B+ and a 4B. On a related note it seems that the original
> RPi3B is missing the pwr led entry altogether, is that expected given
> that at least the 2, other 3 models have the entry?

This is expected since the PWR LED on the 3B doesn't have a real
dedicated GPIO. In downstream this is handled via a virtual GPIO driver
which isn't available in mainline.

Best regards
Stefan

