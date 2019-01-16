From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH 2/2] usb: dwc3: Add workaround for host mode VBUS glitch when boot
Date: Wed, 16 Jan 2019 10:21:15 +0200
Message-ID: <87y37lko78.fsf@linux.intel.com>
References: <20190116064820.20007-1-ran.wang_1@nxp.com> <20190116064820.20007-3-ran.wang_1@nxp.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190116064820.20007-3-ran.wang_1@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ran Wang <ran.wang_1@nxp.com>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Ran Wang <ran.wang_1@nxp.com> writes:
> +static void dwc3_power_off_all_roothub_ports(struct dwc3 *dwc)
> +{
> +	int i, port_num;
> +	u32 reg, op_regs_base, offset;
> +	void __iomem		*xhci_regs;
> +
> +	/* xhci regs is not mapped yet, do it temperary here */
> +	if (dwc->xhci_resources[0].start) {
> +		xhci_regs =3D ioremap(dwc->xhci_resources[0].start,
> +				DWC3_XHCI_REGS_END);
> +		if (IS_ERR(xhci_regs)) {
> +			dev_err(dwc->dev, "Failed to ioremap xhci_regs\n");
> +			return;
> +		}
> +
> +		op_regs_base =3D HC_LENGTH(readl(xhci_regs));
> +		reg =3D readl(xhci_regs + XHCI_HCSPARAMS1);
> +		port_num =3D HCS_MAX_PORTS(reg);
> +
> +		for (i =3D 1; i <=3D port_num; i++) {
> +			offset =3D op_regs_base + XHCI_PORTSC_BASE + 0x10*(i-1);
> +			reg =3D readl(xhci_regs + offset);
> +			reg &=3D ~PORT_POWER;
> +			writel(reg, xhci_regs + offset);
> +		}
> +
> +		iounmap(xhci_regs);

why can't this be done during xhci_gen_setup()?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlw+6XsACgkQzL64meEa
mQaYthAA0N7cZj+TDKBtt13xQYprxukJbw0hJF5r+Xwp64RbDU04hHDxOqrV7S7G
gI+RWTZ1p/dvBZ5z0cf9/5Wj4Uyzcnyesd/OCWvTzJA18zNVObO7Dx/KrZawzgJf
B6s3deHMVN1wUVJprVqqUFEXOyJ0hgvup9dQOVeatZMJLYqgW1ubPrK/7LSW52vy
4KUBT4Ol4hXeJiz/SIngZopM9Vc1BTNXFs7ldR6UqWWtU9KnCajBz0QK5T0k4eqj
cvw+jKj8PMts0beRRqTIRAL128aov+/+9o2X+1PEIrPYmiRlFDwUjSGTEaXfb/K2
wHg1Bt6FdBufnlWYTuhGkT5mp1MPe6L2q11m/q6rYnJJNfqnCAExp6hx8K6cQSHP
SATYdBr/ZaOpYJ3RaNOHX3ehfhCkLKFeofT3I/DJEUqSld5s4AmDH8VYLkSx+YtC
KCBjwhYq9Rs1MF66jVWL+oaTG57q+Ta5FVlxlR/ARnZf3Rp65+NvSzZfckmze8p7
pR+G1J34nziVWCNLV4YXmkfYVV3CHLdPl1YM6hvzEZiBOY0lAHPK40f56L9I/IIF
I+eQmDT/SDNqXcEBs5pZh+2UXZSd1GWFGl2z6C5qXzXo8nGXjhHMg8powkudXxp4
8OFNnT6Se2d9OYRnADDbMR1valZ3spQbsnjX1YPyh2s9ztsEfaU=
=lIIu
-----END PGP SIGNATURE-----
--=-=-=--
