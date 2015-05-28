From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: [PATCH v4 1/2] ARM: socfpga: support suspend to ram
Date: Thu, 28 May 2015 10:07:30 -0500
Message-ID: <55672F32.3050506@opensource.altera.com>
References: <1432317735-29413-1-git-send-email-atull@opensource.altera.com>
 <1432317735-29413-2-git-send-email-atull@opensource.altera.com>
 <556479C9.5070208@opensource.altera.com>
 <alpine.DEB.2.02.1505271520570.19205@linuxheads99>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1505271520570.19205@linuxheads99>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: atull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Delicious Quinoq <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/27/2015 03:25 PM, atull wrote:
> On Tue, 26 May 2015, Dinh Nguyen wrote:
> 
>> Hi Alan,
>>
>> On 5/22/15 1:02 PM, Alan Tull wrote:
>>> Add code that requests that the sdr controller go into
>>> self-refresh mode.  This code is run from ocram.
>>>
>>> This patch assumes that u-boot has already configured sdr:
>>>   sdr.ctrlcfg.lowpwreq.selfrfshmask = 3
>>>   sdr.ctrlcfg.lowpwrtiming.clkdisablecycles = 8
>>>   sdr.ctrlcfg.dramtiming4.selfrfshexit = 512
>>>
>>> Suspend-to-RAM and EDAC support are mutually exclusive on SOCFPGA
>>> platforms.  CONFIG_SOCFPGA_SUSPEND enables suspend-to-RAM and
>>> prevents selecting CONFIG_EDAC_ALTERA_MC.
>>>
>>> How to suspend to ram:
>>>  $ echo enabled > \
>>> /sys/devices/soc/ffc02000.serial0/tty/ttyS0/power/wakeup
>>>
>>>  $ echo -n mem > /sys/power/state
>>>
>>> Signed-off-by: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>>> Cc: Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>
>>> Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>>> Cc: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>>> Cc: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>>> ---
>>> v2: use Generic on-chip SRAM driver to allocate ocram
>>>     rm fncpy_align since generic allocator handles alignment
>>>     check __arm_ioremap_exec return code
>>>     check for NULL pointers
>>>     add a comment regarding sdram controller configuration
>>> v3: fix renamed #define
>>>     propagate socfpga_setup_ocram_self_refresh error code
>>> v4: Kconfig: don't need to select GENERIC_ALLOCATER
>>>     add CONFIG_SOCFPGA_SUSPEND
>>>     make s2r and EDAC support mutually exclusive
>>>     socfpga.c: add sdr_ctl_base_addr
>>>     return error if ocram not available in device tree
>>>     update copyright years
>>> ---
>>
>> <snip>
>>
>>> +
>>> +static int socfpga_pm_suspend(unsigned long arg)
>>> +{
>>> +	u32 ret;
>>> +
>>> +	if (!sdr_ctl_base_addr || !socfpga_scu_base_addr)
>>> +		return -EFAULT;
>>> +
>>> +	ret = socfpga_sdram_self_refresh_in_ocram(
>>> +		(u32)sdr_ctl_base_addr, (u32)socfpga_scu_base_addr);
>>> +
>>
>> I had a patch that removed socfpga_scu_base_addr from being a global and
>> just a local variable in:
>>
>> f6e14376fb20 ARM: socfpga: use of_iomap to map the SCU
>>
>> This patch will be in v4.2 and is currently in arm-soc/next or
>> at my fork: kernel/git/dinguyen/linux.git socfpga_for_next_arria10
>>
>> So you will either need to make socfpga_scu_base_addr global again, or
>> you can use the asm instruction to get the SCU base addr.
>>
>> Sorry about that..
>>
>> Dinh
>>
> 
> I can't make socfpga_scu_base_addr a global from platsmp.c since that file
> may or may not be compiled in.

Ah, okay..
> 
> That leaves me with the option of adding the code that was removed from
> socfpga.c back where it was or taking that same code moving it to pm.c
> 

I think you only need the scu base address in
socfpga_sdram_self_refresh(), so you can probably just use the single
line assembly code to get it there.

Dinh

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
