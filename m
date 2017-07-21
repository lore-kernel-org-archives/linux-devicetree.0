From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/5] arm: allwinner: a64: drop the dummy
 vcc3v3 regulator in Pine64 DT
Date: Fri, 21 Jul 2017 22:39:33 +0200
Message-ID: <20170721203933.l4thb6hjc6elsnjw@flea>
References: <20170719161019.62133-1-icenowy@aosc.io>
 <20170719161019.62133-3-icenowy@aosc.io>
 <4e2c9486-9c0d-14e9-62e7-8642758c5472@arm.com>
 <7FACC99F-F900-437B-9642-741D7D980D25@aosc.io>
 <493424f1-6df3-ec19-a7cf-f76706cb2c51@arm.com>
 <20170721143858.3hufnu7v3ki6xmgf@flea>
 <0d30c993-a3a4-3923-b112-e65d1ea97cce@arm.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7brkildezfg6dpct"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBBWNZHFQKGQEHBXQTKI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <0d30c993-a3a4-3923-b112-e65d1ea97cce-5wv7dgnIgG8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, "agraf-l3A5Bk7waGM@public.gmane.org" <agraf-l3A5Bk7waGM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--7brkildezfg6dpct
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 21, 2017 at 04:08:42PM +0100, Andre Przywara wrote:
> On 21/07/17 15:38, Maxime Ripard wrote:
> > On Fri, Jul 21, 2017 at 02:02:18PM +0100, Andre Przywara wrote:
> >> Hi,
> >>
> >> On 21/07/17 13:49, Icenowy Zheng wrote:
> >>>
> >>>
> >>> =E4=BA=8E 2017=E5=B9=B47=E6=9C=8821=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=
=8D=888:45:39, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org> =E5=86=99=E5=88=B0:
> >>>> Hi,
> >>>>
> >>>> On 19/07/17 17:10, Icenowy Zheng wrote:
> >>>>> The Pine64 DT used to contain a dummy vcc3v3 regulator, in order to
> >>>>> satisfy some device nodes when proper AXP803 regulator support is
> >>>>> available. It's in fact the DCDC1 regulator of AXP803.
> >>>>>
> >>>>> Drop the dummy regulator, and fix the reference of this regulator t=
o
> >>>>> DCDC1.
> >>>>
> >>>> Do we really need to have this?
> >>>> While I see that this is technically correct, it breaks older kernel=
s,
> >>>> which miss the AXP driver. So we can't use this DT for syncing it in=
to
> >>>> U-Boot anymore, while still expecting various kernels (for instance
> >>>> from
> >>>> distribution installers) to work via UEFI (for which U-Boot provides
> >>>> the
> >>>> DT). That would be a shame, because we start to see generic arm64
> >>>> distribution installers to work out of the box.
> >>>>
> >>>> I see these solutions:
> >>>> 1) We drop this patch, instead add a comment that technically it's
> >>>> DCDC1. I believe we can't really turn off DCDC1 anyway.
> >>>> 2) We keep theses patches, but don't sync them to U-Boot to have a
> >>>> universal DT in there which works with every kernel.
> >>>> 3) We keep these patches *and* sync them to U-Boot, but add the fixe=
d
> >>>> regulator back in via a U-Boot specific .dtsi "overlay" snippet. Thi=
s
> >>>> would take care of the parts that break compatibility. The end resul=
t
> >>>> would be similar to 2), then.
> >>>>
> >>>> The easiest and most maintainable would be 1), but I am OK with 3) a=
s
> >>>> well, though I am not sure this won't get messy in the future and wi=
ll
> >>>> work for every change that we make.
> >>>>
> >>>> What do you think?
> >>>
> >>> 4) Do nothing.
> >>>
> >>> We only promise old DTs will run with newer kernel, but
> >>> we don't promise newer DTs to run with old kernel.And
> >>> U-Boot is intended to update less frequently than Linux.
> >>>
> >>> When updateing U-Boot, please update kernel as well.
> >>
> >> Which means you tie your firmware to a kernel. I know this is the old
> >> embedded approach, but we should really get rid of this, as I don't se=
e
> >> how this will work nicely with the Pinebook, for instance (which is no=
t
> >> really "embedded" anymore).
> >>
> >> U-Boot sits on the SPI flash there, and you are expected to just run a=
ny
> >> (not only Linux) distribution from a USB pen drive, for instance, with
> >> that one firmware version, using UEFI. This already works today, but i=
s
> >> only sustainable if we have forward DT compatibility as well.
> >=20
> > We've been discussing this over and over and over again.
>=20
> Don't tell me ;-)
> But apart from "We don't care" I haven't got a real solution out of this
> discussion.

