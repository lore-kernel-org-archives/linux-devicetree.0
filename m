Return-Path: <SRS0=2ZKK=7K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B42DC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 13:31:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 37E362072D
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 13:31:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390207AbgE1Nbu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 May 2020 09:31:50 -0400
Received: from foss.arm.com ([217.140.110.172]:52822 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390303AbgE1Nbu (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 28 May 2020 09:31:50 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5687DD6E;
        Thu, 28 May 2020 06:31:49 -0700 (PDT)
Received: from [192.168.2.22] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 34C4B3F52E;
        Thu, 28 May 2020 06:31:48 -0700 (PDT)
Subject: Re: [PATCH v3 04/20] arm64: dts: arm: vexpress: Move fixed devices
 out of bus node
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Rob Herring <robh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20200513103016.130417-1-andre.przywara@arm.com>
 <20200513103016.130417-5-andre.przywara@arm.com>
 <20200528024810.GA232303@roeck-us.net>
From:   =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Organization: ARM Ltd.
Message-ID: <48afb8bb-a22a-54df-7751-55b7b84c3c88@arm.com>
Date:   Thu, 28 May 2020 14:30:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200528024810.GA232303@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 28/05/2020 03:48, Guenter Roeck wrote:

Hi Guenter,

> On Wed, May 13, 2020 at 11:30:00AM +0100, Andre Przywara wrote:
>> The devicetree compiler complains when DT nodes without a reg property
>> live inside a (simple) bus node:
>> Warning (simple_bus_reg): Node /bus@8000000/motherboard-bus/refclk32khz
>>                           missing or empty reg/ranges property
>>
>> Move the fixed clocks, the fixed regulator, the leds and the config bus
>> subtree to the root node, since they do not depend on any busses.
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> 
> This patch results in tracebacks when booting the vexpress-a15 machine
> with vexpress-v2p-ca15-tc1 devicetree file in qemu. Reverting it as well
> as the subsequent patches affecting the same file (to avoid revert
> conflicts) fixes the problem.

Many thanks for the heads up! I was able to reproduce it here. On the
first glance it looks like the UART is probed before the clocks now,
because the traversal of the changed DT leads to a different probe
order. I will look into how to fix this.

Cheers,
Andre

> 
> Guenter
> 
> ---
> [   12.744248] ------------[ cut here ]------------
> [   12.744562] WARNING: CPU: 0 PID: 20 at drivers/tty/serial/serial_core.c:471 uart_get_baud_rate+0x100/0x154
> [   12.744607] Modules linked in:
> [   12.744785] CPU: 0 PID: 20 Comm: kworker/0:1 Not tainted 5.7.0-rc7-next-20200526 #1
> [   12.744818] Hardware name: ARM-Versatile Express
> [   12.745021] Workqueue: events amba_deferred_retry_func
> [   12.745155] [<c0312484>] (unwind_backtrace) from [<c030c490>] (show_stack+0x10/0x14)
> [   12.745206] [<c030c490>] (show_stack) from [<c0880f04>] (dump_stack+0xc8/0xdc)
> [   12.745239] [<c0880f04>] (dump_stack) from [<c0346e44>] (__warn+0xdc/0xf4)
> [   12.745270] [<c0346e44>] (__warn) from [<c0346f0c>] (warn_slowpath_fmt+0xb0/0xb8)
> [   12.745302] [<c0346f0c>] (warn_slowpath_fmt) from [<c0a6b16c>] (uart_get_baud_rate+0x100/0x154)
> [   12.745336] [<c0a6b16c>] (uart_get_baud_rate) from [<c0a7f5ac>] (pl011_set_termios+0x48/0x32c)
> [   12.745367] [<c0a7f5ac>] (pl011_set_termios) from [<c0a6bbbc>] (uart_set_options+0x124/0x164)
> [   12.745404] [<c0a6bbbc>] (uart_set_options) from [<c1b8c804>] (pl011_console_setup+0x214/0x230)
> [   12.745438] [<c1b8c804>] (pl011_console_setup) from [<c03ab0d8>] (try_enable_new_console+0x98/0x138)
> [   12.745469] [<c03ab0d8>] (try_enable_new_console) from [<c03acc64>] (register_console+0xe8/0x304)
> [   12.745499] [<c03acc64>] (register_console) from [<c0a6c88c>] (uart_add_one_port+0x4c0/0x504)
> [   12.745529] [<c0a6c88c>] (uart_add_one_port) from [<c0a80404>] (pl011_register_port+0x5c/0xac)
> [   12.745568] [<c0a80404>] (pl011_register_port) from [<c097f5a0>] (amba_probe+0x9c/0x110)
> [   12.745602] [<c097f5a0>] (amba_probe) from [<c0b57e84>] (really_probe+0x218/0x348)
> [   12.745632] [<c0b57e84>] (really_probe) from [<c0b580c0>] (driver_probe_device+0x5c/0xb4)
> [   12.745662] [<c0b580c0>] (driver_probe_device) from [<c0b55ff4>] (bus_for_each_drv+0x58/0xb8)
> [   12.745692] [<c0b55ff4>] (bus_for_each_drv) from [<c0b57bf8>] (__device_attach+0xd4/0x140)
> [   12.745721] [<c0b57bf8>] (__device_attach) from [<c0b56eb0>] (bus_probe_device+0x88/0x90)
> [   12.745751] [<c0b56eb0>] (bus_probe_device) from [<c0b53234>] (device_add+0x3d4/0x6e8)
> [   12.745782] [<c0b53234>] (device_add) from [<c097f664>] (amba_device_try_add+0x50/0x2d4)
> [   12.745812] [<c097f664>] (amba_device_try_add) from [<c097f924>] (amba_deferred_retry+0x3c/0x98)
> [   12.745847] [<c097f924>] (amba_deferred_retry) from [<c097f988>] (amba_deferred_retry_func+0x8/0x40)
> [   12.745881] [<c097f988>] (amba_deferred_retry_func) from [<c0365b6c>] (process_one_work+0x2b8/0x6e8)
> [   12.745912] [<c0365b6c>] (process_one_work) from [<c0365fe0>] (worker_thread+0x44/0x540)
> [   12.745942] [<c0365fe0>] (worker_thread) from [<c036d810>] (kthread+0x16c/0x178)
> [   12.745973] [<c036d810>] (kthread) from [<c03001a8>] (ret_from_fork+0x14/0x2c)
> [   12.746041] Exception stack(0xc73abfb0 to 0xc73abff8)
> [   12.746181] bfa0:                                     00000000 00000000 00000000 00000000
> [   12.746302] bfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [   12.746397] bfe0: 00000000 00000000 00000000 00000000 00000013 00000000
> [   12.746651] ---[ end trace 2a3f61da56bd8a49 ]---
> 
> ---
> # bad: [b0523c7b1c9d0edcd6c0fe6d2cb558a9ad5c60a8] Add linux-next specific files for 20200526
> # good: [9cb1fd0efd195590b828b9b865421ad345a4a145] Linux 5.7-rc7
> git bisect start 'next-20200526' 'v5.7-rc7'
> # bad: [0c7351ad83670964e48cb9a098ad732c1ecbf804] Merge remote-tracking branch 'crypto/master'
> git bisect bad 0c7351ad83670964e48cb9a098ad732c1ecbf804
> # bad: [42e11d9b4682229fa7187d129758b8c382f8cd5d] Merge remote-tracking branch 'jc_docs/docs-next'
> git bisect bad 42e11d9b4682229fa7187d129758b8c382f8cd5d
> # bad: [ab6f501559e9efa687c711a781243cf6651a82d3] Merge remote-tracking branch 'm68k/for-next'
> git bisect bad ab6f501559e9efa687c711a781243cf6651a82d3
> # bad: [44aaa516ca63b3ab2da8ae81e9c6a58656e6acb5] Merge branch 'arm/drivers' into for-next
> git bisect bad 44aaa516ca63b3ab2da8ae81e9c6a58656e6acb5
> # good: [1cb00f8c3b36e6ae026fb58d1cd2ccd78b81aa9f] Merge tag 'qcom-arm64-for-5.8' of git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/dt
> git bisect good 1cb00f8c3b36e6ae026fb58d1cd2ccd78b81aa9f
> # bad: [ed0c25932fbfafdfe37e9633dee21770d3c5a306] Merge branch 'arm/defconfig' into for-next
> git bisect bad ed0c25932fbfafdfe37e9633dee21770d3c5a306
> # bad: [9eddc06a3bc79402f50176703237ed045ae77b16] Merge branch 'mmp/fixes' into arm/dt
> git bisect bad 9eddc06a3bc79402f50176703237ed045ae77b16
> # bad: [87b990ab62722a8a3cb0691107971ab1bd7bddb5] Merge tag 'mvebu-dt64-5.8-1' of git://git.infradead.org/linux-mvebu into arm/dt
> git bisect bad 87b990ab62722a8a3cb0691107971ab1bd7bddb5
> # bad: [94cc3f1baabac5e5c4dcc6c2f070353f8315d0ee] arm64: dts: juno: Fix SCPI shared mem node name
> git bisect bad 94cc3f1baabac5e5c4dcc6c2f070353f8315d0ee
> # bad: [a78aee9e434932a500db36cc6d88daeff3745e9f] arm64: dts: juno: Fix GIC child nodes
> git bisect bad a78aee9e434932a500db36cc6d88daeff3745e9f
> # bad: [feebdc3f7950d7e44e914e821f6c04e58e292c74] arm64: dts: fvp: Move fixed clocks out of bus node
> git bisect bad feebdc3f7950d7e44e914e821f6c04e58e292c74
> # good: [849bfc3dfc13cde6ec04fbcf32af553ded9f7ec3] arm64: dts: fvp: Move fixed devices out of bus node
> git bisect good 849bfc3dfc13cde6ec04fbcf32af553ded9f7ec3
> # bad: [d9258898ad49cbb46caffe23af0d4f0b766e67a2] arm64: dts: vexpress: Move fixed devices out of bus node
> git bisect bad d9258898ad49cbb46caffe23af0d4f0b766e67a2
> # first bad commit: [d9258898ad49cbb46caffe23af0d4f0b766e67a2] arm64: dts: vexpress: Move fixed devices out of bus node
> 

