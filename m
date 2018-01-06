From: PrasannaKumar Muralidharan <prasannatsmkumar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] nvmem: add driver for JZ4780 efuse
Date: Sat, 6 Jan 2018 17:22:34 +0530
Message-ID: <CANc+2y7zf5V-7oWiBEDkhv6cD70C74=_7q4fUtbwU85MydAkzA@mail.gmail.com>
References: <20171227122722.5219-1-malat@debian.org> <20171227122722.5219-2-malat@debian.org>
 <bbc64846-e12e-aea8-c516-5e03f6253fed@mips.com> <CA+7wUsxM4Cq-K6ONSO-WzmYYvq8PmT92Jfrf7M-MqY-ntObi-g@mail.gmail.com>
 <0a3b0b12-80c0-9d6d-bfdb-8d2541947750@mips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0a3b0b12-80c0-9d6d-bfdb-8d2541947750-8NJIiSa5LzA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcin Nowakowski <marcin.nowakowski-8NJIiSa5LzA@public.gmane.org>
Cc: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Zubair.Kakakhel-8NJIiSa5LzA@public.gmane.org, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Harvey Hunt <harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hogan <jhogan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Marcin,

On 28 December 2017 at 13:35, Marcin Nowakowski
<marcin.nowakowski-8NJIiSa5LzA@public.gmane.org> wrote:
> Hi Mathieu,
>
> On 28.12.2017 08:26, Mathieu Malaterre wrote:
>>
>> Hi Marcin,
>>
>> On Thu, Dec 28, 2017 at 8:13 AM, Marcin Nowakowski
>> <marcin.nowakowski-8NJIiSa5LzA@public.gmane.org <mailto:marcin.nowakowski-8NJIiSa5LzA@public.gmane.org>> wrote:
>>  > Hi Mathieu, PrasannaKumar,
>>  >
>>  > On 27.12.2017 13:27, Mathieu Malaterre wrote:
>>  >>
>>  >> From: PrasannaKumar Muralidharan <prasannatsmkumar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
>> <mailto:prasannatsmkumar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>>
>>  >>
>>  >> This patch brings support for the JZ4780 efuse. Currently it only
>> expose
>>  >> a read only access to the entire 8K bits efuse memory.
>>  >>
>>  >> Tested-by: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org
>> <mailto:malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>>
>>  >> Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
>> <mailto:prasannatsmkumar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>>
>>  >> ---
>>  >
>>  >
>>  >> +
>>  >> +/* main entry point */
>>  >> +static int jz4780_efuse_read(void *context, unsigned int offset,
>>  >> +                                       void *val, size_t bytes)
>>  >> +{
>>  >> +       static const int nsegments = sizeof(segments) /
>> sizeof(*segments);
>>  >> +       struct jz4780_efuse *efuse = context;
>>  >> +       char buf[32];
>>  >> +       char *cur = val;
>>  >> +       int i;
>>  >> +       /* PM recommends read/write each segment separately */
>>  >> +       for (i = 0; i < nsegments; ++i) {
>>  >> +               unsigned int *segment = segments[i];
>>  >> +               unsigned int lpos = segment[0];
>>  >> +               unsigned int buflen = segment[1] / 8;
>>  >> +               unsigned int ncount = buflen / 32;
>>  >> +               unsigned int remain = buflen % 32;
>>  >> +               int j;
>>  >
>>  >
>>  > This doesn't look right, as offset & bytes are completely ignored. This
>>  > means it will return data from an offset other than requested and may
>> also
>>  > overrun the provided output buffer?
>>
>>
>> Thanks for the review ! That was the part of nvmem framework I was not
>> totally clear. Let say I want to expose only a portion of efuse space, eg:
>
>
> Do you need to expose this to the userspace or to other drivers only?
> For the second case have a look at the description of nvmem cell interface.
>
>
>> diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi
>> b/arch/mips/boot/dts/ingenic/jz4780.dtsi
>> index 2f26922718559..44d97c06a6d15 100644
>> --- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
>> +++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
>> @@ -299,6 +299,15 @@
>> clocks = <&cgu JZ4780_CLK_AHB2>;
>> clock-names = "bus_clk";
>> +
>> +#address-cells = <1>;
>> +#size-cells = <1>;
>> +
>> +eth_mac: eth_mac@12 {
>> +/* six byte/48bit MAC address stored as 8-bit integers */
>> +reg = <0x12 0x6>;
>> +};
>> +
>> };
>> };
>> What should I do to expose that chunk only in the user space ?
>
>
> The nvmem interface's userspace interface (via /sys/.../nvmem) provides
> access to the complete device raw memory so the only way to achieve that
> would be to parse the devicetree description in your driver and only
> register part of the memory with the nvmem driver - but that would be a
> slight abuse of the interface.
> The nvmem devicetree binding document shows clearly how to define the cell
> interface that can later be used by any consumer - that way you could have
> the ethernet driver access the cell directly. However, as the dm9000 driver
> isn't designed to do that and this is a SoC-specific extention, I don't know
> how it fits with the general eth driver design ...
>
> Potentially a good and useful compromise would be to have all of the cell
> regs exposed via /sys/.../nvmem-cellname file (or something similar), but
> this is not currently supported and I don't know what the view of nvmem
> maintainers on adding such extension would be.

Currently exposing MAC address is necessary. No need to worry about
user space stuff for now.

>>  >
>>  >> +               /* EFUSE can read or write maximum 256bit in each time
>> */
>>  >> +               for (j = 0; j < ncount ; ++j) {
>>  >> +                       jz4780_efuse_read_32bytes(efuse, buf, lpos);
>>  >> +                       memcpy(cur, buf, sizeof(buf));
>>  >> +                       cur += sizeof(buf);
>>  >> +                       lpos += sizeof(buf);
>>  >> +                       }
>>  >> +               if (remain) {
>>  >> +                       jz4780_efuse_read_32bytes(efuse, buf, lpos);
>>  >> +                       memcpy(cur, buf, remain);
>>  >> +                       cur += remain;
>>  >> +                       }
>>  >> +               }
>>  >> +
>>  >> +       return 0;
>>  >> +}
>
>
> Regardless of the choices above, you still always have to make sure in your
> reg_read method that you only read from the offset specified in method
> arguments and never return more than 'bytes' of data requested.

Sure, will do that.

Regards,
PrasannaKumar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
