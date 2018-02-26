From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: [PATCH 14/15] ARM: dts: sun8i: h3: Enable HDMI
 output on H3 boards
Date: Mon, 26 Feb 2018 17:27:52 +0100
Message-ID: <2342395.9m6rrqTry7@jernej-laptop>
References: <20180224214545.3740-1-jernej.skrabec@siol.net> <2676311.2IEVhXnSIE@jernej-laptop> <4AA78C45-E139-417E-BE89-FE0BFBC409B0@aosc.io>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDQNBWPU7YERBDHL2DKAKGQE3LNQ3AI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <4AA78C45-E139-417E-BE89-FE0BFBC409B0-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org
Cc: Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Mailing List, Arm" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Dne ponedeljek, 26. februar 2018 ob 17:21:05 CET je Icenowy Zheng napisal(a=
):
> =E4=BA=8E 2018=E5=B9=B42=E6=9C=8827=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=88=
12:16:44, "Jernej =C5=A0krabec"=20
<jernej.skrabec-gGgVlfcn5nU@public.gmane.org> =E5=86=99=E5=88=B0:
> >Hi Julian,
> >
> >Dne nedelja, 25. februar 2018 ob 09:11:34 CET je Julian Calaby
> >
> >napisal(a):
> >> Hi Jernej,
> >>=20
> >> On Sun, Feb 25, 2018 at 8:45 AM, Jernej Skrabec
> >
> ><jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> >
> >wrote:
> >> > Enable HDMI output on all boards which have HDMI connector.
> >> >=20
> >> > Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> >> > ---
> >> >=20
> >> >  arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts    | 25
> >> >  ++++++++++++++++++++++ arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
> >> > =20
> >> >   | 25 ++++++++++++++++++++++
> >> > =20
> >> >  arch/arm/boot/dts/sun8i-h3-libretech-all-h3-cc.dts | 25
> >> >  ++++++++++++++++++++++ arch/arm/boot/dts/sun8i-h3-nanopi-m1.dts
> >> > =20
> >> >   | 25 ++++++++++++++++++++++
> >
> >arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
> >
> >> >         | 25 ++++++++++++++++++++++
> >> > =20
> >> >  arch/arm/boot/dts/sun8i-h3-orangepi-lite.dts       | 25
> >> >  ++++++++++++++++++++++ arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
> >> > =20
> >> >   | 24 +++++++++++++++++++++
> >
> >arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
> >
> >> >        | 25 ++++++++++++++++++++++ 8 files changed, 199
> >
> >insertions(+)
> >
> >> As I understand it, the H2+ is just a slightly trimmed down H3. In
> >> terms of HDMI support, the difference is that the H2+ can't output
> >
> >4k.
> >
> >> If this code is compatible with the H2+, could you please add the
> >> necessary bits and pieces to the h2-plus DTSs too?
> >
> >There are only 3 H2+ boards in kernel and none of them has HDMI
> >connector, so
>=20
> BPi M2 Zero has miniHDMI connector.

Ah, sorry, I missed that one. Since I don't have it (or any other board wit=
h=20
H2+) I'm not really comfortable including such patch. If anyone will test i=
t,=20
I can include it in next revision.

Best regards,
Jernej

>=20
> >there's nothing to do actually. But if such board is added to kernel,
> >it would
> >be trivially add proper nodes, since all H2+ boards include H3 DTSI.
> >
> >Best regards,
> >Jernej
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
