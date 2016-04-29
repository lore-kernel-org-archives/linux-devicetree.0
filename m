From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V5 1/6] SLIMbus: Device management on SLIMbus
Date: Fri, 29 Apr 2016 12:17:10 +0100
Message-ID: <20160429111710.GW3217@sirena.org.uk>
References: <2745420.JjpjMPLp2B@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="c2nJM3NjGGrqEmAW"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2745420.JjpjMPLp2B@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Sagar Dharia <sdharia-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, bp-l3A5Bk7waGM@public.gmane.org, poeschel-Xtl8qvBWbHwb1SvskN2V4Q@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gong.chen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, andreas.noever-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, jkosina-AlSwsSmVLrQ@public.gmane.org, sharon.dvir1-MQgwKvJRKlGYZoqfULhbRA@public.gmane.org, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, michael.opdenacker-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kheitke-hxvC4TZJLZFWk0Htik3J/w@public.gmane.org, mlocke-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sheetal.tigadoli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--c2nJM3NjGGrqEmAW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 28, 2016 at 06:49:23PM +0200, Arnd Bergmann wrote:
> On Thursday 28 April 2016 17:39:20 Mark Brown wrote:

> > It's not just platforms that use these things though - there's things
> > like the SolarFlare NICs where the firmware update mechanism essentially
> > involves exposing a SPI flash as part of a PCI device and we just merged
> > an ASoC driver for a video card which was reusing some existing IPs and
> > chips.

> That's of course fine: you essentially have a discoverable bus there,
> and if we need something like that, we can always add it later to
> any subsystem.

No, the issue with those cases is that there are devices on discoverable
buses that instantiate non-discoverable buses as part of the
discoverable device so the implementation of the discoverable device is
in part essentially a board file.

> In contrast, the interface in the proposed slimbus subsystem seems
> designed for board files, and is in the best case just dead code
> that can be removed, or has a risk of being misused e.g. if some
> device manufacturer decides to use a board file for this instead
> of describing the slimbus slaves in DT.

Which can be more of a pain than it should be if the code has been
written to assume that all the world is DT.  That's the most problematic
bit of this meme - I've seen people doing things like duplicating IP
drivers inside larger devices because they don't think they're allowed
to reuse the IP driver.  We can fix this sort of thing up when we notice
it but we should also try to avoid people making the mistakes in the
first place since it saves everyone a lot of effort.  With subsystems
and to a lesser extent off SoC drivers we need to be careful about just
blindly removing non-DT code and writing things so they're hard to use
without DT.

Like I say in this case I think the board file stuff is probably never
going to get used so it's probably sensible to remove that code but it
does need to be thought about.

--c2nJM3NjGGrqEmAW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXI0K1AAoJECTWi3JdVIfQ8DkH/0O+Djp+wuhmrpuJPBoJrqK9
G2bIcbLKEdi/nxg3svVdnbbBrPXCAgxGwXm7Rn9DId40Gy4QMRS7GNdDVrNz76Xk
UlVHpumphfPBfl2nBTDZXkOtMnIm6QgaD7R8lIiynTfUjtPWL4sYkcf7pPu9BCbG
ApvAZMJUWzxGkYksgxfuiq0vHFbU2xzuOi5RMOoCmqkszCGPhofDU0HL0DCoQdvg
psUNa43Uql+sCUZ8IEkGyJbkWAeBC3D9+QTDzahG9TGhklfo4+PcEjmuwpRGTj0L
WslYplNHeHyZBEW4VsXgxwFy93AYBcBf9vfJHxg0gFAG9tPh43EC8RObqQH6IVA=
=PKOC
-----END PGP SIGNATURE-----

--c2nJM3NjGGrqEmAW--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
