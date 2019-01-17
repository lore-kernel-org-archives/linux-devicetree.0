From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH 02/17] clocksource: davinci-timer: new driver
Date: Thu, 17 Jan 2019 18:12:17 +0530
Message-ID: <d9bc1153-3b65-19a8-67ef-e131296cd8b1@ti.com>
References: <20190111172134.30147-1-brgl@bgdev.pl>
 <20190111172134.30147-3-brgl@bgdev.pl>
 <08200de1-fde5-c525-c874-c7872259067b@ti.com>
 <CAMRc=McrT4KTW45=3CTBxspVb+z8k=DDjOvKi9NH0aA9eJ8=cQ@mail.gmail.com>
 <a7d4994d-7740-c845-da67-9d06e6d874cc@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a7d4994d-7740-c845-da67-9d06e6d874cc@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

On 16/01/19 2:48 PM, Sekhar Nori wrote:
> On 14/01/19 10:09 PM, Bartosz Golaszewski wrote:
>> pon., 14 sty 2019 o 13:20 Sekhar Nori <nsekhar@ti.com> napisał(a):
>>>
>>> Hi Bartosz,
>>>
>>> On 11/01/19 10:51 PM, Bartosz Golaszewski wrote:
>>>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>>>
>>>> Currently the clocksource and clockevent support for davinci platforms
>>>> lives in mach-davinci. It hard-codes many things, used global variables,
>>>> implements functionalities unused by any platform and has code fragments
>>>> scattered across many (often unrelated) files.
>>>>
>>>> Implement a new, modern and simplified timer driver and put it into
>>>> drivers/clocksource. We still need to support legacy board files so
>>>> export a config structure and a function that allows machine code to
>>>> register the timer.
>>>>
>>>> We don't check the return values of regmap reads and writes since with
>>>> mmio it's only likely to fail due to programmer's errors.
>>>>
>>>> We also don't bother freeing resources on errors in
>>>> davinci_timer_register() as the system won't boot without a timer anyway.
>>>>
>>>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>>
>>> With this series, DA830 fails to boot. Rest of the devices are okay from
>>> boot perspective.
>>>
>>> DA830 is pretty unique because it uses the same timer-half for both
>>> clocksource and clockevent. May be you can set the same configuration on
>>> your DA850 to see the same issue? Else, I will enable low-level debug
>>> and try to provide more debug data.
>>>
>>
>> I can't boot da850 with the same config as da830 (0x60 compare
>> register, compare irq 74) even with the old timer code. Just to make
>> sure: does da830 boot fine with mainline v5.0-rc2?
> 
> Yeah, I did check that without the patch DA830 does boot.

You are right that DA850 lacks compare interrupts for timers 0 and 1.
So, yes, it seems like we will have to shift to timer2 to test
compare interrupts on DA850.

Just to confirm, DA830 boots fine with the compare section removed:

---8<---
diff --git a/arch/arm/mach-davinci/da830.c b/arch/arm/mach-davinci/da830.c
index 0d81a8fdd9e6..f34398a7e47c 100644
--- a/arch/arm/mach-davinci/da830.c
+++ b/arch/arm/mach-davinci/da830.c
@@ -788,14 +788,6 @@ static const struct davinci_timer_cfg da830_timer_cfg = {
 			.flags	= IORESOURCE_IRQ,
 		},
 	},
-	.cmp = {
-		.irq = {
-			.start	= IRQ_DA830_T12CMPINT0_0,
-			.end	= IRQ_DA830_T12CMPINT0_0,
-			.flags	= IORESOURCE_IRQ,
-		},
-		.offset		= DA830_CMP12_0,
-	}
 };
 
 static const struct davinci_soc_info davinci_soc_info_da830 = {
---8<---

And the low-level debug with your patches shows that its hanging at 
delay loop calibration.

Uncompressing Linux... done, booting the kernel.                                
Booting Linux on physical CPU 0x0                                               
Linux version 5.0.0-rc1-08699-gc87d386784f3-dirty (a0875516@psplinux063) (gcc v9
CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=0005317f                   
CPU: VIVT data cache, VIVT instruction cache                                    
Machine: DaVinci DA830/OMAP-L137/AM17x EVM                                      
Memory policy: Data cache writethrough                                          
cma: Reserved 16 MiB at 0xc2800000                                              
DaVinci da830/omap-l137 rev2.0 variant 0x9                                      
On node 0 totalpages: 14336                                                     
  DMA zone: 112 pages used for memmap                                           
  DMA zone: 0 pages reserved                                                    
  DMA zone: 14336 pages, LIFO batch:3                                           
random: get_random_bytes called from start_kernel+0x80/0x3ec with crng_init=0   
pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768                                   
pcpu-alloc: [0] 0                                                               
Built 1 zonelists, mobility grouping on.  Total pages: 14224                    
Kernel command line: console=ttyS2,115200n8                                     
Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)                   
Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)                    
Memory: 33876K/57344K available (4607K kernel code, 308K rwdata, 1072K rodata, )
Virtual kernel memory layout:                                                   
    vector  : 0xffff0000 - 0xffff1000   (   4 kB)                               
    fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)                               
    vmalloc : 0xc4000000 - 0xff800000   ( 952 MB)                               
    lowmem  : 0xc0000000 - 0xc3800000   (  56 MB)                               
    modules : 0xbf000000 - 0xc0000000   (  16 MB)                               
      .text : 0x(ptrval) - 0x(ptrval)   (4609 kB)                               
      .init : 0x(ptrval) - 0x(ptrval)   ( 212 kB)                               
      .data : 0x(ptrval) - 0x(ptrval)   ( 309 kB)                               
       .bss : 0x(ptrval) - 0x(ptrval)   ( 137 kB)                               
SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1                      
rcu: Preemptible hierarchical RCU implementation.                               
        Tasks RCU enabled.                                                      
rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.          
NR_IRQS: 245                                                                    
clocksource: timer0_0: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 79s
sched_clock: 32 bits at 24MHz, resolution 41ns, wraps every 89478484971ns       
Console: colour dummy device 80x30                                              
Calibrating delay loop... 
<hangs>

Thanks,
Sekhar
