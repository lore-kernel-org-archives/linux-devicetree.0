From: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [PATCH v2 1/6] resource: Extend the PPC32 reserved memory hack
Date: Tue, 23 Jan 2018 23:58:06 +1100
Message-ID: <871sigwx41.fsf@concordia.ellerman.id.au>
References: <20180122050411.32460-1-j.neuschaefer@gmx.net> <20180122050411.32460-2-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180122050411.32460-2-j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Tom Lendacky <thomas.lendacky-5C7GfCeVMHo@public.gmane.org>, Brijesh Singh <brijesh.singh-5C7GfCeVMHo@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Albert Herranz <albert_herranz-mRCrAkd8dF0@public.gmane.org>, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Jonathan Neuschäfer <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org> writes:

> On the Nintendo Wii, there are two ranges of physical memory, and MMIO
> in between, but Linux on ppc32 doesn't support discontiguous memory.
> Therefore a hack was introduced in commit c5df7f775148 ("powerpc: allow
> ioremap within reserved memory regions") and commit de32400dd26e ("wii:
> use both mem1 and mem2 as ram"):
>
>  - Treat the area from the start of the first memory area (MEM1) to the
>    end of the second (MEM2) as one big memory area, but mark the part
>    that doesn't belong to MEM1 or MEM2 as reserved.
>  - Only on the Wii, allow ioremap to be used on reserved memory.
>
> This hack, however, doesn't account for the "resource"-based API in
> kernel/resource.c, because __request_region performs its own checks.
>
> Extend the hack to kernel/resource.c, to allow more drivers to allocate
> their MMIO regions on the Wii.

Hi Jonathan,

Sorry but I can't merge a hack like this in generic code.

Has anyone looked at adding proper discontig mem support to PPC32?

Or can we punch a hole in the resource in the right place? Maybe from
add_system_ram_resources() ?

cheers
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
