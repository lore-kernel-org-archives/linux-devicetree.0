From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] of: Fix memory block alignment in early_init_dt_add_memory_arch()
Date: Wed, 27 Aug 2014 13:08:51 +0200
Message-ID: <CAMuHMdWZ_GDS_W-Y26ig7cKf7wdr82XF1kyLd8dFzc7Jb4_r-w@mail.gmail.com>
References: <1408547431-24001-1-git-send-email-geert+renesas@glider.be>
	<20140827103048.80BBBC409CB@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140827103048.80BBBC409CB-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Grant,

On Wed, Aug 27, 2014 at 12:30 PM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Wed, 20 Aug 2014 17:10:31 +0200, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org> wrote:
>> If a memory block is not aligned to PAGE_SIZE, its base address must be
>> rounded up, not down, and its size must be reduced.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>
> Looks reasonable. What is the situation that exposed this problem?

When ARM switched from arm_add_memory() to early_init_dt_add_memory_arch()
for DT-based platforms, I just noticed this when comparing the two
implementations.

I don't know if it triggers in the wild.

> Should size be checked for page alignment also?

Size is already rounded down if it's not page aligned, cfr. the context below.

>> ---
>>  drivers/of/fdt.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
>> index f46a24ffa3fe..95fa81b8ca19 100644
>> --- a/drivers/of/fdt.c
>> +++ b/drivers/of/fdt.c
>> @@ -928,7 +928,11 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
>>  void __init __weak early_init_dt_add_memory_arch(u64 base, u64 size)
>>  {
>>       const u64 phys_offset = __pa(PAGE_OFFSET);
>> -     base &= PAGE_MASK;
>> +
>> +     if (!PAGE_ALIGNED(base)) {
>> +             size -= PAGE_SIZE - (base & ~PAGE_MASK);
>> +             base = PAGE_ALIGN(base);
>> +     }
>>       size &= PAGE_MASK;
>>
>>       if (base > MAX_PHYS_ADDR) {
>> --
>> 1.9.1

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
