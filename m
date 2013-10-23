From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Wed, 23 Oct 2013 21:06:11 +0200
Message-ID: <20131023190610.GD7863@ulmo.nvidia.com>
References: <52644A9E.3060007@wwwdotorg.org>
 <20131020220839.GT2443@sirena.org.uk>
 <5264576F.6050307@wwwdotorg.org>
 <alpine.LFD.2.03.1310201911190.1951@syhkavp.arg>
 <20131021091555.GB21518@ulmo.nvidia.com>
 <20131021170711.GA5256@netboy>
 <20131022092410.GB15640@ulmo.nvidia.com>
 <20131023173032.GB5208@netboy>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1SQmhf2mF2YjsYvc"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131023173032.GB5208@netboy>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--1SQmhf2mF2YjsYvc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2013 at 07:30:33PM +0200, Richard Cochran wrote:
> On Tue, Oct 22, 2013 at 11:24:11AM +0200, Thierry Reding wrote:
> >=20
> > Oh, I've been doing that for quite a while. In fact the patches that
> > gave rise to the current frustration have been in a separate tree in
> > various forms for over a year. But that's not what we want, is it?
>=20
> I can't see anything wrong with that. Your code is not the first to
> have to wait for a long time before being finally merged. Think of
> alsa, or of the pps stuff, or wakelocks, or preempt_rt, etc, etc.

Heh... that's no news for me.

> As an end user, I don't mind waiting for a feature if that means
> stability and QA. If I get impatient, still I always have the choice
> to take a development version. But I do not want to be forced to take
> unfinished work in a released kernel.

This isn't about stability and QA. The DT binding has nothing to do
whatsoever with the quality of the code. Also in many cases with DT we
end up with work that's actually finished and pretty well tested, and
the only thing blocking it is the DT binding.

> > I
> > used to think that we actively wanted people to contribute code back
> > upstream, so telling everyone to keep code in their own trees isn't
> > helping anyone.
>=20
> Actually, I mean to propose that the ARM/DT people use a single
> marshaling tree, one step away in the process from mainline.

I don't think fragmentation of that sort will do us any good. It will
only make it harder to get things merged because they get developed
outside of the upstream process.

Thierry

--1SQmhf2mF2YjsYvc
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSaB4iAAoJEN0jrNd/PrOhGd0P/RQ6VVfWIzyqk007V4ZchrZ1
hA6eWdh6ZnpaLu8DfkQSlKh1WlKBcUSPQCQ1kQmVZPP+mOAFTf581srqzU9YM/Xi
m4PUNGrZB0BhmBRpqmKY3raYB1AtvWdYi+hkDDEmuONNQLm3nBke17KlEPI4Ox//
9nY96jCSmUaqS32bcTozclDDw0/cxAYL69/dShIV+hbptXFgpm3FqHhci2kDDQW7
0JlIH5Kt72Wr73mkoxCWcukYqOj1Uq9tCUy7clPT4x5Ia3CzOK6EYQDxCQMWG0wC
C63nZni/fl3IIC9yeqzO+ELUSaov62n9nNlVGY5lh74P4azIxu5BhSECN5u8/ZiT
TbcbvkUgNosNhtC/lLYa4n3NP6jGNT1i9zcmetI9TSgGNT9ujXOJohS2xuva5VDO
Zg6N0Sa37dvGvsi51TpyTKztjKVn8C8xJTh9FtgVvup3UxjFIvLw2u7JR52te0J3
1k4Yi5rl2BUT8ZSfdXxkpbFq3oCmGdUw10xr6epGiuEH1aioi78XgkAQV5LFGGVP
q3gTWvLUh2sGj+Th8IzMMxjfbYYuNa/d3gSYTzY+UcghGgoOtKvZ4MxukUxWHBdw
Suc2jZ8FMcqrpt1plXF8QmvH1fx94tgzQIDCAHp/lPVcYe606c77IyBUoYl6+fhk
SLOAHN+32idnf2NyqsPJ
=LN+T
-----END PGP SIGNATURE-----

--1SQmhf2mF2YjsYvc--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
