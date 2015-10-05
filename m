From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH][RESEND] drm: panel-simple: add URT UMSH-8596MD-xT panel
 support
Date: Mon, 5 Oct 2015 12:58:28 +0200
Message-ID: <20151005105609.GD30219@ulmo>
References: <55E5AD23.8070309@maciej.szmigiero.name>
 <560EF9C0.7080407@maciej.szmigiero.name>
 <CACvgo52s6Gc7Oh=yqS76619gzhMC7TxzZM3o1kyyz0AiS0TVig@mail.gmail.com>
 <5611B75D.9030700@maciej.szmigiero.name>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0993695515=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5611B75D.9030700@maciej.szmigiero.name>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org


--===============0993695515==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4VrXvz3cwkc87Wze"
Content-Disposition: inline


--4VrXvz3cwkc87Wze
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 05, 2015 at 01:33:49AM +0200, Maciej S. Szmigiero wrote:
> Hi Emil,
>=20
> Thanks for your response,
>=20
> On 04.10.2015 12:43, Emil Velikov wrote:
> > Hi Maciej,
> >=20
> > On 2 October 2015 at 22:40, Maciej S. Szmigiero
> > <mail@maciej.szmigiero.name> wrote:
> >> Anybody here?
> >>
> >> I've already submitted this patch two times but received no response...
> >>
> > Seems that the maintainer (Thierry) isn't Cc'ed.
>=20
> Yes, he was Cc'ed - see for example https://patchwork.ozlabs.org/patch/51=
2858/ .

Sorry, I never received any of your earlier patches. It's in none of my
mailboxes nor was it classified as spam. Even searching by message ID
doesn't give me a positive hit.

> > You might want to
> > split the DT binding and vendor prefix to separate patches.
>=20
> Do you mean to first submit new vendor prefix then panel patch with docs?
> Or even docs separately?

This should be three patches: the vendor prefix is usually a separate
patch and needs an Acked-by from one of the device tree bindings
maintainers. The binding itself should also be a separate patch and the
driver changes should come last.

Thierry

--4VrXvz3cwkc87Wze
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWElfUAAoJEN0jrNd/PrOhvZEP/3wyhojINC4gXWaoEgh4mvG3
CY2xXDPNFB8tNMGjjBr6swwTgUH2WjbQee9YViQPqnhtzxn4qz0EcxPeog1TONcn
eURRzV5SetSNc++0dBclIhqqnVKWSyuPmxOSDh9DjPpP3KGme/wr2rJ95lk5PTxf
yS8o5dvx3oos0S4mq+ntcWpvXMTqovJR0Lk0NNe4KEgY3FftOFb1fWa/qWmsxvDq
cyhsh6vFalEwOWctLGozbxnyF+qQ/CHU5Kbjk9pVDNQ1ZzxUg3K0U5QgkMWQr1BP
ZaadFOWVLZBT1laiXMg7HAIpcBu+HwSMqofAP5OMAc8jE6PckAAEnN2/RWxyu6GX
OPdvx55A+VqVLrnmQEQ6dCLtcqM2DAwCAJd8Pga2FfXXIFJrx8YhCPj4aYJMZDVS
29Q6LCR/a6poukYTWwwpUrN15HgQMoteIcg30hfCUIrpGG/9BzUtP4kYSuMAbSEp
dbAxJRNs9J2q7qY1/ga3BsZVYeqrw69EToSo5lBjfQJyjnKh6eE4lpvi4ewkEo1y
d8H+/u43pe+2UPnPe32qVn7HF2Y19Cpm4FfjLzmtde3D0YZTZhZVHreSLoAZsfxX
ikzXXT3h1ijyRur9b++qQunkkCqDEF01ZoT+o4hCABq+5/iyeIRhBCRyFa39pWVn
M9ZZK82brdm1GBy8oxEX
=f+Qj
-----END PGP SIGNATURE-----

--4VrXvz3cwkc87Wze--

--===============0993695515==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0993695515==--
