From: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [PATCH v2 1/6] resource: Extend the PPC32 reserved memory hack
Date: Wed, 24 Jan 2018 12:23:05 +1100
Message-ID: <87po60uk1y.fsf@concordia.ellerman.id.au>
References: <20180122050411.32460-1-j.neuschaefer@gmx.net> <20180122050411.32460-2-j.neuschaefer@gmx.net> <871sigwx41.fsf@concordia.ellerman.id.au> <20180123163739.2sxhzavghzgbjw4c@latitude>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180123163739.2sxhzavghzgbjw4c@latitude>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tom Lendacky <thomas.lendacky-5C7GfCeVMHo@public.gmane.org>, Brijesh Singh <brijesh.singh-5C7GfCeVMHo@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Albert Herranz <albert_herranz-mRCrAkd8dF0@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Jonathan Neuschäfer <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org> writes:

> On Tue, Jan 23, 2018 at 11:58:06PM +1100, Michael Ellerman wrote:
>> Jonathan Neuschäfer <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org> writes:
>> 
>> > On the Nintendo Wii, there are two ranges of physical memory, and MMIO
>> > in between, but Linux on ppc32 doesn't support discontiguous memory.
>> > Therefore a hack was introduced in commit c5df7f775148 ("powerpc: allow
>> > ioremap within reserved memory regions") and commit de32400dd26e ("wii:
>> > use both mem1 and mem2 as ram"):
>> >
>> >  - Treat the area from the start of the first memory area (MEM1) to the
>> >    end of the second (MEM2) as one big memory area, but mark the part
>> >    that doesn't belong to MEM1 or MEM2 as reserved.
>> >  - Only on the Wii, allow ioremap to be used on reserved memory.
>> >
>> > This hack, however, doesn't account for the "resource"-based API in
>> > kernel/resource.c, because __request_region performs its own checks.
>> >
>> > Extend the hack to kernel/resource.c, to allow more drivers to allocate
>> > their MMIO regions on the Wii.
>> 
>> Hi Jonathan,
>> 
>> Sorry but I can't merge a hack like this in generic code.
>
> Makes sense.
>
>> Has anyone looked at adding proper discontig mem support to PPC32?
>
> I'm not aware of any such effort.
>
> Do you have any pointer on how to implement discontiguous memory
> support? CONFIG_ARCH_SPARSEMEM_ENABLE seems relevant.

I'm not really sure what the key impediment to it working is.

You don't need to go all the way to SPARSEMEM, there is DISCONTIGMEM
which IIUI is quite a bit simpler.

I'd actually be interested to know what happens (ie. breaks) if you just
add the two memblocks and leave the hole in between. Is it the generic
code that breaks or is it something in the powerpc code? If it's the
later maybe we can do a small fix/hack to work around that.

>> Or can we punch a hole in the resource in the right place? Maybe from
>> add_system_ram_resources() ?
>
> Not sure. add_system_ram_resources would need the original memblock
> table, which is overwritten in wii_memory_fixups, if I read the code
> correctly.

Or it just needs to know where the "wii hole" is, and it can skip that
region, that should be doable, but whether it actually works I'm not
100% sure.

> If a proper solution doesn't take an overwhelming amount of work, I'd
> prefer a proper solution.

Thanks.

cheers
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
