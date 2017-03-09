From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v8 0/6] Allwinner H5 and Orange Pi PC2 support
Date: Thu, 9 Mar 2017 11:53:58 +0100
Message-ID: <20170309105358.jmbzlenu3tcljrlc@lukather>
References: <20170306171750.7491-1-icenowy@aosc.xyz>
 <20170307170751.n6tvrztet724pxfl@lukather>
 <2704251488908203@web18o.yandex.ru>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ilsnfr2w5gcilo4j"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBR7IQTDAKGQEX6RJN5I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <2704251488908203-0lQQnEuakZFxpj1cXAZ9Bg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--ilsnfr2w5gcilo4j
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 08, 2017 at 01:36:43AM +0800, Icenowy Zheng wrote:
>=20
>=20
> 08.03.2017, 01:07, "Maxime Ripard" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> > Hi,
> >
> > On Tue, Mar 07, 2017 at 01:17:44AM +0800, Icenowy Zheng wrote:
> >> =C2=A0Allwinner H5 is a 64-bit SoC with a design like the 32-bit
> >> =C2=A0H3, and it's pin-to-pin compatible with H3.
> >>
> >> =C2=A0This patchset adds support for it, along with the first availabl=
e
> >> =C2=A0board -- Orange Pi PC2.
> >>
> >> =C2=A0Several H5 boards by Sinovoip Banana Pi and FriendlyARM Nano Pi
> >> =C2=A0are coming, so we should get ready for them.
> >>
> >> =C2=A0CCU changes are already said to be merged by Maxime Ripard, so
> >> =C2=A0this patchset now contains only device tree patches.
> >>
> >> =C2=A0Commit messages are changed by the suggestion of Maxime.
> >>
> >> =C2=A0This patchset depends on patchset [1] to finally take effect. At
> >> =C2=A0least the patch 1 of that patchset is needed if you want to test
> >> =C2=A0the kernel image -- without it the pinctrl driver won't be built
> >> =C2=A0and the kernel will become unusable without pinctrl.
> >
> > It's still not the prefixes I told you to use. I merged your patches
> > and fixed, but please use the right one next time (and be consistent
> > in your ARM vs arm usage).
>=20
> oh I added dts: to the prefix you told me, as they're device tree patches=
.
>=20
> Is the usage of "dts:" out-dated?

I'd like to at least have a common scheme across regular contributors,
and not the current mess that we have. So, yes, kind of. And it
doesn't make much sense these days where all our changes are either
drivers or dts.

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

--ilsnfr2w5gcilo4j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYwTRCAAoJEBx+YmzsjxAgZ6cQAKYsaphgIZnA5Hv0pMyXCXsK
eMPASS4BnEcbS4QYOgM5yPfsAKxTs3FkYf6WI1FO9Lbws4ccBa8PHkKwlFQOtEBo
GwuA0f8+ZLUY6/lkAzmSdKxT5FBxE5Lg48Yr6fzPMBIsQONC+jioKBGriR3QBoA2
AYVBDq0LTVjXiXcANVK85A3vhPqP4lfdu48E9BcJ+ryKytdEEpOFKL17Gj+/s6wJ
kndW3GKEabcQAOB9P749B88Vpa6qRQi7WycMG2CfxR+i7v7bqa5f8HXAEZ5Lk17M
5wIZSEMmphSYe0rdbgRHn+gMlDva98HvnH3Ybkt8ZUmSMW6AW6FwIRvG7pn2ZwLY
H8vn5xz4Tw+wOAAdh5yOuh7pYzCI1ZAMM8h4im+ce2AjaSdAws/2GP4BjQtkc0Uw
jaXrSSo6dSpS+2oty2x5uA0Er8woZB4ahch2jjJsJlk52z2YYT2KrvSWWJavsmT9
7v+wMAPdKzjNESXCHqNgI5tgTSx+f8sgBM3dsx7xaJZyMOS6/EYeAz4jhwIqBjDS
+fXoCc+UdYbNxUGQcQoiqsVm3ZOVt+Rb8DBjiUh/7tFH4arfoPBbexeF8/OFP3VA
xTBdaN5nwaqIgqrdDzPbwokAlyiivRwhSae40C47dHggaLzoyA/vBWqSgrn35A/H
ZEynyKPqLR0GOl5Epckn
=Qxoe
-----END PGP SIGNATURE-----

--ilsnfr2w5gcilo4j--
