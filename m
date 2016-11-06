From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 1/2] arm64: dts: add USB1-related nodes of Allwinner A64
Date: Sun, 6 Nov 2016 19:56:15 +0100
Message-ID: <20161106185615.dxppyh2hjsqxe4jv@lukather>
References: <20161105143830.10099-1-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7481528413357520936=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161105143830.10099-1-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Andre Przywara <andre.przywara@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============7481528413357520936==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xq4n2wd2hc63nnbb"
Content-Disposition: inline


--xq4n2wd2hc63nnbb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 05, 2016 at 10:38:29PM +0800, Icenowy Zheng wrote:
> Allwinner A64 have two HCI USB controllers, a OTG controller and a USB
> PHY device which have two ports. One of the port is wired to both a HCI
> USB controller and the OTG controller, which is currently not supported.
> The another one is only wired to a HCI controller, and the device node of
> OHCI/EHCI controller of the port can be added now.
>=20
> Also the A64 USB PHY device node is also added for the HCI controllers to
> work.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 50 +++++++++++++++++++++=
++++++
>  1 file changed, 50 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/b=
oot/dts/allwinner/sun50i-a64.dtsi
> index 3d70be3..c2b6dc8 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -259,5 +259,55 @@
>  			interrupts =3D <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
>  		};
> +
> +		usbphy: phy@01c19400 {
> +			compatible =3D "allwinner,sun50i-a64-usb-phy";
> +			reg =3D <0x01c19400 0x14>,
> +			      <0x01c1b800 0x4>;
> +			reg-names =3D "phy_ctrl",
> +				    "pmu1";
> +			clocks =3D <&ccu CLK_USB_PHY0>,
> +				 <&ccu CLK_USB_PHY1>;
> +			clock-names =3D "usb0_phy",
> +				      "usb1_phy";
> +			resets =3D <&ccu RST_USB_PHY0>,
> +				 <&ccu RST_USB_PHY1>;
> +			reset-names =3D "usb0_reset",
> +				      "usb1_reset";
> +			status =3D "disabled";
> +			#phy-cells =3D <1>;
> +		};
> +
> +		ohci1: usb@01c1a400 {
> +			compatible =3D "allwinner,sun50i-a64-ohci", "generic-ohci";
> +			reg =3D <0x01c1b400 0x100>;
> +			interrupts =3D <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
> +			/*
> +			 * According to the user manual, OHCI1 USB clock
> +			 * depends on OHCI0 clock.
> +			 */

This is something that should be dealt with in the clock framework,
not in your driver.

> +			clocks =3D <&ccu CLK_BUS_OHCI1>,
> +				 <&ccu CLK_USB_OHCI0>,
> +				 <&ccu CLK_USB_OHCI1>;
> +			resets =3D <&ccu RST_BUS_OHCI1>;
> +			phys =3D <&usbphy 1>;
> +			phy-names =3D "usb";
> +			status =3D "disabled";
> +		};
> +
> +		ehci1: usb@01c1a000 {
> +			compatible =3D "allwinner,sun50i-a64-ehci", "generic-ehci";
> +			reg =3D <0x01c1b000 0x100>;

And please order these nodes by base address.

Also, in both the ehci and ohci nodes, the unit-address and reg don't
match, which one is the right one?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--xq4n2wd2hc63nnbb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYH3zPAAoJEBx+YmzsjxAgr/EP/jsd5ZLoWqYvoFUXLwiO2xST
npsmRt3+oejA8GCsgyzJEXVIv9+kU0Tbbol1R+ZTtN3tKnPTOieLdqcyz7KPCDdb
RddN+EJlihHTcSzGg8uAHR+ETp0Fbw5bbcMYHRJJIPUCyxvBh2azFdf/QnrUjeJo
wxZrjQqIQoYeV3fS3Obm22XXm/cc6NjT8icPa5zVaXMvhonGKYmjYgtfD3nys/uF
5i14Axl8CoH8MxTYpXPQnj4s09hgWXAbP0pT1IPLTqhAC6Lqf3b09PCD2fBtYFSh
7ZKq3V87OUu5zjvfD/Sm8K2ofuKZHzg1Da0zXgCG2WMSJoF5fkj+wZ/2dfQpoCAC
38IGlUcNw8ar5qYgDZ65/ldRsuZr3X3cU1XHykSJP2gLzhoxlcxTf+HoXh6GGTW1
zTmQAUBwbyEhGi5HGmNKidFuFtIAGkjiWo8kvM254vF3sb3kQazeCs9tG11DgVjg
t//p2Rj+KH7zcSi7h7tnCYs1R3uBWqdIj5dGQ0dxWHeMHSDFajuYeDHZQKH0uuUq
PurBedB52bX+QlgsdO0hWToCO0998BvRu5RLTOkqfEjOtD2Pq7YEqjzD0CfI5PY7
9/+m5i3+dHsmQo4Qdv4L2TUtYvkp9PXKuKbAtECbEo1EW8A1qa52Fg9Q03J0+gvs
ddCZyZLiHcPEUmXM++RF
=xA6z
-----END PGP SIGNATURE-----

--xq4n2wd2hc63nnbb--


--===============7481528413357520936==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7481528413357520936==--
