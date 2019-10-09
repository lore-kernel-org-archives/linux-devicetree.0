From: Lukasz Majewski <lukma@denx.de>
Subject: Re: [PATCH] dts: Disable DMA support on the BK4 vf610 device's
 fsl_lpuart driver
Date: Wed, 9 Oct 2019 16:44:42 +0200
Message-ID: <20191009164442.51f27b9d@jawa>
References: <20191009143032.9261-1-lukma@denx.de>
        <b39b6860-9e9b-5cee-a07e-7b430c2e5119@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/Di/jFXAOICs3QlZsnoXzE2z"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b39b6860-9e9b-5cee-a07e-7b430c2e5119@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robin Murphy <robin.murphy@arm.com>
Cc: linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Stefan Agner <stefan@agner.ch>, Rob Herring <robh+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--Sig_/Di/jFXAOICs3QlZsnoXzE2z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Robin,

> On 09/10/2019 15:30, Lukasz Majewski wrote:
> > This change disables the DMA support (RX/TX) on the NXP's fsl_lpuart
> > driver - the PIO mode is used instead. This change is necessary for
> > better robustness of BK4's device use cases with many potentially
> > interrupted short serial transfers.
> >=20
> > Without it the driver hangs when some distortion happens on UART
> > lines.
> >=20
> > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > ---
> >   arch/arm/boot/dts/vf610-bk4.dts | 4 ++++
> >   1 file changed, 4 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/vf610-bk4.dts
> > b/arch/arm/boot/dts/vf610-bk4.dts index 0f3870d3b099..ad20f3442d40
> > 100644 --- a/arch/arm/boot/dts/vf610-bk4.dts
> > +++ b/arch/arm/boot/dts/vf610-bk4.dts
> > @@ -259,24 +259,28 @@
> >   &uart0 {
> >   	pinctrl-names =3D "default";
> >   	pinctrl-0 =3D <&pinctrl_uart0>;
> > +	dma-names =3D "",""; =20
>=20
> This looks like a horrible hack - is there any reason not to just
> strip things at compile-time, i.e. "/delete-property/ dmas;"?

I don't want to strip the dma-names property globally. I just want to
adjust this particular driver mode from DMA to PIO.

For my use cases - as written in the commit message - the PIO mode is
more suitable (and reliable).=20

>=20
> Robin.
>=20
> >   	status =3D "okay";
> >   };
> >  =20
> >   &uart1 {
> >   	pinctrl-names =3D "default";
> >   	pinctrl-0 =3D <&pinctrl_uart1>;
> > +	dma-names =3D "","";
> >   	status =3D "okay";
> >   };
> >  =20
> >   &uart2 {
> >   	pinctrl-names =3D "default";
> >   	pinctrl-0 =3D <&pinctrl_uart2>;
> > +	dma-names =3D "","";
> >   	status =3D "okay";
> >   };
> >  =20
> >   &uart3 {
> >   	pinctrl-names =3D "default";
> >   	pinctrl-0 =3D <&pinctrl_uart3>;
> > +	dma-names =3D "","";
> >   	status =3D "okay";
> >   };
> >  =20
> >  =20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/Di/jFXAOICs3QlZsnoXzE2z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl2d8loACgkQAR8vZIA0
zr2WHggAttPRl8kp+yb/oZQOEp8vg1iZdn55DoxHq2LWuWy8RIoAUnOUy9TapDZ5
ZBQKgfDBYcD0Yawqlk9uOev6Uhe9roJRyVSdWjdPMcGdK0viwBagw8sYWxWD2TrY
MljhCRJfoStaA/ZKClfGb2w5KddgXTgz2jqRs8CNps7aFBbjhKFtwJoKkdCjI/kl
ADmw46QWkNmN6axoy3NKIDeP31lOfWpMcfcYw0MrLCn0+s/tfRpKqH9eRGC5vjJt
SblR8SeFNB4oUOO1rFN9rKANzgxfqF4n06rCPORZBOK8mV5YIAA5vx7L6VOUxioj
U57i4+VhXSCzlyh3HBGKN3//lb0xIA==
=PTiE
-----END PGP SIGNATURE-----

--Sig_/Di/jFXAOICs3QlZsnoXzE2z--
