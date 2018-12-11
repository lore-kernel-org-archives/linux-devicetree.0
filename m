Return-Path: <SRS0=IqaF=OU=vger.kernel.org=devicetree-owner@kernel.org>
Received: from fllv0015.ext.ti.com ([198.47.19.141]:59882 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726085AbeLKISd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 11 Dec 2018 03:18:33 -0500
Subject: Re: [PATCH] ARM: dts: Add am335x mcasp with l3 data port ranges
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
References: <20181205230356.38855-1-tony@atomide.com>
 <3f44b350-17a9-bdf7-33b4-130b6eeae5f0@ti.com>
 <48ee14e0-1361-4840-42c6-f676f2911ce6@ti.com>
 <20181210144851.GZ6707@atomide.com> <20181210154426.GB6707@atomide.com>
 <7e50de23-10d3-511b-a16d-4c32ba58a842@ti.com>
 <20181210162123.GC6707@atomide.com> <20181210163830.GD6707@atomide.com>
 <2b736366-7d16-3cd5-0216-1072784a5d36@ti.com>
 <20181210172327.GE6707@atomide.com>
 <7ac1fd56-d8c9-d622-a53c-ce6e9da862e5@ti.com>
Message-ID: <404d06a3-c2b4-d287-8776-b09c9eb52d9d@ti.com>
Date: Tue, 11 Dec 2018 10:20:06 +0200
MIME-Version: 1.0
In-Reply-To: <7ac1fd56-d8c9-d622-a53c-ce6e9da862e5@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Tony,

On 11/12/2018 9.11, Peter Ujfalusi wrote:
> Tony,
> 
> On 10/12/2018 19.23, Tony Lindgren wrote:
>> * Peter Ujfalusi <peter.ujfalusi@ti.com> [181210 17:00]:
>>> On 10/12/2018 18.38, Tony Lindgren wrote:
>>>> OK so to prevent the hwmod code from resetting gpios very
>>>> early, this now might become necessary. Care to try with
>>>> this also applied?
>>>
>>> With this applied there is life on the console, however it ends up badly:
>>
>> OK thanks for testing. I'll take a look on how to skip
>> early reset for omap_hwmod.c for the dts case instead of
>> dropping the sysc platform data.
>>
>> For the LCDC, does the following revert fix it? If so,
>> I need to check the flags for am33xx_lcdc_hwmod
>> HWMOD_SWSUP_SIDLE | HWMOD_SWSUP_MSTANDBY.
> 
> Unfortunately, not :(
> 
> I have applied the two patch you have sent, plus this (next-20181210):
> [    3.481142] OF: graph: no port node found in /ocp/lcdc@4830e000
> [    3.487627] OF: graph: no port node found in /ocp/lcdc@4830e000
> [    3.494810] Unable to handle kernel NULL pointer dereference at virtual address 00000000
> [    3.503182] pgd = (ptrval)
> [    3.505957] [00000000] *pgd=00000000
> [    3.509645] Internal error: Oops: 5 [#1] PREEMPT SMP ARM
> [    3.514986] Modules linked in:
> [    3.518068] CPU: 0 PID: 66 Comm: kworker/0:3 Not tainted 4.20.0-rc6-next-20181210-00104-g77bc75e7d444 #277
> [    3.527763] Hardware name: Generic AM33XX (Flattened Device Tree)
> [    3.533906] Workqueue: events dbs_work_handler
> [    3.538393] PC is at tilcdc_crtc_update_clk+0xc/0x98
> [    3.543387] LR is at cpufreq_transition+0x1c/0x24
> [    3.548112] pc : [<c057e524>]    lr : [<c057fd50>]    psr: 60000013
> [    3.554408] sp : cf5e5e20  ip : 0ee06000  fp : 00000000
> [    3.559655] r10: ffffffff  r9 : cf5e5ebc  r8 : 00000000
> [    3.564904] r7 : 00000001  r6 : cf5e5ebc  r5 : 00000000  r4 : 00000000
> [    3.571461] r3 : c057fd34  r2 : cf5e5ebc  r1 : 00000001  r0 : 00000000
> [    3.578020] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> [    3.585188] Control: 10c5387d  Table: 80004019  DAC: 00000051
> [    3.590961] Process kworker/0:3 (pid: 66, stack limit = 0x(ptrval))
> [    3.597257] Stack: (0xcf5e5e20 to 0xcf5e6000)
> [    3.601641] 5e20: 00000000 fffffffe cf5e5ebc 00000001 00000000 c057fd50 00000000 c01555d8
> [    3.609862] 5e40: c0e6a26c c0e6a258 00000000 00000000 00000001 c015599c 00000000 c06e5548
> [    3.618082] 5e60: cf5e5ebc cf5c3a00 c0e09264 c0e6a258 00000003 00000000 000afc80 c01559d0
> [    3.626303] 5e80: 00000000 000afc80 cf5c3a00 c06e9994 cf5c3a00 cf5e5ebc 00000000 c0eae910
> [    3.634523] 5ea0: 00000003 c06e9a64 cf5c3a00 00000000 c0e09108 c06e9f94 cf5e1900 00000000
> [    3.642745] 5ec0: 000927c0 000afc80 00000021 71a56597 cf159688 cf5c3a00 cf5e1900 cf5d9a80
> [    3.650966] 5ee0: cf5d9a80 cf5e1880 cf5e1880 cf5e193c ffffe000 c06ed2c8 cf5e1938 cf5de080
> [    3.659187] 5f00: cf5e1904 cf5c3a00 c0e6a5d4 00000000 cf5e193c c06edd80 cf5e1938 cf5de080
> [    3.667408] 5f20: cfb69ec0 cfb6d000 00000000 c014e284 00000008 cfb69ed8 cf5de080 cf5de094
> [    3.675628] 5f40: cfb69ec0 00000008 cfb69ed8 c0e03d00 cfb69ec0 c014ef74 cf5dd000 cf5d9fc0
> [    3.683849] 5f60: ffffe000 00000000 cf5dd000 cf5d9fc0 cf5e4000 cf5de080 c014ef48 cf05feac
> [    3.692069] 5f80: cf5dd01c c0153d40 00000000 cf5d9fc0 c0153c10 00000000 00000000 00000000
> [    3.700289] 5fa0: 00000000 00000000 00000000 c01010e8 00000000 00000000 00000000 00000000
> [    3.708509] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [    3.716730] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
> [    3.724969] [<c057e524>] (tilcdc_crtc_update_clk) from [<c057fd50>] (cpufreq_transition+0x1c/0x24)
> [    3.733986] [<c057fd50>] (cpufreq_transition) from [<c01555d8>] (notifier_call_chain+0x48/0x80)
> [    3.742734] [<c01555d8>] (notifier_call_chain) from [<c015599c>] (__srcu_notifier_call_chain+0x44/0x60)
> [    3.752178] [<c015599c>] (__srcu_notifier_call_chain) from [<c01559d0>] (srcu_notifier_call_chain+0x18/0x20)
> [    3.762067] [<c01559d0>] (srcu_notifier_call_chain) from [<c06e9994>] (cpufreq_notify_transition+0x64/0x110)
> [    3.771949] [<c06e9994>] (cpufreq_notify_transition) from [<c06e9a64>] (cpufreq_freq_transition_end+0x24/0x90)
> [    3.782003] [<c06e9a64>] (cpufreq_freq_transition_end) from [<c06e9f94>] (__cpufreq_driver_target+0x1b8/0x514)
> [    3.792059] [<c06e9f94>] (__cpufreq_driver_target) from [<c06ed2c8>] (od_dbs_update+0x130/0x15c)
> [    3.800892] [<c06ed2c8>] (od_dbs_update) from [<c06edd80>] (dbs_work_handler+0x28/0x58)
> [    3.808941] [<c06edd80>] (dbs_work_handler) from [<c014e284>] (process_one_work+0x1e4/0x3f4)
> [    3.817424] [<c014e284>] (process_one_work) from [<c014ef74>] (worker_thread+0x2c/0x574)
> [    3.825564] [<c014ef74>] (worker_thread) from [<c0153d40>] (kthread+0x130/0x148)
> [    3.833004] [<c0153d40>] (kthread) from [<c01010e8>] (ret_from_fork+0x14/0x2c)
> [    3.840259] Exception stack(0xcf5e5fb0 to 0xcf5e5ff8)
> [    3.845335] 5fa0:                                     00000000 00000000 00000000 00000000
> [    3.853555] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [    3.861773] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> [    3.868428] Code: e12fff1e e92d41f0 e1a04000 e1a05000 (e4946014) 
> [    3.874674] ---[ end trace d8042f7454b3c9d1 ]---
> [    3.883368] mmc1: new SDIO card at address 0001
> [    3.889008] OF: graph: no port node found in /ocp/lcdc@4830e000
> [    3.895127] tilcdc 4830e000.lcdc: no encoders/connectors found

It looks like there is a bug in tilcdc as well, but the display is not
coming up because the backlight is not proping:
[    0.618627] ecap 48304000.epwmss:ecap@48304100: invalid resource
[    0.618822] ecap: probe of 48304000.epwmss:ecap@48304100 failed with
error -22

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
