Return-Path: <SRS0=4wOv=AI=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F23EC433DF
	for <linux-devicetree@archiver.kernel.org>; Sat, 27 Jun 2020 03:57:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 670DD20857
	for <linux-devicetree@archiver.kernel.org>; Sat, 27 Jun 2020 03:57:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vBlJLbf3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725832AbgF0D54 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 26 Jun 2020 23:57:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725824AbgF0D54 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 26 Jun 2020 23:57:56 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEF12C03E979
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2020 20:57:55 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id e9so5844655pgo.9
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2020 20:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=q6S07lknU7tVOiUs6tLtw9iT9ItDXgopWOouw+Pos+4=;
        b=vBlJLbf3UYvxdTkXW6YlyOUbYdRYgxQkpMwuCjRw4pMABlX3+KD/WmMBNWazr3cmYw
         UJLkQ22erWbGX54jZ3hhRrkUdhRL5mMV8ZigIRMtp8AGvXCtVPyeskMYdtkd++tHN0jC
         UfkfTLx8LIzasz2pnDNO4rVQmJyuL1AVDlWRbmnS9fqNJtwIEmYJBt6kq4KlhnyttMva
         0QGFv83Axet8SghixCzri+/HRoM1aDZPeAeXQZEQVMt6r+R7jCyW2uw9nafc/TWL45cq
         urlQsgLhWgS2VkN5mFy5+iKpFPyJQYhqAK+BGB55pbtb69q1oc6I62hWKgwGEiqrt8vO
         n3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=q6S07lknU7tVOiUs6tLtw9iT9ItDXgopWOouw+Pos+4=;
        b=bv0Y4C1/J6umwemPl1M0skP8mop8FxvJxtzzSmhKfyz/FoQGwzkmtKtpYSveKRQ7u2
         ANkLcoLQmf8mRUCp+3VtMenFECpLNDkZyJ4GmgWMXVhdPAy6ssmt8cGW9sPpowAugaei
         cXA8hN9dIKBeIlRr4RfAYIeDMLYgE+GiPto+RrBlJ3zt96zCxqsMktg2XYM2mAmusQyl
         49p+9DDnTJ3ktFwp5tUWWTD1pqvjucvM8IAn1NB3rgXzGxry3c/SHf2xYyVrIRoBJ5ha
         ErgQqjVrXaOT8XNempOSGbTH1hNsijhy8BfZKhCDelk5JGvPsUEUUgZUGl3Bjm2FS9S4
         pB8A==
X-Gm-Message-State: AOAM531hRLoAn+567B1DoU1y6m8NPdvPQvz/RF2oZN9NjSabhEkj7N6D
        /Ns0MjrTQApeP7F1IN78yy8AXY5U
X-Google-Smtp-Source: ABdhPJxMaDFOyYs60EAMEfareyw9q2q6FuSlcQIrD7rKTXfCXayxRJ1xX7WEftHehGGTLfzRHCY50Q==
X-Received: by 2002:a63:d958:: with SMTP id e24mr1782622pgj.348.1593230275289;
        Fri, 26 Jun 2020 20:57:55 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z1sm23602080pgk.89.2020.06.26.20.57.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jun 2020 20:57:54 -0700 (PDT)
Date:   Fri, 26 Jun 2020 20:57:53 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Rob Herring <robh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 04/20] arm64: dts: arm: vexpress: Move fixed devices
 out of bus node
Message-ID: <20200627035753.GA63049@roeck-us.net>
References: <20200513103016.130417-1-andre.przywara@arm.com>
 <20200513103016.130417-5-andre.przywara@arm.com>
 <20200528024810.GA232303@roeck-us.net>
 <20200528025552.GA232631@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528025552.GA232631@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, May 27, 2020 at 07:55:52PM -0700, Guenter Roeck wrote:
> On Wed, May 27, 2020 at 07:48:10PM -0700, Guenter Roeck wrote:
> > On Wed, May 13, 2020 at 11:30:00AM +0100, Andre Przywara wrote:
> > > The devicetree compiler complains when DT nodes without a reg property
> > > live inside a (simple) bus node:
> > > Warning (simple_bus_reg): Node /bus@8000000/motherboard-bus/refclk32khz
> > >                           missing or empty reg/ranges property
> > > 
> > > Move the fixed clocks, the fixed regulator, the leds and the config bus
> > > subtree to the root node, since they do not depend on any busses.
> > > 
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > 
> > This patch results in tracebacks when booting the vexpress-a15 machine
> > with vexpress-v2p-ca15-tc1 devicetree file in qemu. Reverting it as well
> > as the subsequent patches affecting the same file (to avoid revert
> > conflicts) fixes the problem.
> > 
> 
> On top of that, there is this message:
> 
> [   19.817986] vexpress-reset mcc:reboot: Unable to restart (-14)
> [   20.818315] Reboot failed -- System halted
> 
> which also disappears after the patches have been reverted.
> 

