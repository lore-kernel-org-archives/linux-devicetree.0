From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v2 0/2] arm64: dts: r8a779[56]: update register size for thermal
Date: Mon, 8 Jan 2018 09:02:16 +0100
Message-ID: <CAMuHMdUNMoiEQS+Tk3o-FTz0_AKt+8GL3ju8_w174GJiCNoytw@mail.gmail.com>
References: <20180105155447.10071-1-niklas.soderlund+renesas@ragnatech.se> <20180108065911.dz2z4a4aaqjw6qfd@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180108065911.dz2z4a4aaqjw6qfd-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Simon,

On Mon, Jan 8, 2018 at 7:59 AM, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org> wrote:
> On Fri, Jan 05, 2018 at 04:54:45PM +0100, Niklas S=C3=B6derlund wrote:
>> This series updates the register size for the thermal hardware. In later
>> versions of the datasheet one additional register is documented. This
>> register is needed to be able to determine if calibration data should be
>> read from register or if static values from the driver should be used.
>>
>> There is already a posted RFC patch which make use of this additional
>> register (THSCP) if the register size described in DT covers it.
>> Currently no hardware where the calibration value is fused have been
>> found so that patch is not tested and therefore kept back until such a
>> system is found. In the mean time there is no harm in getting the
>> correct register size described in DT now that it's documented in the
>> datasheet (Rev 0.80).
>>
>> * Changes since v1
>> - Increase size from just covering the new register in TSC1 to
>>   increasing the size of all TSC's to 0x100 which is the smallest
>>   granularity of the address decoder circuitry. Suggested by Geert.
>>
>> Niklas S=C3=B6derlund (2):
>>   arm64: dts: r8a7795: update register size for thermal
>>   arm64: dts: r8a7796: update register size for thermal
>
> Applied, but this seems to go in the opposite direction of:
>
> 846106d9d973 ("ARM: dts: r8a7793: Reduce size of thermal registers")
> 1af62038f499 ("ARM: dts: r8a7791: Reduce size of thermal registers")
> d0191d85a237 ("ARM: dts: r8a7790: Reduce size of thermal registers")
>
> Should those patches be dropped and the register areas grown to 0x100
> instead?

There are two "policies" to specify register block lengths:
  1. Cover all registers documented in the datasheet, and nothing more (at =
the
   low/high end),
  2. Use a power-of-two that covers all registers, which is most probably
    what matches the actual address decoder in the hardware.

Of course, we all know datasheets are volatile, and registers may appear or
disappear any time ;-)

In reality, ioremap() granularity is PAGE_SIZE, which is also a power-of-tw=
o.

So personally, I'm more leaning towards policy #2.

The 3 commits you refer to use policy #1, but covered a register not
documented in the datasheet.

Note that some drivers (SD?) use the register block lengths to check if a
feature is available or not. Ideally they should use the compatible value
instead.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
