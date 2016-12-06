From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: sun8i: Specify memblock for Nano Pi M1
Date: Tue, 6 Dec 2016 15:00:25 +0100
Message-ID: <20161206140025.hnlhnsouvohxweou@lukather>
References: <20161205020032.26586-1-woogyom.kim@gmail.com>
 <20161205080932.xaqyl2httgxgso67@lukather>
 <9607940c-1ca9-bb49-291e-ddc7e77546be@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lkgyj4vfe2e2aqdc"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <9607940c-1ca9-bb49-291e-ddc7e77546be-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Milo Kim <woogyom.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--lkgyj4vfe2e2aqdc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 06, 2016 at 04:23:57PM +0900, Milo Kim wrote:
> On 12/05/2016 05:09 PM, Maxime Ripard wrote:
> > On Mon, Dec 05, 2016 at 11:00:31AM +0900, Milo Kim wrote:
> > > The board has DDR3 512MB. This patch helps scanning the memory and
> > > adding memblock through the DT.
> > >=20
> > > Signed-off-by: Milo Kim <woogyom.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > ---
> > >  arch/arm/boot/dts/sun8i-h3-nanopi-m1.dts | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >=20
> > > diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi-m1.dts b/arch/arm/boot=
/dts/sun8i-h3-nanopi-m1.dts
> > > index ec63d10..be3668f 100644
> > > --- a/arch/arm/boot/dts/sun8i-h3-nanopi-m1.dts
> > > +++ b/arch/arm/boot/dts/sun8i-h3-nanopi-m1.dts
> > > @@ -45,6 +45,11 @@
> > >  / {
> > >  	model =3D "FriendlyArm NanoPi M1";
> > >  	compatible =3D "friendlyarm,nanopi-m1", "allwinner,sun8i-h3";
> > > +
> > > +	memory@40000000 {
> > > +		device_type =3D "memory";
> > > +		reg =3D <0x40000000 0x20000000>;
> > > +	};
> >=20
> > U-boot will fill that up, so there's no need to put it there.
>=20
> Right, my intention was adding memblock through the DT whether the bootlo=
ad
> does or not. However I'm not sure the situation (missing memblock in u-bo=
ot)
> could really happen.

No, we need a recent U-Boot in order to boot, and such a uboot will
setup the memory node anyway.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--lkgyj4vfe2e2aqdc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYRsR0AAoJEBx+YmzsjxAguJwQALdBEeHJTDaZOoOX14IVma0D
ryJjObY9e0YA0LDFpEBpzOPlFd6TXTSmdZO/EGoAPKbE5AP0VNzq+p8p2Eku77zT
kYkwyuRKObqMatyhGltsCQdkGb+L+GZl/JP1OdOWAs4JmJgh2dzn6SaZNXPkO4/2
RFU/i9qXpTiBAcMMJgJmTEJxjJGBCkAmRcddg2bzkyl+xK7Q6TldS5GJMs9KBmSF
djfDtAnpnA76wfrfXesS2nmLaK79AKxnCsSIxDa5sVsc8ykWH3EiSlB0sX8B10Fq
ZfyE9+k1sja4r0YIbpBfLjp1TZGeVuE4p4WqyLVanhmO2vievoPie0b+Ps0lFSG7
r7BsfZTEPV9BBIu+ZDXoNmstdezaHaBMurPd73mjpeT6nDluhFXAkpGQJnBN1B27
I7CwxZSeHudJs8T97xBIdkHYiUGa1Y4OSk3eY1cj8s5F6fx+0JkdR+q0R4PTo7KQ
T0r09rzgFU9Nlk404qWmrrcAzucohW/tWLdNaQ5W8+NZY6uEE6+Mjfkrit9PLvH4
6KKMyNmQNl6B0AjRmD2QIDylyIylfMxVuWmQXqlq/Mt+EtIZgJLOsoOwBiWtP/Hl
qMgv4j289JMhTQxqJiESLWxvypY5iNT9ernPtmDBqaj6breACt8PhLJCYU0yvJCU
33rne9AVZTQeaASUxfwh
=2tgt
-----END PGP SIGNATURE-----

--lkgyj4vfe2e2aqdc--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
