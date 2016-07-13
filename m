From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 13/15] ARM: dts: sun8i: Add dt node for rtl8703as wifi
 chip on ga10h
Date: Wed, 13 Jul 2016 09:18:44 +0200
Message-ID: <20160713071844.GB4761@lukather>
References: <1467993956-19535-1-git-send-email-hdegoede@redhat.com>
 <1467993956-19535-14-git-send-email-hdegoede@redhat.com>
 <20160711063909.GA4589@lukather>
 <f5f0a0d0-96a8-e9ad-7b4d-b8f19999f0e9@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oLBj+sq0vYjzfsbl"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <f5f0a0d0-96a8-e9ad-7b4d-b8f19999f0e9-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--oLBj+sq0vYjzfsbl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 11, 2016 at 02:36:43PM +0200, Hans de Goede wrote:
> >>+&mmc1 {
> >>+	pinctrl-names =3D "default";
> >>+	pinctrl-0 =3D <&mmc1_pins_a>;
> >>+	vmmc-supply =3D <&reg_dldo1>;
> >>+	bus-width =3D <4>;
> >>+	non-removable;
> >>+	status =3D "okay";
> >>+
> >>+	rtl8703as: sdio_wifi@1 {
> >
> >Shouldn't that need a compatible ?
>=20
> There is no upstream driver yet, so no devicetree binding for the specific
> wifi chip used. But all we really need is to follow generic sdio / network
> bindings:
>=20
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Docu=
mentation/devicetree/bindings/mmc/mmc-card.txt
>=20
> Describes how to create a mmc-host child-node describing an (e)mmc-card or
> sdio-function, in this case we are adding a node for sdio-function 1,
> hence the reg =3D <1>; in the child-node.

Both that file and
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Docume=
ntation/devicetree/bindings/mmc/mmc.txt
list the compatible property as mandatory.

>=20
> Linux implementation wise, this will make the mmc core set the dev->of_no=
de
> ptr to this node for the struct device it passes into the sdio-drivers
> probe function.
>=20
> And u-boot will add a local-mac-address property as documented here:
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Docu=
mentation/devicetree/bindings/net/ethernet.txt
>=20
> to the node pointed to by ethernet%d aliases.
>=20
> To actually make use of this I've modified the out of tree driver to check
> for the "local-mac-address" property:
>=20
> https://github.com/jwrdegoede/rtl8723bs/commit/be5e87ea71677120ede4572132=
08902ed9942653
>=20
> So that each device actually gets a unique address rather then the
> (stupid) behavior of the out of tree driver to set the same fixes
> mac address on every device which does not have a mac address in
> eeprom / nvram.
>=20
> Since this follows the existing ethernet bindings standard I
> believe the dts bits can go upstream as is, but since there
> is no upstream-able driver yet, I do not believe that making up
> a compatible string to add to the child-node is a good idea.
>=20
> More-over on q8 tablets we will want to do the same (again for
> eeprom / nvram less boards) but without pinning ourselves to
> a specific sdio-wifi module / compatible, instead relying on
> sdio enumeration to figure out which sdio-wifi module is present.

Feel free to raise that issue to the DT maintainers. But this patch
breaks the existing bindings, so it cannot be merged as is.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--oLBj+sq0vYjzfsbl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXhetUAAoJEBx+YmzsjxAgRMoP/jenNGhs5UZGLXwuWEn38HuO
ns3LZWUuP9KBKcxJTUijGgDiD0cikJV9CQoOefFJg7iiDPriO8FDqG7iKcudp5Hl
nBaSHJ1yukUZazCJgienPSp1n981KS7204Xz48CyMWmRCojVFKnhtWFxXCeg7jei
A612S+xW0thNLZEdvBlVr0nbfq1djOgCx41fyq6FH0oQtiJqVqk5KJ1M/7YnzIAr
589T87cY9Ntcz2qvNF18fxWDKY/+FQzwr2XBRf4Lqh8PSmBsCR+Q2mBUyDA/j/I7
z2QflEmjppSssg9Vv8M1RyBR1W297vN0fvMy06obFzzQ2v6iqopajPDPsKuWRI6V
cIwlx5sP0A7KFPPHj9eCD2TzOScxgPjK9Z8sJhOIKgKn3rUNPS7xphWVryMPJ87A
rGkloRK5Y8Ku86Cl+JZBSG58+vbMLD7bwLVkf+QB+hpGLtJtQqTibbF9yRkCX+NC
j52GzUSHiVPaev0avdqYSK4HOu/BluVDPizsvUuEMK4LvfRwrqG90E6jG8If99Hb
rcJ/U/I1G3Fv9ubmflb0jUeA7h7lV9TUqS/FF8sMYKI4iCNgB1V948r1IXOYboNa
VgzgeHgCtmKI4qraT950CgLVf+OFK/xsiqAfRpxUoco3kfA/t8sNf4JdDRiHcD+j
J6U9h+6DKibeKGeIK7I5
=/GYt
-----END PGP SIGNATURE-----

--oLBj+sq0vYjzfsbl--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
