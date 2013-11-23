From: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] iio:light:tsl2563: Add DT support
Date: Sat, 23 Nov 2013 13:06:06 +0100
Message-ID: <20131123120606.GA21861@earth.universe>
References: <1382565063-17083-1-git-send-email-sre@debian.org>
 <20131025191028.8C140C40422@trevor.secretlab.ca>
 <20131025230906.GB8657@earth.universe>
 <52909685.6040606@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52909685.6040606-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Bill Pemberton <wfp5p-4Ng6DfrEGID2fBVCVOL8/A@public.gmane.org>, Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 23, 2013 at 11:50:29AM +0000, Jonathan Cameron wrote:
> On 10/26/13 00:09, Sebastian Reichel wrote:
> > Hi Grant,
> >=20
> > On Fri, Oct 25, 2013 at 08:10:28PM +0100, Grant Likely wrote:
> >>> +  - cover-comp-gain : integer used as multiplier for gain +         =
             compensation (default =3D 1)
> >>=20
> >> Should be taos,cover-comp-gain
> >=20
> > Has been updated to "amstaos,cover-comp-gain" in the latest patches, se=
e https://lkml.org/lkml/2013/10/25/59
> >=20
> >> Otherwise looks fine to me.
> >=20
> > Is this an acked-by?
> It's good enough for me to take the patch  :)
> >=20
> >>> +	else if (np) +		of_property_read_u32_index(np, "cover-comp-gain", 0=
, +							&chip->cover_comp_gain);
> >>=20
> >> of_property_read_u32() should be sufficient. You don't need the _index=
 variant.
> >=20
> > ah, I missed the function when skipping over linux/of.h. I will sent an=
other update.
>
> Did you do this? Latest I seem to have is V3 and that doesn't have
> this change.

Sorry, I forgot, that I still had work to do for this patch :(

> I've made the obvious change to your V3 and applied it.

Thanks for taking care of it.

-- Sebastian

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBCAAGBQJSkJouAAoJENju1/PIO/qa9J4P/iOU2SZH78u/hdaMUWsANdPU
eXexPX7duUQAMn3Uxfi91k7Rgtob7VAJ9CZF2josPHqFak0moky4WRpydlqj55XH
tJFIFlXPfZPvTNdkWpJFNOFX438Hz9wcrZuzfUKwXrUANRp9gzS4f4T35yrsFro2
EzOTjHSFhn51l5YUL1/77fasRX2khAXb+jW458uvL7LCKRUhKXTQwd773Q43zyTQ
7OMXnri4exJFj8YcHtKkDnxvbZFLqvM5Gh8zMfxQ8V4pmSuqZauyFVTEpBS3rW1A
8vOPJTvsB9V81vQdnjA+Me6TNGvDoaoPlrMqVjKnpdjuaqd57DgGS9jYcxloEUoL
xAOr+D5kkAAQUm9TS5ESaEU2mGf2XQZ/1FvK412kD2AT8C6pRLNaFRl4KIa2tkOe
sG/rkImVA6bMvp6qv+L7TiPexbL+x/d2RPxJNYY2rFtf7tqm/BGJFrAYvo5h/9bw
T/edFds+Y87KrLv1Vq3LRnuGiRma+cepiMqh8ooSfUFXNwLvWU8RE8HwZ78DWYO2
9d51kbZoVhQruJgXDmWv4H3+AA7e3tLRcXja5QinP4si4GXsSlaOb6qhrmXmD2Yp
DS4ct8GA1BM7eOs+wE699lsQvQzvGZFb+ZZUZ0xzlFJe6yaV9xNGMvQPcea2BZE3
W/bAkO7/9AbAao5A9gu8
=O9Sy
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--
