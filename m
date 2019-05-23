Return-Path: <SRS0=XkBP=TX=gmail.com=thierry.reding@kernel.org>
Date: Thu, 23 May 2019 12:01:20 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Patch V3 2/8] phy: tegra: xusb: t210: add usb3 port fake support
Message-ID: <20190523100120.GB30331@ulmo>
References: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
 <1557988772-15406-3-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QKdGvSO+nmPlgiQ/"
Content-Disposition: inline
In-Reply-To: <1557988772-15406-3-git-send-email-nkristam@nvidia.com>
To: Nagarjuna Kristam <nkristam@nvidia.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--QKdGvSO+nmPlgiQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2019 at 12:09:26PM +0530, Nagarjuna Kristam wrote:
> On Tegra210, usb2 only otg/peripheral ports dont work in device mode.
> They need an assosciated usb3 port to work in device mode. Identify
> an unused usb3 port and assign it as a fake USB3 port to USB2 only
> port whose mode is otg/peripheral.
>=20
> Based on work by BH Hsieh <bhsieh@nvidia.com>.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>  drivers/phy/tegra/xusb-tegra210.c | 56 +++++++++++++++++++++++++++++++
>  drivers/phy/tegra/xusb.c          | 69 +++++++++++++++++++++++++++++++++=
++++++
>  drivers/phy/tegra/xusb.h          |  2 ++
>  3 files changed, 127 insertions(+)
>=20
> diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-t=
egra210.c
> index 4beebcc..829aca5 100644
> --- a/drivers/phy/tegra/xusb-tegra210.c
> +++ b/drivers/phy/tegra/xusb-tegra210.c
> @@ -58,6 +58,7 @@
>  #define XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_SHIFT(x) ((x) * 5)
>  #define XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_MASK(x) (0x7 << ((x) * 5))
>  #define XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP(x, v) (((v) & 0x7) << ((x) * 5=
))
> +#define XUSB_PADCTL_SS_PORT_MAP_PORT_DISABLED 0x7
> =20
>  #define XUSB_PADCTL_ELPG_PROGRAM1 0x024
>  #define XUSB_PADCTL_ELPG_PROGRAM1_AUX_MUX_LP0_VCORE_DOWN (1 << 31)
> @@ -952,6 +953,34 @@ static int tegra210_usb2_phy_power_on(struct phy *ph=
y)
> =20
>  	priv =3D to_tegra210_xusb_padctl(padctl);
> =20
> +	if (port->usb3_port_fake !=3D -1) {
> +		value =3D padctl_readl(padctl, XUSB_PADCTL_SS_PORT_MAP);
> +		value &=3D ~XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_MASK(
> +					port->usb3_port_fake);
> +		value |=3D XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP(
> +					port->usb3_port_fake, index);
> +		padctl_writel(padctl, value, XUSB_PADCTL_SS_PORT_MAP);
> +
> +		value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
> +		value &=3D ~XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_VCORE_DOWN(
> +					port->usb3_port_fake);
> +		padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
> +
> +		usleep_range(100, 200);
> +
> +		value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
> +		value &=3D ~XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN_EARLY(
> +					port->usb3_port_fake);
> +		padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
> +
> +		usleep_range(100, 200);
> +
> +		value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
> +		value &=3D ~XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN(
> +					port->usb3_port_fake);
> +		padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
> +	}
> +
>  	value =3D padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL0);
>  	value &=3D ~((XUSB_PADCTL_USB2_BIAS_PAD_CTL0_HS_SQUELCH_LEVEL_MASK <<
>  		    XUSB_PADCTL_USB2_BIAS_PAD_CTL0_HS_SQUELCH_LEVEL_SHIFT) |
> @@ -1086,6 +1115,32 @@ static int tegra210_usb2_phy_power_off(struct phy =
*phy)
> =20
>  	mutex_lock(&padctl->lock);
> =20
> +	if (port->usb3_port_fake !=3D -1) {
> +		value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
> +		value |=3D XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN_EARLY(
> +					port->usb3_port_fake);
> +		padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
> +
> +		usleep_range(100, 200);
> +
> +		value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
> +		value |=3D XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN(
> +					port->usb3_port_fake);
> +		padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
> +
> +		usleep_range(250, 350);
> +
> +		value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
> +		value |=3D XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_VCORE_DOWN(
> +					port->usb3_port_fake);
> +		padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
> +
> +		value =3D padctl_readl(padctl, XUSB_PADCTL_SS_PORT_MAP);
> +		value |=3D XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP(port->usb3_port_fake,
> +					XUSB_PADCTL_SS_PORT_MAP_PORT_DISABLED);
> +		padctl_writel(padctl, value, XUSB_PADCTL_SS_PORT_MAP);
> +	}
> +
>  	if (WARN_ON(pad->enable =3D=3D 0))
>  		goto out;
> =20
> @@ -2051,6 +2106,7 @@ const struct tegra_xusb_padctl_soc tegra210_xusb_pa=
dctl_soc =3D {
>  		},
>  	},
>  	.ops =3D &tegra210_xusb_padctl_ops,
> +	.need_fake_usb3_port =3D true,
>  };
>  EXPORT_SYMBOL_GPL(tegra210_xusb_padctl_soc);
> =20
> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> index 0417213..6618db7 100644
> --- a/drivers/phy/tegra/xusb.c
> +++ b/drivers/phy/tegra/xusb.c
> @@ -808,9 +808,66 @@ static void __tegra_xusb_remove_ports(struct tegra_x=
usb_padctl *padctl)
>  	}
>  }
> =20
> +static int tegra_xusb_find_unused_usb3_port(struct tegra_xusb_padctl *pa=
dctl)
> +{
> +	struct device_node *np;
> +	unsigned int i;
> +
> +	for (i =3D 0; i < padctl->soc->ports.usb3.count; i++) {
> +		np =3D tegra_xusb_find_port_node(padctl, "usb3", i);
> +		if (!np || !of_device_is_available(np))
> +			return i;
> +	}
> +
> +	return -ENODEV;
> +}
> +
> +static bool tegra_xusb_usb3_port_has_companion(struct tegra_xusb_padctl =
*padctl,
> +							     unsigned int index)
> +{
> +	unsigned int i;
> +	struct tegra_xusb_usb3_port *usb3;
> +
> +	for (i =3D 0; i < padctl->soc->ports.usb3.count; i++) {
> +		usb3 =3D tegra_xusb_find_usb3_port(padctl, i);
> +		if (usb3 && usb3->port =3D=3D index)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static int tegra_xusb_update_usb3_fake_port(struct tegra_xusb_usb2_port =
*usb2)
> +{
> +	int fake;
> +
> +	/* Disable usb3_port_fake usage by default and assign if needed */
> +	usb2->usb3_port_fake =3D -1;
> +
> +	if ((usb2->mode =3D=3D USB_DR_MODE_OTG ||
> +	     usb2->mode =3D=3D USB_DR_MODE_PERIPHERAL) &&
> +		!tegra_xusb_usb3_port_has_companion(usb2->base.padctl,
> +						    usb2->base.index)) {

This port is still a bit confusing to me. It's not entirely obvious
what's going on here. What I think this is doing is this: for OTG or
peripheral USB 2.0 ports that are not companion ports themselves (i.e.
only standalone OTG/peripheral USB 2.0 ports) find an unused USB 3.0
port that can be used as fake for the hardware workaround.

Correct me if I'm wrong.

I find the tegra_xusb_usb3_port_has_companion() confusing in that case
because you seem to be testing a USB 3.0 port (_usb3_ in the function
name) for a USB 2.0 index (passed as second parameter). So what you're
basically trying to do is find a USB 3.0 port for which the USB 2.0 port
identified by the given index is a companion. It seems to me like that
would be a lot easier to understand if you did this:

	!tegra_xusb_usb2_port_is_companion(usb2)

with:

	static bool tegra_xusb_port_is_companion(struct tegra_xusb_usb2_port *port)
	{
		struct tegra_xusb_padctl *padctl =3D port->base.padctl;
		struct tegra_xusb_usb3_port *usb3;
		unsigned int i;

		for (i =3D 0; i < padctl->soc->ports.usb3.count; i++) {
			usb3 =3D tegra_xusb_find_usb3_port(padctl, i);
			if (usb3 && usb3->port =3D=3D port->base.index)
				return true;
		}

		return false;
	}

> +
> +		fake =3D tegra_xusb_find_unused_usb3_port(usb2->base.padctl);
> +
> +		if (fake < 0) {

This is one of the few exceptions where the blank line is not useful. It
makes sense here to keep the above two lines close together because you
assign the value and then check it. So the blank line rule doesn't apply
to this general pattern:

	value =3D foobar(...);
	if (value < 0) {
		...
	}

That is, if the value that you check is the same that you just assigned,
you should avoid the blank line as separator because the two lines are
closely related.

> +			dev_err(&usb2->base.dev, "no unused USB3 ports available\n");
> +			return -ENODEV;
> +		}
> +
> +		dev_dbg(&usb2->base.dev, "Found unused usb3 port: %d\n",
> +					 fake);

Nit: the above fits on a single line.

Otherwise looks good.

Thierry

> +		usb2->usb3_port_fake =3D fake;
> +		tegra_xusb_find_unused_usb3_port(usb2->base.padctl);
> +	}
> +
> +	return 0;
> +}
> +
>  static int tegra_xusb_setup_ports(struct tegra_xusb_padctl *padctl)
>  {
>  	struct tegra_xusb_port *port;
> +	struct tegra_xusb_usb2_port *usb2;
>  	unsigned int i;
>  	int err =3D 0;
> =20
> @@ -840,6 +897,18 @@ static int tegra_xusb_setup_ports(struct tegra_xusb_=
padctl *padctl)
>  			goto remove_ports;
>  	}
> =20
> +	if (padctl->soc->need_fake_usb3_port) {
> +		for (i =3D 0; i < padctl->soc->ports.usb2.count; i++) {
> +			usb2 =3D tegra_xusb_find_usb2_port(padctl, i);
> +			if (!usb2)
> +				continue;
> +
> +			err =3D tegra_xusb_update_usb3_fake_port(usb2);
> +			if (err < 0)
> +				goto remove_ports;
> +		}
> +	}
> +
>  	list_for_each_entry(port, &padctl->ports, list) {
>  		err =3D port->ops->enable(port);
>  		if (err < 0)
> diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
> index e0028b9f..26dd6d2 100644
> --- a/drivers/phy/tegra/xusb.h
> +++ b/drivers/phy/tegra/xusb.h
> @@ -299,6 +299,7 @@ struct tegra_xusb_usb2_port {
>  	struct regulator *supply;
>  	enum usb_dr_mode mode;
>  	bool internal;
> +	int usb3_port_fake;
>  };
> =20
>  static inline struct tegra_xusb_usb2_port *
> @@ -397,6 +398,7 @@ struct tegra_xusb_padctl_soc {
> =20
>  	const char * const *supply_names;
>  	unsigned int num_supplies;
> +	bool need_fake_usb3_port;
>  };
> =20
>  struct tegra_xusb_padctl {
> --=20
> 2.7.4
>=20

--QKdGvSO+nmPlgiQ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzmbzUACgkQ3SOs138+
s6FQqg/+Pb+7ftImb82JH+x2htjQtdaEIUv/+3XoxBeuiFY7WWD+RD1FK3Zcn839
Rc75RxjcTsJyWOxMLLYdb1Jao8U/NlV+4KKBovJj/VCCmHgHk2RlzsQD4DHgP9oX
hBfTonyb62c39nk/PuPq6oKEmOEnLBtz6SnZL2ByznVEic1pGS67JTtsGz6rDFXM
X8C3c7ZwB9k+LVb9PfDoH4Q7sck3Xx7nso06o/Baj63HoyG0fLZrnQstpdTqgVrQ
STr6u7wZuu2UfHBVeRDrXbLFQPkt9JgeEM0lI4DJCTU7znm4w/qrYi2q1IjgaZrW
NChPBkQTEeIEC4uDKpwySLa1yiZB680xE3iN7H0rtGKOq6733O44+bK6Eeox03fv
QM7Rra6a9K/YDVfkTEX5oEp5WLVDgs3WrZLWuz7uhEwyMKkdmk5qbOB9Lhl3UKdp
sDT6eE+Jx9TlLSiwv4jslJGYrliB4w2tWm+56ayB/KVd5EKUyHxDmZlTuHXQvYTi
BMxmUX/JLFhI1WZtx+FLg1J4jvNoE6N8a3HBfsq6P0ag8e9QaBC1hop7Bn88AcpK
yl3lA7Xs4jteevZF+cVp+yuxrwQBl/RXdGTywWa90iry+waFYRh7IWJ5V3nxUCKE
eL/aoUrhgkXK8MklpYxkCoTSEzl9+9ZNHARRu8RVVLDXrNpaImk=
=Vwak
-----END PGP SIGNATURE-----

--QKdGvSO+nmPlgiQ/--
