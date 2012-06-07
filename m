From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 2/2] gpio: Add Avionic Design N-bit GPIO expander support
Date: Thu, 7 Jun 2012 10:40:15 +0200
Message-ID: <20120607084015.GA27764@avionic-0098.adnet.avionic-design.de>
References: <1334229858-1665-1-git-send-email-thierry.reding@avionic-design.de>
 <1334229858-1665-2-git-send-email-thierry.reding@avionic-design.de>
 <20120511234728.0A4623E0791@localhost>
 <20120521102032.GA27686@avionic-0098.mockup.avionic-design.de>
 <20120526004805.92B373E1E4E@localhost>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2598500782730428273=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120526004805.92B373E1E4E@localhost>
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
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============2598500782730428273==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Content-Disposition: inline


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Grant Likely wrote:
> On Mon, 21 May 2012 12:20:32 +0200, Thierry Reding <thierry.reding@avioni=
c-design.de> wrote:
> > * Grant Likely wrote:
> > > On Thu, 12 Apr 2012 13:24:18 +0200, Thierry Reding <thierry.reding@av=
ionic-design.de> wrote:
[...]
> > > > +struct adnp_platform_data {
> > > > +	unsigned gpio_base;
> > > > +	unsigned nr_gpios;
> > > > +	int irq_base;
> > > > +	const char *const *names;
> > > > +};
> > >=20
> > > From the start this is a DT enabled driver.  There should be no reason
> > > to also include platform_data support.
> >=20
> > I thought it might be a good idea to support both for now. There have b=
een
> > some discussions that the device tree should be just an alternative sou=
rce
> > for platform data, the main argument being that platform data could be =
used
> > to overwrite data provided via DT.
>=20
> Unless you have an *actual* user of platform_data, don't borrow
> trouble by adding it.

If I make the driver DT-only I should probably add a "select OF" to it's
Kconfig entry, right? Or should it rather be "depends on OF"?

Thierry

--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/QaO8ACgkQZ+BJyKLjJp+9owCfavl3YWLyH2UOz3R1tTeAw2e/
04kAn03dZf3rFP0x7n/YP3phu60Nz/pH
=3ITj
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--

--===============2598500782730428273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2598500782730428273==--
