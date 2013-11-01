From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv4] video: backlight: gpio-backlight: Add DT support.
Date: Fri, 1 Nov 2013 10:57:55 +0100
Message-ID: <20131101095754.GJ27864@ulmo.nvidia.com>
References: <20131019104555.GI18477@ns203013.ovh.net>
 <2730370.0UKsY9Ox0H@avalon>
 <20131024110524.GB11296@ulmo.nvidia.com>
 <1389386.JnbumUe76M@avalon>
 <003701ced693$2f856150$8e9023f0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UlxN1C6awaFNesUv"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <003701ced693$2f856150$8e9023f0$%han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: 'Laurent Pinchart' <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, 'Stephen Warren' <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, 'Jean-Christophe PLAGNIOL-VILLARD' <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, 'Denis Carikli' <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, 'Mark Rutland' <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Ian Campbell' <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, 'Eric B??nard' <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, 'Pawel Moll' <pawel.moll-5wv7dgnIgG8@public.gmane.org>, 'Rob Herring' <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, 'Richard Purdie' <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, 'Sascha Hauer' <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, 'Lothar Wa??mann' <LW-AvR2QvxeiV7DiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--UlxN1C6awaFNesUv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 01, 2013 at 08:44:48AM +0900, Jingoo Han wrote:
> On Friday, October 25, 2013 10:58 PM, Laurent Pinchart wrote:
> > On Thursday 24 October 2013 13:05:25 Thierry Reding wrote:
> > > On Thu, Oct 24, 2013 at 12:38:59AM +0200, Laurent Pinchart wrote:
> > > > On Wednesday 23 October 2013 22:20:12 Thierry Reding wrote:
> > > > > On Wed, Oct 23, 2013 at 05:51:13PM +0100, Stephen Warren wrote:
> > > > > > On 10/22/2013 09:01 PM, Thierry Reding wrote:
> > > > > > > On Tue, Oct 22, 2013 at 05:34:45PM +0200, Jean-Christophe
> > > > > >
> > > > > > > PLAGNIOL-VILLARD wrote:
> > > > > > ...
> > > > > >
> > > > > > >> I'm sorry but the blacklight descibe in DT have nothing to do
> > > > > > >> with the common pratice that the current driver have today
> > > > > > >
> > > > > > > That's not at all what I said. What I said was that the major=
ity
> > > > > > > of backlight drivers currently default to turning the backlig=
ht on
> > > > > > > when probed. Therefore I think it would be consistent if this
> > > > > > > driver did the same.
> > > > > > >
> > > > > > > I also said that I don't think it's a very good default, but =
at the
> > > > > > > same time we can't just go and change the default behaviour a=
t will
> > > > > > > because people may rely on it.
> > > > > >
> > > > > > It may well be reasonable to change the default behaviour for d=
evices
> > > > > > instantiated from DT. If it's not possible to instantiate the d=
evice
> > > > > > from DT yet, then it's not possible for anyone to be relying on=
 the
