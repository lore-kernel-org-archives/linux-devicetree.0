From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv4] video: backlight: gpio-backlight: Add DT support.
Date: Tue, 22 Oct 2013 22:01:42 +0200
Message-ID: <20131022200141.GA8037@mithrandir>
References: <20131019104555.GI18477@ns203013.ovh.net>
 <1382346813-8449-1-git-send-email-denis@eukrea.com>
 <20131022045833.GB17512@ns203013.ovh.net>
 <20131022072307.GA8681@ulmo.nvidia.com>
 <20131022153445.GD17512@ns203013.ovh.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131022153445.GD17512-HVbc7XotTAhnXn40ka+A6Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Eric B??nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lothar Wa??mann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2013 at 05:34:45PM +0200, Jean-Christophe PLAGNIOL-VILLARD =
wrote:
> On 09:23 Tue 22 Oct     , Thierry Reding wrote:
> > On Tue, Oct 22, 2013 at 06:58:33AM +0200, Jean-Christophe PLAGNIOL-VILL=
ARD wrote:
> > > On 11:13 Mon 21 Oct     , Denis Carikli wrote:
> > > > Cc: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>
> > > > Cc: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > > > Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> > > > Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> > > > Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> > > > Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> > > > Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> > > > Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> > > > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > > > Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > > > Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > > > Cc: Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
> > > > Cc: Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
> > > > Cc: Eric B=C3=A9nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
> > > > Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
> > > > ---
> > > > ChangeLog v3->v4:
> > > > - The default-brightness property is now optional, it defaults to 1=
 if not set.
> > > by default we set OFF not ON
> > >=20
> > > do not actiate driver or properti by default you can not known to con=
sequence
> > > on the hw
> >=20
> > Turning on a backlight by default is what pretty much every backlight
> > driver does. I personally think that's the wrong default, I even tried
> > to get some discussion started recently about how we could change this.
> > However, given that this has been the case for possibly as long as the
> > subsystem has existed, suddenly changing it might cause quite a few of
> > our users to boot the new kernel and not see their display come up. As
> > with any other ABI, this isn't something we can just change without a
> > very good migration path.
>=20
> I'm sorry but the blacklight descibe in DT have nothing to do with the co=
mmon
> pratice that the current driver have today

That's not at all what I said. What I said was that the majority of
backlight drivers currently default to turning the backlight on when
probed. Therefore I think it would be consistent if this driver did the
same.

I also said that I don't think it's a very good default, but at the same
time we can't just go and change the default behaviour at will because
people may rely on it.

> put on by default if wrong specially without the property define. Even pu=
t it
> on by default it wrong as the bootloader may have set it already for spla=
sh
> screen and to avoid glitch the drivers need to detect this.

I agree that would be preferable, but I don't know of any way to detect
what value the bootloader set a GPIO to. The GPIO API requires that you
call gpio_direction_output(), and that requires a value parameter which
will be used as the output level of the GPIO.

> For me this should not even be a property but handled by the driver them
> selves in C.

Agreed. There has been some discussion recently about whether devicetree
should be extended (or supplemented) to allow defining behaviour as well
(in addition to just hardware). But that's not immediately relevant here
at this time.

Thierry

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSZtmlAAoJEN0jrNd/PrOhsoEQAI7auF9rHWH/ynqdebfwq+zS
js5wwoKjA/HhFtI/Uf1z2gfg1OlWO36xUXgXEEs/Zuqj7INeqP7bvft+N5rjfDsP
bYW3GK8bxBIF5tOUglNJXm6661j38mHtdggDgLYQtSPczN0V6D5zc5txO/tR7Jsq
ypb5xos5WdaYx5MIBNWz4d1xAbug/PH4vjcyw8cej3SY32Ku2kRnfyifYwGa8vV1
udTvzU36+LBfjdpoLhVgXcjCkgfuXg167cCO2vlulLb77NnPALXCxVKhibJirSET
qu7gxRPa7tYDcA9OjvMyj7BovcC877Swm+zDG8e00ehGAPB3j8L5cCyg2+r6nz2k
jqbeuYnO21fgqNo62WYxFg0M80cnamfXgwU09s/i06nbRE4UI/esIbjNSqI3t4n+
IfV+gWkRXfYtvm/9QDN0VrmYbLZtNTp5bVBRkrOqpWljAPk8WCZaPgNLghHCLLl9
0919354m9Ig/QVxAFTMQeIgiv8GCxkLww1C85vwkq0trRX8Wc6nKRcCM28ldsk0U
RZ0vB5T4XXUJKdOl+6Dt8Q6URHW/hqBum/07X7ldfMNFzHZVYEDwaXNS4Td+g+Mo
to5c2HVaLzbsqXOmdVkeRZ9ZdexeHr1i3f/wnUpQyZrIKfk2cteD53qKtSq6GQ4H
g1h+V4NvJSzJmTDjNH9Z
=hScn
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
