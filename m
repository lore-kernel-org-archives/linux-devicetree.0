From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v3 3/5] soc: rockchip: add reboot notifier driver
Date: Tue, 15 Dec 2015 18:42:36 +0100
Message-ID: <20151215174234.GB24031@ulmo.nvidia.com>
References: <1447840044-19689-1-git-send-email-andy.yan@rock-chips.com>
 <10162108.nOThMrrbdf@wuerfel>
 <20151215163120.GA24031@ulmo.nvidia.com>
 <3759218.6sItdW65UG@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s/l3CgOIzMHHjg/5"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3759218.6sItdW65UG@wuerfel>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>, heiko@sntech.de, linux-kernel@vger.kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, khilman@linaro.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, benchan@google.com, sjg@chromium.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, galak@codeaurora.org, wxt@rock-chips.com, john.stultz@linaro.org
List-Id: devicetree@vger.kernel.org

--s/l3CgOIzMHHjg/5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 15, 2015 at 05:34:00PM +0100, Arnd Bergmann wrote:
> On Tuesday 15 December 2015 17:31:22 Thierry Reding wrote:
> > On Mon, Dec 14, 2015 at 12:39:44PM +0100, Arnd Bergmann wrote:
> > > On Wednesday 18 November 2015 17:56:22 Andy Yan wrote:
> > > > rockchip platform have a protocol to pass the kernel reboot
> > > > mode to bootloader by some special registers when system reboot.
> > > > By this way the bootloader can take different action according
> > > > to the different kernel reboot mode, for example, command
> > > > "reboot loader" will reboot the board to rockusb mode, this is
> > > > a very convenient way to get the board enter download mode.
> > > >=20
> > > > Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> > >=20
> > > Adding John Stultz to Cc
> > >=20
> > > I just saw this thread pop up again, and had to think of John's recent
> > > patch to unify this across platforms.
> > >=20
> > > John, can you have a look at this driver too, and see how it fits in?
> > > I think this is yet another variant, using an MMIO register rather th=
an
> > > RAM (as HTC / NVIDIA does) or SRAM (as Qualcomm does), but otherwise
> > > it conceptually fits in with what you had.
> >=20
> > FWIW, Tegra typically does use an MMIO register as well. See
> > drivers/soc/tegra/pmc.c:tegra_pmc_restart_notify(). I don't know what
> > HTC does, but if it's writing somewhere in RAM it isn't using the
> > standard way of resetting the SoC. There's early boot ROM code which I
> > think evaluates the PMC_SCRATCH0 register on Tegra to determine which
> > mode to boot into. That's before even any firmware gets the chance of
> > doing anything.
>=20
> HTC apparently uses a separate RAM area to pass the reboot reason,
> and they have a driver to store that, which is separate from the
> driver that they use for actually rebooting the machine.

I wasn't very clear, but the PMC_SCRATCH0 register is used to store the
reset reason. It supports the recovery mode, which I think is really an
Android thing, "bootloader" will typically cause the bootloader not to
boot anything, and "forced-recovery" will go into a recovery mode that
is used to bootstrap the device (usually by uploading a "miniloader"
that initializes RAM, downloads a bootloader for booting or flashing an
operating system, ...).

The write that resets the SoC is to a different register.

Thierry

--s/l3CgOIzMHHjg/5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWcFEIAAoJEN0jrNd/PrOhwi8P/3n869TLbLoqgZOwDJky+2QS
5Z0dy8nREw6Fi33SoT6NRopEPAqylnlKz9J5TOx6zzc86McKEJ6j5By0FaSrZreb
H2rsMvtYTrfhb78IQLVwTjsF4CpO5vwWsQYy6uz2yZuZV6WxZgg1wmc98ycJ1pX0
6LorEOJF80xjGVN1gNtZ0/ZXGirNqDoou7tEOTB/b2BXFApUhECdeEHOeFbnjyrm
+kgtjbR8att97U26wSuWt0wy5btKUG94W3/q6eLRVd0Pd951MS6jhON31ff5GYjA
lUsSI25EQAnN13kNuqhAZfFET5iltyl2Z5B3yEbdp+AWLswFURgCdX8ULXIMmQoP
rJarA3Uh+PH3zwkhrJlFqHOCsat3tZXGOdiF7HndaqxpjHPvrKnyF2u5FeiKeid1
Zv9U4/I0CJp+VfhsY+mCFww5ohKkJaXRBcaUBFO9OPTCg3m6syzHqEqRzD4HfgbT
t8FaPEIvXrLxwwhs2LVCEIzhFkFgUyMhApSmtk9m2QHXsVUYCdO/R06WDZ+2mkOs
sBmvGRMV7/BwekgPR8YBZX4dEdZXrBZMQS5uKhrBOhkfYhxt80yXQ88j/w3j8VhU
dN/yk7onDUERrbKC7CgMQWtMEljrD2RxeiAS+FF1e7sThaeq5kZGdY6fEeZwngEw
mhqEQufri+71nSpvgZNi
=hN3U
-----END PGP SIGNATURE-----

--s/l3CgOIzMHHjg/5--
