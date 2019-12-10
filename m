Return-Path: <SRS0=BuJn=2A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C233C43603
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 07:10:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4022D20663
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 07:10:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sDowYenD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727096AbfLJHKw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Dec 2019 02:10:52 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:34561 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726819AbfLJHKw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Dec 2019 02:10:52 -0500
Received: by mail-pj1-f65.google.com with SMTP id j11so5902549pjs.1
        for <devicetree@vger.kernel.org>; Mon, 09 Dec 2019 23:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hXXT59OO6YGqQMmLExyl4I6+s7M+cBEkNq2bS4mnIaU=;
        b=sDowYenD4umHuQR9io2qmtAY0hFzsZq2cwzS4LnPVc82Hbi16b+Le+2E063byYuIEa
         JGdGc1Va9znthdVQKKPvCC0xsOIaBDZyOBMmR17ZK1s3tS5SuK8egNBDmxBSfwy2nVDj
         WoYCHDmgVG3bHwbuprxByjChL2GBrGF/wXGbiDh5qTUDPpRZhpjXdUIf/H3n1CYqDCDV
         ZFvL34dcvECMRWhDkwLOnTjD/hNHy90UQb16KQVRKcXnzkPJbfVuBuvIfurLIwgkCbuD
         81o+wH6Mf5A/YSMEM13WIwionQ85sawiqi34cPTIH+2Mj7OLmpuSt03CaPu6QoGNSeT9
         LieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hXXT59OO6YGqQMmLExyl4I6+s7M+cBEkNq2bS4mnIaU=;
        b=mlxTLZ5G8IjAqKYJqxWCPQtzQ24cthlix03lal7hXdiUhBKlpqYBohzrX6EbeqvBNQ
         bXyve8eo78Y2foGoZWaxPXv6TJDqB1qwsQpY6HvTdIMCTNdCFMGcoxFHG8XxKmW7pOcO
         UIXAVPPxex4cz1kI7ko4bNR5IpZulkU6Lvew+pxILMKhsc5D/qEufE6GkTlOyPn0C9Om
         2tT7k95aAIFb+0HC3Ixfj4lvI45I3M/bqB/D/5vp0S8A1q+RA1Oo/zrY0/1mTuvGGfxA
         XhQUL9N1ayhHBmjbvFVyZo4rr/N/3jOZk4I/D9xEQXdym39T7v3/88IADqyLnyMyNG5D
         aV9A==
X-Gm-Message-State: APjAAAW6kMpYWuKi9ltekvHCEGVugmBmAiKOQUupUsUOGxziso+/bHa4
        V5obpkaG2C8KeBhHLeGfcL4=
X-Google-Smtp-Source: APXvYqzBkx38DOR4RGrYibEVrs2lOfafKWafmC/LWEjH+5YoENrMzCioU72USJFeHgZeoYXEu7ggjQ==
X-Received: by 2002:a17:90a:178f:: with SMTP id q15mr3881586pja.132.1575961851373;
        Mon, 09 Dec 2019 23:10:51 -0800 (PST)
Received: from ?IPv6:240d:1a:90a:7900:1572:c35d:e9db:e357? ([240d:1a:90a:7900:1572:c35d:e9db:e357])
        by smtp.gmail.com with ESMTPSA id i9sm1751792pfd.166.2019.12.09.23.10.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Dec 2019 23:10:50 -0800 (PST)
Subject: Re: of_node_release() warn
To:     John Garry <john.garry@huawei.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Anders Roxell <anders.roxell@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <ff1eb50f-fd08-0022-d0cd-fefdac806f96@huawei.com>
 <fec28875-fa5b-d086-c5be-77cc63365d18@gmail.com>
 <0a6b7d4d-6d0f-8717-f3d3-26b0452f36e5@huawei.com>
 <6021ac63-b5e0-ed3d-f964-7c6ef579cd68@huawei.com>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <ccba6b97-fdcd-5373-f54e-dd7935e4596a@gmail.com>
Date:   Tue, 10 Dec 2019 01:10:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6021ac63-b5e0-ed3d-f964-7c6ef579cd68@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi John,


