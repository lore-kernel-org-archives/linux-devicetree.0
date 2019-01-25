From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] r8169: Load MAC address from device tree if present
Date: Fri, 25 Jan 2019 16:33:10 +0100
Message-ID: <20190125153310.GA30990@ulmo>
References: <20190125101814.6262-1-thierry.reding@gmail.com>
 <20190125145711.GF12962@lunn.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190125145711.GF12962@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>, Realtek linux nic maintainers <nic_swsd@realtek.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 25, 2019 at 03:57:11PM +0100, Andrew Lunn wrote:
> On Fri, Jan 25, 2019 at 11:18:14AM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > If the system was booted using a device tree and if the device tree
> > contains a MAC address, use it instead of reading one from the EEPROM.
> > This is useful in situations where the EEPROM isn't properly programmed
> > or where the firmware wants to override the existing MAC address.
> >=20
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
> > +static void rtl_read_mac_address(struct rtl8169_private *tp,
> > +				 u8 mac_addr[ETH_ALEN])
> > +{
> > +	/* Get MAC address */
> > +	switch (tp->mac_version) {
> > +	case RTL_GIGA_MAC_VER_35 ... RTL_GIGA_MAC_VER_38:
> > +	case RTL_GIGA_MAC_VER_40 ... RTL_GIGA_MAC_VER_51:
> > +		*(u32 *)&mac_addr[0] =3D rtl_eri_read(tp, 0xe0, ERIAR_EXGMAC);
> > +		*(u16 *)&mac_addr[4] =3D rtl_eri_read(tp, 0xe4, ERIAR_EXGMAC);
> > +		break;
> > +	default:
> > +		break;
> > +	}
> > +}
> > +
> >  DECLARE_RTL_COND(rtl_link_list_ready_cond)
> >  {
> >  	return RTL_R8(tp, MCU) & LINK_LIST_RDY;
> > @@ -7148,6 +7163,7 @@ static int rtl_get_ether_clk(struct rtl8169_priva=
te *tp)
> >  static int rtl_init_one(struct pci_dev *pdev, const struct pci_device_=
id *ent)
> >  {
> >  	const struct rtl_cfg_info *cfg =3D rtl_cfg_infos + ent->driver_data;
> > +	u8 mac_addr[ETH_ALEN] __aligned(4);
>=20
> Hi Thierry
>=20
> Maybe now would be a good time to cleanup this __aligned(4), pointer
> aliasing, etc?

Are you proposing that I rewrite rtl_read_mac_address() to manually
extract bytes from each register read? Something along these lines:

	value =3D rtl_eri_read(tp, 0xe0, ERIAR_EXGMAC);
	mac_addr[0] =3D (value >>  0) & 0xff;
	mac_addr[1] =3D (value >>  8) & 0xff;
	mac_addr[2] =3D (value >> 16) & 0xff;
	mac_addr[3] =3D (value >> 24) & 0xff;

	value =3D rtl_eri_read(tp, 0xe4 ERIAR_EXGMAC);
	mac_addr[4] =3D (value >>  0) & 0xff;
	mac_addr[5] =3D (value >>  8) & 0xff;

Looks like maybe that should be a separate patch?

>=20
> > +	/* get MAC address */
> > +	if (eth_platform_get_mac_address(&pdev->dev, mac_addr))
> > +		rtl_read_mac_address(tp, mac_addr);
> > +
>=20
> Maybe that could be made more readable with:
>=20
>       err =3D eth_platform_get_mac_address(&pdev->dev, mac_addr);
>       if (err)
>       	 	rtl_read_mac_address(tp, mac_addr);

I was following the same pattern that other drivers were, but I can
change to the above if you prefer.

Thanks,
Thierry

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxLLDEACgkQ3SOs138+
s6FADQ//bIJRLjuvqMg1gqSqCK/Lze06PFPhtnRYtXQyAqo3YqblXqbgyyUWxg5Z
UivTex/Jou2z7nHnfc0v5l3zmqG1TzovaLh6F8H2JBZXrIALm2xnycI6kdv+R8EP
0+pAS7J0sDHxUmygDeLiLT1ufDvoOnMyPKEAVThPexEX9VqlJze1cqG7ecV8BcBv
k1HSzZckrgPn/rOD8s2yBFU8cjs3fW61yyxR6ME6g3pjz/1gew2uiG+bytOjmuYp
44K3woMqjoO9PTUqdmpaKIeTNnVcwQwzwZzLC78TUA/kRnD75Ny7rmOKf4UvyazL
SD6YDW8J2iGdhyrS+ZZL9sV+RNbHFxC7lDidple8ZCBo0QJXl3kaZKwnqbqbHau2
xGOF2RXYD8PZMfwcOXzQpfgn9hsqEk6veq0tLS8CNm6CPBknGYu2iySZiohZesQ0
ftb/RMCk6ecRw0vAH2RZlXpBNKx9lgeUTSjtfdBXapyp5CeFT1HMBxjCb1SxHKoN
mpRCcEHDBBQJTcIQssADZQWYUsA3wwEKJqKsN94xMqdVWnkSnQbgGTkCsscl3SJJ
pu5k2YPf1c1xs3iVhY3QZUjspYg0WZTlFDommfbaL0RkuY2Y4qrW9OF1z2X+XC9K
Nhvf/poV/3syJTsNfClsK08Cnb2GdqfGyBGlG599L7C+pvS/aEQ=
=bENl
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--
