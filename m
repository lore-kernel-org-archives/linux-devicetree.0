From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: add USB1-related nodes of Allwinner A64
Date: Wed, 23 Nov 2016 09:08:36 +0100
Message-ID: <20161123080836.xigrwdmf4zxbqmqf@lukather>
References: <20161122155831.8724-1-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2555394674027723004=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161122155831.8724-1-icenowy@aosc.xyz>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============2555394674027723004==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="b2a6tlvjct7vwijg"
Content-Disposition: inline


--b2a6tlvjct7vwijg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 22, 2016 at 11:58:29PM +0800, Icenowy Zheng wrote:
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
> Changes since v1:
> - Remove manual CLK_USB_OHCI0 gate, as it's dealed by ccu driver now.
> - Sort the nodes and fixed {e,o}hci1 regs.
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 44 +++++++++++++++++++++=
++++++
>  1 file changed, 44 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/b=
oot/dts/allwinner/sun50i-a64.dtsi
> index 3d70be3..2572dd6 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -122,6 +122,50 @@
>  		#size-cells =3D <1>;
>  		ranges;
> =20
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
> +		ohci1: usb@01c1b400 {
> +			compatible =3D "allwinner,sun50i-a64-ohci", "generic-ohci";
> +			reg =3D <0x01c1b400 0x100>;
> +			interrupts =3D <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_OHCI1>,
> +				 <&ccu CLK_USB_OHCI1>;
> +			resets =3D <&ccu RST_BUS_OHCI1>;
> +			phys =3D <&usbphy 1>;
> +			phy-names =3D "usb";
> +			status =3D "disabled";
> +		};
> +
> +		ehci1: usb@01c1b000 {
> +			compatible =3D "allwinner,sun50i-a64-ehci", "generic-ehci";
> +			reg =3D <0x01c1b000 0x100>;
> +			interrupts =3D <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_OHCI1>,
> +				 <&ccu CLK_BUS_EHCI1>,
> +				 <&ccu CLK_USB_OHCI1>;
> +			resets =3D <&ccu RST_BUS_OHCI1>,
> +				 <&ccu RST_BUS_EHCI1>;
> +			phys =3D <&usbphy 1>;
> +			phy-names =3D "usb";
> +			status =3D "disabled";
> +		};

The nodes were inverted, also, please use "arm64: dts: allwinner:" for
your prefix in the future.

I fixed both issues and queued for 4.11.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--b2a6tlvjct7vwijg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYNU6EAAoJEBx+YmzsjxAg5gAQAIoPoLKkEKHgOF8uvZUR4Kp9
KPvrYbZBAk9ierp28d20SO7Apy1LYv2SEoXZ6wJckPolnVhkJVY42CyfYrlWIEzX
9rMtCMfjg6WiCWYW4GBq0J8XoNWFnIPVJwfR09ud6+Hi4LXwYEgtPdwUuYd7RLzR
QKeN9t9V0t/5xkZXmUqy3Ho39IAdMHh1CGAI3BSa9QDs9jb2T8UoQrIB3x4xRYXj
v1LIsKmtJ791Tea3CQ5RBu8rluWFDHTwpvzLFfUzEIfmXJRzp2sJUb5cJoXRT0dB
VZUehENKdskKoe1nxedmoHxKTNQgC9oPPC6flc4PSs0O2Mj9imekuQvQXxvzfZg2
TG7OTelJyJIA1SzcT7/fR+JGL64TvORJ5YY5cSrPdUKCjkBJjQYawk5qe+KxEkwU
n5+OHo7RKARxtnzZyeM/5g3GZxKgyOg27F129zw+B3IO8l4G0plmk456KUh6CQ1T
RILsTz6vEwlO8KEZiwul6NAOLY93rtdkS95/asZSLo/fYVoCMHgVP7iqnMAKflyE
FpZYxUS/kqms48cR8OwLtnBTRcf4gwHaCWWS40H0JRcgn93zUAF7VGMSrLhQ3bVQ
qwlgq38oAokrRYxa50Q8WLmKAg8SLgrmGvaKOUNWtHfxDfy8wfMq3eBUlJlvZM6+
xWhbFlLty8/GcD6ROzMW
=D5Vf
-----END PGP SIGNATURE-----

--b2a6tlvjct7vwijg--


--===============2555394674027723004==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2555394674027723004==--
