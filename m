From: Albrecht =?iso-8859-1?b?RHJl3w==?= <albrecht.dress-KvP5wT2u2U0@public.gmane.org>
Subject: Re: [PATCHv2 1/3] mpc52xx/wdt: OF property to enable the WDT on boot
Date: Thu, 12 Nov 2009 21:33:19 +0100
Message-ID: <1258058006.2192.0@antares>
References: <fa686aa40911121106j1d609868vb16d6867955aa607@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0612980491900626699=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <fa686aa40911121106j1d609868vb16d6867955aa607-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(from grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org on Thu Nov 12 20:06:03 2009)
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Linux PPC Development <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Devicetree Discussions <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============0612980491900626699==
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=PGP-SHA1; boundary="=-uYlxlcf/JSjU/d7LWO/D"

--=-uYlxlcf/JSjU/d7LWO/D
Content-Type: text/plain; charset=UTF-8; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Grant!

Am 12.11.09 20:06 schrieb(en) Grant Likely:
> > +The watchdog will respect the CONFIG_WATCHDOG_NOWAYOUT option.
>=20
> I think it would be better to use a device tree property to enable up
> NOWAYOUT.  The static config isn't multiplatform-friendly.  Thoughts?

I fully agree with you that this property would fit perfectly in the device=
 tree.  However, if we now add it *only* for the 52xx, but not for other de=
vice tree-aware platforms, this might be somewhat confusing.  The good thin=
g is that it wouldn't break =20
anything for the 5200 as the old wdt driver didn't work anyway.

One *real* advantage of the compile-time option is that it actually removes=
 the code which stops the wdt.  I'm not a real expert in that, but if we ar=
gue that the system is "safe" as required by IEC/EN 61508 part 3, it's prob=
ably beneficial if we can show =20
that there *is* no code to stop the wdt, not a snipplet only disabled by a =
flag.

Just my =E2=82=AC0.01, though - maybe more insight from the WDT gurus?

Cheers, Albrecht.

--=-uYlxlcf/JSjU/d7LWO/D
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iD8DBQBK/HEWn/9unNAn/9ERAmTnAKCUVjZhNQKzMmzUTcZIkVSlToMDmwCePG5E
3rrjOPalLiJZyLXqTeTZAf0=
=5Acg
-----END PGP SIGNATURE-----

--=-uYlxlcf/JSjU/d7LWO/D--

--===============0612980491900626699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0612980491900626699==--
