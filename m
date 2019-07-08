From: Luis de Oliveira <Luis.Oliveira@synopsys.com>
Subject: RE: [v4 1/6] dt-bindings: media: Document bindings for DW MIPI CSI-2
 Host
Date: Mon, 8 Jul 2019 15:21:50 +0000
Message-ID: <MN2PR12MB37109D7AADCE4823CB458CB9CBF60@MN2PR12MB3710.namprd12.prod.outlook.com>
References: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
 <1560280855-18085-2-git-send-email-luis.oliveira@synopsys.com>
 <20190628141326.swgl3kg4fj5pmlqx@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190628141326.swgl3kg4fj5pmlqx@valkosipuli.retiisi.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@iki.fi>, Luis Oliveira <Luis.Oliveira@synopsys.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "robh@kernel.org" <robh@kernel.org>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "paulmck@linux.ibm.com" <paulmck@linux.ibm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "kishon@ti.com" <kishon@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>
List-Id: devicetree@vger.kernel.org

Hi Sakari,

Thank you for your feedback.
I have my comments inline.

From: Sakari Ailus <sakari.ailus@iki.fi>
Date: Fri, Jun 28, 2019 at 15:13:26

> Hi Luis,
>=20
> Thank you for the patchset.
>=20
> On Tue, Jun 11, 2019 at 09:20:50PM +0200, Luis Oliveira wrote:
> > From: Luis Oliveira <lolivei@synopsys.com>
> >=20
> > Add bindings for Synopsys DesignWare MIPI CSI-2 host.
> >=20
> > Signed-off-by: Luis Oliveira <lolivei@synopsys.com>
> > ---
> > Changelog
> > v3-v4
> > - remove "plat" from the block name @rob @laurent
> > - remove "phy-names" when single-entry @rob
> > - remove "snps,output-type" -> went to the driver config @laurent
> >=20
> >  .../devicetree/bindings/media/snps,dw-csi.txt      | 41 ++++++++++++++=
++++++++
> >  1 file changed, 41 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/snps,dw-csi=
.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/snps,dw-csi.txt b/=
Documentation/devicetree/bindings/media/snps,dw-csi.txt
> > new file mode 100644
> > index 0000000..613b7f9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/snps,dw-csi.txt
> > @@ -0,0 +1,41 @@
> > +Synopsys DesignWare CSI-2 Host controller
> > +
> > +Description
> > +-----------
> > +
> > +This HW block is used to receive image coming from an MIPI CSI-2 compa=
tible
> > +camera.
> > +
> > +Required properties:
> > +- compatible		: shall be "snps,dw-csi"
> > +- reg			: physical base address and size of the device memory
> > +			  mapped registers;
> > +- interrupts		: DW CSI-2 Host interrupts
> > +- phys			: List of one PHY specifier (as defined in
> > +			  Documentation/devicetree/bindings/phy/phy-bindings.txt).
> > +			  This PHY is a MIPI DPHY working in RX mode.
> > +- resets		: Reference to a reset controller (optional)
> > +
> > +The per-board settings:
> > + - port sub-node describing a single endpoint connected to the camera =
as
> > +   described in video-interfaces.txt[1].
>=20
> Which endpoint properties in video-interfaces.txt are relevant for the
> hardware? Which values may they have?
>=20

Currently I'm using only two properties "data-lanes" and "bus-width", but=20
I have plans to add blanking info also.
I will add more info.

> > +
> > +Example:
> > +
> > +	csi2: csi2@3000 {
> > +		compatible =3D "snps,dw-csi";
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		reg =3D < 0x03000 0x7FF>;
>=20
> reg =3D <0x03000 0x7FF>;

Yes, I've missed that.

>=20
> > +		phys =3D <&mipi_dphy_rx>;
> > +		resets =3D <&dw_rst 1>;
> > +		interrupts =3D <2>;
> > +
> > +		port@0 {
> > +			reg =3D <0>;
>=20
> You can drop "@0" and the reg property.

Ok thank you.
>=20
> > +			csi_ep1: endpoint {
> > +				remote-endpoint =3D <&camera_1>;
> > +				data-lanes =3D <1 2>;
> > +			};
> > +		};
> > +	};
>=20
> --=20
> Kind regards,
>=20
> Sakari Ailus

Best regards,
Luis
