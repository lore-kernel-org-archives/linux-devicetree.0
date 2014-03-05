From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/4] phy: miphy365x: Add Device Tree bindings for the
 MiPHY365x
Date: Wed, 5 Mar 2014 16:40:39 +0800
Message-ID: <20140305084039.GB14902@lee--X1>
References: <1392377036-12816-1-git-send-email-lee.jones@linaro.org>
 <20140305073422.GD20016@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140305073422.GD20016@e106331-lin.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "alexandre.torgue@st.com" <alexandre.torgue@st.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@st.com>
List-Id: devicetree@vger.kernel.org

On Wed, 05 Mar 2014, Mark Rutland wrote:

> On Fri, Feb 14, 2014 at 11:23:53AM +0000, Lee Jones wrote:
> > The MiPHY365x is a Generic PHY which can serve various SATA or PCIe
> > devices. It has 2 ports which it can use for either; both SATA, bot=
h
> > PCIe or one of each in any configuration.
> >=20
> > Cc: devicetree@vger.kernel.org
> > Cc: Srinivas Kandagatla <srinivas.kandagatla@st.com>
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  .../devicetree/bindings/phy/phy-miphy365x.txt      | 54 ++++++++++=
++++++++++++
> >  1 file changed, 54 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/phy-miphy=
365x.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/phy/phy-miphy365x.tx=
t b/Documentation/devicetree/bindings/phy/phy-miphy365x.txt
> > new file mode 100644
> > index 0000000..96f269f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/phy-miphy365x.txt
> > @@ -0,0 +1,54 @@
> > +STMicroelectronics STi MIPHY365x PHY binding
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +This binding describes a miphy device that is used to control PHY =
hardware
> > +for SATA and PCIe.
> > +
> > +Required properties:
> > +- compatible: Should be "st,miphy365x-phy"
> > +- #phy-cells: Should be 2 (See second example)
> > +		First cell is the port number; MIPHY_PORT_{0,1}
> > +		Second cell is device type; MIPHY_TYPE_{SATA,PCI}
>=20
> Either this should refer to the header file, or specific values shoul=
d
> be given in the binding document.

When you say specific values you mean break out the {,}s?

I thought most people would know what they mean.

> > +- reg:	      Address and length of the register set for the device
> > +- reg-names:  The names of the register addresses corresponding to=
 the
> > +	      registers filled in "reg"
> > +		Options are; sata{0,1} and pcie{0,1} (See first example)
>=20
> How about something like:

Same here.

> - reg: a list of offset + length pairs, one for each entry in reg-nam=
es
> - reg-names: should contain some of:
>   * "sata0" for ...
>   * "sata1" for ...
>   * "pcie0" for ...
>   * "pcie1" for ...
>=20
> Where ... might just be "the sata port 0 registers"

Seems awfully redundant.

> > +- st,syscfg : Should be a phandle of the system configuration regi=
ster group
> > +	      which contain the SATA, PCIe mode setting bits
>=20
> I'll assume this is well-defined by some other binding.

Right.

> > +
> > +Optional properties:
> > +- st,sata-gen	     : Generation of locally attached SATA IP. Expec=
ted values
> > +		       are {1,2,3). If not supplied generation 1 hardware will
> > +		       be expected
> > +- st,pcie-tx-pol-inv : Bool property to invert the polarity PCIe T=
x (Txn/Txp)
> > +- st,sata-tx-pol-inv : Bool property to invert the polarity SATA T=
x (Txn/Txp)
>=20
> It might just be me, but the phrase "invert the polarity {SATA,PCIe} =
Tx"
> sounds odd. What exactly is being inverted?

=46rom the doc (and the only reference of this functionallity):

rx_polarity:
  1: switch rxp/rxn
tx_polarity:
  1: switch txp/txn

If we don't set these registers up to reflect the h/w configuration of
the board, the MiPHY will not work.

> > +
> > +Example:
> > +
> > +	miphy365x_phy: miphy365x@0 {
> > +		compatible =3D "st,miphy365x-phy";
> > +		#phy-cells =3D <2>;
> > +		reg =3D	<0xfe382000 0x100>,
> > +			<0xfe38a000 0x100>,
> > +			<0xfe394000 0x100>,
> > +			<0xfe804000 0x100>;
> > +		reg-names =3D "sata0", "sata1", "pcie0", "pcie1";
> > +		st,syscfg=3D <&syscfg_rear>;
>=20
> Nit: missing space before '=3D'.

Will fix.

> > +	};
> > +
> > +Specifying phy control of devices
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Device nodes should specify the configuration required in their "p=
hys"
> > +property, containing a phandle to the miphy device node, a port nu=
mber
> > +and a device type.
> > +
> > +Example:
> > +
> > +#include <dt-bindings/phy/phy-miphy365x.h>
> > +
> > +	sata0: sata@fe380000 {
> > +		...
> > +		phys	  =3D <&miphy365x_phy MIPHY_PORT_0 MIPHY_TYPE_SATA>;
> > +		...
> > +	};
>=20
> Is there not a generic phy binding we can point to? It seems a bit
> redundant to do this in each phy binding.

Sure, but that wouldn't make much of an example.

  Documentation/devicetree/bindings/phy/phy-bindings.txt

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
