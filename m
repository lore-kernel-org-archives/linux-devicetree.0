From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Elimination of of_platform_bus_type remains in devicetree/next
Date: Tue, 1 Mar 2011 10:47:45 +1100
Message-ID: <20110301104745.0b35f8be.sfr@canb.auug.org.au>
References: <AANLkTim6fuYhPLRjwt814RjxV4Yp-tv4LQ6DBhdgGiDP@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__1_Mar_2011_10_47_45_+1100_SXfQheGbo15/N.VA"
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <AANLkTim6fuYhPLRjwt814RjxV4Yp-tv4LQ6DBhdgGiDP@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-next <linux-next@vger.kernel.org>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
List-Id: devicetree@vger.kernel.org

--Signature=_Tue__1_Mar_2011_10_47_45_+1100_SXfQheGbo15/N.VA
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Grant,

On Mon, 28 Feb 2011 13:59:37 -0700 Grant Likely <grant.likely@secretlab.ca>=
 wrote:
>
> I've just pushed a big change out to my devicetree/next branch which
> removes most users of of_platform_driver.  This gets rid of almost all
> the remaining users.  ibmebus and macintosh are the last holdouts, but
> they're pretty isolated and don't use the ugly shim that was in
> drivers/of/platform.c.

Yeah, I saw all those patches - looked pretty good.

> This change very likely will break a few things.  I've done my best to
> test it over many configurations, but I make no guarantees.  I've also
> performed a test merge with linux-next, and am checking it for
> breakage now.  You might want to move devicetree/next to the back of
> the queue for your merge tonight (or whatever else you like to do to
> mitigate damage).  :)
>=20
> Let me know if it causes you any problems.

I will just use yesterday's tree if it breaks obviously.  Thanks for the
heads up.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__1_Mar_2011_10_47_45_+1100_SXfQheGbo15/N.VA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJNbDQhAAoJEDMEi1NhKgbs56gH/3WAl/pbySzaTGJ8fFyAZVD1
OGwGiwwjMOOkTc4TFW45OnGcGeosAyizhVz+bHYm4lbvYpBupo+7aAb7DMSUL/f8
tVZZ0ND4xqz0eg8blkv/x0gFkX4MB/plsg5MQWMb41N9b9vWhIgNGGqpMikYP1aO
D/kv9Ca+2vspWAlwYLBt5UQ1xyQs9KmbFZrB8kOeU+3jhe1BSWJpJzHuCaKnaIBX
rh88I0RkSkQ/LNjhNGHpQAPsZFhGQS3Pdla/S4ylX6l0MYKuJJIaY6zPeVsRQHn4
ej1uFedkg2UoYc8NfDarDAwXOC6T9n6TknsZAzQqpvYDod0uAbf71AHV7iy4+Qw=
=6Zye
-----END PGP SIGNATURE-----

--Signature=_Tue__1_Mar_2011_10_47_45_+1100_SXfQheGbo15/N.VA--
