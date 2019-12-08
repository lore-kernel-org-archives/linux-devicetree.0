Return-Path: <SRS0=dKgV=Z6=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AB26C43603
	for <linux-devicetree@archiver.kernel.org>; Sun,  8 Dec 2019 22:38:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F0A5320637
	for <linux-devicetree@archiver.kernel.org>; Sun,  8 Dec 2019 22:38:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oJoEzkbG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbfLHWiR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 8 Dec 2019 17:38:17 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:43040 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726667AbfLHWiR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 8 Dec 2019 17:38:17 -0500
Received: by mail-pl1-f196.google.com with SMTP id q16so4951257plr.10
        for <devicetree@vger.kernel.org>; Sun, 08 Dec 2019 14:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MnvBbRT5iVZH0+Nzu+hGknTgiT+FwnkKwwLBbL9Zn4g=;
        b=oJoEzkbGwyMIJYmVqOV2vuz/nVqn5wdKUiDyDWQnIBOMICxwbI9aDzJfCuB9Y5iz7A
         cYjrttcvemVXPD6YhJnYemHbQ/Naq7G9isQY0oR6+07H8S2b4eBvagZc9RclbtVo5Oxt
         EEtgMLcfs3J/3c7VT8SDTP1NT7EG5oWzUt6oghdywy2GuZgCnU0DBs9lHL3YueZxCnll
         opyw7vdw3nGJ0w3W/tQsa3eFJx47fu5QCfnzoGRI1NK5i0R/BNV9XbBvqda9vMcGJmJV
         RUEUm6WbjWXlqrwxY6MUbY7tVH+4k0/AzXb47fspet8I73nnbz2lmJO3yvHxVkHo66SO
         GwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=MnvBbRT5iVZH0+Nzu+hGknTgiT+FwnkKwwLBbL9Zn4g=;
        b=UnS4B3pFmQGpcfivKPFjGfZTDf8twfnP3KfmkO0quSOQvOxr4+0wMBUNd33xzfSfjx
         Ahbc6P39Ftkf+EIq8+BSB4U3XXW2e/FzTgvE0gkyxXW/oTs/g3oTRWk2eBKqIs++LA3e
         JNZawaxR0ZRhR53tDRtvsn1sckAJdOtzMDdeBlwSb7GHzoNtOLSICfeWpduIBYsCOIxF
         6ejUyctC0xwzUaltT+feRcB5LXzNvLbypdzw/WknVvu8ba1AD54J4jblvo+V7LknRhva
         cybgeRDwBrJTemCOytbyCAgxDx9AfCDGyuYksEmAwhCU+731vtqRbPsdgD3Vd+HtMXTp
         HqmA==
X-Gm-Message-State: APjAAAW3LW5ELUNNQzBgB8OXmv/QkWNqsNISmaG3NwappfrPhmTdE3vc
        WEbL96TY2BC3Ww1vNiiqtjY=
X-Google-Smtp-Source: APXvYqyTH+955DDw+6USZnKhGT30ibfdBdfKpDWuHsUCEHkmZ+v1u36m47xK1OHv9GIbrg7P55OpWA==
X-Received: by 2002:a17:902:c58e:: with SMTP id p14mr26026826plx.202.1575844696307;
        Sun, 08 Dec 2019 14:38:16 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u2sm22210820pgc.19.2019.12.08.14.38.14
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Dec 2019 14:38:15 -0800 (PST)
Date:   Sun, 8 Dec 2019 14:38:14 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, michal.simek@xilinx.com,
        devicetree@vger.kernel.org, Rajan Vaja <rajanv@xilinx.com>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        linux-arm-kernel@lists.infradead.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/5] arm64: zynqmp: Add firmware DT node
Message-ID: <20191208223814.GA21260@roeck-us.net>
References: <20191018160735.15658-1-m.tretter@pengutronix.de>
 <20191018160735.15658-2-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018160735.15658-2-m.tretter@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Oct 18, 2019 at 06:07:31PM +0200, Michael Tretter wrote:
> From: Rajan Vaja <rajan.vaja@xilinx.com>
> 
> Add firmware DT node in ZynqMP device tree. This node
> uses bindings as per new firmware interface driver.
> 
> Signed-off-by: Rajan Vaja <rajanv@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

With this patch applied in the mainline kernel, the qemu xlnx-zcu102
emulation crashes (see below). Any idea what it might take to get
qemu back to working ?

Thanks,
Guenter

---
[   30.719268] ------------[ cut here ]------------
[   30.719403] kernel BUG at arch/arm64/kernel/traps.c:406!
[   30.719971] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
[   30.720358] Modules linked in:
[   30.720741] CPU: 3 PID: 1 Comm: swapper/0 Not tainted 5.4.0-13331-g9455d25f4e3b #1
[   30.720852] Hardware name: ZynqMP ZCU102 Rev1.0 (DT)
[   30.721157] pstate: 00000005 (nzcv daif -PAN -UAO)
[   30.721261] pc : do_undefinstr+0x2f4/0x318
[   30.721336] lr : do_undefinstr+0x1fc/0x318
[   30.721410] sp : ffff80001003b930
[   30.721486] x29: ffff80001003b930 x28: ffff00007d178040
[   30.721597] x27: 0000000000000000 x26: ffff8000117d0514
[   30.721683] x25: ffff8000118c90d0 x24: 0000000000000000
[   30.721769] x23: 0000000040000005 x22: 00000000d4000003
[   30.721854] x21: ffff800011e1c850 x20: ffff80001003b990
[   30.721940] x19: ffff800011e0fa08 x18: 0000000000000001
[   30.722025] x17: ffff800010c0f1d8 x16: ffff800010c11fb8
[   30.722111] x15: ffffffffffffffff x14: ffffffffffffffff
[   30.722196] x13: 0000000000000018 x12: 0101010101010101
[   30.722281] x11: 0000000000000000 x10: 00000000628e21fa
[   30.722384] x9 : ffff00007d178858 x8 : ffff00007d178880
[   30.722471] x7 : ffff80001003b8b0 x6 : 0000000000000001
[   30.722560] x5 : 0000000000000001 x4 : 0000000000000001
[   30.722646] x3 : 0000000000000000 x2 : 00000000000174b1
[   30.722730] x1 : ffff00007d178040 x0 : 0000000040000005
[   30.722913] Call trace:
[   30.722993]  do_undefinstr+0x2f4/0x318
[   30.723070]  el1_sync_handler+0xb0/0x108
[   30.723138]  el1_sync+0x7c/0x100
[   30.723201]  __arm_smccc_smc+0x0/0x2c
[   30.723272]  zynqmp_pm_get_api_version.part.1+0x40/0x68
[   30.723352]  zynqmp_firmware_probe+0xbc/0x298