You're looking for a solution to an industry-wide problem, without
fixing the industry first. Make the thousands-engineers companies
heavily involved in mainlining their stuff (you know, the Qualcomm,
Mediatek [1], Microchip [2], Marvell [3], Rockchip, you name it)
comply with these arbitrarily made up rules.

And then the handful people working on their spare time will follow.

> > You're using the pinebook as an example, fine.
>=20
> I believe the current approach for supporting Allwinner boards is rooted
> in some embedded world, where shipping firmware together with some
> kernel is standard, especially if there is no on-board storage anyway.
>=20
> But the Pinebook is clearly not embedded and comes with SPI flash to
> boot from, so people might expect to install some Linux distribution on i=
t.
> And with the UEFI support in U-Boot we have a good solution for this
> (check the debian-testing arm64 installer), and so far this works: every
> extension we did to the DT was still fine with older kernels - this
> particular feature might not work (say Ethernet in kernels < 2.13-rc1),
> but at least it doesn't hurt or introduces regressions.

Unless $distribution put some man power in supporting and mainlining
whatever they are interested in, yeah, I don't care what they think is
best. We're not their slaves.

And what would distributions think if we're all just tired of this and
just quit? How would they feel about having to use a 4 years old
kernel, without any security updates, rigged with bugs and mostly
unmaintained?

It's really time to get serious about this. Some of our most important
contributors already quit because of the sh*t we take every day, I've
thought about quitting several times in the last year. And yet, you
regularly criticize whatever we do on our evenings without real
documentation (adding your fair shair to the pile we take), want to
put more maintainance burden on us, all of that without contributing
anything significant else than "rules" that no-one else comply with?

Be reasonable for a minute.

I did that once, because it seemed important to some people at the
moment. It just gave us more ugly hacks, and just made our lives
harder.

> > Please give me the full documented, reviewed and acked-by binding
> > for all the features the pinebook has.
> >=20
> > If you can't, this discussion is pointless, since you will expect
> > changes in the DT.
>=20
> It's not about *changes* per se, it's about breaking compatibility,
> which can be avoided.
> As long as we just *add* features (DE2/HDMI, for instance) and don't
> introduce regressions, touching the DT is fine.
>=20
> And yes: I expect some hiccups with this, but also would hope for
> finding some solutions (like the ones sketched in my original email).

I'm going to merge this patch unless I can see a written rule
somewhere in our device tree documentation that prevent me from doing
so.

Maxime



--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--7brkildezfg6dpct
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZcmaFAAoJEBx+YmzsjxAgJxMP/AtOpvxTvyKjQAZHN2+VMiVw
HW2+Uk+oacfVkoKNuBLk6u6CEmSboVuRp+RfCj17pvoDoZKFLX/tKuCRIsBa7+Px
NNkGVlmV2azBd9T0urGWzpZZT/YGXU7sNmqQ+XjDJaT143VTwuNyfdxToIWvlCmR
V6GsxfdS8+MKsCDFQOzv4LdNevOfGkAXO0XEWr60uxdRjR6sYRq38w9B4YHIjDmN
h5dZ710oHopAaHf16/FfoT+O3ZTUjkUM9ZpOZuC6VXbXjb1wxN6XnBuXRJk2Ltj2
aW1Dy5Mz0o2ES9oSbRyyI0BdALXeinYWVcCZgCSD/MlHOqd4Z/fD1FkPkcBleSEO
3l2aHFFLKLu9fe1nUWaGj90gC+XZlLZDa9jOyYeBBbuAMsW2s87NbkpjzylXw+iZ
f4bpN7tkagm/udV4vshFYuVv+QmhHYpRpMI81kRq29wMZXpkvrDJMFA1XGjaoTot
QK5zwrv0KVKdhn9NU1ZFJu8DGx7vKwEyR+MQH7SMI5S4eAnNEG9KEp6ZtkXuMoxA
4vKxDErseZW7ieUrFw4sZFGXQNLofKEZNHB8eKiKaU3MgPZWHgdfBnR/8eimRxyr
XezKtmS9ox4ApwJ6MN6F14Q5rRjLXWtpVxGbPG5fS3AaImc3qNfjTSXepFO/79KA
aw5q0PYpBL1JUEgSawKl
=gN+L
-----END PGP SIGNATURE-----

--7brkildezfg6dpct--
