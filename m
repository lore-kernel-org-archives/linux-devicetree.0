Return-Path: <SRS0=PToE=Z3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE5BC3F68F
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Dec 2019 23:39:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9BBC22466E
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Dec 2019 23:39:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lSPN/8B6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725959AbfLEXjE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 5 Dec 2019 18:39:04 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40277 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725927AbfLEXjE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 5 Dec 2019 18:39:04 -0500
Received: by mail-pg1-f196.google.com with SMTP id k25so2317056pgt.7
        for <devicetree@vger.kernel.org>; Thu, 05 Dec 2019 15:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LvMWrT04hEEPsYONL+fFXOLUExLaHUMyEBeQmgihYYM=;
        b=lSPN/8B6jO+JvFpxYACKJTAwSLVstBUgQIXZIyBE9UnCe4cIm+urvyxXvRXpyj6Gx6
         HV0HXmkX6SJ05ReKJpOlMBVNUM8tDNcDY8z5Bt1q9R6eTer7Yo63oIcabNX7gXCt3Cyi
         Ml0OkqcH25oEJwOv4IuH2Ok5db2SA8/+F3lXYOq6iEE8vGrPJwNLAJxuk4BSHp8MhFVa
         axIOuijj9h+sZ00l0FIJYlLTCWC6wYZemzi2X1VpVkjQ17uSyO06c/pmdjkkXLQGRAv0
         /tvd/spBKJlN02H+2uroBP+nCW8H79759U6GoU248S71mJEV7yo7Po2uz08mxGAJlqMZ
         9YPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LvMWrT04hEEPsYONL+fFXOLUExLaHUMyEBeQmgihYYM=;
        b=Z7ZFWVRW+TM+Yk9XOMjPQfNfIAqGElRmcQAndLsJcTG5+zUAE1M9M8/Au3qpGyB7Qs
         gYapQGXEyeUkeY7rdY++9oD0UQBHWBI0gf93+FUNYecdtVNX16wrRXCgTFfWcji9cWn7
         65MYnI4/I/7ZgTL8KFOC8ZAlFrK+qK5+xzW43cgH77UF+bm32cdaHbeS9K1u4cxUcKCM
         2qcIo3C4sni7k9VvrggferzXGKT+fIlaGKmgLY4G9iMxZFUWX1iJfHTbqKwQLihAyOp4
         D/2jIRGxe45ohtmOtlKNklJKtk9ZxQZaCD5aPgTL1p1jOiAuzFGlLceBn6N+ApXO2PAj
         8KVA==
X-Gm-Message-State: APjAAAWJjykUVENx9N7vJ+FTdM5QDN/ZZE76/gzg2Rtb8MVz+/+xEus4
        ijUr0C0okIcBitIE+pDRaoVwaArO
X-Google-Smtp-Source: APXvYqyC5SNWgF3OIHva41zWne/BulFmBS6WgYF2Oy/oQPDbVOP1Q/AigVFX3AyIB7PZ3+vMbL7ZWw==
X-Received: by 2002:aa7:95a9:: with SMTP id a9mr11320743pfk.15.1575589143421;
        Thu, 05 Dec 2019 15:39:03 -0800 (PST)
Received: from [10.220.99.133] ([125.29.25.186])
        by smtp.gmail.com with ESMTPSA id s18sm13710431pfm.27.2019.12.05.15.39.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Dec 2019 15:39:02 -0800 (PST)
Subject: Re: of_node_release() warn
To:     John Garry <john.garry@huawei.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Anders Roxell <anders.roxell@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <ff1eb50f-fd08-0022-d0cd-fefdac806f96@huawei.com>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <fec28875-fa5b-d086-c5be-77cc63365d18@gmail.com>
Date:   Thu, 5 Dec 2019 17:38:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ff1eb50f-fd08-0022-d0cd-fefdac806f96@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi John,

