From: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH RFC 5/5] dt-bindings: gnss: add lna-supply property
Date: Sun, 9 Dec 2018 20:11:34 +0100
Message-ID: <20181209201134.52c16a71@aktux>
References: <20181118215801.12280-1-andreas@kemnade.info>
        <20181118215801.12280-6-andreas@kemnade.info>
        <20181205150939.GI15689@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/3qDgqbcb4MN5ObIRVUBdrTh"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181205150939.GI15689@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
List-Id: devicetree@vger.kernel.org

--Sig_/3qDgqbcb4MN5ObIRVUBdrTh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 5 Dec 2018 16:09:39 +0100
Johan Hovold <johan@kernel.org> wrote:

> On Sun, Nov 18, 2018 at 10:58:01PM +0100, Andreas Kemnade wrote:
> > Add lna-supply property.
> >=20
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > ---
> >  Documentation/devicetree/bindings/gnss/sirfstar.txt | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/gnss/sirfstar.txt b/Docu=
mentation/devicetree/bindings/gnss/sirfstar.txt
> > index 1be7597ae884..9614774d14bc 100644
> > --- a/Documentation/devicetree/bindings/gnss/sirfstar.txt
> > +++ b/Documentation/devicetree/bindings/gnss/sirfstar.txt
> > @@ -30,6 +30,7 @@ Optional properties:
> >  - sirf,wakeup-gpios	: GPIO used to determine device power state
> >  			  (pin name: RFPWRUP, WAKEUP)
> >  - timepulse-gpios	: Time pulse GPIO (pin name: 1PPS, TM)
> > +- lna-supply		: Separate supply for a LNA =20
>=20
> "Supply for external LNA"?
>=20
"External" might be misleading:
- not part of the gps chip itself: yes
- but might also be inside of the device.

In case of the GTA04 this includes power supply for an antenna switch
(operates by plug detection) + internal or external antenna.

Regards,
Andreas

--Sig_/3qDgqbcb4MN5ObIRVUBdrTh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE7sDbhY5mwNpwYgrAfb1qx03ikyQFAlwNaOYACgkQfb1qx03i
kyRcmhAAuC7k3S9ti4oqnnu8eO00xAeL9wp66vofIRmQbMb6ONYcoJkMQRuPw1Nn
6F0mCiLwSKqWOMoST/Wk2MFiwTjhwQK4ZBjm5S+VHhIBhVAL17fU/wIluiwM/+1R
4RDJdFL7Qhy7f2lofdlbe2UpQzp2cxXVDHkzK/BYGBuXZM8qRMm4hikYRIUqqsxo
1Z13LhaYtsq4mbwMJh/AFvQBN6/3mcBXQ1fgNRJR9dyXQTtlSWTco0Uhs1dskwOQ
CKaA8vAKzM+THL3y4+N43AZIN4LPDqKESkHTRbHZ84OCHbkJiqWn7SBh9S++OR9h
NKXe5WVmjeLoxcEpCqV5V3j2EQyDTaP3PwEN/sO56pboiG1OKtFs5bycxT2ih+8i
LIk1zPxdcQ1s2aM/RckBznkUDdL2OvT79r1y/Dc35VAfK2qxG6H60OdUbdNvP4WO
9cbyMuNmX4NLQmFAPbPOpO9o/3MxSYWA0SmxodIpVM0/bVgzMla98cJi/gkICxQ/
mez8wvDeFUAkMdN7Nv/0WM2+TsqM7ry4FtONoE9rYMzZDyaQA09jjQ//VqknrsJL
QCZJQ/SKdFDdmZ4+6KLPPBYls1WtF6Bbo55ULtGvleeKFhxiUGHChWsOSRoZAUbP
eSfPITAojXKS8GnbwEVFv0lyshLIcXDMKiZnfJwk21lAN5Ssh6E=
=Wbat
-----END PGP SIGNATURE-----

--Sig_/3qDgqbcb4MN5ObIRVUBdrTh--