On 12/6/19 11:11 AM, John Garry wrote:
> On 06/12/2019 09:40, John Garry wrote:
>> Hi Frank,
>>
>>>> [  292.117483][  T406] driver: 'unittest-i2c-bus': driver_release
>>>> [  292.125954][  T487] kobject: 'unittest-i2c-dev': free name
>>>> [  292.134162][  T406] kobject: 'unittest-i2c-bus': free name
>>>> [  292.171965][  T504] kobject: 'test-unittest111' ((____ptrval____)): kobject_cleanup, parent (____ptrval____)
>>>> [  292.181866][  T504] kobject: 'test-unittest111' ((____ptrval____)): calling ktype release
>>>
>>> The following "OF: ERROR: memory leak ..." message is not an expected error from the unittest:
> 
> Even just using a vanilla arm64 defconfig with CONFIG_OF_UNITTEST=y gives many of these warnings for me:
> 
>    18.022956] rtc-efi rtc-efi: setting system clock to 2019-12-06T17:04:30 UTC (1575651870)
> [   18.031448] Duplicate name in testcase-data, renamed to "duplicate-name#1"
> [   18.038657] ### dt-test ### start of unittest - you will see error messages
> [   18.045707] OF: /testcase-data/phandle-tests/consumer-a: could not get #phandle-cells-missing for /testcase-data/phandle-tests/provider1
> [   18.057957] OF: /testcase-data/phandle-tests/consumer-a: could not get #phandle-cells-missing for /testcase-data/phandle-tests/provider1
> [   18.070205] OF: /testcase-data/phandle-tests/consumer-a: could not find phandle
> [   18.077505] OF: /testcase-data/phandle-tests/consumer-a: could not find phandle
> [   18.084804] OF: /testcase-data/phandle-tests/consumer-a: #phandle-cells = 3 found -1
> [   18.092538] OF: /testcase-data/phandle-tests/consumer-a: #phandle-cells = 3 found -1
> [   18.093302] usb 1-2: new high-speed USB device number 3 using ehci-platform
> [   18.100313] OF: /testcase-data/phandle-tests/consumer-b: could not get #phandle-missing-cells for /testcase-data/phandle-tests/provider1
> [   18.119468] OF: /testcase-data/phandle-tests/consumer-b: could not find phandle
> [   18.126769] OF: /testcase-data/phandle-tests/consumer-b: #phandle-cells = 2 found -1
> [   18.135374] platform testcase-data:testcase-device2: IRQ index 0 not found
> [   18.144546] OF: overlay: WARNING: memory leak will occur if overlay removed, property: /testcase-data/overlay-node/test-bus/test-unittest0/status
> [   18.157908] OF: overlay: WARNING: memory leak will occur if overlay removed, property: /testcase-data/overlay-node/test-bus/test-unittest1/status
> [   18.171028] OF: overlay: WARNING: memory leak will occur if overlay removed, property: /testcase-data/overlay-node/test-bus/test-unittest2/status
> [   18.184381] OF: overlay: WARNING: memory leak will occur if overlay removed, property: /testcase-data/overlay-node/test-bus/test-unittest3/status
> [   18.197890] OF: overlay: WARNING: memory leak will occur if overlay removed, property: /testcase-data/overlay-node/test-bus/test-unittest5/status
> [   18.211312] OF: overlay: WARNING: memory leak will occur if overlay removed, property: /testcase-data/overlay-node/test-bus/test-unittest6/status
> [   18.224649] OF: overlay: WARNING: memory leak will occur if overlay removed, property: /testcase-data/overlay-node/test-bus/test-unittest7/status
> [   18.238114] OF: overlay: WARNING: memory leak will occur if overlay removed, property: /testcase-data/overlay-node/test-bus/test-unittest8/status
> [   18.251444] OF: overlay: WARNING: memory leak will occur if overlay removed, property: /testcase-data/overlay-node/test-bus/test-unittest8/property-foo
> [   18.261857] hub 1-2:1.0: USB hub found
> [   18.265002] OF: overlay: node_overlaps_later_cs: #6 overlaps with #7 @/testcase-data/overlay-node/test-bus/test-unittest8
> [   18.268835] hub 1-2:1.0: 4 ports detected
> [   18.279670] OF: overlay: overlay #6 is not topmost
> [   18.281898] i2c i2c-1: Added multiplexed i2c bus 2
> [   18.293275] OF: overlay: WARNING: memory leak will occur if overlay removed, property: /testcase-data/overlay-node/test-bus/i2c-test-bus/test-unittest12/status
> [   18.307619] OF: overlay: WARNING: memory leak will occur if overlay removed, property: /testcase-data/overlay-node/test-bus/i2c-test-bus/test-unittest13/status
> [   18.322611] i2c i2c-1: Added multiplexed i2c bus 3