On 12/5/19 6:12 AM, John Garry wrote:
> Hi all,
> 
> I am booting an *allmodconfig* kernel on my arm64 system from Linus' master branch, and I see this:
> 
> [  292.117483][  T406] driver: 'unittest-i2c-bus': driver_release
> [  292.125954][  T487] kobject: 'unittest-i2c-dev': free name
> [  292.134162][  T406] kobject: 'unittest-i2c-bus': free name
> [  292.171965][  T504] kobject: 'test-unittest111' ((____ptrval____)): kobject_cleanup, parent (____ptrval____)
> [  292.181866][  T504] kobject: 'test-unittest111' ((____ptrval____)): calling ktype release

The following "OF: ERROR: memory leak ..." message is not an expected error from the unittest:

> [  292.191376][  T504] OF: ERROR: memory leak before free overlay changeset, /testcase-data/overlay-node/test-bus/test-unittest11/test-unittest111


> [  292.191386][   C47] ------------[ cut here ]------------
> [  292.191391][   C47] refcount_t: addition on 0; use-after-free.
> [  292.191397][   C47] WARNING: CPU: 47 PID: 504 at lib/refcount.c:25 refcount_warn_saturate+0xf4/0x1b0
> [  292.191399][   C47] Modules linked in:
> [  292.191406][   C47] CPU: 47 PID: 504 Comm: kworker/47:2 Tainted: G     W         5.4.0+ #1424
> [  292.191411][   C47] Hardware name: Huawei Taishan 2280 /D05, BIOS Hisilicon D05 IT21 Nemo 2.0 RC0 04/18/2018
> [  292.191414][   C47] Workqueue: events kobject_delayed_cleanup
> [  292.191420][   C47] pstate: 80400085 (Nzcv daIf +PAN -UAO)
> [  292.191423][   C47] pc : refcount_warn_saturate+0xf4/0x1b0
> [  292.191427][   C47] lr : refcount_warn_saturate+0xf4/0x1b0
> [  292.191429][   C47] sp : ffffff9da32574c0
> [  292.191432][   C47] x29: ffffff9da32574c0 x28: 0000000000000001
> [  292.191438][   C47] x27: ffffffd01231fc40 x26: ffffffd015cea179
> [  292.191445][   C47] x25: ffffff9d29846818 x24: ffffffd012320160
> [  292.191452][   C47] x23: ffffffd015cea510 x22: ffffffd015cea179
> [  292.191458][   C47] x21: ffffff9d29844490 x20: 0000000000000002
> [  292.191465][   C47] x19: ffffffd0151b186b x18: 0000000000000000
> [  292.191471][   C47] x17: 0000000000000000 x16: 0000000000002760
> [  292.191478][   C47] x15: 0000000000000000 x14: 726170202c70756e
> [  292.191485][   C47] x13: 61656c635f746365 x12: 1ffffff3b5c94703
> [  292.191491][   C47] x11: ffffffc3b5c94703 x10: dfffffd000000000
> [  292.191498][   C47] x9 : ffffffc3b5c94704 x8 : 0000000000000001
> [  292.191504][   C47] x7 : ffffff9dae4a381b x6 : ffffffc3b5c94704
> [  292.191511][   C47] x5 : ffffffc3b5c94704 x4 : ffffffc3b5c94704
> [  292.191517][   C47] x3 : ffffffd010000000 x2 : ffffffc3b464ae60
> [  292.191524][   C47] x1 : 8bd48ccdcee9fb00 x0 : 0000000000000000
> [  292.191530][   C47] Call trace:
> [  292.191533][   C47]  refcount_warn_saturate+0xf4/0x1b0
> [  292.191536][   C47]  kobject_get+0x9c/0x100
> [  292.191539][   C47]  of_node_get+0x2c/0x40
> [  292.191541][   C47]  of_get_parent+0x50/0x88
> [  292.191544][   C47]  of_fwnode_get_parent+0x4c/0xa8
> [  292.191547][   C47]  fwnode_count_parents+0x54/0x98
> [  292.191551][   C47]  fwnode_full_name_string+0x28/0xd8
> [  292.191554][   C47]  device_node_string+0x28c/0x5d0
> [  292.191556][   C47]  pointer+0x338/0x488
> [  292.191559][   C47]  vsnprintf+0x53c/0xad8
> [  292.191562][   C47]  vscnprintf+0x48/0x80
> [  292.191565][   C47]  vprintk_store+0x78/0x308
> [  292.191567][   C47]  vprintk_emit+0x258/0x600
> [  292.191570][   C47]  vprintk_default+0xac/0xc8
> [  292.191573][   C47]  vprintk_func+0x248/0x2d8
> [  292.191575][   C47]  printk+0xc4/0xf4
> [  292.191578][   C47]  of_node_release+0xd0/0x180
> [  292.191581][   C47]  kobject_delayed_cleanup+0x1f4/0x250
> [  292.191584][   C47]  process_one_work+0x800/0xd90
> [  292.191587][   C47]  worker_thread+0x41c/0x6c0
> [  292.191590][   C47]  kthread+0x1dc/0x1f8
> [  292.191592][   C47]  ret_from_fork+0x10/0x18
> [  292.191595][   C47] irq event stamp: 2118
> [  292.191600][   C47] hardirqs last  enabled at (2117): [<ffffffd0115faaa0>] _raw_spin_unlock_irq+0x38/0xc0
> [  292.191604][   C47] hardirqs last disabled at (2118): [<ffffffd0115ef040>] __schedule+0x310/0xd70
> [  292.191609][   C47] softirqs last  enabled at (1408): [<ffffffd0100e2fac>] __do_softirq+0x804/0x870
> [  292.191613][   C47] softirqs last disabled at (1399): [<ffffffd0101b9d4c>] irq_exit+0x11c/0x1a8
> [  292.191616][   C47] ---[ end trace f80ccb1560e43eff ]---
> [  292.191620][   C47] ------------[ cut here ]------------
> [  292.191623][   C47] refcount_t: underflow; use-after-free.
> [  292.191628][   C47] WARNING: CPU: 47 PID: 504 at lib/refcount.c:28 refcount_warn_saturate+0x12c/0x1b0
> [  292.191630][   C47] Modules linked in:
> [  292.191637][   C47] CPU: 47 PID: 504 Comm: kworker/47:2 Tainted: G     W         5.4.0+ #1424
> [  292.191641][   C47] Hardware name: Huawei Taishan 2280 /D05, BIOS Hisilicon D05 IT21 Nemo 2.0 RC0 04/18/2018
> [  292.191645][   C47] Workqueue: events kobject_delayed_cleanup
> [  292.191650][   C47] pstate: 80400085 (Nzcv daIf +PAN -UAO)
> [  292.191653][   C47] pc : refcount_warn_saturate+0x12c/0x1b0
> [  292.191656][   C47] lr : refcount_warn_saturate+0x12c/0x1b0
> [  292.191659][   C47] sp : ffffff9da32574a0
> [  292.191661][   C47] x29: ffffff9da32574a0 x28: 0000000000000001
> [  292.191668][   C47] x27: ffffffd01231fc40 x26: ffffffd015cea179
> [  292.191674][   C47] x25: ffffff9d29846818 x24: ffffffd012320160
> [  292.191681][   C47] x23: ffffffd015cea510 x22: ffffff9d25c29668
> [  292.191687][   C47] x21: ffffff9d29844490 x20: 0000000000000003
> [  292.191694][   C47] x19: ffffffd0151b186b x18: 0000000000000000
> [  292.191701][   C47] x17: 0000000000000000 x16: 000fffffc3b5c94704 x8 : 0000000000000001
> [  292.191733][   C47] x7 : ffffff9dae4a381b x6 : ffffffc3b5c94704
> [  292.191740][   C47] x5 : ffffffc3b5c94704 x4 : ffffffc3b5c94704
> [  292.191746][   C47] x3 : ffffffd010000000 x2 : ffffffc3b464ae5c
> [  292.191753][   C47] x1 : 8bd48ccdcee9fb00 x0 : 0000000000000000
> [  292.191759][   C47] Call trace:
> [  292.191762][   C47]  refcount_warn_saturate+0x12c/0x1b0
> [  292.191765][   C47]  kobject_put+0x1bc/0x1f8
> [  292.191768][   C47]  of_node_put+0x2c/0x40
> [  292.191770][   C47]  of_fwnode_put+0x4c/0x80
> [  292.191773][   C47]  fwnode_get_next_parent+0xa0/0xe8
> [  292.191776][   C47]  fwnode_count_parents+0x70/0x98
> [  292.191779][   C47]  fwnode_full_name_string+0x28/0xd8
> [  292.191782][   C47]  device_node_string+0x28c/0x5d0
> [  292.191785][   C47]  pointer+0x338/0x488
> [  292.191788][   C47]  vsnprintf+0x53c/0xad8
> [  292.191790][   C47]  vscnprintf+0x48/0x80
> [  292.191793][   C47]  vprintk_store+0x78/0x308
> [  292.191796][   C47]  vprintk_emit+0x258/0x600
> [  292.191798][   C47]  vprintk_default+0xac/0xc8
> [  292.191801][   C47]  vprintk_func+0x248/0x2d8
> [  292.191804][   C47]  printk+0xc4/0xf4
> [  292.191806][   C47]  of_node_release+0xd0/0x180
> [  292.191809][   C47]  kobject_delayed_cleanup+0x1f4/0x250
> [  292.191812][   C47]  process_one_work+0x800/0xd90
> [  292.191815][   C47]  worker_thread+0x41c/0x6c0
> [  292.191818][   C47]  kthread+0x1dc/0x1f8
> [  292.191820][   C47]  ret_from_fork+0x10/0x18
> [  292.191823][   C47] irq event stamp: 2118
> [  292.191828][   C47] hardirqs last  enabled at (2117): [<ffffffd0115faaa0>] _raw_spin_unlock_irq+0x38/0xc0
> [  292.191833][   C47] hardirqs last disabled at (2118): [<ffffffd0115ef040>] __schedule+0x310/0xd70
> [  292.191837][   C47] softirqs last  enabled at (1408): [<ffffffd0100e2fac>] __do_softirq+0x804/0x870
> [  292.191842][   C47] softirqs last disabled at (1399): [<ffffffd0101b9d4c>] irq_exit+0x11c/0x1a8
> [  292.191845][   C47] ---[ end trace f80ccb1560e43f00 ]---
> [  292.191849][   C47] ------------[ cut here ]------------
> [  292.191854][   C47] refcount_t: saturated; leaking memory.
> [  292.191860][   C47] WARNING: CPU: 47 PID: 504 at lib/refcount.c:22 refcount_warn_saturate+0xbc/0x1b0
> [  292.191862][   C47] Modules linked in:
> [  292.191871][   C47] CPU: 47 PID: 504 Comm: kworker/47:2 Tainted: G     W         5.4.0+ #1424
> [  292.191877][   C47] Hardware name: Huawei Taishan 2280 /D05, BIOS Hisilicon D05 IT21 Nemo 2.0 RC0 04/18/2018
> [  292.191881][   C47] Workqueue: events kobject_delayed_cleanup
> [  292.191887][   C47] pstate: 80400085 (Nzcv daIf +PAN -UAO)
> [  292.191891][   C47] pc : refcount_warn_saturate+0xbc/0x1b0
> [  292.191894][   C47] lr : refcount_warn_saturate+0xbc/0x1b0
> [  292.191897][   C47] sp : ffffff9da3257480
> [  292.191899][   C47] x29: ffffff9da3257480 x28: 0000000000000001
> [  292.191906][   C47] x27: ffffffd01231fc40 x26: ffffffd015cea179
> [  292.191913][   C47] x25: ffffff9d29846818 x24: ffffffd01231fc40
> [  292.191920][   C47] x23: ffffffd015cea510 x22: ffffffd01124fee8
> [  292.191926][   C47] x21: ffffff9d29844490 x20: 0000000000000001
> [  292.191933][   C47] x19: ffffffd0151b186b x18: 0000000000000000
> [  292.191940][   C47] x17: 0000000000000000 x16: 0000000000002760
> [  292.191947][   C47] x15: 0000000000000000 x14: 726170202c70756e
> [  292.191954][   C47] x13: 61656c635f746365 x12: 1ffffff3b5c94703
> [  292.191960][   C47] x11: ffffffc3b5c94703 x10: dfffffd000000000
> [  292.191967][   C47] x9 : ffffffc3b5c94704 x8 : 0000000000000001
> [  292.191974][   C47] x7 : ffffff9dae4a381b x6 : ffffffc3b5c94704
> [  292.191981][   C47] x5 : ffffffc3b5c94704 x4 : ffffffc3b5c94704
> [  292.191988][   C47] x3 : ffffffd010000000 x2 : ffffffc3b464ae58
> [  292.191995][   C47] x1 : 8bd48ccdcee9fb00 x0 : 0000000000000000
> [  292.192001][   C47] Call trace:
> [  292.192005][   C47]  refcount_warn_saturate+0xbc/0x1b0
> [  292.192008][   C47]  kobject_get+0xbc/0x100
> [  292.192010][   C47]  of_node_get+0x2c/0x40
> [  292.192013][   C47]  of_get_parent+0x50/0x88
> [  292.192016][   C47]  of_fwnode_get_parent+0x4c/0xa8
> [  292.192019][   C47]  fwnode_get_next_parent+0x64/0xe8
> [  292.192023][   C47]  fwnode_get_nth_parent+0x80/0xb0
> [  292.192026][   C47]  fwnode_full_name_string+0x58/0xd8
> [  292.192029][   C47]  device_node_string+0x28c/0x5d0
> [  292.192032][   C47]  pointer+0x338/0x488
> [  292.192035][   C47]  vsnprintf+0x53c/0xad8
> [  292.192037][   C47]  vscnprintf+0x48/0x80
> [  292.192040][   C47]  vprintk_store+0x78/0x308
> [  292.192043][   C47]  vprintk_emit+0x258/0x600
> [  292.192046][   C47]  vprintk_default+0xac/0xc8
> [  292.192049][   C47]  vprintk_func+0x248/0x2d8
> [  292.192051][   C47]  printk+0xc4/0xf4
> [  292.192054][   C47]  of_node_release+0xd0/0x180
> [  292.192057][   C47]  kobject_delayed_cleanup+0x1f4/0x250
> [  292.192060][   C47]  process_one_work+0x800/0xd90
> [  292.192063][   C47]  worker_thread+0x41c/0x6c0
> [  292.192065][   C47]  kthread+0x1dc/0x1f8
> [  292.192068][   C47]  ret_from_fork+0x10/0x18
> [  292.192071][   C47] irq event stamp: 2118
> [  292.192076][   C47] hardirqs last  enabled at (2117): [<ffffffd0115faaa0>] _raw_spin_unlock_irq+0x38/0xc0
> [  292.192080][   C47] hardirqs last disabled at (2118): [<ffffffd0115ef040>] __schedule+0x310/0xd70
> [  292.192085][   C47] softirqs last  enabled at (1408): [<ffffffd0100e2fac>] __do_softirq+0x804/0x870
> [  292.192089][   C47] softirqs last disabled at (1399): [<ffffffd0101b9d4c>] irq_exit+0x11c/0x1a8
> [  292.192093][   C47] ---[ end trace f80ccb1560e43f01 ]---
> 
> 
> Not sure if this is significant as it seems to originate from a test, but I thought I should report it anyway.

Thanks for reporting it.

Can I ask you to bisect to find where it first occurred?
As the first step of the bisect, I would recommend checking whether
the problem exists in version 5.4.  As a further bound on the bisect
range, the furthest back the "OF: ERROR:" message could exist is
version 5.0, because that is when I added the message.

If you can't bisect, I will try to reproduce the error.

Thanks,

Frank

> 
> Git log:
> f13437b8917 (origin/master, origin/HEAD) Merge tag 'trace-v5.5-2' of git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace
> 056df578c2dc Merge tag 'arc-5.5-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc
> aedc0650f913 Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm
> 6cdc7f2efc25 Merge tag 'riscv/for-v5.5-rc1-2' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux
> ef66f6b8e3f5 Merge tag 'please-pull-misc-5.5' of git://git.kernel.org/pub/scm/linux/kernel/git/aegl/linux
> b92f3d32e098 Merge tag 'acpi-5.5-rc1-2' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm
> ef867c12f31d Merge tag 'pm-5.5-rc1-2' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm
> a356646a5685 tracing: Do not create directories if lockdown is in affect
> 7d73710d9ca2 kvm: vmx: Stop wasting a page for guest_msrs
> 
> .config is attached.
> 
> Thanks,
> John

