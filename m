From: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH v2 5/5] dt-bindings: gnss: add lna-supply property
Date: Thu, 10 Jan 2019 18:07:32 +0100
Message-ID: <20190110180732.75490757@kemnade.info>
References: <20181209195150.5192-1-andreas@kemnade.info>
        <20181209195150.5192-6-andreas@kemnade.info>
        <20190110122757.GB9725@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/kogTsdgB3P=GJqkn3Pu7N.f"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190110122757.GB9725@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
List-Id: devicetree@vger.kernel.org

--Sig_/kogTsdgB3P=GJqkn3Pu7N.f
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 10 Jan 2019 13:27:57 +0100
Johan Hovold <johan@kernel.org> wrote:

> On Sun, Dec 09, 2018 at 08:51:50PM +0100, Andreas Kemnade wrote:
> > Add lna-supply property.
> >=20
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > ---
> > Changes in v2:
> >  - reordering
> > Original order had a
> > Reviewed-by: Rob Herring <robh@kernel.org>
> >=20
> >  Documentation/devicetree/bindings/gnss/sirfstar.txt | 1 +
> >  1 file changed, 1 insertion(+) =20
>=20
> Ah, missed this one at first.
>=20
> But shouldn't this go into the generic binding since it isn't specific
> for sirf-star based receivers?

That idea was formulated with a question mark towards Rob.
And no reaction from Rob about that.

Regards,
Andreas

--Sig_/kogTsdgB3P=GJqkn3Pu7N.f
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE7sDbhY5mwNpwYgrAfb1qx03ikyQFAlw3e9QACgkQfb1qx03i
kyQJ8A//at4YsJK1yECSuQsCChA8HxdLQ/mCI4OESmDhNY2tEN1m36RPMh80SpXk
KVmtT+6NTnjn4xzw0jGPHVH1yaAN2/egT7UnyBpjsA5Xj/smLmKajQ2VTarMFs5x
5a4Q83f5NcDeVt03/0hnzbp7rdGp3BtHWiInBd8Fm18giY2BEFANnOLIyPMR1P/3
ZIf8uBnnJhM0vmrRklI6kvZLoAjnpOZPDXK6n7SLTKT7Io8WuavG9Im/xjm3no8o
/ko9aqE0wjf0fs/PDlYA8x59KVlLzd/2+0Bn6F0HN+kjYJomDgcmACMIvlj6bp39
8SDzzQWhU1nASmRaHKm1LnNabrla37N2Uaxa0DCwUhTyhuh5lcVHerNQQRTD1oX3
9mRcZIcJ4M+gKig287DgECHSpqWN3SIHSqSdnrze+BW2K8+/g1AbqJp4Z8HzGQSd
Gq4LbgImEgEHaekSY/CaqpE98Cs/LQVbeiAjqSyNoIhc8Tc7xOylQ01dN0C+F6dF
eOPF4Icxw226yzIk8mekzoxGrgA9kx+YVOjsiYEB643FFowggr3Doqg2LxGG3pnS
jAPclnnt6F7Xdy7G2ncrkQ2B/85G4D/K4kTVnTqmChLDopaV0H8BvGmVusudyIbp
zrNMeDaUjn1Q5/lWKWlZt/0gD3vDS18oUneu6CMqB99lhVSxJMQ=
=JKBw
-----END PGP SIGNATURE-----

--Sig_/kogTsdgB3P=GJqkn3Pu7N.f--
