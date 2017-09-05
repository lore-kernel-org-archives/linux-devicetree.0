From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v3 0/5] arm64: Initial Realtek RTD1295 enablement
Date: Tue, 5 Sep 2017 10:46:08 +0200
Message-ID: <95ea400d-4605-10f4-fa5f-f554b4705d58@suse.de>
References: <20170514022429.11555-1-afaerber@suse.de>
 <068148b5-7add-96e5-dc6d-4597527a6c35@suse.de>
 <CAK8P3a2gBk_rbO7fgpqiTW7A5oxhAPbz6rOjH-kOnOntBjdHSw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK8P3a2gBk_rbO7fgpqiTW7A5oxhAPbz6rOjH-kOnOntBjdHSw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Roc He <hepeng-qoVzM6YEWSw@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, =?UTF-8?B?6JKL5Li955C0?= <jiang.liqin-31gW8twSeR21Z/+hSey0Gg@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 05.09.2017 um 09:18 schrieb Arnd Bergmann:
> On Tue, Sep 5, 2017 at 12:09 AM, Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org> wrote:
>> Am 14.05.2017 um 04:24 schrieb Andreas Färber:
>>> This mini-series adds initial support for the Realtek RTD1295 SoC and
>>> the Zidoo X9S TV box.
>>>
>>> v3 changes #address-cells, #size-cells and ranges.
>>>
>>> With these patches CPU0 can be booted with earlycon.
>>>
>>> PSCI doesn't work despite present in the vendor device tree; as enable-method
>>> it instead used a custom "rtk-spin-table" that I sadly have no source code of.
>>
>> Synology has now published source code for RTD1293/1296. This has
>> allowed me to narrow the RTD1295 CPU1..3 issue down to two changes in
>> arch/arm64/kernel/smp_spin_table.c:smp_spin_table_cpu_prepare():
>>
>> 1) writel_relaxed() instead of writeq_relaxed()
>> 2) ioremap() instead of ioremap_cache()
>>
>> Without those changes it hangs in earlycon after this line:
>> [    0.043674] Mountpoint-cache hash table entries: 4096 (order: 3,
>> 32768 bytes)
>>
>> The size difference sounds easy enough - we could introduce an optional
>> cpu-release-size property to handle this or derive a "spin-table-32bit"
>> enable-method to that effect.
>>
>> The second one appears to be caused by PROT_NORMAL vs.
>> PROT_DEVICE_nGnRE. Is there any simple check we could do on
>> cpu-release-addr to choose which MT to use?
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=113954c6463d1d80a206e91627ae49711f8b47cd
>>
>> Any other ideas?
> 
> I think we had a similar problem before and concluded that something
> requiring a write into an MMIO register is simply not a spin-table
> implementation but something else.

Well, my understanding was that "something else" is not acceptable for
arm64. And still being without ATF, U-Boot and OP-TEE sources I don't
see how I could reimplement PSCI instead.

> Is this simply using a copy of the spin-table code to trigger the actual
> booting of the secondary CPU?

Yes. Realtek have duplicated and modified the file - I've instead tried
to reuse the existing code with those minimal changes, for a chance to
get this mainline with suitable conditions.

The only other Realtek changes are additions for cpu_disable/cpu_die
that I am ignoring for now. Happy that the cores are finally up!

> Can you identify the MMIO address?

The magic 32-bit register is 0x9801aa44, with RAM being 0..0x80000000.

Thus I was hoping there might be some handy is_ram_addr(phys_addr) that
we could use in generic code to choose the right ioremap function.

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
