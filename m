Return-Path: <SRS0=XkBP=TX=gmail.com=thierry.reding@kernel.org>
Date: Thu, 23 May 2019 12:13:59 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Patch V3 4/8] dt-bindings: usb: Add  NVIDIA Tegra XUSB device
 mode controller binding
Message-ID: <20190523101359.GD30331@ulmo>
References: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
 <1557988772-15406-5-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="osDK9TLjxFScVI/L"
Content-Disposition: inline
In-Reply-To: <1557988772-15406-5-git-send-email-nkristam@nvidia.com>
To: Nagarjuna Kristam <nkristam@nvidia.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--osDK9TLjxFScVI/L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2019 at 12:09:28PM +0530, Nagarjuna Kristam wrote:
> Add device-tree binding documentation for the XUSB device mode controller
> present on Tegra210 SoC. This controller supports the USB 3.0
> specification.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>  .../devicetree/bindings/usb/nvidia,tegra-xudc.txt  | 101 +++++++++++++++=
++++++
>  1 file changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra-xu=
dc.txt
>=20
> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt =
b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt
> new file mode 100644
> index 0000000..d78b436
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt
> @@ -0,0 +1,101 @@
> +Device tree binding for NVIDIA Tegra XUSB device mode controller (XUDC)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The Tegra XUDC controller supports both USB 2.0 HighSpeed/FullSpeed and
> +USB 3.0 SuperSpeed protocols.
> +
> +Required properties:
> +--------------------
> +- compatible: For Tegra210, must contain "nvidia,tegra210-xudc".
> +- reg: Must contain the base and length of the XUSB device registers, XU=
SB device
> +  PCI Config registers and XUSB device controller registers.
> +- interrupts: Must contain the XUSB device interrupt.
> +- clocks: Must contain an entry for all clocks used.
> +  See ../clock/clock-bindings.txt for details.
> +- clock-names: Must include the following entries:
> +   - dev: Clock to enable core XUSB dev clock.
> +   - ss: Clock to enable XUSB super speed clock.
> +   - ss_src: Clock to enable XUSB super speed dev clock.
> +   - hs_src: Clock to enable XUSB high Speed dev clock.
> +   - fs_src: Clock to enable XUSB full Speed dev clock.

You use inconsistent spelling for "speed" here.

> +- nvidia,xusb-padctl: phandle to the XUSB pad controller that is used to
> +  configure the USB pads used by the XUDC controller.
> +- power-domains: A list of PM domain specifiers that reference each powe=
r-domain
> +  used by the XUSB device mode controller. This list must comprise of a =
specifier
> +  for the XUSBA and XUSBB power-domains. See ../power/power_domain.txt a=
nd
> +  ../arm/tegra/nvidia,tegra20-pmc.txt for details.
> +- power-domain-names: A list of names that represent each of the specifi=
ers in
> +  the 'power-domains' property. Must include 'ss' and 'dev'.
> +
> +For Tegra210:
> +- avddio-usb-supply: PCIe/USB3 analog logic power supply. Must supply 1.=
05 V.
> +- hvdd-usb-supply: USB controller power supply. Must supply 3.3 V.
> +
> +- phys: Must contain an entry for each entry in phy-names.
> +  See ../phy/phy-bindings.txt for details.
> +- phy-names: Should include an entry for each PHY used by the controller.
> +  Names must be "usb2", and "usb3" if support SuperSpeed device mode.
> +  - "usb3" phy, SuperSpeed (SSTX+/SSTX-/SSRX+/SSRX-) data lines.
> +  - "usb2" phy, USB 2.0 (D+/D-) data lines.
> +
> +- extcon: Must contains an extcon entry which detects USB VBUS pin.
> +  See ../extcon/extcon-usb-gpio.txt for details.

Do the phys, phy-names and extcon properties only apply to Tegra210? It
sounds like those would also apply to other generations, so they should
go before the "For Tegra210:" line.

