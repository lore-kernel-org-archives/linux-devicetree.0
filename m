From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: bootloader support for DTB on x86
Date: Tue, 10 Jul 2012 14:35:24 +0200
Message-ID: <20120710123524.GA6466@avionic-0098.mockup.avionic-design.de>
References: <20120522125622.GA21187@avionic-0098.mockup.avionic-design.de>
 <CAPnjgZ2OwarbF+=SZkXYgszhES94Y6=-9wq+BdNHuo+PrZsYWA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7636663626550010169=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAPnjgZ2OwarbF+=SZkXYgszhES94Y6=-9wq+BdNHuo+PrZsYWA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============7636663626550010169==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 10, 2012 at 02:27:26PM +0200, Simon Glass wrote:
> Hi,
>=20
> On Tue, May 22, 2012 at 2:56 PM, Thierry Reding <
> thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
>=20
> > Hi,
> >
> > I was looking at booting an x86-based platform using DT. However I wasn=
't
> > able to find a bootloader that supports this. There also doesn't seem to
> > be a
> > method to append the DTB to the zImage (which I wouldn't want to use
> > anyway).
> > Does anybody know of a bootloader that supports this?
> >
>=20
> Maybe U-Boot with a FIT image? Also, you should support having multiple
> device trees in the image and the boot loader selecting the correct one.
>=20
> I don't think we should rely on there being an initrd - what do we do if
> there isn't one?

I'm not sure if I can get U-Boot to run on this platform. It's Atom-
based and I don't think anybody's gotten that to work yet.

syslinux 4.06 should support loading of DTBs on x86.

Thierry

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJP/CGMAAoJEN0jrNd/PrOhZSEP/jdMznAtsptK6aCUIzM5QTWx
U0n/zYABhxRfDfL3LcWIQaDp3/qSfNlhjnrL5XlLv05jnwgJia0yNcvWYR8ICi34
qh+dVkMZrme7LnsoNzhs1O6bS4r2ibMrYiVFJw5C8wyiSvcFR/Xmx+6zZbdGuoGn
EOaFqw5TxsKyP8Om1tgPYwslDnkpH3Nuw2cmQXlftkyVrLKv2i3zpAFH4dG3xiKR
IZr0+/X2ZeWC0GZeK2ZsCzHxsfRyYOPnwiiMFjN47/QGH/cfUO122vmOHuQCmtzD
NAsZDyCIU5uW0E4Jl/1zSAQpjofwUDMKllwY52LA/P87P7MLJzRgV23+NsHhCC+T
t3sGpUKT7sDI3l8jcaRgAtS8Q8SUaYVV9xPTrQK+33LtYVAEX40HqDwkicdOGwIp
zDxS3anTeJW2UX5r+nd5eYBm1TCReAwg/3kN+sxcVW57jciz8uS0D7+kITx1c+75
8VKeruX5u4qj7M8QvNcrNR5Pmc0uxUEBZTce5n3YFrphOPZSnV0e3fsD/VjTQt5Z
WaEmLBwrvZO/PxKHBzJ6kEaCbFICeOQBfM7YKABx/1OrDAp0VC6vGaHnymeuicnU
OtppGNkmDW7buOM2KcXx3GEdEFx5lXlI7HZ1bQnpLamyjr/JEuKZXjXyj/DOG/Dq
oYPh6Mt1EvQcGtdWHuJh
=rwyK
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--

--===============7636663626550010169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============7636663626550010169==--
