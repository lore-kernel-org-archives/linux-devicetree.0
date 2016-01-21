From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 3/5] soc: rockchip: add reboot notifier driver
Date: Thu, 21 Jan 2016 17:20:37 +0100
Message-ID: <20160121162035.GG647@ulmo.nvidia.com>
References: <1447840044-19689-1-git-send-email-andy.yan@rock-chips.com>
 <15127971.1juVbocOjP@wuerfel>
 <20151228092054.GA29195@ulmo.nvidia.com>
 <2250962.OgUpqMgY4k@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ulDeV4rPMk/y39in"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2250962.OgUpqMgY4k@wuerfel>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, benchan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org, john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

--ulDeV4rPMk/y39in
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 28, 2015 at 04:35:46PM +0100, Arnd Bergmann wrote:
> On Monday 28 December 2015 10:20:56 Thierry Reding wrote:
> > > > > HTC apparently uses a separate RAM area to pass the reboot reason,
> > > > > and they have a driver to store that, which is separate from the
> > > > > driver that they use for actually rebooting the machine.
> > > >=20
> > > > I wasn't very clear, but the PMC_SCRATCH0 register is used to store=
 the
> > > > reset reason. It supports the recovery mode, which I think is reall=
y an
> > > > Android thing, "bootloader" will typically cause the bootloader not=
 to
> > > > boot anything, and "forced-recovery" will go into a recovery mode t=
hat
> > > > is used to bootstrap the device (usually by uploading a "miniloader"
> > > > that initializes RAM, downloads a bootloader for booting or flashin=
g an
> > > > operating system, ...).
> > > >=20
> > > > The write that resets the SoC is to a different register.
> > >=20
> > > So is this scratch register interpreted by some maskrom code, or by c=
ode that
> > > can be provided by the OEM?
> >=20
> > My understanding is that its interpreted both by what's called BootROM
> > on Tegra (I guess that's what you call "maskrom code") and the system's
> > bootloader. The BootROM cannot typically be replaced by the OEM, but it
> > is quite typical for the bootloader to differ between devices.
>=20
> Ok, so not maskrom (which would not be OEM specific, but hardcoded for
> the chip) but rather some form of PROM. This means we can only guess
> that all OEMs use the same protocol but in theory someone could have
> implemented an incompatible BootROM, but it's also possible that HTC
> just ignore the register entirely and implement the same thing separately.

I wasn't being clear, the BootROM is hardcoded for the chip, I'm not
aware of a way to replace it once the chip's taped out.

Thierry

--ulDeV4rPMk/y39in
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWoQVTAAoJEN0jrNd/PrOhrTUQAJ6jgKk7HnaFcXXrFjxoSrUA
Oswvi3LQav1rsFNVKp3vC/NUkdgZJVcl2Qr8AluGtJFvCqZxI0AQfCbuNbEtB/dq
Fa/wPTenfl0eWJkSyUdxkW6OWkSqMobxZ4pXkJ+saW3ixjLs0/2mArsh1/RjPC3b
lgIfII5j8rxRIZi8RdSiPzPIWc1+w+3bZhkhW52qpmd9q4o7yrhbzRofNDevDg39
ELkTPUmm1FyEwTYDbQ9rc7YY/1Nx3rBOTEct0Y76sU0OdRbeykNkJYlNZkL47/E3
omR2V+9LEMUVIOuEyG0iOzaKmBU0VtO5v5LSqbduRirwX196pSlSBR9A9xqnaa1q
5ha3aKIbVaeRKSSE0xCAoJJyyXKuclOgEvvla10HsgBuI0V3zzFbJJFCjN+o146c
eos5VvmakQrbam+kwVyARuME8RCIS/1C6Xbq/wYACFHAtYA0oleLUe/7W2ZgTEoE
bojfEI8saWOTgML6IQq+lpHQQZSKBodv7EJN5YkGkn4L9kn5je7NXUp2YRtWp6ow
gjNL7qhqgfc66wOqHuXJmsiUwZ1eZM1RgHTzmgAFrksH/9xbVLI5cpuhxVhNNX8N
pB9JqSEuzqC0idU0hwhVebxnIfWYT5J2FWOkfFcYhz8V1uv+bT+4xUkkw8Ys73ww
qoLvb0VT53+agu6EIYD1
=GaH6
-----END PGP SIGNATURE-----

--ulDeV4rPMk/y39in--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
