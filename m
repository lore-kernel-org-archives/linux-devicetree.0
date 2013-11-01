From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv4] video: backlight: gpio-backlight: Add DT support.
Date: Fri, 1 Nov 2013 11:13:47 +0100
Message-ID: <20131101101346.GK27864@ulmo.nvidia.com>
References: <20131019104555.GI18477@ns203013.ovh.net>
 <1382346813-8449-1-git-send-email-denis@eukrea.com>
 <20131022045833.GB17512@ns203013.ovh.net>
 <20131022072307.GA8681@ulmo.nvidia.com>
 <20131022153445.GD17512@ns203013.ovh.net>
 <20131022200141.GA8037@mithrandir>
 <001e01ced692$267a6d90$736f48b0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="j/HO4hzKTNbM1mOX"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <001e01ced692$267a6d90$736f48b0$%han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: 'Jean-Christophe PLAGNIOL-VILLARD' <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, 'Denis Carikli' <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, 'Mark Rutland' <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Ian Campbell' <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, 'Eric B??nard' <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, 'Pawel Moll' <pawel.moll-5wv7dgnIgG8@public.gmane.org>, 'Stephen Warren' <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, 'Rob Herring' <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, 'Richard Purdie' <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, 'Laurent Pinchart' <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, 'Sascha Hauer' <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, 'Lothar Wa??mann' <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--j/HO4hzKTNbM1mOX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 01, 2013 at 08:37:23AM +0900, Jingoo Han wrote:
> On Wednesday, October 23, 2013 5:02 AM, Thierry Reding wrote:
> > On Tue, Oct 22, 2013 at 05:34:45PM +0200, Jean-Christophe PLAGNIOL-VILL=
ARD wrote:
> > > On 09:23 Tue 22 Oct     , Thierry Reding wrote:
> > > > On Tue, Oct 22, 2013 at 06:58:33AM +0200, Jean-Christophe PLAGNIOL-=
VILLARD wrote:
> > > > > On 11:13 Mon 21 Oct     , Denis Carikli wrote:
> > > > > > Cc: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>
> > > > > > Cc: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > > > > > Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> > > > > > Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> > > > > > Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> > > > > > Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> > > > > > Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> > > > > > Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> > > > > > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > > > > > Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > > > > > Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > > > > > Cc: Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
> > > > > > Cc: Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
> > > > > > Cc: Eric B=C3=A9nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
> > > > > > Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
> > > > > > ---
> > > > > > ChangeLog v3->v4:
> > > > > > - The default-brightness property is now optional, it defaults =
to 1 if not set.
> > > > > by default we set OFF not ON
> > > > >
> > > > > do not actiate driver or properti by default you can not known to=
 consequence
> > > > > on the hw
> > > >
> > > > Turning on a backlight by default is what pretty much every backlig=
ht
> > > > driver does. I personally think that's the wrong default, I even tr=
ied
> > > > to get some discussion started recently about how we could change t=
his.
> > > > However, given that this has been the case for possibly as long as =
the
> > > > subsystem has existed, suddenly changing it might cause quite a few=
 of
> > > > our users to boot the new kernel and not see their display come up.=
 As
> > > > with any other ABI, this isn't something we can just change without=
 a
> > > > very good migration path.
> > >
> > > I'm sorry but the blacklight descibe in DT have nothing to do with th=
e common
> > > pratice that the current driver have today
> >=20
> > That's not at all what I said. What I said was that the majority of
> > backlight drivers currently default to turning the backlight on when
> > probed. Therefore I think it would be consistent if this driver did the
> > same.
> >=20
> > I also said that I don't think it's a very good default, but at the same
> > time we can't just go and change the default behaviour at will because
> > people may rely on it.
>=20
> I agree with your opinion.
> But, I can't decide how to change it.

One solution that Stephen proposed was to make all DT-based setups use a
new default (off). An advantage of that is that such setups are still
fairly actively being worked on, so we can probably get early adopters
to cope with the new default.

Looking through some DTS files it seems that many use the pwm-backlight
driver. So if we can get some concensus from all the users that changing
the default would be okay, then I think we could reasonably change it.

Another solution perhaps would be to add a property to DT which encodes
the default state of the backlight on boot. This used to be impossible
because the general concensus was that DT should describe hardware only
and not software policy. During the kernel summit this requirement was
somewhat relaxed and it should now be okay to describe system
configuration data, and I think this would be a good match. If the
system is designed to keep the backlight off by default because some
other component (display panel driver) is meant to turn it on later,
that's system configuration data, right?

Perhaps a boolean property could be used:

	backlight {
		compatible =3D "pwm-backlight";

		...

		backlight-default-off;
	};

> > > put on by default if wrong specially without the property define. Eve=
n put it
> > > on by default it wrong as the bootloader may have set it already for =
splash
> > > screen and to avoid glitch the drivers need to detect this.
> >=20
> > I agree that would be preferable, but I don't know of any way to detect
> > what value the bootloader set a GPIO to. The GPIO API requires that you
> > call gpio_direction_output(), and that requires a value parameter which
> > will be used as the output level of the GPIO.
>=20
> Jean-Christophe's point is right.
>=20
> We may need to discuss 'the way to detect what value the bootloader
> set a GPIO to'.

Since some GPIO hardware simply can't do it, I guess we could resolve to
passing such information via DT. That obviously won't work for non-DT
setups, but I guess that's something we could live with.

One possibility would be to supplement the backlight-default-off
property with another property (backlight-boot-on) that can be passed on
to the kernel from the bootloader to signal that it has turned the
backlight on.

Thierry

--j/HO4hzKTNbM1mOX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSc37aAAoJEN0jrNd/PrOhCfwQAKTc2GEGZn0kUHEsXssDDz+a
rM5igL4Q64wesZ6DhbNrZHvvtdva2CxsKxAtaSg2uP8k5zQFEXhioztUq05l0Ig8
4PZdw/K3m/S58gLCoy3cZFLUbPo4GSlKlZ1VlUR9KJv8oJJ/iOas+4fHPG1W04F5
hTl26D2gJGFrMlSlZQCLHrkyucN7ISDzhMBcIWQ1SmqkCKek36Z/PfNjgspZwRXh
j1qqLrNa/rEm8GCRT7dtqr+waAcx4vSbWsqQnehU85xxJ5gr7DWzxsp7GPKlWYqI
n4lilWUdzBYZ1i3zb0BqMfGp4Umr7ERZND5I98hfeUFnRlrJstnqlKT3ISGz+IF/
1K+wcX/eTZwnaNeiP5aryGzwuI8WqH6IJiesOzvFUF3Dr9f/DWDUa02qX569Qit2
ya4DsQT2Bwih1bhb99s3eQuh0kJoctnmxR6E1tuud0R2U1iRYRwBTeI4mEvNa+D1
x/NjQiS5/5uBW4aUXOsAp3SdIscuH5o0ZNNBxma5O5O1dL1uAzJaabgLEfVpH2Us
GRtzlD6RBuZfraZZu+kN9ncfps2aGq6oCaPwuVzD71D+iRb8sISYO0HKVQPSReHP
gTNgiOuYwc+45PsuIgCM0Z47fVc7ZJzuf4VLUXncsSerKIGaUGUY7O/LKPAbbt1B
vtyChy0l2SxQ+3x7lt0r
=ogWQ
-----END PGP SIGNATURE-----

--j/HO4hzKTNbM1mOX--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
