From: Tom Rini <trini-l0cyMroinI0@public.gmane.org>
Subject: Re: [U-Boot] [PATCH v4 0/19] Allow images to work on sandbox
Date: Thu, 9 May 2013 15:36:47 -0400
Message-ID: <20130509193647.GR6931@bill-the-cat>
References: <1367943123-16013-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2748934426385484763=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1367943123-16013-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, u-boot-review-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Joe Hershberger <joe.hershberger-acOepvfBmUk@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============2748934426385484763==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1GSL5ZULXUIqbbH1"
Content-Disposition: inline


--1GSL5ZULXUIqbbH1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 07, 2013 at 09:11:44AM -0700, Simon Glass wrote:

> This series adjusts the image code to work with sandbox and prepares it f=
or
> verified boot to come later.
>=20
> The primary goal here is to get image loading to work on sandbox, which is
> mostly a set of fairly minor changes such as using map_sysmem() instead of
> just a cast when converting from a U-Boot address to a pointer. Since
> common/image.c runs to over 3000 lines and half of it is FIT-related code
> behind an #ifdef, this code is moved into a new image-fit.c file.
>=20
> Changes in v4:
> - Bring in upstream version of fdt_first/next_subnode()
> - Use new upstream fdt_first/next_subnode()

Everything looks fine to me, barring further comments I'll pick this up
around next Tuesday.

--=20
Tom

--1GSL5ZULXUIqbbH1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJRi/rPAAoJENk4IS6UOR1WvPsP/jsdyOBPCqXy18w4bu1BvrzJ
X3icyyK866JShnshUbdtIFA4CdMYqvOK3djG0HnRf3ElNCRDXuoyIYE7L1Qea1dP
ybZqkYd/khryp25kbg0ygeOJ4AeX1IzTwmuHxANFIIl3PqqG9Q4yuaNTUHoM6MNK
QsHn0mwKmmSh9tvJ6SApK+BecPlxO7ndU/Ht9TssJ6mXWXYigbPitn2DKKrIeBE9
ct5kNAYhYgLHCEgS0beP8ubLlFBB1zxHDEpAqadbf+dnvK6fuCsKrwXq6HWLrVup
qp0EDcGmzHJABIYyFKs17lbK2ynboMGWBNs74I1TNh62H0ah0vlH4iXn8/pSeICQ
2qUf6hWF8xga/vVD0XrO5gI98w+L/vnKubcQJ5guuzi/bSzQbgl1H2UNVHfcnW0W
lRpJdUI/PDg+LQY/2gdbDmfiSL6hqKoJVJSGiMfshJo3KuOcqQwZ79khezloaS6g
w0klHzW69kFRLwoO5vqsbre0q2tzd4EaIcUoIFKOs0HiGBmddokHq1vFdlvZGWHX
b7d9jEkLU8CJaOWMRsu5YscskfuzaFY9JGJtxPkNXJb81uCjcLFK1dDkA2/HtZSw
NrYMZw1vm/Jz2qrGUYL9AYwND8pOdkyk8o9SkkpzhkYLS1vX2YEB3DNhC3r+xRnR
UDANMWYTXfTB0ZT86ai2
=qvFO
-----END PGP SIGNATURE-----

--1GSL5ZULXUIqbbH1--

--===============2748934426385484763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2748934426385484763==--
