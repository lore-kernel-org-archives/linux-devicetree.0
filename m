From: Siarhei Siamashka <siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Re: [PATCH 05/11] drivers: pinctrl: add driver for
 Allwinner A64 SoC
Date: Tue, 2 Feb 2016 03:58:52 +0200
Message-ID: <20160202035852.6984db63@i7>
References: <1454348370-3816-1-git-send-email-andre.przywara@arm.com>
	<1454348370-3816-6-git-send-email-andre.przywara@arm.com>
	<20160201182754.GA14737@excalibur.cnev.de>
	<56AFE0EC.8080207@arm.com>
Reply-To: siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCH4DA7NUEBBBX42YC2QKGQEHUBU7ZQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <56AFE0EC.8080207-5wv7dgnIgG8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?UTF-8?B?QW5kcsOp?= Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 1 Feb 2016 22:49:16 +0000
Andr=C3=A9 Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org> wrote:

> On 01/02/16 18:27, Karsten Merker wrote:
>=20
> Hi Karsten,
>=20
> thank you very much for your feedback!
>=20
> > On Mon, Feb 01, 2016 at 05:39:24PM +0000, Andre Przywara wrote: =20
> >> Based on the Allwinner A64 user manual and on the previous sunxi
> >> pinctrl drivers this introduces the pin multiplex assignments for
> >> the ARMv8 Allwinner A64 SoC.
> >> Port A is apparently used for the fixed function DRAM controller, so
> >> the ports start at B here (the manual mentions "n from 1 to 7", so
> >> not starting at 0).
> >>
> >> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> >> ---
> >>  .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |   1 +
> >>  arch/arm64/Kconfig.platforms                       |   1 +
> >>  drivers/pinctrl/sunxi/Kconfig                      |   4 +
> >>  drivers/pinctrl/sunxi/Makefile                     |   1 +
> >>  drivers/pinctrl/sunxi/pinctrl-a64.c                | 606 ++++++++++++=
+++++++++
> >>  5 files changed, 613 insertions(+)
> >>  create mode 100644 drivers/pinctrl/sunxi/pinctrl-a64.c
> >>
> >> diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi=
-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pi=
nctrl.txt
> >> index 9213b27..9050002 100644
> >> --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctr=
l.txt
> >> +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctr=
l.txt
> >> @@ -21,6 +21,7 @@ Required properties:
> >>    "allwinner,sun9i-a80-r-pinctrl"
> >>    "allwinner,sun8i-a83t-pinctrl"
> >>    "allwinner,sun8i-h3-pinctrl"
> >> +  "allwinner,a64-pinctrl" =20
> >=20
> > Hello,
> >=20
> > on all other Allwinner SoCs we use the SoC family as part of the
> > compatible, as well as in the names of the Kconfig options. To
> > keep things consistent, I would like to propose doing the same on
> > Arm64, i.e. using allwinner,sun50i-a64-pinctrl instead of
> > allwinner,a64-pinctrl. =20
>=20
> Yes, I have been told this already. However I don't like this idea so
> much, for the following reasons:
> a) It is mostly redundant. The actual SoC (marketing) name is unique,
> there is no sun6i-a20 or sun7i-a23.
> b) It is not even helpful. If I got Maxime correctly, then the newer
> sunxi generation numbers depend on the ARM _cores_ used in the SoC,
> which is frankly the least interesting part from a Linux support
> perspective. I would see some sense if it would reflect the generation
> of IP blocks used, but so it is even more confusing to see that
> sun7i-a20 and sun8i-a23 are related, but sun8i-h3 is a completely
> different beast. The Allwinner marketing name tells you that, but the
> sunxi one does not.
> c) It is very confusing for people not dealing with it everyday. Just
> because I own a BananaPi I know that the A20 is sun7i, but I am totally
> lost when it comes to all the other names. And even now it took me about
> a minute to find the appropriate Wiki page which explains part of that
> story.
> d) Most importantly ;-): It kills TAB completion, unless you know the
> sunxi number, which is mostly not true as pointed out in c)
>=20
> So while I see that just a<somenumber> is not really very specific, I'd
> rather do away with current naming scheme for the future. In this
> particular case we have the vendor name as a name space identifier
> already, so there is no possible confusion with ARM Cortex naming, for
> instance.
>=20
> Also as this is now moving into the arm64 world, I'd like to use the
> opportunity to fix things that are not really optimal, the naming is one
> of them.

One of the problems is that A64 name is not unique. We have reasons
to believe that there are also H64 and R18 out there using exactly
the same die, but possibly available in different packaging (a different
ball grid pitch? or maybe a different set of peripherals routed to the
outside?). Early prototypes of the Pine64 board were using Allwinner R18
and the Jide Remix Mini HTPC box is using Allwinner H64.

The bootloader sources from Allwinner are also referring to A64 as
AW1689, which makes some sense because it is the chip id number that
is accessible for runtime identification via reading the SRAM_VER_REG
hardware register:

    http://linux-sunxi.org/SRAM_Controller_Register_Guide#SRAM_VER_REG

So would it be a good idea to use "aw1689" as a compatible property
in the DT instead of "a64"? Or maybe have "aw1689-a64" and
"aw1689-h64", which would be similar to the existing "sun5i-a13"
and "sun5i-a10s" naming convention?

--=20
Best regards,
Siarhei Siamashka

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
