From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 05/11] drivers: pinctrl: add driver for
 Allwinner A64 SoC
Date: Tue, 2 Feb 2016 18:09:59 +0800
Message-ID: <CAGb2v66JGbuQJUh5k6guhKrN4GqMmomyBFtqgcH09Zm-pVGxPw@mail.gmail.com>
References: <1454348370-3816-1-git-send-email-andre.przywara@arm.com>
 <1454348370-3816-6-git-send-email-andre.przywara@arm.com> <20160201182754.GA14737@excalibur.cnev.de>
 <56AFE0EC.8080207@arm.com> <20160202100046.GM4652@lukather>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBBDUBYK2QKGQE6BBH5NQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20160202100046.GM4652@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 2, 2016 at 6:00 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Hi Andre,
>
> On Mon, Feb 01, 2016 at 10:49:16PM +0000, Andr=C3=A9 Przywara wrote:
>> On 01/02/16 18:27, Karsten Merker wrote:
>>
>> Hi Karsten,
>>
>> thank you very much for your feedback!
>>
>> > On Mon, Feb 01, 2016 at 05:39:24PM +0000, Andre Przywara wrote:
>> >> Based on the Allwinner A64 user manual and on the previous sunxi
>> >> pinctrl drivers this introduces the pin multiplex assignments for
>> >> the ARMv8 Allwinner A64 SoC.
>> >> Port A is apparently used for the fixed function DRAM controller, so
>> >> the ports start at B here (the manual mentions "n from 1 to 7", so
>> >> not starting at 0).
>> >>
>> >> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
>> >> ---
>> >>  .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |   1 +
>> >>  arch/arm64/Kconfig.platforms                       |   1 +
>> >>  drivers/pinctrl/sunxi/Kconfig                      |   4 +
>> >>  drivers/pinctrl/sunxi/Makefile                     |   1 +
>> >>  drivers/pinctrl/sunxi/pinctrl-a64.c                | 606 +++++++++++=
++++++++++
>> >>  5 files changed, 613 insertions(+)
>> >>  create mode 100644 drivers/pinctrl/sunxi/pinctrl-a64.c
>> >>
>> >> diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sunx=
i-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-p=
inctrl.txt
>> >> index 9213b27..9050002 100644
>> >> --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinct=
rl.txt
>> >> +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinct=
rl.txt
>> >> @@ -21,6 +21,7 @@ Required properties:
>> >>    "allwinner,sun9i-a80-r-pinctrl"
>> >>    "allwinner,sun8i-a83t-pinctrl"
>> >>    "allwinner,sun8i-h3-pinctrl"
>> >> +  "allwinner,a64-pinctrl"
>> >
>> > Hello,
>> >
>> > on all other Allwinner SoCs we use the SoC family as part of the
>> > compatible, as well as in the names of the Kconfig options. To
>> > keep things consistent, I would like to propose doing the same on
>> > Arm64, i.e. using allwinner,sun50i-a64-pinctrl instead of
>> > allwinner,a64-pinctrl.
>>
>> Yes, I have been told this already. However I don't like this idea so
>> much, for the following reasons:
>> a) It is mostly redundant. The actual SoC (marketing) name is unique,
>> there is no sun6i-a20 or sun7i-a23.
>
> At the same time, the family name is mostly valid too.
>
> We do share some DTSI across some SoCs already by their family name
> (sun5i.dtsi for the A10s/A13/R8, sun8i-a23-a33.dtsi for the A23 and
> A33, etc.)
>
>> b) It is not even helpful. If I got Maxime correctly, then the newer
>> sunxi generation numbers depend on the ARM _cores_ used in the SoC,
>> which is frankly the least interesting part from a Linux support
>> perspective. I would see some sense if it would reflect the generation
>> of IP blocks used, but so it is even more confusing to see that
>> sun7i-a20 and sun8i-a23 are related, but sun8i-h3 is a completely
>> different beast. The Allwinner marketing name tells you that, but the
>> sunxi one does not.
>
> The opposite can be said too.
>
> The A31 is quite different from the A33, while the A83 is much closer
> to the H3 than it is to the A80. Their marketing scheme is messy. In
> all aspects. We have a scheme that worked, I'd really like to stick
> with it.
>
>> c) It is very confusing for people not dealing with it everyday. Just
>> because I own a BananaPi I know that the A20 is sun7i, but I am totally
>> lost when it comes to all the other names. And even now it took me about
>> a minute to find the appropriate Wiki page which explains part of that
>> story.
>> d) Most importantly ;-): It kills TAB completion, unless you know the
>> sunxi number, which is mostly not true as pointed out in c)
>
> Both of these are true, but are about the DT filenames, and not the
> compatibles. I'd agree with you on this one now that we have
> per-vendor subfolders in boot/dts, but it was not the case before, and
> I'm pretty sure that to anyone that is not aware of the Allwinner SoCs
> names, having an A<number>.dtsi in arch/arm/boot/dts, it would be
> about a Cortex-A<number>, and definitely not an SoC from some random
> vendor.
>
> So, droping it in the filenames, why not. But I'd really like to keep
> the same compatible scheme.

If we do end up dropping it from the filenames, can you (Andr=C3=A9) update
MAINTAINERS to add "arch/arm64/boot/dts/sunxi/" to the sunxi entry?

Thanks.
ChenYu

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
