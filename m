From: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/4] lis3lv02d: update DT binding for use with Nokia N900
Date: Wed, 8 Jan 2014 12:17:04 +0100
Message-ID: <20140108111703.GA22852@earth.universe>
References: <1386968094-24554-1-git-send-email-sre@debian.org>
 <52AB8ACB.6000101@tremplin-utc.net>
 <20131213225920.GA20534@earth.universe>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131213225920.GA20534-SfvFxonMDyemK9LvCR3Hrw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: =?iso-8859-1?Q?=C9ric?= Piel <eric.piel-VkQ1JFuSMpfAbQlEx87xDw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, arnd-r2nGTMty4D4@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Dec 13, 2013 at 11:59:20PM +0100, Sebastian Reichel wrote:
> >  * Who wants to carry these patches? Can they all go via the
> > devicetree branch? Or maybe Arnd or Greg would prefer to pick them
> > via the misc driver branch? Both ways are fine for me...
>=20
> I don't care, but it would be nice to see this in 3.14.

mh looks like nobody feels responsible.

I think the first patch should normally go through Grant's tree,
whom I forgot to Cc in the patchset (sorry).

The patches 3-4 can go the same way as the other updates for the
driver, but should be merged after Grant's tree.

-- Sebastian

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBCAAGBQJSzTOvAAoJENju1/PIO/qacggP/2J6Tj9DjHfBA6y99SsZyHAD
dMFEFhFziVXhGUHxEAvojuNyNE2EPG2pAmVeFvQ2nKod7wyYrHE/h4jWP5jal1kc
xA0Gz+9V8aEzKMgCwJStdV3/BGemmRe/3Vme4wJCEBOE6q4dEqTlXMnALzii4r7I
TAMkxEZTEPzkIaFMY81U1maCLrmh2zV+SHgF2CzI/gK/sQb+P0DLas62kQRmsYZw
U1ch6vcBFMMUvZjLyo9gKdqPdl0UcWNUQnbt/2oXj/GeM0HsC0tVGzspq0Al8C5s
Zwf4PL3VW2pm4TKwkvYfws7uQ5tq8S8rwktNLmuJ5MHH8BAoItW7ukvbBqkzOR0U
gesMjT6J3mmxQ8DMtm8LVlTw3YmnR5d+1ZBjEw0mKUVEnVsDDbpWD3Tf02kL/nL/
a8WeSVyQuNm8ibAVVA77oVsOvQ82ED/B76AQyIRBEjOmjnjq4Wnu71s60PoypQFq
xiVzIQ5pNmONxUvkANoPsoTfghXE5YHYkQIrPhXk8lfvvrjbtbfwHZeLj6L9CUIh
yFNq6WUhOD2Qt+jJS625FFDcMmKQwymE2Ih94RwycWMm962PW5qkFCBoem/9U4FX
7OfX2EHQqbCksL73V2ut8kURAl5S/Z/2OZ7qXO46iOz3ilb5fRRdOeINoYUy6HoH
jaPUmflR0BpbIzOOp22x
=XJMU
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
