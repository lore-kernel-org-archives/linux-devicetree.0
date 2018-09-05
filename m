From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/3] dt-bindings: change the A64 HDMI PHY
 binding to R40
Date: Wed, 5 Sep 2018 16:39:32 +0200
Message-ID: <20180905143932.lbytjftmobjtzdsu@flea>
References: <20180903133434.58188-1-icenowy@aosc.io>
 <20180903133434.58188-2-icenowy@aosc.io>
 <20180905071435.lgsogpzmh5nw6bcy@flea>
 <3D28A45F-D67D-4388-9FB7-2A2763955398@aosc.io>
 <20180905075601.32kzkd3is2gpa3ft@flea>
 <1CE38B34-005F-4E49-B9B5-48EDFA56EFE5@aosc.io>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6gnyepzpdeoujvh6"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBMGVX7OAKGQEC22H7UQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1CE38B34-005F-4E49-B9B5-48EDFA56EFE5-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--6gnyepzpdeoujvh6
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 05, 2018 at 04:05:18PM +0800, Icenowy Zheng wrote:
>=20
>=20
> =E4=BA=8E 2018=E5=B9=B49=E6=9C=885=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=883=
:56:01, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> =E5=86=99=E5=88=B0:
> >On Wed, Sep 05, 2018 at 03:46:41PM +0800, Icenowy Zheng wrote:
> >>=20
> >>=20
> >> =E4=BA=8E 2018=E5=B9=B49=E6=9C=885=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=
=883:14:35, Maxime Ripard
> ><maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> =E5=86=99=E5=88=B0:
> >> >On Mon, Sep 03, 2018 at 09:34:32PM +0800, Icenowy Zheng wrote:
> >> >> By experiment, the A64 HDMi PHY doesn't support the PLL-VIDEO mux
> >> >> introduced in R40, although it has two PLL-VIDEOs.
> >> >>=20
> >> >> Change the A64 HDMI PHY binding to R40 one.
> >> >>=20
> >> >> This binding is introduced in v4.19, which is still in RC stage,
> >so
> >> >we
> >> >> have change to fix it.
> >> >>=20
> >> >> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> >> >
> >> >That doesn't make much sense. The A64 doesn't have any particular
> >> >reason to behave like the R40, and the R40 can definitely use a
> >> >different compatible if it has a different behaviour. But I don't
> >see
> >> >*why* the A64 not behaving like the R40 is a justification to remove
> >> >the A64 compatible. Especially when the R40 was released later.
> >> >
> >> >Add a new compatible, and leave the A64 compatible alone.
> >>=20
> >> But the behavior of A64 compatible will change from double
> >> PLL to single PLL, because the A64 HDMI PHY is proven
> >> to have no double PLL.
> >>=20
> >> Should I then change the A64 compatible behavior and import R40
> >> compatible at the same time?
> >
> >I don't see why you should do both at the same time. Fix the A64, and
> >add the support for the R40, those are two orthogonal changes.
>=20
> Then how to deal with double PLL support? Make them temporarily
> dead during 4.19?

Well, if the PHY doesn't use two PLL, don't use it, ever. Why does it
have to be temporary?

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--6gnyepzpdeoujvh6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAluP6qMACgkQ0rTAlCFN
r3SO+Q/+JI6BwCnKyImFVIb5OvNNBW/n41sBO4VohMeGozJZm9cVbn2acA5UJ4uF
26AJTiB75J0wgDpvPtYponwyxlUnoo5CPRmaJyj/4Q8W825gMZ+0ZTWjzsWJTM0B
9Dl8la7r5HulmUSvGfrQarFbfxERVHxMjmCStHjFM6jLvyMx6cS4/0WMbTqDX9bp
Rw0ogYCohlSRXgRNolzIRc/7eEIRgnvIwoBYLrVfwRm8J11xlibWSdgFCWhJckb/
VOl9VjstWCCS99++Hm3XBPysp/mSDMHC76itheWzICqYRCAAdsuydADttyYElpW4
gBCNf875cAlusnhsmSVu8c6ZnszffzXvtk7RIftJsFOS7nVX5eUTyBhRVZBGMnkx
xzusuIFz4M+d2wEP++vnhPi3IOgB+vAudfy1RLGdV6kyad8h/pG08GBSwBIaD5se
RVpnPsiuUrOkRs4UFUHV/k3TSTytN/qLXNQ5htd7+6REfRiydtgQ6S84MMhFtZWb
hClYSlJGNbUaFH8gndTky/DnoFZjtqAgnPFb9q1PWlMGF4SeauYrd7oQqRIDgQin
M8kErYpfVh0bOKpsAShEsfMgopzqGL3vqMiA3GlpSNMCsZbvV+e/bA34G9Szf+5c
X/081AM3Z4qJsHBmnCsrRjl+ZR90wzA6F+PRbGvpkm3dgKH22SQ=
=giSw
-----END PGP SIGNATURE-----

--6gnyepzpdeoujvh6--
