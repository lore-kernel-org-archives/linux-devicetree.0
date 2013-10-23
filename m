From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCHv4] video: backlight: gpio-backlight: Add DT support.
Date: Thu, 24 Oct 2013 00:38:59 +0200
Message-ID: <2730370.0UKsY9Ox0H@avalon>
References: <20131019104555.GI18477@ns203013.ovh.net> <5267FE81.3070201@wwwdotorg.org> <20131023202011.GD8828@mithrandir>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2597348.4gFW9HCYSv"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131023202011.GD8828@mithrandir>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Eric B??nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lothar Wa??mann <LW-AvR2QvxeiV7DiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--nextPart2597348.4gFW9HCYSv
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Thierry,

On Wednesday 23 October 2013 22:20:12 Thierry Reding wrote:
> On Wed, Oct 23, 2013 at 05:51:13PM +0100, Stephen Warren wrote:
> > On 10/22/2013 09:01 PM, Thierry Reding wrote:
> > > On Tue, Oct 22, 2013 at 05:34:45PM +0200, Jean-Christophe
> > 
> > > PLAGNIOL-VILLARD wrote:
> > ...
> > 
> > >> I'm sorry but the blacklight descibe in DT have nothing to do
> > >> with the common pratice that the current driver have today
> > > 
> > > That's not at all what I said. What I said was that the majority
> > > of backlight drivers currently default to turning the backlight on
> > > when probed. Therefore I think it would be consistent if this
> > > driver did the same.
> > > 
> > > I also said that I don't think it's a very good default, but at the
> > > same time we can't just go and change the default behaviour at will
> > > because people may rely on it.
> > 
> > It may well be reasonable to change the default behaviour for devices
> > instantiated from DT. If it's not possible to instantiate the device
> > from DT yet, then it's not possible for anyone to be relying on the
> > default behaviour yet, since there is none. So, perhaps the default
> > could be:
> > 
> > * If device instantiated from a board file, default to on, for
> > backwards-compatibility.
> > 
> > * If device instantiated from DT, there is no backwards compatibility
> > to be concerned with, since this is a new feature, hence default to
> > off, since we think that's the correct thing to do.
> 
> I actually had a patch to do precisely that. However I then realized
> that people have actually been using pwm-backlight in DT for a while
> already and therefore may be relying on that behaviour as well.
> 
> It also isn't really an issue of DT vs. non-DT. The simple fact is that
> besides the backlight driver there's usually no other code that enables
> a backlight on boot. The only way to do so that I know of is using the
> DRM panel patches that I've been working on.

I would very much welcome a refactoring of the backlight code that would 
remove the fbdev dependency and hook backlights to panel drivers. That's 
something I wanted to work on myself, but that I pushed back after CDF :-)

> That said, it is true that the number of DT users of the pwm-backlight
> driver is smaller than the number of board file users, and it is much
> more likely that people are still actively using them, so if we can get
> everyone to agree on changing the default behaviour that might still be
> possible.

-- 
Regards,

Laurent Pinchart

--nextPart2597348.4gFW9HCYSv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAABAgAGBQJSaFAJAAoJEIkPb2GL7hl1tcAH/jOWVw31RkmsLDJiiTjn4xv6
cOm2Waldra89zG/LNDoAlEPv8af6ngTHkxst2S6Pb3OQjWjV1yYivnsu7rVxOdhu
SDr3oJJsB2yu9aUTokP9w70GEzjjpHDlrE1jg9Su0QEyuW4S5mvLORu0JaxpetzC
GzlMjTOLrj2lRsyIESGObBoyHBSFihdoIjbnTUM1AWaN7LATImlputRVwKiSrFL1
eKAWC8AGDLtPNkM3svIvM7yCfRo+35xn84hcKvY8MK5+6BXda9GwDMOgxWBJRxuE
Fni8hB2GiCmv2GEWE2WNJ72zT/xtqYENJjIVdZ1PbWkYsdVLRLVjCm1LjTLki0E=
=xWg5
-----END PGP SIGNATURE-----

--nextPart2597348.4gFW9HCYSv--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
