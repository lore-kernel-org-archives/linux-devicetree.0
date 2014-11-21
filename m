From: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 15/15] metag: tz1090: add TZ1090 clocks to device tree
Date: Fri, 21 Nov 2014 10:06:47 +0000
Message-ID: <20141121100647.GF12456@jhogan-linux.le.imgtec.org>
References: <1416438943-11429-1-git-send-email-james.hogan@imgtec.com>
 <1416438943-11429-16-git-send-email-james.hogan@imgtec.com>
 <2363265.Y6kZ4TuTy5@diego>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Return-path: <linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2363265.Y6kZ4TuTy5@diego>
Sender: linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2014 at 01:56:24PM +0100, Heiko St=C3=BCbner wrote:
> Hi James,
>=20
> interestingly I only got the cover-letter, so had to find the other patch=
es=20
> through my list-archive :-) .

Hmm, sorry about that. I copy cover letter Cc list from the Ccs of the
patches, so not sure what happened there.

>=20
>=20
> Am Mittwoch, 19. November 2014, 23:15:43 schrieb James Hogan:
> > Enable the common clock framework for the TZ1090 SoC, add a tz1090_clk
> > device tree file describing the clocks, and connect the Meta core clock
> > so that the rate of the Meta timer can be determined.
> >=20
> > Most of the clock tree is described apart from some AFE clocks which
> > aren't usually of much interest to Linux. These are represented with
> > placeholder clocks.
> >=20
> > Signed-off-by: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> > Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> > Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> > Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> > Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> > Cc: linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > ---
>=20
>=20
> I don't know enough about your clock structure, but it looks quite a bit =
like=20
> Mike's mail from May [0] may apply here too.
>=20
> The register layout also suggests that it is indeed one clock ip-block:
>=20
> 0x02005908 0x4	CR_TOP_CLKSWITCH=20
> 0x0200590c 0x4	CR_TOP_CLKENAB
> 0x02005950 0x4	CR_TOP_SYSPLL_CTL0
> 0x02005954 0x4	CR_TOP_SYSPLL_CTL1
> 0x02005988 0x4	CR_TOP_CLKSWITCH2
> 0x0200598c 0x4	CR_TOP_CLKENAB2
> ...
>=20
>=20
> [0] https://lkml.org/lkml/2014/5/14/715

Thanks, that does make sense. It's probably more like 4 memory regions
("top" level, "perip" peripheral registers, "hep" high end peripheral
registers, and "pdc" powerdown controller registers), but it could
certainly still have a single binding with multiple memory regions to
simplify the clock specifiers.

I'll take a look at doing it that way.

Cheers
James

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUbw63AAoJEGwLaZPeOHZ6q9QQAJ+IVpui8B8AgxJrhQKQgx3n
jXWGHngPP+uZmKBl3fuKnQoTDVNPQUNRSTYJrJxeyGaSuZuhjiVsxkoBVCH2Puya
1vtKJrsPFrJ3vIUodQhzR3+us8WrzA/gFvawl/gWGkwaWn4SSYXTF23/qKezq/gi
EQ6yUJfmceig13743dkgPiAbI6PDCnUAYKRboN3nnFKYp+9m/TUFhlTbAgKT5wDu
wCvJhjva5yiHzw7ZIGqKfhhKBE97RewjZHQc3Gqem1vtCVTBSgEGZmY3xsvzDHpN
+SSav1OnMLI8m1Gffx2Gs9rb4JG1CE7FHZGQveqFoudoqz1ePRyFBfAvBoaz+2Wv
lPrHHlyPNCDPIntGvmifLyHhIJPHVOdROkIHwRtIGUlNqfWBC6J2Flq6OCo7uOfN
1ZugffXAVFE9Iuetn1kNtQAaF98U9TCmfWfK6yB4Fnyf4Fit7leYnD3YXqmvJWkB
1Ngz3LFOFXLY7HoTjq3w5x40KNwj/itvGCOVn/wMX2fmKCrezqKE3Yjw6rPeOna2
yROmr1FtYfogvAhwnkKUT+cSzk4irfcF8AhzFcjHJ+wuvdSnvIlL5DRyZiDwlDxr
By4Enitxn44QmoVTCFCvKQKXl6IWCuYhzOW5NZ4x1hCIxVlYBVaiUZysaIx4UjtA
U0HypPQMzyYvFRYxbHcR
=u/zm
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
--
To unsubscribe from this list: send the line "unsubscribe linux-metag" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
