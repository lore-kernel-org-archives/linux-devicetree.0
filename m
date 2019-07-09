From: Luis de Oliveira <Luis.Oliveira@synopsys.com>
Subject: RE: [v4 4/6] dt-bindings: phy: Document the Synopsys MIPI DPHY Rx
 bindings
Date: Tue, 9 Jul 2019 16:28:53 +0000
Message-ID: <MN2PR12MB371024C55C5B48A91EECE7A0CBF10@MN2PR12MB3710.namprd12.prod.outlook.com>
References: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
 <1560280855-18085-5-git-send-email-luis.oliveira@synopsys.com>
 <20190709142000.GA995@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190709142000.GA995@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Luis Oliveira <Luis.Oliveira@synopsys.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "paulmck@linux.ibm.com" <paulmck@linux.ibm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "kishon@ti.com" <kishon@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <robh@kernel.org>
Date: Tue, Jul 09, 2019 at 15:20:00

> On Tue, Jun 11, 2019 at 09:20:53PM +0200, Luis Oliveira wrote:
> > Add device-tree bindings documentation for SNPS DesignWare MIPI D-PHY i=
n
> > RX mode.
> >=20
> > Signed-off-by: Luis Oliveira <luis.oliveira@synopsys.com>
> > ---
> > Changelog
> > v3-v4
> > - @Laurent I know I told you I could remove the snps,dphy-frequency on =
V3 but
> >   it is really useful for me here. I removed all other the proprietary
> >   properties except this one. Do you still think it must be removed?
> > - Frequency units @Rob
>=20
> Frequency units means append '-khz' to the property name. That also=20
> makes the 'frequency' part redundant, so maybe name it more around what=20
> the frequency is. The frequency for what?
>=20
> Rob
>=20

This is the D-PHY high speed frequency configuration that corresponds to=20
the high speed data transfer of the bus.
Basically is the transmission speed per lane.
Do you think I can use "link-frequencies" (present in=20
video-interfaces.txt) with one frequency?


> >=20
> >  .../devicetree/bindings/phy/snps,dw-dphy-rx.txt    | 29 ++++++++++++++=
++++++++
> >  1 file changed, 29 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/snps,dw-dphy-=
rx.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/phy/snps,dw-dphy-rx.txt =
b/Documentation/devicetree/bindings/phy/snps,dw-dphy-rx.txt
> > new file mode 100644
> > index 0000000..50603e6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/snps,dw-dphy-rx.txt
> > @@ -0,0 +1,29 @@
> > +Synopsys DesignWare MIPI Rx D-PHY block details
> > +
> > +Description
> > +-----------
> > +
> > +The Synopsys MIPI D-PHY controller supports MIPI-DPHY in receiver mode=
.
> > +Please refer to phy-bindings.txt for more information.
> > +
> > +Required properties:
> > +- compatible		: Shall be "snps,dw-dphy-rx".
> > +- #phy-cells		: Must be 1.
> > +- bus-width		: Size of the test interface data bus (8 bits->8 or
> > +			  12bits->12).
> > +- snps,dphy-frequency	: Frequency at which D-PHY should start, configu=
rable.
> > +			  Check Synopsys databook. (-kHz)
> > +- reg			: Test interface register. This correspondes to the
> > +			  physical base address of the controller and size of
> > +			  the device memory mapped registers; Check Synopsys
> > +			  databook.
> > +
> > +Example:
> > +
> > +	mipi_dphy_rx1: dphy@d00003040 {
> > +		compatible =3D "snps,dw-dphy-rx";
> > +		#phy-cells =3D <1>;
> > +		bus-width =3D <12>;
> > +		snps,dphy-frequency =3D <300000>;
> > +		reg =3D <0xd0003040 0x20>;
> > +	};
> > --=20
> > 2.7.4
> >=20

Thank you Rob,
Luis
