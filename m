From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv4] video: backlight: gpio-backlight: Add DT support.
Date: Tue, 22 Oct 2013 09:23:08 +0200
Message-ID: <20131022072307.GA8681@ulmo.nvidia.com>
References: <20131019104555.GI18477@ns203013.ovh.net>
 <1382346813-8449-1-git-send-email-denis@eukrea.com>
 <20131022045833.GB17512@ns203013.ovh.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131022045833.GB17512-HVbc7XotTAhnXn40ka+A6Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Eric B??nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lothar Wa??mann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2013 at 06:58:33AM +0200, Jean-Christophe PLAGNIOL-VILLARD =
wrote:
> On 11:13 Mon 21 Oct     , Denis Carikli wrote:
> > Cc: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>
> > Cc: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> > Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> > Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> > Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> > Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> > Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > Cc: Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
> > Cc: Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
> > Cc: Eric B=C3=A9nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
> > Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
> > ---
> > ChangeLog v3->v4:
> > - The default-brightness property is now optional, it defaults to 1 if =
not set.
> by default we set OFF not ON
>=20
> do not actiate driver or properti by default you can not known to consequ=
ence
> on the hw

Turning on a backlight by default is what pretty much every backlight
driver does. I personally think that's the wrong default, I even tried
to get some discussion started recently about how we could change this.
However, given that this has been the case for possibly as long as the
subsystem has existed, suddenly changing it might cause quite a few of
our users to boot the new kernel and not see their display come up. As
with any other ABI, this isn't something we can just change without a
very good migration path.

In my opinion every backlight should be hooked up to a display panel,
and the display panel driver should be the one responsible for turning
the backlight on or off. That's the only way we can guarantee that the
backlight is turned on at the right moment so that glitches can be
avoided.

One possible migration path would be to update all display panel drivers
to cope with an associated backlight device, but even if somebody would
even find the time to write the code to do that, I can imagine that we'd
have a hard time getting this tested since a lot of the boards that rely
on these backlight drivers are legacy and probably no longer very
actively used.

Thierry

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSZifbAAoJEN0jrNd/PrOhDEsP/iYkNsjEIuAvrt7YsJNNNu0P
J8Ci3+VqDeBITolp9BEzk7tBzumZjM2Md1UZFpUDvOihyjShEHjGqudM6RxfIEMb
4FlLHv61F38k4CaCOuUvLZvUjS9eJ33ANCPzA0mt6S2AtPDyCA9uAlNyqoM2fWUZ
j/K6pAeIUCo9iP+OGcU+SeKkljnZhEfpT7shxKPyIQB+FRxzKqiXdaJqQf1j8MaS
SpKSSJ18YiKHRN3lzDfd49VVDXEP2vpr+kEieT6GW21O6/is0Bm/7tCDaqlCv0KG
Ag/WXPFKegrm/up8gmIaoPAOzMHfNenrIulLVicdOVe5ZAcYK9H0RvC3ObbB2QyE
hMMOzSL+1Fvs/z1JYjYY5LmjfpElXLB7HqRdadWkGl/J8fKwOBXpNSMU14sMXp5r
TkRi7sRtbFWpKXGDvmhPLFYg4m0PrsGTOQoWgApPLEdr9E6Srxr4U5B/fM4fn31C
f4QLS8vPYt9QLM79R3sMQKZ69S6jHw3Lq3Pvzfp6YJOzFCnwT8n3I8nMOohqS6t5
xbMOjOhQCMLi0kRUlQWl52hGewTcJvi6vdoN+jQuAi3QU8mUnGWeslLa+GBKzTgW
M0BQGQrmCE8tF8tFfcKAVdOFVFDKmwi/+oiqyHDaNBHVF7Nu8PNhXi53GuGTCcao
QHjoPYWWB7T93uPhHdwa
=wxWq
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
