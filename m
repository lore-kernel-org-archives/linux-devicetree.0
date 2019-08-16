From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM64: dts: allwinner: Add devicetree for
 pine H64 modelA evaluation board
Date: Fri, 16 Aug 2019 11:50:35 +0200
Message-ID: <2361666.6tDiKGV9WF@jernej-laptop>
References: <20190808084253.10573-1-clabbe.montjoie@gmail.com> <20190814132001.GC24324@Red> <CAJiuCcfASQriPLMuwuDCn9bU=_8q4jL+KkPo8NmMrrYpOqy2qA@mail.gmail.com>
Reply-To: jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDP4JJM5QYGRB4HY3HVAKGQE4NXDZYQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAJiuCcfASQriPLMuwuDCn9bU=_8q4jL+KkPo8NmMrrYpOqy2qA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dne sreda, 14. avgust 2019 ob 15:28:53 CEST je Cl=C3=A9ment P=C3=A9ron napi=
sal(a):
> Hi,
>=20
> On Wed, 14 Aug 2019 at 15:20, Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=
=20
wrote:
> > On Mon, Aug 12, 2019 at 12:56:56PM +0200, Jernej =C5=A0krabec wrote:
> > > Dne =C4=8Detrtek, 08. avgust 2019 ob 10:42:53 CEST je Corentin Labbe=
=20
napisal(a):
> > > > This patch adds the evaluation variant of the model A of the PineH6=
4.
> > > > The model A has the same size of the pine64 and has a PCIE slot.
> > > >=20
> > > > The only devicetree difference with current pineH64, is the PHY
> > > > regulator.
> > >=20
> > > I have Model A board which also needs ddc-en-gpios property for HDMI
> > > connector in order for HDMI to work correctly. Otherwise it will just
> > > use 1024x768 resolution. Can you confirm that?
>=20
> Schematics Rev A:
> http://files.pine64.org/doc/Pine%20H64/Pine%20H64%20Ver1.1-20180104.pdf
>=20
> Rev B:
> http://files.pine64.org/doc/Pine%20H64/PINE-H6-model-B-20181212-schematic=
.pd
> f
>=20
> There is a DDC_EN on REV A not on REV B
>=20
> Regards,
> Cl=C3=A9ment
>=20
> > > Best regards,
> > > Jernej
> >=20
> > Sorry I didnt use at all video stuff (like HDMI), so I cannot answer no=
w.
> >=20
> > Could you send me a patch against my future v2 and I could test
> > with/without.

I don't have access to my Model A board currently, but this should suffice:

&connector {
	ddc-en-gpios =3D <&pio 7 2 GPIO_ACTIVE_HIGH>; /* PH2 */
};

Best regards,
Jernej

> >=20
> > Regards
> >=20
> > --
> > You received this message because you are subscribed to the Google Grou=
ps
> > "linux-sunxi" group. To unsubscribe from this group and stop receiving
> > emails from it, send an email to
> > linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org To view this discussion on th=
e
> > web, visit
> > https://groups.google.com/d/msgid/linux-sunxi/20190814132001.GC24324%40=
Re
> > d.




--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
To view this discussion on the web, visit https://groups.google.com/d/msgid=
/linux-sunxi/2361666.6tDiKGV9WF%40jernej-laptop.
