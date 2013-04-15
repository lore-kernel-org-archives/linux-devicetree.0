From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 10/10] fdtdump: add a debug mode
Date: Tue, 16 Apr 2013 09:53:57 +1000
Message-ID: <20130415235357.GR16400@truffula.fritz.box>
References: <1365618555-5893-1-git-send-email-vapier@gentoo.org>
 <1365618555-5893-11-git-send-email-vapier@gentoo.org>
 <20130415051206.GK16400@truffula.fritz.box>
 <201304151935.56128.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1080125396134343639=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201304151935.56128.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
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
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============1080125396134343639==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Hnpg0BSo5EvPlUVi"
Content-Disposition: inline


--Hnpg0BSo5EvPlUVi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2013 at 07:35:55PM -0400, Mike Frysinger wrote:
> On Monday 15 April 2013 01:12:06 David Gibson wrote:
> > On Wed, Apr 10, 2013 at 02:29:15PM -0400, Mike Frysinger wrote:
> > > -static void dump_blob(void *blob)
> > > +static const char *tagname(uint32_t tag)
> > >  {
> > > +	static const char * const names[] =3D {
> > > +#define TN(t) [t] #t
> > > +		TN(FDT_BEGIN_NODE),
> > > +		TN(FDT_END_NODE),
> > > +		TN(FDT_PROP),
> > > +		TN(FDT_NOP),
> > > +		TN(FDT_END),
> > > +#undef TN
> > > +	};
> > > +	if (tag < ARRAY_SIZE(names))
> > > +		if (names[tag])
> > > +			return names[tag];
> > > +	return "???";
> >=20
> > Better to return NULL here, I think.  That way a caller can easily
> > check and print the numeric value instead.
> >=20
> > Or you could construct a string with the number.  It would leak
> > memory, obviously, but in a short-run program like this, it doesn't
> > really matter.
>=20
> if this were a general func (like in util.c or something), i'd agree with=
 you. =20
> but the only consumer also prints out the #, so it'd be redundant:
>         dprintf("%04zx: tag: 0x%08x (%s)\n",
>                 (uintptr_t)p - blob_off - 4, tag, tagname(tag));
>=20
> the output looks like:
> 	// 350c: tag: 0x00000003 (FDT_PROP)
>=20
> if it was an unknown value, it'd look like:
> 	// 350c: tag: 0x0000a123 (???)

Ah, good point, fair enough.

> > > +#define dprintf(fmt, args...) \
> > > +	do { if (debug) printf("// " fmt, ## args); } while (0)
> >=20
> > I'd prefer a different function (well, macro) name.  I tend to use
> > "dprintf" for debug print functions in the sense of debugging for the
> > program they're in, whereas in this case it's for the debug mode which
> > is (primarily) for debugging other programs.
>=20
> dumpf() ?

Not great, but nothing better springs to mind, so yeah, that'll do.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Hnpg0BSo5EvPlUVi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlFskxUACgkQaILKxv3ab8Y2cACeObM6X/C2PLV66R0DsmXJk9il
vk4AnjfbJG4NEyW/vEgi4Y/+dE7qMqJG
=3ciU
-----END PGP SIGNATURE-----

--Hnpg0BSo5EvPlUVi--

--===============1080125396134343639==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1080125396134343639==--
