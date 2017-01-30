From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] ARM: sun8i: dt: Add mali node
Date: Mon, 30 Jan 2017 10:40:25 -0600
Message-ID: <CAL_JsqLs8bMjx2AcLePeNSxXDs0UAaReLrfaGRZOEun3tVqwiw@mail.gmail.com>
References: <a4d90de597cfcfab5fddeeb538505774a980818b.1485180017.git-series.maxime.ripard@free-electrons.com>
 <681511dd6370b9146ae8e3f8009eba1e15d36cc0.1485180017.git-series.maxime.ripard@free-electrons.com>
 <20170127202119.cnnuuojtjor6rleg@rob-hp-laptop> <20170130140015.dopcfbula6spu2xo@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170130140015.dopcfbula6spu2xo@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 30, 2017 at 8:00 AM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Hi Rob,
>
> On Fri, Jan 27, 2017 at 02:21:19PM -0600, Rob Herring wrote:
>> On Mon, Jan 23, 2017 at 03:00:46PM +0100, Maxime Ripard wrote:
>> > The A23 and A33 have an ARM Mali 400 GPU. Now that we have a binding, add
>> > it to our DT.
>> >
>> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> > ---
>> >  arch/arm/boot/dts/sun8i-a23-a33.dtsi | 26 ++++++++++++++++++++++++++
>> >  1 file changed, 26 insertions(+), 0 deletions(-)
>> >
>> > diff --git a/arch/arm/boot/dts/sun8i-a23-a33.dtsi b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
>> > index e4991a78ad73..982705719ef2 100644
>> > --- a/arch/arm/boot/dts/sun8i-a23-a33.dtsi
>> > +++ b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
>> > @@ -486,6 +486,32 @@
>> >                     #size-cells = <0>;
>> >             };
>> >
>> > +           mali: gpu@01c40000 {
>>
>> Drop leading 0.
>>
>> > +                   compatible = "allwinner,sun8i-a23-mali",
>> > +                                "allwinner,sun7i-a20-mali", "arm,mali-400";
>> > +                   reg = <0x01c40000 0x10000>;
>>
>> Does this really use 64K or that's just the register spacing? Set it
>> to what's used.
>
> The memory maps in our datasheet allocates 64k for that block. I
> always thought that we had to put the size of the whole memory block
> allocated to that device.
>
> For now, the driver only uses space up to 0xe000 (so we wouldn't
> "waste" a lot of space anyway), but what if at some point the driver
> needs more than what we put in the DT?

Well, it should be what the h/w is, not what the driver needs.

I only asked because 64K spacing of peripherals is becoming common,
but that wastes a bit of virtual address space on 32-bit if really the
h/w registers are only <4KB. Given that it is 0xe000 in this case, it
doesn't really matter here.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