> +
> +Example:
> +--------
> +	pmc: pmc@7000e400 {
> +		compatible =3D "nvidia,tegra210-pmc";
> +		reg =3D <0x0 0x7000e400 0x0 0x400>;
> +		clocks =3D <&tegra_car TEGRA210_CLK_PCLK>, <&clk32k_in>;
> +		clock-names =3D "pclk", "clk32k_in";
> +
> +		powergates {
> +			pd_xusbss: xusba {
> +				clocks =3D <&tegra_car TEGRA210_CLK_XUSB_SS>;
> +				resets =3D <&tegra_car TEGRA210_CLK_XUSB_SS>;

We typically use the literal number here to be consistent with the cases
where the clock ID differs from the reset ID.

> +				#power-domain-cells =3D <0>;
> +			};
> +
> +			pd_xusbdev: xusbb {
> +				clocks =3D <&tegra_car TEGRA210_CLK_XUSB_DEV>;
> +				resets =3D <&tegra_car 95>;

It seems like don't follow that rule exactly since this is the same
thing we have for XUSB already. I think it'd be best to stick with the
literal number (like here) and remove the odd ones out. I can prepare
patches to convert over the existing oddballs.

> +				#power-domain-cells =3D <0>;
> +			};
> +		};
> +	};
> +
> +	xudc@700d0000 {
> +		compatible =3D "nvidia,tegra210-xudc";
> +		reg =3D <0x0 0x700d0000 0x0 0x8000>,
> +			<0x0 0x700d8000 0x0 0x1000>,
> +			<0x0 0x700d9000 0x0 0x1000>;

Use tabs, followed by spaces to properly align with the first entry,
like you do for clock-names below.

> +
> +		interrupts =3D <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> +
> +		clocks =3D <&tegra_car TEGRA210_CLK_XUSB_DEV>,
> +			<&tegra_car TEGRA210_CLK_XUSB_SS>,
> +			<&tegra_car TEGRA210_CLK_XUSB_SSP_SRC>,
> +			<&tegra_car TEGRA210_CLK_XUSB_HS_SRC>,
> +			<&tegra_car TEGRA210_CLK_XUSB_FS_SRC>;

Ditto.

> +		clock-names =3D "dev", "ss", "ss_src",
> +			      "hs_src", "fs_src";
> +
> +		power-domains =3D <&pd_xusbdev>, <&pd_xusbss>;
> +		power-domain-names =3D "dev", "ss";
> +
> +		nvidia,xusb-padctl =3D <&padctl>;
> +
> +		phys =3D <&{/padctl@7009f000/pads/usb2/lanes/usb2-0}>;
> +		phy-names =3D "usb2;

Does it perhaps make sense to include the pad controller snippet in here
as well?

Thierry

> +
> +		avddio-usb-supply =3D <&vdd_pex_1v05>;
> +		hvdd-usb-supply =3D <&vdd_3v3_sys>;
> +
> +		extcon =3D <&extcon_usb>;
> +	};
> +
> +	extcon_usb: extcon_vbus {
> +		compatible =3D "linux,extcon-usb-gpio";
> +		vbus-gpio =3D <&gpio TEGRA_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
> +	};
> +
> --=20
> 2.7.4
>=20

--osDK9TLjxFScVI/L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzmcmQACgkQ3SOs138+
s6F50hAAozJMI81xCHHWiyU/9Hfx/jIhtb8LYe8cNvs+jttbR0j95OENNi/reeS3
Nid9jn227XcHTfrcWPEfrAwgnHlNL5j4v4bbf2AvtyTYKN57PMLCx0k99Zhn1EI6
ps4l0/X1pkvlky6RiQS+UzW6hdaEucMYTSoIQAv8anfJ/UiDyvBBuW0UVJbBcL8q
MwFx2qlC+ibxDToRsThggdHuyabB48hHdrLSWiLUsJNUfgUcpMR+Q5cMBqCeWYx9
/Z29HC6WPm+3CGgON9kNqbWdBDKnu/ZmIRHt8XIIU/3+ksKX5wPIZmxBvgkspBmk
CBO8DHm5A3ZMKDS0ftskrTM3CZuWBTXgHYQ9ROpNtQlphPOts0DhfmT5t706T2Yz
jX12UhzsvpNFKTfRrAhdPZ85Eikjhpj1LBOcx5558/TYSpexGtng0djEXTAT/g2i
XSizdOwcRCYW8ACLnOY9IEOOoD+PUTh+7glkHxoLr/S9lDkNJHfr7OA19SbcC9r1
UB+7h6k1oMSYRKKxvNwX8lNVjqoqaIBOzlAI3sSYliPCWHAm3YyDjtQG4krU+Gx+
8Tc7mYO7OtYliajWwEd7KfC8VWPAN8DOYJLLRzdWA2xg2W6s9tvp0k2VwYGJm/S3
9OgotfIqC39bWpvAdlhcwSnra6oOnuBWRAs38aZ9zsnqJ17NYxE=
=sFeo
-----END PGP SIGNATURE-----

--osDK9TLjxFScVI/L--
