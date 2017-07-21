From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/5] arm: allwinner: a64: drop the dummy
 vcc3v3 regulator in Pine64 DT
Date: Fri, 21 Jul 2017 16:38:58 +0200
Message-ID: <20170721143858.3hufnu7v3ki6xmgf@flea>
References: <20170719161019.62133-1-icenowy@aosc.io>
 <20170719161019.62133-3-icenowy@aosc.io>
 <4e2c9486-9c0d-14e9-62e7-8642758c5472@arm.com>
 <7FACC99F-F900-437B-9642-741D7D980D25@aosc.io>
 <493424f1-6df3-ec19-a7cf-f76706cb2c51@arm.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="74ziiz3zjxjyeuey"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBA5EZDFQKGQEKA4XGRQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <493424f1-6df3-ec19-a7cf-f76706cb2c51-5wv7dgnIgG8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, "agraf-l3A5Bk7waGM@public.gmane.org" <agraf-l3A5Bk7waGM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--74ziiz3zjxjyeuey
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 21, 2017 at 02:02:18PM +0100, Andre Przywara wrote:
> Hi,
>=20
> On 21/07/17 13:49, Icenowy Zheng wrote:
> >=20
> >=20
> > =E4=BA=8E 2017=E5=B9=B47=E6=9C=8821=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=
=888:45:39, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org> =E5=86=99=E5=88=B0:
> >> Hi,
> >>
> >> On 19/07/17 17:10, Icenowy Zheng wrote:
> >>> The Pine64 DT used to contain a dummy vcc3v3 regulator, in order to
> >>> satisfy some device nodes when proper AXP803 regulator support is
> >>> available. It's in fact the DCDC1 regulator of AXP803.
> >>>
> >>> Drop the dummy regulator, and fix the reference of this regulator to
> >>> DCDC1.
> >>
> >> Do we really need to have this?
> >> While I see that this is technically correct, it breaks older kernels,
> >> which miss the AXP driver. So we can't use this DT for syncing it into
> >> U-Boot anymore, while still expecting various kernels (for instance
> >> from
> >> distribution installers) to work via UEFI (for which U-Boot provides
> >> the
> >> DT). That would be a shame, because we start to see generic arm64
> >> distribution installers to work out of the box.
> >>
> >> I see these solutions:
> >> 1) We drop this patch, instead add a comment that technically it's
> >> DCDC1. I believe we can't really turn off DCDC1 anyway.
> >> 2) We keep theses patches, but don't sync them to U-Boot to have a
> >> universal DT in there which works with every kernel.
> >> 3) We keep these patches *and* sync them to U-Boot, but add the fixed
> >> regulator back in via a U-Boot specific .dtsi "overlay" snippet. This
> >> would take care of the parts that break compatibility. The end result
> >> would be similar to 2), then.
> >>
> >> The easiest and most maintainable would be 1), but I am OK with 3) as
> >> well, though I am not sure this won't get messy in the future and will
> >> work for every change that we make.
> >>
> >> What do you think?
> >=20
> > 4) Do nothing.
> >=20
> > We only promise old DTs will run with newer kernel, but
> > we don't promise newer DTs to run with old kernel.And
> > U-Boot is intended to update less frequently than Linux.
> >=20
> > When updateing U-Boot, please update kernel as well.
>=20
> Which means you tie your firmware to a kernel. I know this is the old
> embedded approach, but we should really get rid of this, as I don't see
> how this will work nicely with the Pinebook, for instance (which is not
> really "embedded" anymore).
>
> U-Boot sits on the SPI flash there, and you are expected to just run any
> (not only Linux) distribution from a USB pen drive, for instance, with
> that one firmware version, using UEFI. This already works today, but is
> only sustainable if we have forward DT compatibility as well.

We've been discussing this over and over and over again. You're using
the pinebook as an example, fine. Please give me the full documented,
reviewed and acked-by binding for all the features the pinebook has.

If you can't, this discussion is pointless, since you will expect
changes in the DT.

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

--74ziiz3zjxjyeuey
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZchICAAoJEBx+YmzsjxAga18P/Au/CRbFQ/3vV3QBMFYJ9wGh
7ILw9WvmrHkl2NbqH7gMR0bEIPTpXRa5gL3nZ5AFei7OnsHfiFBf2k59+Aq/r1Bt
LsPO0mVvdnyhQw6LW5Pc2Ar+D3A5lLoH/2PMK5YNzgGh0fSLV5RIV2kz3mM6V5Fr
26KcEji9pfeu0VY4eX46FAu6gl8xOqPhQQredmYYozE2qz8KsvUZfoQ2a6JE+tsd
WeM3x+sqzflBaw+2QCP5kiiOIrLiYnH6ICnY5BUhDWOzFBDi/FIhRvdduhq9UqUu
VRmjU/xvMuFxVYzWKXRVWbIsGE36vWJwFK5GDwCKRU2YpKHEvOEG//qg9ITDy1wm
HqxHrD21ns2l9ypHagqJ5+nLURni+mk/RGVoc8zxMvPZpsCo/k7FvApWJo6qsgXU
oLTsq2P7h7C7QZvA5qqfiB2el+vEfiHOipIvsjXxfhbGMlokT6bWWpImy6dmyuRt
zJ1ORruRIkBPAOiPmPtXPGJ3wfp37br2W2Jb72gbse4/a4WIFK9rTbUgzqf2aMlm
YfTrIxgIgO70EPlFJrYxC1+x41J4Lb7IdYa6wZnDrqD/uI2OEcoax7ydP8rItqtf
x9nf6jQ2DY+CUwQLTr2FYm7+mHmwSPOsIOT1xFBMtzl//tQ05F8Z4ApOcD8WZgdC
SQsGv5MW8wbr1KS5GYPQ
=NnHq
-----END PGP SIGNATURE-----

--74ziiz3zjxjyeuey--
