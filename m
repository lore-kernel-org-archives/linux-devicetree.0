From: Jolly Shah <JOLLYS@xilinx.com>
Subject: RE: [PATCH v2 1/3] dt-bindings: power: Add ZynqMP power domain
 bindings
Date: Fri, 24 Aug 2018 22:22:03 +0000
Message-ID: <CY1PR02MB2138CD14431A976812492D0BB8360@CY1PR02MB2138.namprd02.prod.outlook.com>
References: <1534447304-12919-1-git-send-email-jollys@xilinx.com>
 <1534447304-12919-2-git-send-email-jollys@xilinx.com>
 <20180820194628.GA26783@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180820194628.GA26783@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "andy.gross@linaro.org" <andy.gross@linaro.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "sean.wang@mediatek.com" <sean.wang@mediatek.com>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, Michal Simek <michals@xilinx.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Rajan Vaja <RAJANV@xilinx.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>Rajan Vaja <RAJANV@xilinx.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,

> -----Original Message-----
> From: Rob Herring [mailto:robh@kernel.org]
> Sent: Monday, August 20, 2018 12:46 PM
> To: Jolly Shah <JOLLYS@xilinx.com>
> Cc: matthias.bgg@gmail.com; andy.gross@linaro.org; shawnguo@kernel.org;
> geert+renesas@glider.be; bjorn.andersson@linaro.org;
> sean.wang@mediatek.com; m.szyprowski@samsung.com; Michal Simek
> <michals@xilinx.com>; mark.rutland@arm.com; Rajan Vaja
> <RAJANV@xilinx.com>; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Rajan Vaja
> <RAJANV@xilinx.com>; Jolly Shah <JOLLYS@xilinx.com>
> Subject: Re: [PATCH v2 1/3] dt-bindings: power: Add ZynqMP power domain
> bindings
>=20
> On Thu, Aug 16, 2018 at 12:21:42PM -0700, Jolly Shah wrote:
> > From: Rajan Vaja <rajan.vaja@xilinx.com>
> >
> > Add documentation to describe ZynqMP power domain bindings.
> >
> > Signed-off-by: Rajan Vaja <rajan.vaja@xilinx.com>
> > Signed-off-by: Jolly Shah <jollys@xilinx.com>
> > ---
> >  .../firmware/xilinx/xlnx,zynqmp-firmware.txt       | 47
> ++++++++++++++++++++++
>=20
> This should be with all the other power domain bindings.
>=20

The firmware node has clock, reset and power domain subnodes. Please sugges=
t the right location for binding.

> >  1 file changed, 47 insertions(+)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmwa
> > re.txt
> > b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmwa
> > re.txt
> > index d215d15..5fa10a0 100644
> > ---
> > a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmwa
> > re.txt
> > +++ b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-fi
> > +++ rmware.txt
> > @@ -64,6 +64,29 @@ Output clocks are registered based on clock
> > information received  from firmware. Output clocks indexes are
> > mentioned in  include/dt-bindings/clock/xlnx,zynqmp-clk.h.
> >
> > +-----------------------------------------------------------
> > +Device Tree Bindings for the Xilinx Zynq MPSoC PM domains
> > +-----------------------------------------------------------
> > +The binding for zynqmp-power-controller follow the common generic PM
> > +domain binding[1].
> > +
> > +[1] Documentation/devicetree/bindings/power/power_domain.txt
> > +
> > +=3D=3D Zynq MPSoC Generic PM Domain Node =3D=3D
> > +
> > +Required properties:
> > + - compatible:	Must be: "xlnx,zynqmp-power-controller"
> > +
> > +This node contains a number of subnodes, each representing a single
> > +PM domain that PM domain consumer devices reference.
> > +
> > +=3D=3D PM Domain Nodes =3D=3D
> > +
> > +Required properties:
> > + - #power-domain-cells:	Number of cells in a PM domain specifier. Must
> be 0.
> > + - pd-id:		Domain identifier as defined by platform firmware.
> > +			This identifier is passed to the PM firmware.
>=20
> Make this a cell for the power domain consumer.
>=20

I am not clear here. Do you suggest to move pd-id property under consumer n=
odes? Right now, consumer nodes use power-domains property as below:

usb0: usb0@ff9d0000 {
                        #address-cells =3D <2>;
	          ...................................................
                        power-domains =3D <&pd_usb0>;
	};

Thanks,
Jolly Shah

> > +
> >  -------
> >  Example
> >  -------
> > @@ -78,5 +101,29 @@ firmware {
> >  			clocks =3D <&pss_ref_clk>, <&video_clk>,
> <&pss_alt_ref_clk>, <&aux_ref_clk>, <&gt_crx_ref_clk>;
> >  			clock-names =3D "pss_ref_clk", "video_clk",
> "pss_alt_ref_clk","aux_ref_clk", "gt_crx_ref_clk";
> >  		};
> > +		zynqmp-power-controller {
> > +			compatible =3D "xlnx,zynqmp-power-controller";
> > +
> > +			pd_usb0: pd-usb0 {
> > +				pd-id =3D <22>;
> > +				#power-domain-cells =3D <0>;
> > +			};
> > +
> > +			pd_sata: pd-sata {
> > +				pd-id =3D <28>;
> > +				#power-domain-cells =3D <0>;
> > +			};
> > +
> > +			pd_gpu : pd-gpu {
> > +				pd-id =3D <58 20 21>;
> > +				#power-domain-cells =3D <0>;
> > +			};
> > +		};
> >  	};
> >  };
> > +
> > +sata0: ahci@SATA_AHCI_HBA {
>=20
> Don't use defines in unit-addresses (or reg for that matter). It's pointl=
ess
> indirection.
>=20
> > +	...
> > +	power-domains =3D <&pd_sata>;
> > +	...
> > +};
> > --
> > 2.7.4
> >
