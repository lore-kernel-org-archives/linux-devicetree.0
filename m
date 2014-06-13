From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: CPU revision IDs
Date: Fri, 13 Jun 2014 15:58:17 +0200
Message-ID: <20140613135817.GK3448@lukather>
References: <CAKON4OwNULPeQFHwRhRfri86yexMvvKfrw_dthim4_oPWvMD3g@mail.gmail.com>
 <4285095.l6sVUI20tQ@wuerfel>
 <CAKON4OxzJ7UoKnMgf+sckksjG-rx8NG1tUvPj2qaHNsda0j3jQ@mail.gmail.com>
 <5045739.TmqqIG2CDG@wuerfel>
 <CAKON4Ox+tCgiu6N988ds7ED2KbECw=60Y6BRqV_2UcM+vshw4Q@mail.gmail.com>
 <20140613132022.GJ3448@lukather>
 <CAKON4OxZLaL9sJFPjnUhec_LMZKGvGXrKyUjW-whHzY6byVUxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XjbSsFHOHxvQpKib"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKON4OxZLaL9sJFPjnUhec_LMZKGvGXrKyUjW-whHzY6byVUxw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--XjbSsFHOHxvQpKib
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2014 at 09:34:05AM -0400, jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> On Fri, Jun 13, 2014 at 9:20 AM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > On Fri, Jun 13, 2014 at 09:14:45AM -0400, jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> >> On Fri, Jun 13, 2014 at 9:08 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> >> > On Friday 13 June 2014 09:05:14 jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> >> >> I was adding the CPU revision ID to the top level compatible string,
> >> >> nothing specific to the device.  By knowing the CPU revision I know
> >> >> which errata to apply.
> >> >>
> >> >> If you patch the device strings, then you have to maintain knowledge
> >> >> of which devices are broken in two places -- the device driver and =
the
> >> >> machine file where you are patching the strings.
> >> >
> >> > IMHO, the driver only has to know what device versions exist, it
> >> > shouldn't need to know which soc has which version of the device.
> >> >
> >> > Can you describe which kind of quirk you are looking at in the drive=
r,
> >> > and how common it is?
> >>
> >> Allwinner wired the volume control for their on-chip codec up
> >> backwards on the A revsion of the the A10 chip. In later revisions is
> >> it fixed to work in the right direction.
> >>
> >> I was wanting to add code like this to the device driver...
> >>
> >> if (of_machine_is_compatible("allwinner,sun7i-a20a")) {
> >>       fix bug
> >> }
> >>
> >> Another solution would be for me to detect the chip revision in the
> >> init code of the driver and remember it.
> >
> > The point is that you don't have that kind of constructs. You can
> > associate any number of compatibles to your driver, and data to each
> > of these compatibles. So, with different compatibles, you will be
> > probed and retrieved these data directly, without even having this in
> > your driver.
>=20
>=20
> Then I end up with code in the machine file like this...
>=20
> find SOC revision
> if revision =3D=3D A
>     fix up codec and i2s driver compatible
> if revision =3D=3D B
>     fix up HDMI compatible
> if revision =3D=3D C
>     fix up whatever
> I've seen chips with revision levels of J
>=20
> Why do you want this knowledge in the machine file? Why not just add
> the test for SOC revision inside the device driver?

Because it's going to be a mess anyway. No matter if it's in the
driver or the machine code. So at least, that way, we're having it
centralized and isolated from the driver's code.

Plus, we're going to need these several compatibles anyway, for boards
that come with a single SoC revision, so why not just use them.

And if it's a single revision of a single SoC for the moment, it's
completely fine. When we'll get overwhelmed, if we ever are, we can
always refactor that code to something smarter.

> I do see the logic for wanting to change the compatible string for the
> device, but these aren't really different devices. They are errata
> being applied to the same device.

No, they're not really different, but they're not the same either, or
at least, for whatever reason, they don't behave in the exact same
way.

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--XjbSsFHOHxvQpKib
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTmwN5AAoJEBx+YmzsjxAghIoP/RR01V2iuUuHQ4mzz6fXI7xG
7s/sUHpdQ1KLyzTkvwCmNW60wjqIhpcafNpNLxVLCSdNZmLIMAxz4ZyZcQDAGSyp
/ib8ee0vhv4oUmi6waSiJuhdK09DdiA9YbhQ6d+zOVMLCEN9/2ervrBsZLSANzWy
xZa03sj7l4asO8cJQlHhmAmSzd6kf8ohAdeXCzakA+z+KCO91tlhEeEtpL/kkuyB
TyerfB4brHPrIYlTnQR5V/YdPh18P0gMgBJyc7TtnwEg+8OCKTOzkTB7wFjBPtiR
7SSZxEGcp611gAl4D8NoomIBG1TkSKDifNcRo5TaDXHHH2kAJ+uWqBcAAG1WRptf
UK7g48GRW7R7BdgTgizzMnMIJ8ILvhcAL3kwsFiIAscAzkzL4gylEFt4hfoHw8CU
j1xfW2HFhxLB16yxET/z6yZQLBCHXAyDzZmp1TrVOnvpygOOfv4HqoEnQ3UfpL3M
RPhrmraP9MvBWFL5fGooymRMpd5LYCr1gHU4VYE7e/d1ffJo2YJhRveR0850KiuJ
nYVu2ZU/cIIyMQ/YfEZRlvSFjxp9w3ywW8EM4brslIGlwNG65LMID7pVTQO07cTj
AByK9OkgLcb7nmkH+U2JBVkr/c/gjJm+PRpyWGTHlVmiILKv+r0X2aSmLzOO4RTD
W+feDsdxPBm3RHfOdqAb
=CsEb
-----END PGP SIGNATURE-----

--XjbSsFHOHxvQpKib--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