> > > > > > default behaviour yet, since there is none. So, perhaps the def=
ault
> > > > > > could be:
> > > > > >
> > > > > > * If device instantiated from a board file, default to on, for
> > > > > > backwards-compatibility.
> > > > > >
> > > > > > * If device instantiated from DT, there is no backwards compati=
bility
> > > > > > to be concerned with, since this is a new feature, hence defaul=
t to
> > > > > > off, since we think that's the correct thing to do.
> > > > >
> > > > > I actually had a patch to do precisely that. However I then reali=
zed
> > > > > that people have actually been using pwm-backlight in DT for a wh=
ile
> > > > > already and therefore may be relying on that behaviour as well.
> > > > >
> > > > > It also isn't really an issue of DT vs. non-DT. The simple fact i=
s that
> > > > > besides the backlight driver there's usually no other code that e=
nables
> > > > > a backlight on boot. The only way to do so that I know of is usin=
g the
> > > > > DRM panel patches that I've been working on.
> > > >
> > > > I would very much welcome a refactoring of the backlight code that =
would
> > > > remove the fbdev dependency and hook backlights to panel drivers. T=
hat's
> > > > something I wanted to work on myself, but that I pushed back after =
CDF :-)
> > >
> > > Yeah, that would certainly be very welcome. But it's also a pretty
> > > daunting job since there are a whole lot of devices out there that
> > > aren't easy to test because, well, they're pretty old and chances
> > > are that nobody that actually has one is around.
> > >
> > > But I guess that we can always try to solve it on a best effort basis,
> > > though. Perhaps things can even be done in a backwards-compatible way.
> > > I'm thinking for instance that we could introduce a new property, say
> > > .enable, but keep any of the others suhc as state, power, fb_blank for
> > > backwards-compatibility. Perhaps even emulate them for a while until
> > > we've gone and cleaned up all users.
> >=20
> > That would work with me. I don't think we need more than a best effort
> > approach to porting existing backlight drivers to the new model. When i=
t comes
> > to compatibility with the current interface, I'd like to move the
> > compatibility code to the core instead of leaving it in the individual =
drivers
> > if possible.
>=20
> I agree with you.
> Moving the compatibility code to the core from the individual drivers
> looks good. :-)
>=20
> >=20
> > > Or is there still a reason to have more than a single bit for backlig=
ht
> > > state? I don't know any hardware that actually makes a difference
> > > between FB_BLANK_NORMAL, FB_BLANK_VSYNC_SUSPEND, FB_BLANK_HSYNC_SUSPE=
ND
> > > or FB_BLANK_POWERDOWN.
>=20
> On Exynos side, I have never seen that FB_BLANK_VSYNC_SUSPEND,
> FB_BLANK_HSYNC_SUSPEND are used for controlling display panels or
> Display controllers.
>=20
> However, I heard that FB_BLANK_VSYNC_SUSPEND, FB_BLANK_HSYNC_SUSPEND are
> used for some monitors.

I think that those may make sense in the context of fbdev, and looking
at some fbdev drivers seems to substantiate that.

However, I don't think backlights have any such capability. I mean they
are either on or off, right? There's no such thing as partially off, or
partially on. How would a backlight behave differently if the panel was
in HSYNC suspend mode or VSYNC suspend mode?

Thierry

--UlxN1C6awaFNesUv
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSc3siAAoJEN0jrNd/PrOhq/YQAKPo0e9vGJOiORylK3KMOfT4
K5bTwfAjX7CakG8o6nPGTBa9A3va87SoyIK4d29b6qg/9foMKICTAjkXVqJXlOEP
C6rGQUMad3VCiFX3ill2RZUOGE17sVVCSbgP7LwMyv800gptFi9cKI4sezRlHuXp
rU3lAzJKcRZQMvhaYfGxOQIgwP6U2asdcrIx94x+0VslU6nQCHnVt3qgwVFrWffV
1aZ/jTP0S9llyPXGYh2/zySlGWF7zILN05ZvFNtn40q8XMMgfGWdsr3APDdADZNt
CoV1Gtw4ApFvGeon8Z8MtVWEveLpYZDJkT2fOo/cenUgl4WFHSe1Gs0L/Qtok7Fb
h+6zz1TvWG2TSP8jwZ8SEXtVA+Xvr3+j7MaKBtZBQDhPbKz/SqWl/0c4pp5pViQI
5SIGuaQdUEiqiOR8BnbzTNEzIwgCQ2SZXuscAgixTSYkz8tzxiwT1E1N1ZlTo2ia
Ko4tCNrF8CWKyx3j0kltXMpwnpZ3/aE5ZS62H5RZmsOF53nYslagOwLjF6xo9VR2
OxroJUXe1Dmp0x6C2/c2cmgeVCqnB+giOg8HE7hpvWWtfBKnrrpNo9Trxf90c02G
ojtqAYSEZBAELCvZCYpAcGSYrug65p+UtYpY/RQnDOH/NfxvgUQwCWC+Qms7HUMK
fUFT6NVDX4i+dktTHekv
=s4gq
-----END PGP SIGNATURE-----

--UlxN1C6awaFNesUv--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
