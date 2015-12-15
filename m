From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 3/5] soc: rockchip: add reboot notifier driver
Date: Tue, 15 Dec 2015 17:31:22 +0100
Message-ID: <20151215163120.GA24031@ulmo.nvidia.com>
References: <1447840044-19689-1-git-send-email-andy.yan@rock-chips.com>
 <1447840582-19850-1-git-send-email-andy.yan@rock-chips.com>
 <10162108.nOThMrrbdf@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <10162108.nOThMrrbdf@wuerfel>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, benchan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org, john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 14, 2015 at 12:39:44PM +0100, Arnd Bergmann wrote:
> On Wednesday 18 November 2015 17:56:22 Andy Yan wrote:
> > rockchip platform have a protocol to pass the kernel reboot
> > mode to bootloader by some special registers when system reboot.
> > By this way the bootloader can take different action according
> > to the different kernel reboot mode, for example, command
> > "reboot loader" will reboot the board to rockusb mode, this is
> > a very convenient way to get the board enter download mode.
> >=20
> > Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>=20
> Adding John Stultz to Cc
>=20
> I just saw this thread pop up again, and had to think of John's recent
> patch to unify this across platforms.
>=20
> John, can you have a look at this driver too, and see how it fits in?
> I think this is yet another variant, using an MMIO register rather than
> RAM (as HTC / NVIDIA does) or SRAM (as Qualcomm does), but otherwise
> it conceptually fits in with what you had.

FWIW, Tegra typically does use an MMIO register as well. See
drivers/soc/tegra/pmc.c:tegra_pmc_restart_notify(). I don't know what
HTC does, but if it's writing somewhere in RAM it isn't using the
standard way of resetting the SoC. There's early boot ROM code which I
think evaluates the PMC_SCRATCH0 register on Tegra to determine which
mode to boot into. That's before even any firmware gets the chance of
doing anything.

Thierry

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWcEBPAAoJEN0jrNd/PrOhyhEP/iy5j+2TS4spEL8am4wV0SJl
SsEcvSbq9Sthn6CVQhvm1zyuNqaoNqf0RnVD4zbtSSXDcxScUNub35SuwHMUo44x
glsVstv92aZOULRjX6eqWOJHJ34DlFYohBnn/15j6Ze8XxFHoB6t01djRoq44B6T
KZZIKWOXAI2M5Lqlr+PXef5GP8Y+/VKtLGanAcZ8pFRf8ITWNJo9j8Pc7sOHcwMq
e1lPoIqH4FcWGc0zN2dnta4OwwoTi6IxOBKvjCbcDKrxKtjwk3MI/Dt/fZeyvSD+
RAWrwOIRUY7slvYMZW1IxpNxZUlpIMy6h0rGnDt43afeEiRrzMLG3OGxaXecFyXt
ubGVfcKxh3mcc8+XaY7KpxP8nGOKNZZHirMItjBKvBkEU5upuNtwpUmZvJ78reD8
OJKQ1Cu9J4VH4k4F/tYJ3aQK9yOZSO0WZyPPHcVm1d1HhwVStjxsNaBHqcOPUWpT
4tYDoh41KQKK0kNa8SVSRi4aFIgvqGNUrcuYlAB0U2kKHLIfSDlL2ewLdRH6tHx9
f53ssN5rGVl+CheEkvzJKGMNyzI73il0COJNDY9VbDJBvcI4ayNZLprghNsIeo9K
5Oppqh+xXfiXr0Dmiim3m9pcnJIuIzWML0+vGNlllu7URNmFha8tsPjn8oFUHqLX
qSXX3s+8R/mTDCEPy+FY
=RRZ0
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
