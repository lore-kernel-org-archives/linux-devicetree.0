From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: rockchip: temporarily remove emmc hs200
 speed from rk3288-veyron-speedy.
Date: Tue, 18 Oct 2016 23:00:17 +0200
Message-ID: <1476824417.1031.9.camel@paulk.fr>
References: <87twd1vzc5.fsf@aikidev.net> <1476647383.3885.3.camel@paulk.fr>
         <12872023.2LumKfgYDl@diego>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-O6XpYNzikBBJ8mkdYEn2"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <12872023.2LumKfgYDl@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vagrant Cascadian <vagrantc-LkDtOWtB3X7R7s880joybQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--=-O6XpYNzikBBJ8mkdYEn2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 18 octobre 2016 =C3=A0 11:21 +0200, Heiko St=C3=BCbner a =C3=A9cri=
t=C2=A0:
> Am Sonntag, 16. Oktober 2016, 21:49:43 schrieb Paul Kocialkowski:
> >=20
> > Hi,
> >=20
> > Le mardi 27 septembre 2016 =C3=A0 13:53 -0700, Vagrant Cascadian a =C3=
=A9crit :
> > >=20
> > > This essentially mimics what was done with rk3288-veyron-minnie in
> > > commit 984926781122f034d5bc9962815d135b6c4a8e1d.
> > >=20
> > > The eMMC of the speedy Chromebook also appears to need the same tunin=
g
> > > workaround, as it frequently fails to recognize the eMMC without it.
> >=20
> > I have a device where (without this patch) eMMC sometimes fails, with:
> > [=C2=A0=C2=A0=C2=A0=C2=A03.561010] dwmmc_rockchip ff0f0000.dwmmc: Succe=
ssfully tuned phase to
> > 175 [=C2=A0=C2=A0=C2=A0=C2=A03.571742] mmc2: new HS200 MMC card at addr=
ess 0001
> > [=C2=A0=C2=A0=C2=A0=C2=A03.571943] mmcblk2: mmc2:0001 HAG2e 14.7 GiB=C2=
=A0
> > [=C2=A0=C2=A0=C2=A0=C2=A03.572026] mmcblk2boot0: mmc2:0001 HAG2e partit=
ion 1 4.00 MiB
> > [=C2=A0=C2=A0=C2=A0=C2=A03.572107] mmcblk2boot1: mmc2:0001 HAG2e partit=
ion 2 4.00 MiB
> > [=C2=A0=C2=A0=C2=A0=C2=A03.572181] mmcblk2rpmb: mmc2:0001 HAG2e partiti=
on 3 4.00 MiB
> > [=C2=A0=C2=A0=C2=A0=C2=A03.685647] mmcblk2: error -110 transferring dat=
a, sector 0, nr 8, cmd
> > response 0x900, card status 0x0
> >=20
> > And sometimes works, with:
> > [=C2=A0=C2=A0=C2=A0=C2=A03.451058] dwmmc_rockchip ff0f0000.dwmmc: Succe=
ssfully tuned phase to
> > 176 [=C2=A0=C2=A0=C2=A0=C2=A03.491093] mmc2: new HS200 MMC card at addr=
ess 0001
> > [=C2=A0=C2=A0=C2=A0=C2=A03.491277] mmcblk2: mmc2:0001 HAG2e 14.7 GiB=C2=
=A0
> > [=C2=A0=C2=A0=C2=A0=C2=A03.491345] mmcblk2boot0: mmc2:0001 HAG2e partit=
ion 1 4.00 MiB
> > [=C2=A0=C2=A0=C2=A0=C2=A03.491409] mmcblk2boot1: mmc2:0001 HAG2e partit=
ion 2 4.00 MiB
> > [=C2=A0=C2=A0=C2=A0=C2=A03.491474] mmcblk2rpmb: mmc2:0001 HAG2e partiti=
on 3 4.00 MiB
> > [=C2=A0=C2=A0=C2=A0=C2=A03.493548]=C2=A0=C2=A0mmcblk2: p1 p2
> >=20
> > However, with this change, it always fails, with:
> > [=C2=A0=C2=A0=C2=A0=C2=A03.322129] mmc_host mmc2: Bus speed (slot 0) =
=3D 50000000Hz (slot req
> > 52000000Hz, actual 50000000HZ div =3D 0) [=C2=A0=C2=A0=C2=A0=C2=A03.333=
174] mmc2: error -110
> > whilst initialising MMC card
> >=20
> > I don't have so much time to investigate this issue, but it's clear tha=
t
> > this patch doesn't fix the issue (and actually worsens it) for my devic=
e.
>=20
> thanks for the heads up.
>=20
> As discussed on IRC we now have varying reports of the emmc working or no=
t=C2=A0
> working with and without that patch applied. So it's not really a bandaid=
 fix=C2=A0
> and I've thus dropped this patch again.

Thanks for dropping it! For the record, my eMMC shows up as:
mmcblk2: mmc2:0001 HAG2e 14.7 GiB

Maybe it could help to share what each tested device reports as eMMC model =
and
associate that with the current behavior, in spite of getting a clearer ide=
a of
what issue affects what model.

> Still hoping someone will find the source of the problem somewhere :-)

I have started investigating the issue, but did not discover anything
significant yet. I hope I'll be able to figure it out!

Cheers!

--=20
Paul Kocialkowski, developer of free digital technology at the lower levels

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/
--=-O6XpYNzikBBJ8mkdYEn2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYBo1hAAoJEIT9weqP7pUMgxcP/j7IdADdPaBHsLxZLt9/Dfrw
4gfOpGx4+2qCGVd9QvRXD6xpM50nlXUMeqC15qn/JJvkCKxvVS92OTMl8ppf0QAO
uB5Uk4UQ+bYya277GsSioseYAMjNM+2mK1cP+eWvKl49pECWojTGBLMLO2j2CPWw
dmEa3FjdqE9mCRgRLHn5BXq7DjWnt9xzKqjgruLWj2hJ3yk4u9zaSigC/NzaquLj
V7U939U/dKKgtdopGlifqxSAVhHFBwjO6/zFGyZkCVX2xvYPU+VCREYfAcBHxsO8
L/111zbM7TQWReky5CoF0HQM+MWvgI3LRbEwZX17oK+mh9btXOoYzl0yWy5pIXc+
BjJOuLBcytinWMGfxrt/h6huomEjp1DgdZ2oJFDAYtZcZc362NVqfx4g8hyomJdG
iI9xIuvwRkFvGYN+pCemXH6tBCgTeRVWPApmHqI+PV3RRzkROTcAilLQM2Jp0dEu
0lNLhwYh6cl8xk5Qp6soKOGoV7rkeogU425dMfjwc43AO/JhIwPqKMSGEqz9AMNV
O71d4ahF/hV9ZSLx6AvFIN1N4pYyNXt81liQ8VrI36fGYdpfk+01pve7oJqFwQBM
MAKcHXI6/RC47Wd0oInw8I7bq3kLl3upxwqjQazE9ITXdxQcTsQcC6voowsvRQZR
USLJGRhOSgooBdqvEfvp
=pxSl
-----END PGP SIGNATURE-----

--=-O6XpYNzikBBJ8mkdYEn2--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