The problem reported below is still seen in the mainline kernel.

> Here is my list of reverts on top of next-20200526:
> 
> bdc8a817612b (HEAD -> master) Revert "arm64: dts: vexpress: Move fixed devices out of bus node"
> 9a1f85df9e1a Revert "arm64: dts: fvp/juno: Fix serial node names"
> 381e0bbe8c00 Revert "arm64: dts: fvp/juno: Fix bus node names"
> 63723f67bf4b Revert "arm64: dts: vexpress: Fix VExpress LED names"
> 

Maybe all those patches should be reverted if no fix is in sight ?

Guenter

> Guenter
> 
> > Guenter
> > 
> > ---
> > [   12.744248] ------------[ cut here ]------------
> > [   12.744562] WARNING: CPU: 0 PID: 20 at drivers/tty/serial/serial_core.c:471 uart_get_baud_rate+0x100/0x154
> > [   12.744607] Modules linked in:
> > [   12.744785] CPU: 0 PID: 20 Comm: kworker/0:1 Not tainted 5.7.0-rc7-next-20200526 #1
> > [   12.744818] Hardware name: ARM-Versatile Express
> > [   12.745021] Workqueue: events amba_deferred_retry_func
> > [   12.745155] [<c0312484>] (unwind_backtrace) from [<c030c490>] (show_stack+0x10/0x14)
> > [   12.745206] [<c030c490>] (show_stack) from [<c0880f04>] (dump_stack+0xc8/0xdc)
> > [   12.745239] [<c0880f04>] (dump_stack) from [<c0346e44>] (__warn+0xdc/0xf4)
> > [   12.745270] [<c0346e44>] (__warn) from [<c0346f0c>] (warn_slowpath_fmt+0xb0/0xb8)
> > [   12.745302] [<c0346f0c>] (warn_slowpath_fmt) from [<c0a6b16c>] (uart_get_baud_rate+0x100/0x154)
> > [   12.745336] [<c0a6b16c>] (uart_get_baud_rate) from [<c0a7f5ac>] (pl011_set_termios+0x48/0x32c)
> > [   12.745367] [<c0a7f5ac>] (pl011_set_termios) from [<c0a6bbbc>] (uart_set_options+0x124/0x164)
> > [   12.745404] [<c0a6bbbc>] (uart_set_options) from [<c1b8c804>] (pl011_console_setup+0x214/0x230)
> > [   12.745438] [<c1b8c804>] (pl011_console_setup) from [<c03ab0d8>] (try_enable_new_console+0x98/0x138)
> > [   12.745469] [<c03ab0d8>] (try_enable_new_console) from [<c03acc64>] (register_console+0xe8/0x304)
> > [   12.745499] [<c03acc64>] (register_console) from [<c0a6c88c>] (uart_add_one_port+0x4c0/0x504)
> > [   12.745529] [<c0a6c88c>] (uart_add_one_port) from [<c0a80404>] (pl011_register_port+0x5c/0xac)
> > [   12.745568] [<c0a80404>] (pl011_register_port) from [<c097f5a0>] (amba_probe+0x9c/0x110)
> > [   12.745602] [<c097f5a0>] (amba_probe) from [<c0b57e84>] (really_probe+0x218/0x348)
> > [   12.745632] [<c0b57e84>] (really_probe) from [<c0b580c0>] (driver_probe_device+0x5c/0xb4)
> > [   12.745662] [<c0b580c0>] (driver_probe_device) from [<c0b55ff4>] (bus_for_each_drv+0x58/0xb8)
> > [   12.745692] [<c0b55ff4>] (bus_for_each_drv) from [<c0b57bf8>] (__device_attach+0xd4/0x140)
> > [   12.745721] [<c0b57bf8>] (__device_attach) from [<c0b56eb0>] (bus_probe_device+0x88/0x90)
> > [   12.745751] [<c0b56eb0>] (bus_probe_device) from [<c0b53234>] (device_add+0x3d4/0x6e8)
> > [   12.745782] [<c0b53234>] (device_add) from [<c097f664>] (amba_device_try_add+0x50/0x2d4)
> > [   12.745812] [<c097f664>] (amba_device_try_add) from [<c097f924>] (amba_deferred_retry+0x3c/0x98)
> > [   12.745847] [<c097f924>] (amba_deferred_retry) from [<c097f988>] (amba_deferred_retry_func+0x8/0x40)
> > [   12.745881] [<c097f988>] (amba_deferred_retry_func) from [<c0365b6c>] (process_one_work+0x2b8/0x6e8)
> > [   12.745912] [<c0365b6c>] (process_one_work) from [<c0365fe0>] (worker_thread+0x44/0x540)
> > [   12.745942] [<c0365fe0>] (worker_thread) from [<c036d810>] (kthread+0x16c/0x178)
> > [   12.745973] [<c036d810>] (kthread) from [<c03001a8>] (ret_from_fork+0x14/0x2c)
> > [   12.746041] Exception stack(0xc73abfb0 to 0xc73abff8)
> > [   12.746181] bfa0:                                     00000000 00000000 00000000 00000000
> > [   12.746302] bfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> > [   12.746397] bfe0: 00000000 00000000 00000000 00000000 00000013 00000000
> > [   12.746651] ---[ end trace 2a3f61da56bd8a49 ]---
> > 
> > ---
> > # bad: [b0523c7b1c9d0edcd6c0fe6d2cb558a9ad5c60a8] Add linux-next specific files for 20200526
> > # good: [9cb1fd0efd195590b828b9b865421ad345a4a145] Linux 5.7-rc7
> > git bisect start 'next-20200526' 'v5.7-rc7'
> > # bad: [0c7351ad83670964e48cb9a098ad732c1ecbf804] Merge remote-tracking branch 'crypto/master'
> > git bisect bad 0c7351ad83670964e48cb9a098ad732c1ecbf804
> > # bad: [42e11d9b4682229fa7187d129758b8c382f8cd5d] Merge remote-tracking branch 'jc_docs/docs-next'
> > git bisect bad 42e11d9b4682229fa7187d129758b8c382f8cd5d
> > # bad: [ab6f501559e9efa687c711a781243cf6651a82d3] Merge remote-tracking branch 'm68k/for-next'
> > git bisect bad ab6f501559e9efa687c711a781243cf6651a82d3
> > # bad: [44aaa516ca63b3ab2da8ae81e9c6a58656e6acb5] Merge branch 'arm/drivers' into for-next
> > git bisect bad 44aaa516ca63b3ab2da8ae81e9c6a58656e6acb5
> > # good: [1cb00f8c3b36e6ae026fb58d1cd2ccd78b81aa9f] Merge tag 'qcom-arm64-for-5.8' of git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/dt
> > git bisect good 1cb00f8c3b36e6ae026fb58d1cd2ccd78b81aa9f
> > # bad: [ed0c25932fbfafdfe37e9633dee21770d3c5a306] Merge branch 'arm/defconfig' into for-next
> > git bisect bad ed0c25932fbfafdfe37e9633dee21770d3c5a306
> > # bad: [9eddc06a3bc79402f50176703237ed045ae77b16] Merge branch 'mmp/fixes' into arm/dt
> > git bisect bad 9eddc06a3bc79402f50176703237ed045ae77b16
> > # bad: [87b990ab62722a8a3cb0691107971ab1bd7bddb5] Merge tag 'mvebu-dt64-5.8-1' of git://git.infradead.org/linux-mvebu into arm/dt
> > git bisect bad 87b990ab62722a8a3cb0691107971ab1bd7bddb5
> > # bad: [94cc3f1baabac5e5c4dcc6c2f070353f8315d0ee] arm64: dts: juno: Fix SCPI shared mem node name
> > git bisect bad 94cc3f1baabac5e5c4dcc6c2f070353f8315d0ee
> > # bad: [a78aee9e434932a500db36cc6d88daeff3745e9f] arm64: dts: juno: Fix GIC child nodes
> > git bisect bad a78aee9e434932a500db36cc6d88daeff3745e9f
> > # bad: [feebdc3f7950d7e44e914e821f6c04e58e292c74] arm64: dts: fvp: Move fixed clocks out of bus node
> > git bisect bad feebdc3f7950d7e44e914e821f6c04e58e292c74
> > # good: [849bfc3dfc13cde6ec04fbcf32af553ded9f7ec3] arm64: dts: fvp: Move fixed devices out of bus node
> > git bisect good 849bfc3dfc13cde6ec04fbcf32af553ded9f7ec3
> > # bad: [d9258898ad49cbb46caffe23af0d4f0b766e67a2] arm64: dts: vexpress: Move fixed devices out of bus node
> > git bisect bad d9258898ad49cbb46caffe23af0d4f0b766e67a2
> > # first bad commit: [d9258898ad49cbb46caffe23af0d4f0b766e67a2] arm64: dts: vexpress: Move fixed devices out of bus node
> > 
