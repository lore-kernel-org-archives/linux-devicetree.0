From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCHv4] video: backlight: gpio-backlight: Add DT support.
Date: Fri, 25 Oct 2013 15:57:45 +0200
Message-ID: <1389386.JnbumUe76M@avalon>
References: <20131019104555.GI18477@ns203013.ovh.net> <2730370.0UKsY9Ox0H@avalon> <20131024110524.GB11296@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3123756.8CHp34Fogl"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131024110524.GB11296-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Eric B??nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lothar Wa??mann <LW-AvR2QvxeiV7DiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--nextPart3123756.8CHp34Fogl
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Thierry,

On Thursday 24 October 2013 13:05:25 Thierry Reding wrote:
> On Thu, Oct 24, 2013 at 12:38:59AM +0200, Laurent Pinchart wrote:
> > On Wednesday 23 October 2013 22:20:12 Thierry Reding wrote:
> > > On Wed, Oct 23, 2013 at 05:51:13PM +0100, Stephen Warren wrote:
> > > > On 10/22/2013 09:01 PM, Thierry Reding wrote:
> > > > > On Tue, Oct 22, 2013 at 05:34:45PM +0200, Jean-Christophe
> > > > 
> > > > > PLAGNIOL-VILLARD wrote:
> > > > ...
> > > > 
> > > > >> I'm sorry but the blacklight descibe in DT have nothing to do
> > > > >> with the common pratice that the current driver have today
> > > > > 
> > > > > That's not at all what I said. What I said was that the majority
> > > > > of backlight drivers currently default to turning the backlight on
> > > > > when probed. Therefore I think it would be consistent if this
> > > > > driver did the same.
> > > > > 
> > > > > I also said that I don't think it's a very good default, but at the
> > > > > same time we can't just go and change the default behaviour at will
> > > > > because people may rely on it.
> > > > 
> > > > It may well be reasonable to change the default behaviour for devices
> > > > instantiated from DT. If it's not possible to instantiate the device
> > > > from DT yet, then it's not possible for anyone to be relying on the
> > > > default behaviour yet, since there is none. So, perhaps the default
> > > > could be:
> > > > 
> > > > * If device instantiated from a board file, default to on, for
> > > > backwards-compatibility.
> > > > 
> > > > * If device instantiated from DT, there is no backwards compatibility
> > > > to be concerned with, since this is a new feature, hence default to
> > > > off, since we think that's the correct thing to do.
> > > 
> > > I actually had a patch to do precisely that. However I then realized
> > > that people have actually been using pwm-backlight in DT for a while
> > > already and therefore may be relying on that behaviour as well.
> > > 
> > > It also isn't really an issue of DT vs. non-DT. The simple fact is that
> > > besides the backlight driver there's usually no other code that enables
> > > a backlight on boot. The only way to do so that I know of is using the
> > > DRM panel patches that I've been working on.
> > 
> > I would very much welcome a refactoring of the backlight code that would
> > remove the fbdev dependency and hook backlights to panel drivers. That's
> > something I wanted to work on myself, but that I pushed back after CDF :-)
> 
> Yeah, that would certainly be very welcome. But it's also a pretty
> daunting job since there are a whole lot of devices out there that
> aren't easy to test because, well, they're pretty old and chances
> are that nobody that actually has one is around.
>
> But I guess that we can always try to solve it on a best effort basis,
> though. Perhaps things can even be done in a backwards-compatible way.
> I'm thinking for instance that we could introduce a new property, say
> .enable, but keep any of the others suhc as state, power, fb_blank for
> backwards-compatibility. Perhaps even emulate them for a while until
> we've gone and cleaned up all users.

That would work with me. I don't think we need more than a best effort 
approach to porting existing backlight drivers to the new model. When it comes 
to compatibility with the current interface, I'd like to move the 
compatibility code to the core instead of leaving it in the individual drivers 
if possible.

> Or is there still a reason to have more than a single bit for backlight
> state? I don't know any hardware that actually makes a difference
> between FB_BLANK_NORMAL, FB_BLANK_VSYNC_SUSPEND, FB_BLANK_HSYNC_SUSPEND
> or FB_BLANK_POWERDOWN. Many drivers in drivers/video seem to be using
> those, but for backlights I can see no use other than FB_BLANK_UNBLANK
> meaning enabled and anything else meaning disabled.

I see no use case for the fine-grained state in backlights at the moment.

-- 
Regards,

Laurent Pinchart

--nextPart3123756.8CHp34Fogl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAABAgAGBQJSanjZAAoJEIkPb2GL7hl1XycH/2fWDjxu5SsO/ZPx6Rgwq5k9
siQNnC4Ebddr/E/ex8+hXThkqJ4rze6GrXVnr4BNOTrvLn4GtQPEqbD3gQ8eVGUo
SeBQWLd7+0v7FdyYPp9vI8qxzb7NNFHHEh2CBUwvtmd2KCNn8hK7JsourEosuY7O
sswFWOHD27uTvOdEwHrbGRIN+LTvKSP8RZNlxsPbgtgPPQvopE8uu7VWe25bHPa/
r0snw1BaVjUkHlajlFBKlBZkldwwjxH3J49NMm0ALos3ZwCxUjbsJqIUJDq7N1mk
bBwVC2QNDBM1866DqrIHeU8AM8ErBnlhSotpH3nSpYTI0MkBW/QnVtmWLZdK+kk=
=c6CM
-----END PGP SIGNATURE-----

--nextPart3123756.8CHp34Fogl--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
