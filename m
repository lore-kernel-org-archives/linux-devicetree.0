From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 10/10] fdtdump: add a debug mode
Date: Mon, 15 Apr 2013 19:35:55 -0400
Message-ID: <201304151935.56128.vapier@gentoo.org>
References: <1365618555-5893-1-git-send-email-vapier@gentoo.org>
 <1365618555-5893-11-git-send-email-vapier@gentoo.org>
 <20130415051206.GK16400@truffula.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1863218713296436614=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130415051206.GK16400-W9XWwYn+TF0XU02nzanrWNbf9cGiqdzd@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============1863218713296436614==
Content-Type: multipart/signed;
  boundary="nextPart1822085.Jj4IEDzhGA";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1822085.Jj4IEDzhGA
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Monday 15 April 2013 01:12:06 David Gibson wrote:
> On Wed, Apr 10, 2013 at 02:29:15PM -0400, Mike Frysinger wrote:
> > -static void dump_blob(void *blob)
> > +static const char *tagname(uint32_t tag)
> >  {
> > +	static const char * const names[] =3D {
> > +#define TN(t) [t] #t
> > +		TN(FDT_BEGIN_NODE),
> > +		TN(FDT_END_NODE),
> > +		TN(FDT_PROP),
> > +		TN(FDT_NOP),
> > +		TN(FDT_END),
> > +#undef TN
> > +	};
> > +	if (tag < ARRAY_SIZE(names))
> > +		if (names[tag])
> > +			return names[tag];
> > +	return "???";
>=20
> Better to return NULL here, I think.  That way a caller can easily
> check and print the numeric value instead.
>=20
> Or you could construct a string with the number.  It would leak
> memory, obviously, but in a short-run program like this, it doesn't
> really matter.

if this were a general func (like in util.c or something), i'd agree with y=
ou. =20
but the only consumer also prints out the #, so it'd be redundant:
        dprintf("%04zx: tag: 0x%08x (%s)\n",
                (uintptr_t)p - blob_off - 4, tag, tagname(tag));

the output looks like:
	// 350c: tag: 0x00000003 (FDT_PROP)

if it was an unknown value, it'd look like:
	// 350c: tag: 0x0000a123 (???)

> > +#define dprintf(fmt, args...) \
> > +	do { if (debug) printf("// " fmt, ## args); } while (0)
>=20
> I'd prefer a different function (well, macro) name.  I tend to use
> "dprintf" for debug print functions in the sense of debugging for the
> program they're in, whereas in this case it's for the debug mode which
> is (primarily) for debugging other programs.

dumpf() ?
=2Dmike

--nextPart1822085.Jj4IEDzhGA
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRbI7bAAoJEEFjO5/oN/WB0YAP/1d+926H8u6zJDIW7qCO1orx
7dvLY5d+7V8hH2q8kzVLoCM1eSpBftSICcTEXJI19fan4XUrw1xP0UAeQ/D/u8cY
GqfmTZtmvJS4AoCCxP+oBW2qQlSxusvQ+SzbKc7xq9GHLSnSEsTQa/kmNkq5ieOU
KOVHFUVeBw/Aqhb8eML2fHHxpyhj/k8pUj20D0hdWtIEbRrIcMaUvkTvzo0r4VVB
0G0PzPENbGNH7ZYuszVUMgo5rYJL77/dUSf4E9rvM6+oqM0sDW4KC515UPEpBvX7
4llzTT6D9jchqPiW+dFmvBmpasODCKYcQnwMUzl7BNNykgEdY4LMz3qcxvW3y/PZ
+JrhA1UmXVax3ABRBzVA2O/3JmrJJ5jtY9/7T28UuYSHwQk+QPSalYSgs7JVCfp8
qw3ZBy6rHzjnm6zHtBGCfmHp+kzVc0w2p5YT1PtbyZbUKBODIT86J4S/ZKxniDLS
O/51nc4mKEekCCo2FE1+N+zQXLBfuSsmlpT5kMKLBj5Yu0Mv7KMAsOlyqNPNNKXR
91/SFTssde5SUanry0HW/SyeaqtkLFxzjd9XuuEjMbRRRq8/at365c9zYRwMggHY
xYSKCbPJ9OkyZS33NaJxOBNrbE3U+eLmhRAxpcio2A+3mHigDHdnEkf0585r774A
afmasMwAkj5gThhF8RMZ
=eBpB
-----END PGP SIGNATURE-----

--nextPart1822085.Jj4IEDzhGA--

--===============1863218713296436614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1863218713296436614==--
