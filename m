From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: Re: [PATCH v2 01/11] dt-bindings: update the
 binding for Allwinner H3 TVE support
Date: Fri, 09 Jun 2017 23:24:47 +0200
Message-ID: <7305754.diZEu7DK25@jernej-laptop>
References: <20170604160149.30230-1-icenowy@aosc.io> <20170609164915.enap3epreg5vr2gy@flea.home> <53E8FC74-8AC0-461A-B875-812EE4A3267E@aosc.io>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDQNBWPU7YERBI5E5TEQKGQEJKWM3RY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <53E8FC74-8AC0-461A-B875-812EE4A3267E-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org
Cc: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi!

Dne petek, 09. junij 2017 ob 18:51:02 CEST je Icenowy Zheng napisal(a):
> =E4=BA=8E 2017=E5=B9=B46=E6=9C=8810=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=88=
12:49:15, Maxime Ripard <maxime.ripard@free-
electrons.com> =E5=86=99=E5=88=B0:
> >On Wed, Jun 07, 2017 at 04:48:50PM +0800, Icenowy Zheng wrote:
> >> >> @@ -189,6 +211,8 @@ supported.
> >> >>=20
> >> >>  Required properties:
> >> >>    - compatible: value must be one of:
> >> >>      * allwinner,sun8i-v3s-de2-mixer
> >> >>=20
> >> >> +    * allwinner,sun8i-h3-de2-mixer0
> >> >> +    * allwinner,sun8i-h3-de2-mixer1
> >> >
> >> >Again, please explain why we need to have different compatibles
> >> >here. If it's only about the number of planes, this should be dealt
> >> >with a property, not a compatible.
> >>=20
> >> Only mixer0 has "VEP" and write-back support, at least on H3.
> >
> >What is that VEP? writeback support can also be expressed by a
> >property.
>=20
> I don't know what VEP is...

VEP is probably Video Enhancement Processor (?). Although I'm not sure if t=
hat=20
is really mixer specific. Icenowy, can you explain where did you get this i=
nfo?=20

Best regards,
Jernej

>=20
> But we are really facing different cores, like sun50i-a64-mmc
> and sun50i-a64-emmc.
>=20
> >Maxime
>=20
> --
> You received this message because you are subscribed to the Google Groups
> "linux-sunxi" group. To unsubscribe from this group and stop receiving
> emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org=
.
> For more options, visit https://groups.google.com/d/optout.


--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
