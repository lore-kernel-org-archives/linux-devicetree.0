From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCHv4] video: backlight: gpio-backlight: Add DT support.
Date: Wed, 06 Nov 2013 01:08:35 +0100
Message-ID: <3967459.E0IoUGONBn@avalon>
References: <20131019104555.GI18477@ns203013.ovh.net> <001e01ced692$267a6d90$736f48b0$%han@samsung.com> <20131101101346.GK27864@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2565113.6EJJvi0Muc"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131101101346.GK27864-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Jean-Christophe PLAGNIOL-VILLARD' <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, 'Denis Carikli' <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, 'Mark Rutland' <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Ian Campbell' <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, 'Eric B??nard' <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, 'Pawel Moll' <pawel.moll-5wv7dgnIgG8@public.gmane.org>, 'Stephen Warren' <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, 'Rob Herring' <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, 'Richard Purdie' <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, 'Sascha Hauer' <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, 'Lothar Wa??mann' <LW-AvR2QvxeiV7DiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--nextPart2565113.6EJJvi0Muc
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Thierry,

On Friday 01 November 2013 11:13:47 Thierry Reding wrote:
> On Fri, Nov 01, 2013 at 08:37:23AM +0900, Jingoo Han wrote:
> > On Wednesday, October 23, 2013 5:02 AM, Thierry Reding wrote:
> > > On Tue, Oct 22, 2013 at 05:34:45PM +0200, Jean-Christophe PLAGNIO=
L-
VILLARD wrote:
> > > > On 09:23 Tue 22 Oct     , Thierry Reding wrote:
> > > > > On Tue, Oct 22, 2013 at 06:58:33AM +0200, Jean-Christophe PLA=
GNIOL-
VILLARD wrote:
> > > > > > On 11:13 Mon 21 Oct     , Denis Carikli wrote:
> > > > > > > Cc: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>
> > > > > > > Cc: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > > > > > > Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> > > > > > > Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> > > > > > > Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> > > > > > > Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> > > > > > > Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> > > > > > > Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> > > > > > > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > > > > > > Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > > > > > > Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > > > > > > Cc: Lothar Wa=DFmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
> > > > > > > Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.c=
om>
> > > > > > > Cc: Eric B=E9nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
> > > > > > > Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
> > > > > > > ---
> > > > > > > ChangeLog v3->v4:
> > > > > > > - The default-brightness property is now optional, it def=
aults
> > > > > > > to 1 if not set.> > > > >=20
> > > > > > by default we set OFF not ON
> > > > > >=20
> > > > > > do not actiate driver or properti by default you can not kn=
own to
> > > > > > consequence on the hw
> > > > >=20
> > > > > Turning on a backlight by default is what pretty much every
> > > > > backlight driver does. I personally think that's the wrong de=
fault,
> > > > > I even tried to get some discussion started recently about ho=
w we
> > > > > could change this. However, given that this has been the case=
 for
> > > > > possibly as long as the subsystem has existed, suddenly chang=
ing it
> > > > > might cause quite a few of our users to boot the new kernel a=
nd not
> > > > > see their display come up. As with any other ABI, this isn't
> > > > > something we can just change without a very good migration pa=
th.
> > > >=20
> > > > I'm sorry but the blacklight descibe in DT have nothing to do w=
ith the
> > > > common pratice that the current driver have today
> > >=20
> > > That's not at all what I said. What I said was that the majority =
of
> > > backlight drivers currently default to turning the backlight on w=
hen
> > > probed. Therefore I think it would be consistent if this driver d=
id the
> > > same.
> > >=20
> > > I also said that I don't think it's a very good default, but at t=
he same
> > > time we can't just go and change the default behaviour at will be=
cause
> > > people may rely on it.
> >=20
> > I agree with your opinion.
> > But, I can't decide how to change it.
>=20
> One solution that Stephen proposed was to make all DT-based setups us=
e a
> new default (off). An advantage of that is that such setups are still=

> fairly actively being worked on, so we can probably get early adopter=
s
> to cope with the new default.
>=20
> Looking through some DTS files it seems that many use the pwm-backlig=
ht
> driver. So if we can get some concensus from all the users that chang=
ing
> the default would be okay, then I think we could reasonably change it=
.
>=20
> Another solution perhaps would be to add a property to DT which encod=
es
> the default state of the backlight on boot. This used to be impossibl=
e
> because the general concensus was that DT should describe hardware on=
ly
> and not software policy. During the kernel summit this requirement wa=
s
> somewhat relaxed and it should now be okay to describe system
> configuration data, and I think this would be a good match. If the
> system is designed to keep the backlight off by default because some
> other component (display panel driver) is meant to turn it on later,
> that's system configuration data, right?
>=20
> Perhaps a boolean property could be used:
>=20
> =09backlight {
> =09=09compatible =3D "pwm-backlight";
>=20
> =09=09...
>=20
> =09=09backlight-default-off;
> =09};
>=20
> > > > put on by default if wrong specially without the property defin=
e. Even
> > > > put it on by default it wrong as the bootloader may have set it=

> > > > already for splash screen and to avoid glitch the drivers need =
to
> > > > detect this.
> > >=20
> > > I agree that would be preferable, but I don't know of any way to =
detect
> > > what value the bootloader set a GPIO to. The GPIO API requires th=
at you
> > > call gpio_direction_output(), and that requires a value parameter=
 which
> > > will be used as the output level of the GPIO.
> >=20
> > Jean-Christophe's point is right.
> >=20
> > We may need to discuss 'the way to detect what value the bootloader=

> > set a GPIO to'.
>=20
> Since some GPIO hardware simply can't do it, I guess we could resolve=
 to
> passing such information via DT. That obviously won't work for non-DT=

> setups, but I guess that's something we could live with.

For what it's worth, the pcf857x GPIO controllers suffer from this prob=
lem,=20
and the solution was to use a DT property to specify the initial GPIOs =
state.=20
The driver can thus implement gpio_get_value() properly and the hardwar=
e=20
limitation is hidden from the clients.

https://lkml.org/lkml/2013/9/21/105

> One possibility would be to supplement the backlight-default-off prop=
erty
> with another property (backlight-boot-on) that can be passed on to th=
e
> kernel from the bootloader to signal that it has turned the backlight=
 on.

--=20
Regards,

Laurent Pinchart

--nextPart2565113.6EJJvi0Muc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAABAgAGBQJSeYiJAAoJEIkPb2GL7hl1OhsIAKagiR33+6pDQ/DNyV8uCyB7
ofgz71cfJ7Oiinq+5ayX9hKpTgcbJOrGm3937oW3v5l59syAzgSbnHGRNBJ4+Au1
t3p5e7xd9+73GFFM1VS+FK6wO2/cP4Nxs8YZo9A6/gtM8qP/wcg1IFP3lHaW0Orj
fYmhL8n302AkfW3U0368/6SoAQ0QxtgzZpmeWRmGDg7GoBzP7EsC4YikAkza0bPv
d7fcgy2SDeU279UcflisG+8O4iGsZ45JmJYLyYblK08r74aqwTeHhDMMLjl1d2Tx
ayt8crumi94eE8lgigRUB6IwlaNBMYv0FzjTkpIFl9ehsbu66ZoCUHBHonMFGgc=
=+gIQ
-----END PGP SIGNATURE-----

--nextPart2565113.6EJJvi0Muc--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
