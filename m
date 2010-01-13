From: Michael Ellerman <michael-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [PATCH] of/flattree: use callback to setup initrd from /chosen
Date: Wed, 13 Jan 2010 22:03:42 +1100
Message-ID: <1263380622.3378.6.camel@concordia>
References: <1261474791.289871.854376051633.1.gpush@pororo>
	<1261478868.10767.2.camel@concordia>
	<200912221854.37572.jeremy.kerr@canonical.com>
	<1261487856.10767.128.camel@concordia>
	<fa686aa41001122243v31e25e9et5db40b4f7ea8a56f@mail.gmail.com>
Reply-To: michael-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8388621828771309298=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <fa686aa41001122243v31e25e9et5db40b4f7ea8a56f-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============8388621828771309298==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-G5XRvwZJPwBX0IhRML4f"


--=-G5XRvwZJPwBX0IhRML4f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2010-01-12 at 23:43 -0700, Grant Likely wrote:
> On Tue, Dec 22, 2009 at 6:17 AM, Michael Ellerman
> <michael-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org> wrote:
> > On Tue, 2009-12-22 at 18:54 +0800, Jeremy Kerr wrote:
> >> Hi Michael,
> >>
> >> > >  void early_init_dt_setup_initrd_arch(unsigned long start,
> >> > >                                 unsigned long end);
> >> >
> >> > arch_early_init_dt_setup_initrd() makes more sense to me, but ..
> >>
> >> <foo>_arch has been the general convention for arch-specific hooks in
> >> drivers/of/.
> >
> > Yuck, doh, guess I should have read those patches before they went in :=
)
>=20
> It's not necessarily permanent.  My first goal is to get the common
> code merged.  Then I want to look closely at it for patterns and
> refactor how the common code calls out to arch specific hooks (or
> maybe turn it around and have arch code calling out to the common
> bits).

Sure, no biggy. There is lots of precedent for arch hooks to be called
arch_foo() or topic_arch_foo(), but it's not the end of the world.

cheers



--=-G5XRvwZJPwBX0IhRML4f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAktNqIYACgkQdSjSd0sB4dLvZACgzK9+iLOC/pomCcO+Bbmu6IwD
X5QAoLD7Q/a3ukEAmE5eUuTGwcDfcfKr
=Pc6/
-----END PGP SIGNATURE-----

--=-G5XRvwZJPwBX0IhRML4f--


--===============8388621828771309298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============8388621828771309298==--
