From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv4] video: backlight: gpio-backlight: Add DT support.
Date: Thu, 24 Oct 2013 13:05:25 +0200
Message-ID: <20131024110524.GB11296@ulmo.nvidia.com>
References: <20131019104555.GI18477@ns203013.ovh.net>
 <5267FE81.3070201@wwwdotorg.org>
 <20131023202011.GD8828@mithrandir>
 <2730370.0UKsY9Ox0H@avalon>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yNb1oOkm5a9FJOVX"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2730370.0UKsY9Ox0H@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Eric B??nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lothar Wa??mann <LW-AvR2QvxeiV7DiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--yNb1oOkm5a9FJOVX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2013 at 12:38:59AM +0200, Laurent Pinchart wrote:
> Hi Thierry,
>=20
> On Wednesday 23 October 2013 22:20:12 Thierry Reding wrote:
> > On Wed, Oct 23, 2013 at 05:51:13PM +0100, Stephen Warren wrote:
> > > On 10/22/2013 09:01 PM, Thierry Reding wrote:
> > > > On Tue, Oct 22, 2013 at 05:34:45PM +0200, Jean-Christophe
> > >=20
> > > > PLAGNIOL-VILLARD wrote:
> > > ...
> > >=20
> > > >> I'm sorry but the blacklight descibe in DT have nothing to do
> > > >> with the common pratice that the current driver have today
> > > >=20
> > > > That's not at all what I said. What I said was that the majority
> > > > of backlight drivers currently default to turning the backlight on
> > > > when probed. Therefore I think it would be consistent if this
> > > > driver did the same.
> > > >=20
> > > > I also said that I don't think it's a very good default, but at the
> > > > same time we can't just go and change the default behaviour at will
> > > > because people may rely on it.
> > >=20
> > > It may well be reasonable to change the default behaviour for devices
> > > instantiated from DT. If it's not possible to instantiate the device
> > > from DT yet, then it's not possible for anyone to be relying on the
> > > default behaviour yet, since there is none. So, perhaps the default
> > > could be:
> > >=20
> > > * If device instantiated from a board file, default to on, for
> > > backwards-compatibility.
> > >=20
> > > * If device instantiated from DT, there is no backwards compatibility
> > > to be concerned with, since this is a new feature, hence default to
> > > off, since we think that's the correct thing to do.
> >=20
> > I actually had a patch to do precisely that. However I then realized
> > that people have actually been using pwm-backlight in DT for a while
> > already and therefore may be relying on that behaviour as well.
> >=20
> > It also isn't really an issue of DT vs. non-DT. The simple fact is that
> > besides the backlight driver there's usually no other code that enables
> > a backlight on boot. The only way to do so that I know of is using the
> > DRM panel patches that I've been working on.
>=20
> I would very much welcome a refactoring of the backlight code that would=
=20
> remove the fbdev dependency and hook backlights to panel drivers. That's=
=20
> something I wanted to work on myself, but that I pushed back after CDF :-)

Yeah, that would certainly be very welcome. But it's also a pretty
daunting job since there are a whole lot of devices out there that
aren't easy to test because, well, they're pretty old and chances
are that nobody that actually has one is around.

But I guess that we can always try to solve it on a best effort basis,
though. Perhaps things can even be done in a backwards-compatible way.
I'm thinking for instance that we could introduce a new property, say
=2Eenable, but keep any of the others suhc as state, power, fb_blank for
backwards-compatibility. Perhaps even emulate them for a while until
we've gone and cleaned up all users.

Or is there still a reason to have more than a single bit for backlight
state? I don't know any hardware that actually makes a difference
between FB_BLANK_NORMAL, FB_BLANK_VSYNC_SUSPEND, FB_BLANK_HSYNC_SUSPEND
or FB_BLANK_POWERDOWN. Many drivers in drivers/video seem to be using
those, but for backlights I can see no use other than FB_BLANK_UNBLANK
meaning enabled and anything else meaning disabled.

Thierry

--yNb1oOkm5a9FJOVX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSaP70AAoJEN0jrNd/PrOhYFMQALPV7yg8pTM72CUXxXRzX5nJ
OWe7x1af9AthxMdUzJ5KTk2VqhKXL7isYzOAfvt1arh5SwA6auRE2KjOZgblVyf9
HyhFkwU+L4+1hYkpLqSFF/5m+JI/fgNnT4+Qu2KW8f7HWaOb3r4RQNDElyMARCVI
iS6M4GA62xHXFOn59qH8ND5LnYrKhZ3K/OetigZ+9zjVo4ANR1yddcoXeKEjyS4Z
WDGDLPXK5SZyACu8xs/HkLoxs8nq/JdKUaekjUHTyXRAuUbVoeiTZ1Zs8f41skAb
DHA/yHQ3cn1wG823BF5XL+rLPmY4C5hhK4BCmopcVW3aQHSxT64wC/6zbXLAfx+z
ELKxZ1+iInukMGhgY8j9RKJuu8Lm4Q+lVTAQZ9iQx0D4tHEdr1C3xVjk8F0Ukx6W
wkH0p1qseAGSBTHViFJXY7jZ8AqaOlJlLlP/h1aP/EV764RfeBmNcGiLDhhES5Y/
YnDmEbKhrPJ+Hde+6ZQ2deX1A0NFxQXgS1RwSo9+NA1fFWJb6VG5dcNI755QHaGa
nWS2aws14IY/xWlvTKRolgMBuRNUzGK6odrITeP44eaI5VQY/L3hBlySu77xEPYy
TnXYoOD0MGcITE850KauvluZ4BqHRD78x6i5S6W2f5apBOTL4R0r3Ds4Ee/EnXK+
BdNxlRtHJfg/0YmyzDby
=1fIk
-----END PGP SIGNATURE-----

--yNb1oOkm5a9FJOVX--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
