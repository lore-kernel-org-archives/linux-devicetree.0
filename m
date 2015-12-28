From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 3/5] soc: rockchip: add reboot notifier driver
Date: Mon, 28 Dec 2015 10:20:56 +0100
Message-ID: <20151228092054.GA29195@ulmo.nvidia.com>
References: <1447840044-19689-1-git-send-email-andy.yan@rock-chips.com>
 <3759218.6sItdW65UG@wuerfel>
 <20151215174234.GB24031@ulmo.nvidia.com>
 <15127971.1juVbocOjP@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <15127971.1juVbocOjP@wuerfel>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, benchan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org, john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 15, 2015 at 09:38:41PM +0100, Arnd Bergmann wrote:
> On Tuesday 15 December 2015 18:42:36 Thierry Reding wrote:
> > On Tue, Dec 15, 2015 at 05:34:00PM +0100, Arnd Bergmann wrote:
> > > On Tuesday 15 December 2015 17:31:22 Thierry Reding wrote:
> > > > On Mon, Dec 14, 2015 at 12:39:44PM +0100, Arnd Bergmann wrote:
> > > > > On Wednesday 18 November 2015 17:56:22 Andy Yan wrote:
> > > > > > rockchip platform have a protocol to pass the kernel reboot
> > > > > > mode to bootloader by some special registers when system reboot.
> > > > > > By this way the bootloader can take different action according
> > > > > > to the different kernel reboot mode, for example, command
> > > > > > "reboot loader" will reboot the board to rockusb mode, this is
> > > > > > a very convenient way to get the board enter download mode.
> > > > > >=20
> > > > > > Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> > > > >=20
> > > > > Adding John Stultz to Cc
> > > > >=20
> > > > > I just saw this thread pop up again, and had to think of John's r=
ecent
> > > > > patch to unify this across platforms.
> > > > >=20
> > > > > John, can you have a look at this driver too, and see how it fits=
 in?
> > > > > I think this is yet another variant, using an MMIO register rathe=
r than
> > > > > RAM (as HTC / NVIDIA does) or SRAM (as Qualcomm does), but otherw=
ise
> > > > > it conceptually fits in with what you had.
> > > >=20
> > > > FWIW, Tegra typically does use an MMIO register as well. See
> > > > drivers/soc/tegra/pmc.c:tegra_pmc_restart_notify(). I don't know wh=
at
> > > > HTC does, but if it's writing somewhere in RAM it isn't using the
> > > > standard way of resetting the SoC. There's early boot ROM code whic=
h I
> > > > think evaluates the PMC_SCRATCH0 register on Tegra to determine whi=
ch
> > > > mode to boot into. That's before even any firmware gets the chance =
of
> > > > doing anything.
>=20
>=20
> I just checked the android lollipop tree, and I could not find a pmc_rest=
art_notify
> function, only this file
>=20
> https://android.googlesource.com/kernel/tegra/+/android-tegra-flounder-3.=
10-lollipop-release/drivers/htc_debug/stability/reboot_params.c
>=20
> with the device that stores into RAM. It looks like HTC ported over
> a driver that they were already using on some Qualcomm MSM8960 device,
> as in=20
>=20
> https://gitlab.com/MaC/android_kernel_htc_msm8960/blob/859977fc723f59a6b7=
07df1d70e80826ee1dccc4/arch/arm/mach-msm/htc/htc_restart_handler.c
>=20
> On Android marshmallow (Flounder), that file again does not exist, and
> I don't see how it's done.
>=20
> > > HTC apparently uses a separate RAM area to pass the reboot reason,
> > > and they have a driver to store that, which is separate from the
> > > driver that they use for actually rebooting the machine.
> >=20
> > I wasn't very clear, but the PMC_SCRATCH0 register is used to store the
> > reset reason. It supports the recovery mode, which I think is really an
> > Android thing, "bootloader" will typically cause the bootloader not to
> > boot anything, and "forced-recovery" will go into a recovery mode that
> > is used to bootstrap the device (usually by uploading a "miniloader"
> > that initializes RAM, downloads a bootloader for booting or flashing an
> > operating system, ...).
> >=20
> > The write that resets the SoC is to a different register.
>=20
> So is this scratch register interpreted by some maskrom code, or by code =
that
> can be provided by the OEM?

My understanding is that its interpreted both by what's called BootROM
on Tegra (I guess that's what you call "maskrom code") and the system's
bootloader. The BootROM cannot typically be replaced by the OEM, but it
is quite typical for the bootloader to differ between devices.

The BootROM will interpret a subset of the bits in that register. Most
notable the "force recovery" bit. That will cause the BootROM to go into
a mode which can be used to bootstrap the device. It implements a simple
protocol (RCM) which can be used to upload a loader (usually referred to
as mini-loader) to the device's IRAM which in turn will initialize the
memory and which can download a proper bootloader (such as U-Boot) to
memory using a slightly more complex protocol (the standard protocol is
called nv3p, but the particular choice of protocol no longer matters at
this point).

The bootloader can also access this register and will interpret the
"bootloader" and "recovery" bits. On the, argueably small, sample of
Android devices I've worked with, the "bootloader" bit will make the
bootloader go into fastboot mode, whereas the "recovery" bit will make
it initiate the RCK mode, which is used to update through OTA.

There are a couple of other bits in this register, but they are badly
documented and don't seem to relate to reboot.

Thierry

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWgP7zAAoJEN0jrNd/PrOhlI4P/03Er2IxgO+HYCryV56gOEns
C+ZtGNlifSI7CsFivhzZ6YfY0fKS0c1jUk5cSm/kNkDpSyGveqkCFBMM8J5oN9vM
GxwQCVhzHfim5AXhMk4GOy6yaQDhy0SQC1hr1ZIQ03ApFDipCouY+kt/4tZQAIJ/
zdKMrhKviM+DGVpEF/ghgq1cdH2cn2uCU9Me7aw8P5umrt7jEAbSnifweWoz+USI
DUlGZLAas41PJgTR+8CZ7aTBOqI2v4tT9LJ3+6ymU2ijLdc8k9oAxtAThr8mjyT4
sdfk7GRNwRPVFIy6QzUHpUKnKhGj/8P9q2UT1LbJ9HrYUtntgkKS7T4WTXMSzv+s
GIEPDrDKOviJqM4fOUVKmCAF+nfMZ3UvjqKCVbbUuyqX4fUZw3pILN5lohduKZ/C
evOSiTO7AZtYvvgZ2pUAfBJPtvi1bgFkIpjNPkoYfzCY7jUH4n7Tdk8pkWiQ8wb3
g4+7P/Mvlxjb0g7JuRKQd4u3kFisUznKuipUk1ltuNEmlEltKeQ9IrpeM1tqard/
pbibakP73LfmZOmwF5pqeUHxKBXU7KvR57MeX4YqxjLjkAznombscySNitkGHJ6L
cjFTjtWJ3XhqbaC5sT7BBDjEX9nk8kB6Rekt59SDA9s0pl9omxC0R6nTvVDYmy8W
G97tuFeMlFM6+yp0pVUQ
=GkU8
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
