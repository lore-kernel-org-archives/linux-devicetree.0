From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [RFC PATCH 0/9] initial support for "suniv"
 Allwinner new ARM9 SoC
Date: Wed, 24 Jan 2018 21:10:34 +0800
Message-ID: <14593819.uISRktVE4V@ice-x220i>
References: <20180119231735.61504-1-icenowy@aosc.io> <20180122121435.bpayxk4uzfqbhqse@flea.lan>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBXELULJQKGQEDDKFEUY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180122121435.bpayxk4uzfqbhqse-ZC1Zs529Oq4@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2018=E5=B9=B41=E6=9C=8822=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=80 CST=
 =E4=B8=8B=E5=8D=888:14:35=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
> On Sat, Jan 20, 2018 at 07:17:26AM +0800, Icenowy Zheng wrote:
> > This is the RFC initial patchset for the "new" Allwinner SUNIV ARM9 SoC=
.
> >=20
> > The same die is packaged differently, come with different co-packaged
> > DRAM or shipped with different SDK; and then made many model names: F23=
,
> > F25, F1C100A, F1C100S, F1C200S, F1C500, F1C600, R6, etc. These SoCs all
> > share a common feature set and are packaged similarly (eLQFP128 for SoC=
s
> > without co-packaged DRAM, QFN88 for with DRAM). As their's no
> > functionality hidden on the QFN88 models (except DRAM interface not
> > exported), it's not clever to differentiate them. So I will use suniv a=
s
> > common name of all these SoCs.
>=20
> Where is that suniv prefix coming from?

The BSP (Melis and Linux). (e.g. "libs/suniv" directory of the Melis SDK an=
d=20
"arch/arm/boot/dts/sunivw1p1.dtsi" in the Linux SDK)

>=20
> And you need to have a SoC in all your compatibles. This isn't about
> being clever or not, this is just a matter of being able to accurately
> read in a crystal ball. Or maybe it's just the same, in which case,
> I'd really like to have a course :)

Okay. I will choose to use f1c100s in my next patchset, as it's where
it's developed. (Although I mainly refered F1C600 BSP and document)

>=20
> You should really answer two questions here:
>   - Are you able to predict whether you'll find an SoC part of that
>     family in the future that derives a bit and will need a compatible
>     of its own?
>   - Are you able to predict which quirks we'll need along the way to
>     support all the SoCs you've listed there?
>=20
> If you can't answer yes to both these questions, with a 100%
> certainty, then you'll need a SoC name in the compatible.
>=20
> Which doesn't prevent you from sharing as much as possible the DT like
> we did between the A10s and the A13 for example.

So the suniv-f1c100s.dtsi will still be kept empty and all peripherals know=
n=20
should go through suniv.dtsi.

>=20
> Maxime


--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
