From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 05/11] drivers: pinctrl: add driver for Allwinner A64 SoC
Date: Tue, 2 Feb 2016 16:53:58 +0000
Message-ID: <56B0DF26.10203@arm.com>
References: <1454348370-3816-1-git-send-email-andre.przywara@arm.com>
 <1454348370-3816-6-git-send-email-andre.przywara@arm.com>
 <20160201182754.GA14737@excalibur.cnev.de> <56AFE0EC.8080207@arm.com>
 <20160202100046.GM4652@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160202100046.GM4652@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 02/02/16 10:00, Maxime Ripard wrote:
> Hi Andre,
>=20
> On Mon, Feb 01, 2016 at 10:49:16PM +0000, Andr=E9 Przywara wrote:
>> On 01/02/16 18:27, Karsten Merker wrote:
>>
>> Hi Karsten,
>>
>> thank you very much for your feedback!
>>
>>> On Mon, Feb 01, 2016 at 05:39:24PM +0000, Andre Przywara wrote:
>>>> Based on the Allwinner A64 user manual and on the previous sunxi
>>>> pinctrl drivers this introduces the pin multiplex assignments for
>>>> the ARMv8 Allwinner A64 SoC.
>>>> Port A is apparently used for the fixed function DRAM controller, =
so
>>>> the ports start at B here (the manual mentions "n from 1 to 7", so
>>>> not starting at 0).
>>>>
>>>> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
>>>> ---
>>>>  .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |   1 +
>>>>  arch/arm64/Kconfig.platforms                       |   1 +
>>>>  drivers/pinctrl/sunxi/Kconfig                      |   4 +
>>>>  drivers/pinctrl/sunxi/Makefile                     |   1 +
>>>>  drivers/pinctrl/sunxi/pinctrl-a64.c                | 606 ++++++++=
+++++++++++++
>>>>  5 files changed, 613 insertions(+)
>>>>  create mode 100644 drivers/pinctrl/sunxi/pinctrl-a64.c
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,s=
unxi-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/allwinner,=
sunxi-pinctrl.txt
>>>> index 9213b27..9050002 100644
>>>> --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pi=
nctrl.txt
>>>> +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pi=
nctrl.txt
>>>> @@ -21,6 +21,7 @@ Required properties:
>>>>    "allwinner,sun9i-a80-r-pinctrl"
>>>>    "allwinner,sun8i-a83t-pinctrl"
>>>>    "allwinner,sun8i-h3-pinctrl"
>>>> +  "allwinner,a64-pinctrl"
>>>
>>> Hello,
>>>
>>> on all other Allwinner SoCs we use the SoC family as part of the
>>> compatible, as well as in the names of the Kconfig options. To
>>> keep things consistent, I would like to propose doing the same on
>>> Arm64, i.e. using allwinner,sun50i-a64-pinctrl instead of
>>> allwinner,a64-pinctrl.
>>
>> Yes, I have been told this already. However I don't like this idea s=
o
>> much, for the following reasons:
>> a) It is mostly redundant. The actual SoC (marketing) name is unique=
,
>> there is no sun6i-a20 or sun7i-a23.
>=20
> At the same time, the family name is mostly valid too.
>=20
> We do share some DTSI across some SoCs already by their family name
> (sun5i.dtsi for the A10s/A13/R8, sun8i-a23-a33.dtsi for the A23 and
> A33, etc.)
>=20
>> b) It is not even helpful. If I got Maxime correctly, then the newer
>> sunxi generation numbers depend on the ARM _cores_ used in the SoC,
>> which is frankly the least interesting part from a Linux support
>> perspective. I would see some sense if it would reflect the generati=
on
>> of IP blocks used, but so it is even more confusing to see that
>> sun7i-a20 and sun8i-a23 are related, but sun8i-h3 is a completely
>> different beast. The Allwinner marketing name tells you that, but th=
e
>> sunxi one does not.
>=20
> The opposite can be said too.
>=20
> The A31 is quite different from the A33, while the A83 is much closer
> to the H3 than it is to the A80. Their marketing scheme is messy. In
> all aspects. We have a scheme that worked, I'd really like to stick
> with it.

But also H3 and A64 are closely related, still having a totally
different sunxi name.
I guess we could give examples and counter-examples for hours, and just
making it possible to have two contradicting rationales lets me think
this whole naming scheme is inconsistent ;-)
I see that it may have fulfilled a purpose in the past (sun3i-sun7i,
maybe sun8i), but I am not very happy with proliferating this into the
(arm64) future.
Allwinner A<something> is a perfectly google-able and well understood
naming, also unique. So why add some mysterious sun{4,5,6,7,8,9,50}i to=
 it?
So I will amend identifiers/filenames where the name was just A64,
without any Allwinner reference (like in the pinctrl driver). I am in
for using sunxi as a shorthand for Allwinner, since this is a) shorter,
b) is already all over the kernel and c) doesn't give direct credit to =
a
company that apparently doesn't care ;-)

>> c) It is very confusing for people not dealing with it everyday. Jus=
t
>> because I own a BananaPi I know that the A20 is sun7i, but I am tota=
lly
>> lost when it comes to all the other names. And even now it took me a=
bout
>> a minute to find the appropriate Wiki page which explains part of th=
at
>> story.
>> d) Most importantly ;-): It kills TAB completion, unless you know th=
e
>> sunxi number, which is mostly not true as pointed out in c)
>=20
> Both of these are true, but are about the DT filenames, and not the
> compatibles. I'd agree with you on this one now that we have
> per-vendor subfolders in boot/dts, but it was not the case before, an=
d
> I'm pretty sure that to anyone that is not aware of the Allwinner SoC=
s
> names, having an A<number>.dtsi in arch/arm/boot/dts, it would be
> about a Cortex-A<number>, and definitely not an SoC from some random
> vendor.

I completely agree on that, but this is in
arch/arm64/boot/dts/allwinner, so it's pretty unique. Other vendors in
there seem to think the same. I also see that just an "a" as a prefix i=
s
pretty short, so should we go with "aw" instead?
But actually I would just leave it as it is.

> So, droping it in the filenames, why not. But I'd really like to keep
> the same compatible scheme.

And I still don't get this: in the DT compatible scheme we always have =
a
vendor prefix, so allwinner,a64 is surely not a mysterious ARM Ltd. cor=
e
or a new Apple SoC. Instead it is the A64 from Allwinner, full stop. So
why should we add an arbitrary and confusing sun50i naming to it (when
it actually should be more like "sun8i-a64").

Cheers,
Andre.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
