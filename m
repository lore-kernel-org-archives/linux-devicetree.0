From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] arm64: dts: r8a7795: update register size for thermal
Date: Fri, 5 Jan 2018 13:33:46 +0100
Message-ID: <CAMuHMdXnNQE7CY_k465robn8weh6+EeGn7xe7ZzdpdTOcice5A@mail.gmail.com>
References: <20180104213108.24080-1-niklas.soderlund+renesas@ragnatech.se>
 <20180104213108.24080-2-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdU97udtf4+vo_SaGyYaEk1eV4QEmeqWiGF4iVp045w=6A@mail.gmail.com> <20180105122450.GG22490@bigcity.dyn.berto.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20180105122450.GG22490@bigcity.dyn.berto.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Niklas,

On Fri, Jan 5, 2018 at 1:24 PM, Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
> On 2018-01-05 09:47:11 +0100, Geert Uytterhoeven wrote:
>> On Thu, Jan 4, 2018 at 10:31 PM, Niklas S=C3=B6derlund
>> <niklas.soderlund+renesas@ragnatech.se> wrote:
>> > To be able to read fused calibration values from hardware the size of
>> > the register resource of TSC1 needs to be incremented to cover one mor=
e
>> > register which holds the information if the calibration values have be=
en
>> > fused or not.
>> >
>> > Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnate=
ch.se>
>>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>
>> > --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
>> > +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
>> > @@ -2385,7 +2385,7 @@
>> >
>> >                 tsc: thermal@e6198000 {
>> >                         compatible =3D "renesas,r8a7795-thermal";
>> > -                       reg =3D <0 0xe6198000 0 0x68>,
>> > +                       reg =3D <0 0xe6198000 0 0x6c>,
>>
>> Perhaps we should just make it 0x100?
>> I'd be very surprised if that would be smaller than the granularity of t=
he
>> address decoder circuitry.
>
> I have no problem with making it 0x100, looking at r8a7795.dtsi it seems
> we are mixing what we do today. For example the i2c nodes are defined
> with a precise size less then 0x100 while the USB-DMAC nodes uses a size
> of 0x100 while the size in the documentation is less then 0x100. Maybe
> we should define how we should handle cases like this and update the
> existing DT files?
>
> Do you think I should make all thermal registers 0x100 and not just TSC1
> and resend?

I think that makes sense.

Granularities below PAGE_SIZE can't be enforced well anyway
(Hi, gpio5/6/7 virtualization!).

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
