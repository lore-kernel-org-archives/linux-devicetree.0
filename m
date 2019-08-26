Return-Path: <SRS0=gJgO=WW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from server-x.ipv4.hkg02.ds.network ([27.111.83.178]:43032 "EHLO
        mail.gtsys.com.hk" rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org
        with ESMTP id S1729352AbfHZCrQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 25 Aug 2019 22:47:16 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.gtsys.com.hk (Postfix) with ESMTP id DEE922005C56
        for <devicetree@vger.kernel.org>; Mon, 26 Aug 2019 10:40:24 +0800 (HKT)
Received: from mail.gtsys.com.hk ([127.0.0.1])
        by localhost (mail.gtsys.com.hk [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id F63-wzZMowJN for <devicetree@vger.kernel.org>;
        Mon, 26 Aug 2019 10:40:24 +0800 (HKT)
Received: from s01.gtsys.com.hk (unknown [10.128.4.2])
        by mail.gtsys.com.hk (Postfix) with ESMTP id BDF992001F2C
        for <devicetree@vger.kernel.org>; Mon, 26 Aug 2019 10:40:24 +0800 (HKT)
Received: from [10.128.2.32] (n058152218032.netvigator.com [58.152.218.32])
        by s01.gtsys.com.hk (Postfix) with ESMTPSA id 9DBEBC019FB
        for <devicetree@vger.kernel.org>; Mon, 26 Aug 2019 10:40:24 +0800 (HKT)
From: Chris Ruehl <chris.ruehl@gtsys.com.hk>
Subject: i.mx6 Warning triggered if cores greater then configed max cores
Message-ID: <946f3c0e-b57f-156f-3029-6cb585557525@gtsys.com.hk>
Date: Mon, 26 Aug 2019 10:40:24 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi all,

I have compiled a kernel limit cores = 2, which fits my imx6dl, start this
kernel on the imx6q triggers a warning and back - trace.

I'm wondering if that is intended.



[    0.000000] ------------[ cut here ]------------
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/arm/kernel/devtree.c:157 
arm_dt_init_cpu_maps+0x170/0x21c
[    0.000000] DT /cpu 3 nodes greater than max cores 2, capping them
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 4.19.67-rt24 #30
[    0.000000] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
[    0.000000] Backtrace:
[    0.000000] [<c010c3c8>] (dump_backtrace) from [<c010c738>] 
(show_stack+0x18/0x1c)
[    0.000000]  r7:c08a618c r6:600000d3 r5:00000000 r4:c0b44fe4
[    0.000000] [<c010c720>] (show_stack) from [<c06ceb84>] (dump_stack+0xbc/0xd0)
[    0.000000] [<c06ceac8>] (dump_stack) from [<c011f8fc>] (__warn+0xdc/0xf8)
[    0.000000]  r7:c08a618c r6:00000009 r5:00000000 r4:c0b01ed0
[    0.000000] [<c011f820>] (__warn) from [<c011f564>] (warn_slowpath_fmt+0x40/0x48)
[    0.000000]  r9:c08ab890 r8:c08f8fb0 r7:00000000 r6:00000001 r5:c0b0753c 
r4:c08a61a8
[    0.000000] [<c011f528>] (warn_slowpath_fmt) from [<c0a03f10>] 
(arm_dt_init_cpu_maps+0x170/0x21c)
[    0.000000]  r3:00000003 r2:c08a61a8
[    0.000000]  r4:00000003
[    0.000000] [<c0a03da0>] (arm_dt_init_cpu_maps) from [<c0a033dc>] 
(setup_arch+0x8b0/0xa7c)
[    0.000000]  r10:efffcec0 r9:c0b623e8 r8:fffff000 r7:10000000 r6:c0b0b218 
r5:8fffffff
[    0.000000]  r4:c0a2df44
[    0.000000] [<c0a02b2c>] (setup_arch) from [<c0a00a2c>] (start_kernel+0x60/0x3ec)
[    0.000000]  r10:10c5387d r9:412fc09a r8:00000001 r7:00000eb9 r6:c0b07440 
r5:00000051
[    0.000000]  r4:00000000
[    0.000000] [<c0a009cc>] (start_kernel) from [<00000000>] (  (null))
[    0.000000]  r10:10c5387d r9:412fc09a r8:18000000 r7:00000eb9 r6:10c0387d 
r5:00000051
[    0.000000]  r4:c0a00330
[    0.000000] ---[ end trace 0000000000000001 ]---


Regards
Chris
