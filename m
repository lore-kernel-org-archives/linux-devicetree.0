From: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] MIPS: BMIPS: dts: remove unsupported entry for bcm7362
Date: Fri, 8 May 2015 12:53:28 -0700
Message-ID: <CAJiQ=7BAYVgtXHvQbwcJ0y8PzuoeYPggiuk5K7T7M1BwjsbLJg@mail.gmail.com>
References: <1431089958-2626-1-git-send-email-jaedon.shin@gmail.com>
 <10776752.kPn2ooXz5Z@wuerfel> <CAJiQ=7Ajkae60eKfzr=mjPDov=bzoq7jBVDdQhGO37G8GGKK3w@mail.gmail.com>
 <29249313.0p3GP5279g@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <29249313.0p3GP5279g@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 8, 2015 at 11:33 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>> > What exactly is the kernel limitation here?
>>
>> If we can't enable HIGHMEM, e.g. because the MIPS CPU has D$ aliases,
>> then Linux is supposed to ignore any RAM above the highmem/lowmem
>> boundary.
>>
>> There is code in paging_init() that tries to do this.  Several years
>> ago it used to work, but the last time I tried it (~Oct 2014) it was
>> broken due to some other changes in MIPS early memory init, so Linux
>> hangs on boot unless you take the excess RAM out of DT.  Jaedon may be
>> running into the same issue.
>
> Ok, I see. Could you avoid the problem by not requiring highmem?

I think the problem goes away if you disable CONFIG_HIGHMEM.

> We have some hacks on arch/arm/mach-realview to provide a nonlinear
> virt_to_phys() function, which ends up moving all RAM underneath the
> lowmem limit.

On this particular chip we can get a linear 1:1 virtual:physical
mapping for the first 1GB of system memory using the XKS01 hardware
feature and a bit of software support.  As Jaedon pointed out, a
couple of other things need to be tweaked in the arch/mips code:

 - Uncached/cached address conversions, as kseg1 is moved and reduced
 - Enabling XKS01 on each CPU thread on SMP boot, PM resume, or hot unplug
 - Setting aside a special VA range for uncached ioremaps, similar to
ARM, instead of assuming all kseg0 addresses have a corresponding
kseg1 address
 - Adding a wired TLB entry for PA 4000_0000 - 4fff_ffff

Without using XKS01, we'd need to use a nonlinear VA:PA mapping and
repurpose a large chunk of vmalloc space to map the upper 768MB of
system memory.  This would also require wired TLB entries and the
special ioremap range.  I never tried to make this work because the
XKS01 solution was cleaner.

Going beyond 1GB of system memory on this CPU would require HIGHMEM.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
