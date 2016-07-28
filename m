From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: dts: sun8i: Extend Orange Pi PC dt to also
 handle the PC Plus
Date: Thu, 28 Jul 2016 20:17:57 +0200
Message-ID: <20160728181757.GD6682@lukather>
References: <1468095718-18515-1-git-send-email-hdegoede@redhat.com>
 <20160713084505.GE4761@lukather>
 <bce2b340-a930-8771-4560-dc61bf5828d5@redhat.com>
 <20160725064033.GA7419@lukather>
 <74d3b5eb-601a-cc1d-a44e-fea2895fd8b2@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8nsIa27JVQLqB7/C"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74d3b5eb-601a-cc1d-a44e-fea2895fd8b2-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--8nsIa27JVQLqB7/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Tue, Jul 26, 2016 at 11:07:23PM +0200, Hans de Goede wrote:
> >>>Nothing prevents you from including the orange pi pc dts, from the
> >>>orange pi plus dts.
> >>>
> >>>It prevents the duplication you were trying to avoid, and it doesn't
> >>>create all those spurious errors and devices.
> >>
> >>That would solve the copy paste problem on the kernel side, but that
> >>would still mean adding a new u-boot defconfig for this, which means th=
at
> >>all the distro's which ship with prebuild u-boot binaries need to build
> >>for yet another board, something which I would like to avoid.
> >
> >Still, registering devices that are not present on the board is not an
> >option.
>=20
> Ok, new version send.
>=20
> What about the other 3 patches in this series ?

I guess the same comment applies for patch 2.

I'll look at the two others.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--8nsIa27JVQLqB7/C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXmkxVAAoJEBx+YmzsjxAgSz0QAKWyZv64Sfar8W8y/n3Jvqi8
L1IfMW4cEVGPchmieg7FTlOF8dBEIDGI20NkHX/sDrHgChNIRk5Uqy3mtCGFOUuT
83k97sREMMh+dPg7bY+I3+xmu1d/eT1vSzXkUdMz56HSBWLy3SfmGeYX6titJGTD
CpbcVcUD3TgZrrcfmYVD4Pt8GqAoDc38s2Udbl/oR99wy5F/A0xLZGK0eOBjiQfS
m8fwmI5FnUA7+pvOAHAJAc6tgmiLCN6eHKnzzDMo+OFemMOlVUo9BiDk+SAahTut
DGub4zp0dH6KLuMznRUj00RBRFqRZplYJHEvZQ6a8z1zyk87yTCZDl81SufqZFpW
HZFEeDarMsUkvg0OdIiJCPEAbhxi6Typ2P+5nS7M5YnrI37dUskhnBE8snEqwW/F
WkasoFBhN7vJEmdtTXdJed26+EgP+b/mVa8h0TxYBTEWeYwTHiuijtenWaZKUibp
N0D496bSb8aXu9KvZc4pnf+nvXDW+RmADBAhQ7UObWfQT0pPDzoE8AdAuUxMkLeq
iOvi2R/WmKg0M1J56xiXup+wta6lXZhmHNecREEx6f9KyLWipLiTDAH8cVRyF80q
77IYoeFF/OQjhxPVvJ/0zrTS84qLZ7Opvt8JeqQHffx3dNnJbPK00uWtHKfq0XgV
z+IbD1nZeq6Scx1oSWxc
=vApe
-----END PGP SIGNATURE-----

--8nsIa27JVQLqB7/C--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