The above set of warnings is the expected set of warnings.

The warnings are an unfortunate side effect of the way devicetree unittests
are implemented.  That there is no easy way to confirm whether the warnings
are expected has been an annoyance to me for a long time.  Maybe this will
be the incentive I need to come up with a solution.


> [   18.328552] ### dt-test ### FAIL of_unittest_overlay_high_level():2475 overlay_base_root not initialized

This unittest "FAIL" is because the overlay test base data is only created
on the arm architecture.

I'll add this "FAIL" to my todo list.

> [   18.338024] ### dt-test ### end of unittest - 237 passed, 1 failed
> [   18.344208] ------------[ cut here ]------------

Thanks for providing this additional information.

-Frank


> 
> 
> Thanks,
> John
> 
>>>
>>>> [  292.191376][  T504] OF: ERROR: memory leak before free overlay changeset, /testcase-data/overlay-node/test-bus/test-unittest11/test-unittest111
>>>
>>>
>>>> [  292.191386][   C47] ------------[ cut here ]------------
>>>> [  292.191391][   C47] refcount_t: addition on 0; use-after-free.
>>>> [  292.191397][   C47] WARNING: CPU: 47 PID: 504 at lib/refcount.c:25 refcount_warn_saturate+0xf4/0x1b0
>>>> [  292.191399][   C47] Modules linked in:
>>>> [  292.191406][   C47] CPU: 47 PID: 504 Comm: kworker/47:2 Tainted: G     W         5.4.0+ #1424
>>>> [  292.191411][   C47] Hardware name: Huawei Taishan 2280 /D05, BIOS Hisilicon D05 IT21 Nemo 2.0 RC0 04/18/2018
>>>> [  292.191414][   C47] Workqueue: events kobject_delayed_cleanup
>>>> [  292.191420][   C47] pstate: 80400085 (Nzcv daIf +PAN -UAO)
>>>> [  292.191423][   C47] pc : refcount_warn_saturate+0xf4/0x1b0
>>>> [  292.191427][   C47] lr : refcount_warn_saturate+0xf4/0x1b0
>>>> [  292.191429][   C47] sp : ffffff9da32574c0
>>>> [  292.191432][   C47] x29: ffffff9da32574c0 x28: 0000000000000001
>>>> [  292.191438][   C47] x27: ffffffd01231fc40 x26: ffffffd015cea179
>>>> [  292.191445][   C47] x25: ffffff9d29846818 x24: ffffffd012320160
>>>> [  292.191452][   C47] x23: ffffffd015cea510 x22: ffffffd015cea179
>>>> [  292.191458][   C47] x21: ffffff9d29844490 x20: 0000000000000002
>>>> [  292.191465][   C47] x19: ffffffd0151b186b x18: 0000000000000000
>>>> [  292.191471][   C47] x17: 0000000000000000 x16: 0000000000002760
>>>> [  292.191478][   C47] x15: 0000000000000000 x14: 726170202c70756e
>>>> [  292.191485][   C47] x13: 61656c635f746365 x12: 1ffffff3b5c94703
>>>> [  292.191491][   C47] x11: ffffffc3b5c94703 x10: dfffffd000000000
>>>> [  292.191498][   C47] x9 : ffffffc3b5c94704 x8 : 0000000000000001
>>>> [  292.191504][   C47] x7 : ffffff9dae4a381b x6 : ffffffc3b5c94704
>>>> [  292.191511][   C47] x5 : ffffffc3b5c94704 x4 : ffffffc3b5c94704
>>>> [  292.191517][   C47] x3 : ffffffd010000000 x2 : ffffffc3b464ae60
>>>> [  292.191524][   C47] x1 : 8bd48ccdcee9fb00 x0 : 0000000000000000
>>>> [  292.191530][   C47] Call trace:
>>>> [  292.191533][   C47]  refcount_warn_saturate+0xf4/0x1b0
>>>> [  292.191536][   C47]  kobject_get+0x9c/0x100
>>>> [  292.191539][   C47]  of_node_get+0x2c/0x40
>>>> [  292.191541][   C47]  of_get_parent+0x50/0x88
>>>> [  292.191544][   C47]  of_fwnode_get_parent+0x4c/0xa8
>>>> [  292.191547][   C47]  fwnode_count_parents+0x54/0x98
>>>> [  292.191551][   C47]  fwnode_full_name_string+0x28/0xd8
>>>> [  292.191554][   C47]  device_node_string+0x28c/0x5d0
>>>> [  292.191556][   C47]  pointer+0x338/0x488
>>>> [  292.191559][   C47]  vsnprintf+0x53c/0xad8
>>>> [  292.191562][   C47]  vscnprintf+0x48/0x80
>>>> [  292.191565][   C47]  vprintk_store+0x78/0x308
>>>> [  292.191567][   C47]  vprintk_emit+0x258/0x600
>>>> [  292.191570][   C47]  vprintk_default+0xac/0xc8
>>>> [  292.191573][   C47]  vprintk_func+0x248/0x2d8
>>>> [  292.191575][   C47]  printk+0xc4/0xf4
>>>> [  292.191578][   C47]  of_node_release+0xd0/0x180
>>>> [  292.191581][   C47]  kobject_delayed_cleanup+0x1f4/0x250
>>>> [  292.191584][   C47]  process_one_work+0x800/0xd90
>>>> [  292.191587][   C47]  worker_thread+0x41c/0x6c0
>>>> [  292.191590][   C47]  kthread+0x1dc/0x1f8
>>>> [  292.191592][   C47]  ret_from_fork+0x10/0x18
>>>> [  292.191595][   C47] irq event stamp: 2118
>>>> [  292.191600][   C47] hardirqs last  enabled at (2117): [<ffffffd0115faaa0>] _raw_spin_unlock_irq+0x38/0xc0
>>>> [  292.191604][   C47] hardirqs last disabled at (2118): [<ffffffd0115ef040>] __schedule+0x310/0xd70
>>>> [  292.191609][   C47] softirqs last  enabled at (1408): [<ffffffd0100e2fac>] __do_softirq+0x804/0x870
>>>> [  292.191613][   C47] softirqs last disabled at (1399): [<ffffffd0101b9d4c>] irq_exit+0x11c/0x1a8
>>>> [  292.191616][   C47] ---[ end trace f80ccb1560e43eff ]---
>>>> [  292.191620][   C47] ------------[ cut here ]------------
>>>> [  292.191623][   C47] refcount_t: underflow; use-after-free.
>>>> [  292.191628][   C47] WARNING: CPU: 47 PID: 504 at lib/refcount.c:28 refcount_warn_saturate+0x12c/0x1b0
>>>> [  292.191630][   C47] Modules linked in:
>>>> [  292.191637][   C47] CPU: 47 PID: 504 Comm: kworker/47:2 Tainted: G     W         5.4.0+ #1424
>>>> [  292.191641][   C47] Hardware name: Huawei Taishan 2280 /D05, BIOS Hisilicon D05 IT21 Nemo 2.0 RC0 04/18/2018
>>>> [  292.191645][   C47] Workqueue: events kobject_delayed_cleanup
>>>> [  292.191650][   C47] pstate: 80400085 (Nzcv daIf +PAN -UAO)
>>>> [  292.191653][   C47] pc : refcount_warn_saturate+0x12c/0x1b0
>>>> [  292.191656][   C47] lr : refcount_warn_saturate+0x12c/0x1b0
>>>> [  292.191659][   C47] sp : ffffff9da32574a0
>>>> [  292.191661][   C47] x29: ffffff9da32574a0 x28: 0000000000000001
>>>> [  292.191668][   C47] x27: ffffffd01231fc40 x26: ffffffd015cea179
>>>> [  292.191674][   C47] x25: ffffff9d29846818 x24: ffffffd012320160
>>>> [  292.191681][   C47] x23: ffffffd015cea510 x22: ffffff9d25c29668
>>>> [  292.191687][   C47] x21: ffffff9d29844490 x20: 0000000000000003
>>>> [  292.191694][   C47] x19: ffffffd0151b186b x18: 0000000000000000
>>>> [  292.191701][   C47] x17: 0000000000000000 x16: 000fffffc3b5c94704 x8 : 0000000000000001
>>>> [  292.191733][   C47] x7 : ffffff9dae4a381b x6 : ffffffc3b5c94704
>>>> [  292.191740][   C47] x5 : ffffffc3b5c94704 x4 : ffffffc3b5c94704
>>>> [  292.191746][   C47] x3 : ffffffd010000000 x2 : ffffffc3b464ae5c
>>>> [  292.191753][   C47] x1 : 8bd48ccdcee9fb00 x0 : 0000000000000000
>>>> [  292.191759][   C47] Call trace:
>>>> [  292.191762][   C47]  refcount_warn_saturate+0x12c/0x1b0
>>>> [  292.191765][   C47]  kobject_put+0x1bc/0x1f8
>>>> [  292.191768][   C47]  of_node_put+0x2c/0x40
>>>> [  292.191770][   C47]  of_fwnode_put+0x4c/0x80
>>>> [  292.191773][   C47]  fwnode_get_next_parent+0xa0/0xe8
>>>> [  292.191776][   C47]  fwnode_count_parents+0x70/0x98
>>>> [  292.191779][   C47]  fwnode_full_name_string+0x28/0xd8
>>>> [  292.191782][   C47]  device_node_string+0x28c/0x5d0
>>>> [  292.191785][   C47]  pointer+0x338/0x488
>>>> [  292.191788][   C47]  vsnprintf+0x53c/0xad8
>>>> [  292.191790][   C47]  vscnprintf+0x48/0x80
>>>> [  292.191793][   C47]  vprintk_store+0x78/0x308
>>>> [  292.191796][   C47]  vprintk_emit+0x258/0x600
>>>> [  292.191798][   C47]  vprintk_default+0xac/0xc8
>>>> [  292.191801][   C47]  vprintk_func+0x248/0x2d8
>>>> [  292.191804][   C47]  printk+0xc4/0xf4
>>>> [  292.191806][   C47]  of_node_release+0xd0/0x180
>>>> [  292.191809][   C47]  kobject_delayed_cleanup+0x1f4/0x250
>>>> [  292.191812][   C47]  process_one_work+0x800/0xd90
>>>> [  292.191815][   C47]  worker_thread+0x41c/0x6c0
>>>> [  292.191818][   C47]  kthread+0x1dc/0x1f8
>>
>> [...]
>>
>>>>
>>>> Not sure if this is significant as it seems to originate from a test, but I thought I should report it anyway.
>>>
>>> Thanks for reporting it.
>>>
>>> Can I ask you to bisect to find where it first occurred?
>>
>> ok, but that may take a little time as it's a big'ish build.
>>
>>> As the first step of the bisect, I would recommend checking whether
>>> the problem exists in version 5.4.  As a further bound on the bisect
>>> range, the furthest back the "OF: ERROR:" message could exist is
>>> version 5.0, because that is when I added the message.
>>>
>>> If you can't bisect, I will try to reproduce the error.
>>
>> OK, let me get back to you early next week on this.
>>
>> Cheers,
>> John
>>
> 
> 

