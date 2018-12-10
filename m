Return-Path: <SRS0=EUt7=OT=vger.kernel.org=devicetree-owner@kernel.org>
Received: from fllv0015.ext.ti.com ([198.47.19.141]:58270 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726209AbeLJRAN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 10 Dec 2018 12:00:13 -0500
Subject: Re: [PATCH] ARM: dts: Add am335x mcasp with l3 data port ranges
References: <20181205230356.38855-1-tony@atomide.com>
 <3f44b350-17a9-bdf7-33b4-130b6eeae5f0@ti.com>
 <48ee14e0-1361-4840-42c6-f676f2911ce6@ti.com>
 <20181210144851.GZ6707@atomide.com> <20181210154426.GB6707@atomide.com>
 <7e50de23-10d3-511b-a16d-4c32ba58a842@ti.com>
 <20181210162123.GC6707@atomide.com> <20181210163830.GD6707@atomide.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <2b736366-7d16-3cd5-0216-1072784a5d36@ti.com>
Date: Mon, 10 Dec 2018 19:01:47 +0200
MIME-Version: 1.0
In-Reply-To: <20181210163830.GD6707@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On 10/12/2018 18.38, Tony Lindgren wrote:
> * Tony Lindgren <tony@atomide.com> [181210 16:21]:
>> * Peter Ujfalusi <peter.ujfalusi@ti.com> [181210 16:13]:
>>> am335x-evmsk is still not booting with this patch on top of next-20181210.
>>
>> Oh interesting.
> 
> OK so to prevent the hwmod code from resetting gpios very
> early, this now might become necessary. Care to try with
> this also applied?

With this applied there is life on the console, however it ends up badly:

[    3.511211] OF: graph: no port node found in /ocp/interconnect@48000000/segment@300000/target-module@e000/lcdc@0
[    3.522149] OF: graph: no port node found in /ocp/interconnect@48000000/segment@300000/target-module@e000/lcdc@0
[    3.533488] Unable to handle kernel NULL pointer dereference at virtual address 00000000
[    3.541752] pgd = (ptrval)
[    3.544521] [00000000] *pgd=00000000
[    3.548163] Internal error: Oops: 5 [#1] PREEMPT SMP ARM
[    3.553502] Modules linked in:
[    3.556584] CPU: 0 PID: 66 Comm: kworker/0:3 Not tainted 4.20.0-rc6-next-20181210-00102-g6da59622c934-dirty #276
[    3.566804] Hardware name: Generic AM33XX (Flattened Device Tree)
[    3.572947] Workqueue: events dbs_work_handler
[    3.577434] PC is at tilcdc_crtc_update_clk+0xc/0x98
[    3.582429] LR is at cpufreq_transition+0x1c/0x24
[    3.587155] pc : [<c057e524>]    lr : [<c057fd50>]    psr: 60000013
[    3.593450] sp : cf5e7e20  ip : 0ee06000  fp : 00000000
[    3.598698] r10: ffffffff  r9 : cf5e7ebc  r8 : 00000000
[    3.603946] r7 : 00000001  r6 : cf5e7ebc  r5 : 00000000  r4 : 00000000
[    3.610503] r3 : c057fd34  r2 : cf5e7ebc  r1 : 00000001  r0 : 00000000
[    3.617063] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
[    3.624231] Control: 10c5387d  Table: 80004019  DAC: 00000051
[    3.630005] Process kworker/0:3 (pid: 66, stack limit = 0x(ptrval))
[    3.636302] Stack: (0xcf5e7e20 to 0xcf5e8000)
[    3.640688] 7e20: 00000000 fffffffe cf5e7ebc 00000001 00000000 c057fd50 00000000 c01555d8
[    3.648909] 7e40: c0e6a26c c0e6a258 00000000 00000000 00000001 c015599c 00000000 c06e5548
[    3.657131] 7e60: cf5e7ebc cf5c3b00 c0e09264 c0e6a258 00000003 00000000 000afc80 c01559d0
[    3.665353] 7e80: 00000000 000afc80 cf5c3b00 c06e9994 cf5c3b00 cf5e7ebc 00000000 c0eae910
[    3.673575] 7ea0: 00000003 c06e9a64 cf5c3b00 00000000 c0e09108 c06e9f94 cf5dee00 00000000
[    3.681797] 7ec0: 000927c0 000afc80 00000021 71a56597 cf159688 cf5c3b00 cf5dee00 cf5d9c40
[    3.690019] 7ee0: cf5d9c40 cf5ded80 cf5ded80 cf5dee3c ffffe000 c06ed2c8 cf5dee38 cf5e1380
[    3.698240] 7f00: cf5dee04 cf5c3b00 c0e6a5d4 00000000 cf5dee3c c06edd80 cf5dee38 cf5e1380
[    3.706461] 7f20: cfb69ec0 cfb6d000 00000000 c014e284 00000008 cfb69ed8 cf5e1380 cf5e1394
[    3.714683] 7f40: cfb69ec0 00000008 cfb69ed8 c0e03d00 cfb69ec0 c014ef74 cf5e01c0 cf5e0180
[    3.722905] 7f60: ffffe000 00000000 cf5e01c0 cf5e0180 cf5e6000 cf5e1380 c014ef48 cf05feac
[    3.731127] 7f80: cf5e01dc c0153d40 00000000 cf5e0180 c0153c10 00000000 00000000 00000000
[    3.739348] 7fa0: 00000000 00000000 00000000 c01010e8 00000000 00000000 00000000 00000000
[    3.747568] 7fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    3.755789] 7fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
[    3.764028] [<c057e524>] (tilcdc_crtc_update_clk) from [<c057fd50>] (cpufreq_transition+0x1c/0x24)
[    3.773045] [<c057fd50>] (cpufreq_transition) from [<c01555d8>] (notifier_call_chain+0x48/0x80)
[    3.781794] [<c01555d8>] (notifier_call_chain) from [<c015599c>] (__srcu_notifier_call_chain+0x44/0x60)
[    3.791238] [<c015599c>] (__srcu_notifier_call_chain) from [<c01559d0>] (srcu_notifier_call_chain+0x18/0x20)
[    3.801126] [<c01559d0>] (srcu_notifier_call_chain) from [<c06e9994>] (cpufreq_notify_transition+0x64/0x110)
[    3.811008] [<c06e9994>] (cpufreq_notify_transition) from [<c06e9a64>] (cpufreq_freq_transition_end+0x24/0x90)
[    3.821061] [<c06e9a64>] (cpufreq_freq_transition_end) from [<c06e9f94>] (__cpufreq_driver_target+0x1b8/0x514)
[    3.831118] [<c06e9f94>] (__cpufreq_driver_target) from [<c06ed2c8>] (od_dbs_update+0x130/0x15c)
[    3.839952] [<c06ed2c8>] (od_dbs_update) from [<c06edd80>] (dbs_work_handler+0x28/0x58)
[    3.848003] [<c06edd80>] (dbs_work_handler) from [<c014e284>] (process_one_work+0x1e4/0x3f4)
[    3.856487] [<c014e284>] (process_one_work) from [<c014ef74>] (worker_thread+0x2c/0x574)
[    3.864628] [<c014ef74>] (worker_thread) from [<c0153d40>] (kthread+0x130/0x148)
[    3.872068] [<c0153d40>] (kthread) from [<c01010e8>] (ret_from_fork+0x14/0x2c)
[    3.879323] Exception stack(0xcf5e7fb0 to 0xcf5e7ff8)
[    3.884400] 7fa0:                                     00000000 00000000 00000000 00000000
[    3.892621] 7fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    3.900840] 7fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    3.907493] Code: e12fff1e e92d41f0 e1a04000 e1a05000 (e4946014) 
[    3.913743] ---[ end trace 3f613bd9d55096fe ]---
[    3.922546] mmc1: new SDIO card at address 0001
[    3.928074] OF: graph: no port node found in /ocp/interconnect@48000000/segment@300000/target-module@e000/lcdc@0
[    3.938547] tilcdc 4830e000.lcdc: no encoders/connectors found


> 
> Regards,
> 
> Tony
> 
> 8< ------------------------
> diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
> --- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
> +++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
> @@ -516,24 +516,8 @@ struct omap_hwmod am33xx_epwmss2_hwmod = {
>  	},
>  };
>  
> -/*
> - * 'gpio' class: for gpio 0,1,2,3
> - */
> -static struct omap_hwmod_class_sysconfig am33xx_gpio_sysc = {
> -	.rev_offs	= 0x0000,
> -	.sysc_offs	= 0x0010,
> -	.syss_offs	= 0x0114,
> -	.sysc_flags	= (SYSC_HAS_AUTOIDLE | SYSC_HAS_ENAWAKEUP |
> -			  SYSC_HAS_SIDLEMODE | SYSC_HAS_SOFTRESET |
> -			  SYSS_HAS_RESET_STATUS),
> -	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
> -			  SIDLE_SMART_WKUP),
> -	.sysc_fields	= &omap_hwmod_sysc_type1,
> -};
> -
>  struct omap_hwmod_class am33xx_gpio_hwmod_class = {
>  	.name		= "gpio",
> -	.sysc		= &am33xx_gpio_sysc,
>  	.rev		= 2,
>  };
>  
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
