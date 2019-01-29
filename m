From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] r8169: Load MAC address from device tree if present
Date: Tue, 29 Jan 2019 18:40:35 +0100
Message-ID: <20190129174035.GA25929@ulmo>
References: <20190125101814.6262-1-thierry.reding@gmail.com>
 <59aa73fd-9cdc-8db8-b58e-ed106b084637@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <59aa73fd-9cdc-8db8-b58e-ed106b084637@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Realtek linux nic maintainers <nic_swsd@realtek.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 25, 2019 at 07:34:31PM +0100, Heiner Kallweit wrote:
> On 25.01.2019 11:18, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > If the system was booted using a device tree and if the device tree
> > contains a MAC address, use it instead of reading one from the EEPROM.
> > This is useful in situations where the EEPROM isn't properly programmed
> > or where the firmware wants to override the existing MAC address.
> >=20
> I rarely see DT-configured boards with RTL8168 network. Do you add this
> patch because of a specific board?
> And you state "if EEPROM isn't properly programmed": Did you come across
> such a case?

We use these Realtek chips on some of our boards that customers can
either purchase individually and integrate into their own designs or
they can get the module as part of a product.

In order to easily allow customers to reprogram the device (they may
want to do that if integrating the module into their own products), a
so-called ID EEPROM is part of the module that stores various bits of
information. The ethernet MAC address is part of that EEPROM.

Typically the ID EEPROM will contain a valid MAC address if the module
is part of a product, but if customers purchase the module individually,
it is expected that they use a MAC address from their own pool.

Typically early boot firmware will load the MAC address from the EEPROM
and store it in the ethernet device's device tree node so that the MAC
address programmed into the ID EEPROM will be used by the ethernet
device at runtime.

> In general the patch is fine with me, I just want to understand the
> motivation. One further comment see inline.
> As of today we already have the option to set a MAC from userspace
> via ethtool.
>=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > Based on net-next.
> >=20
> >  drivers/net/ethernet/realtek/r8169.c | 35 +++++++++++++++++-----------
> >  1 file changed, 22 insertions(+), 13 deletions(-)
> >=20
> > diff --git a/drivers/net/ethernet/realtek/r8169.c b/drivers/net/etherne=
t/realtek/r8169.c
> > index f574b6b557f9..fd9edd643ca5 100644
> > --- a/drivers/net/ethernet/realtek/r8169.c
> > +++ b/drivers/net/ethernet/realtek/r8169.c
> > @@ -6957,6 +6957,21 @@ static int rtl_alloc_irq(struct rtl8169_private =
*tp)
> >  	return pci_alloc_irq_vectors(tp->pci_dev, 1, 1, flags);
> >  }
> > =20
> [...]
> > @@ -7252,20 +7268,13 @@ static int rtl_init_one(struct pci_dev *pdev, c=
onst struct pci_device_id *ent)
> >  	u64_stats_init(&tp->rx_stats.syncp);
> >  	u64_stats_init(&tp->tx_stats.syncp);
> > =20
> > -	/* Get MAC address */
> > -	switch (tp->mac_version) {
> > -		u8 mac_addr[ETH_ALEN] __aligned(4);
> > -	case RTL_GIGA_MAC_VER_35 ... RTL_GIGA_MAC_VER_38:
> > -	case RTL_GIGA_MAC_VER_40 ... RTL_GIGA_MAC_VER_51:
> > -		*(u32 *)&mac_addr[0] =3D rtl_eri_read(tp, 0xe0, ERIAR_EXGMAC);
> > -		*(u16 *)&mac_addr[4] =3D rtl_eri_read(tp, 0xe4, ERIAR_EXGMAC);
> > +	/* get MAC address */
> > +	if (eth_platform_get_mac_address(&pdev->dev, mac_addr))
> > +		rtl_read_mac_address(tp, mac_addr);
> > +
> > +	if (is_valid_ether_addr(mac_addr))
>=20
> Here array mac_addr may be uninitialized (if platform defines no MAC
> and chip version is not covered by the switch statement).

Good point. I can memset() mac_addr to make sure it is invalid, rather
than undefined, for chip versions that are not covered.

Thierry

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxQkBAACgkQ3SOs138+
s6GvkQ/7BEyMdMJpuYhqNU7g/U6ExGOPKKa+OJJoECaCreF4Wyg9i3rWiaY2ST7q
1Py9vinh+EjEF/uMpkCCLTBB6UbA92aqWcI7d27GA+VV88yEWaQxHcty0/j5k2dX
w7Bcip/Z/Tmul63WdFsdPrQmNvrrXV4NU51uXRlGj8zRK6GXobmZGzroH4rEXa+b
3hvD1mT6htpGtGqet4VryDFW4+COVuMOycT4ABF/5vyn9g/Pe9C/9j+rPC7LXowR
spVeLudHgIApYmdASpIBv73LiOZpVEpmgIOqhDNNvyeu1HMh+yU5fLRGTFKnMZ9B
wvcjTaESNtX6yoEFi9a/HxdwGrUMqAbLtJ4s2CiNo7R4AvjM1JOweKP4QtTtRwIj
LYO0UaOTQHhkpi4+kTitPZj5RCbei3PS/WQ7hZX34rcaM0xkYapm3mpxhhPUPnnq
j7OHGMKvQFEHhkjI1a4icY8IRIURTRHWNgBfBg/r1ZKG4eO4eoF490bs5qDN/an5
uRKBUVcENhYN270gD0tcnoL7HPmqNkIFjpr3PiVyXrrGBsV80avdhTFpwqQMoLCE
1Tx78ezmmjlL9df07n8bixLhVeR2yneyo5FK4C+rtO9BQihvSZOxndoVQmnODoFC
krw0pnPN2ReR2BKIj9Vhq3FgqT7DPiPSLn9B9N+wfJn7lF92Gh4=
=OR3H
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
