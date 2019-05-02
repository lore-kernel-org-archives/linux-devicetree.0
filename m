From: Dragan Cvetic <draganc@xilinx.com>
Subject: RE: [PATCH V3 01/12] dt-bindings: xilinx-sdfec: Add SDFEC binding
Date: Thu, 2 May 2019 11:04:30 +0000
Message-ID: <BL0PR02MB56815DFC139D65D46D5DFF50CB340@BL0PR02MB5681.namprd02.prod.outlook.com>
References: <1556402706-176271-1-git-send-email-dragan.cvetic@xilinx.com>
 <1556402706-176271-2-git-send-email-dragan.cvetic@xilinx.com>
 <20190501194738.GA1441@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190501194738.GA1441@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "arnd@arndb.de" <arnd@arndb.de>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Michal Simek <michals@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Derek Kiernan <dkiernan@xilinx.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Please find my inline comments below

Thank you
Dragan

> -----Original Message-----
> From: Rob Herring [mailto:robh@kernel.org]
> Sent: Wednesday 1 May 2019 20:48
> To: Dragan Cvetic <draganc@xilinx.com>
> Cc: arnd@arndb.de; gregkh@linuxfoundation.org; Michal Simek <michals@xili=
nx.com>; linux-arm-kernel@lists.infradead.org;
> mark.rutland@arm.com; devicetree@vger.kernel.org; linux-kernel@vger.kerne=
l.org; Derek Kiernan <dkiernan@xilinx.com>
> Subject: Re: [PATCH V3 01/12] dt-bindings: xilinx-sdfec: Add SDFEC bindin=
g
>=20
> On Sat, Apr 27, 2019 at 11:04:55PM +0100, Dragan Cvetic wrote:
> > Add the Soft Decision Forward Error Correction (SDFEC) Engine
> > bindings which is available for the Zynq UltraScale+ RFSoC
> > FPGA's.
> >
> > Signed-off-by: Dragan Cvetic <dragan.cvetic@xilinx.com>
> > Signed-off-by: Derek Kiernan <derek.kiernan@xilinx.com>
> > ---
> >  .../devicetree/bindings/misc/xlnx,sd-fec.txt       | 58 ++++++++++++++=
++++++++
> >  1 file changed, 58 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/misc/xlnx,sd-fec.=
txt
> >
> > diff --git a/Documentation/devicetree/bindings/misc/xlnx,sd-fec.txt b/D=
ocumentation/devicetree/bindings/misc/xlnx,sd-fec.txt
> > new file mode 100644
> > index 0000000..425b6a6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/misc/xlnx,sd-fec.txt
> > @@ -0,0 +1,58 @@
> > +* Xilinx SDFEC(16nm) IP *
> > +
> > +The Soft Decision Forward Error Correction (SDFEC) Engine is a Hard IP=
 block
> > +which provides high-throughput LDPC and Turbo Code implementations.
> > +The LDPC decode & encode functionality is capable of covering a range =
of
> > +customer specified Quasi-cyclic (QC) codes. The Turbo decode functiona=
lity
> > +principally covers codes used by LTE. The FEC Engine offers significan=
t
> > +power and area savings versus implementations done in the FPGA fabric.
> > +
> > +
> > +Required properties:
> > +- compatible: Must be "xlnx,sd-fec-1.1"
> > +- clock-names : List of input clock names from the following:
> > +    - "core_clk", Main processing clock for processing core (required)
> > +    - "s_axi_aclk", AXI4-Lite memory-mapped slave interface clock (req=
uired)
> > +    - "s_axis_din_aclk", DIN AXI4-Stream Slave interface clock (option=
al)
> > +    - "s_axis_din_words-aclk", DIN_WORDS AXI4-Stream Slave interface c=
lock (optional)
> > +    - "s_axis_ctrl_aclk",  Control input AXI4-Stream Slave interface c=
lock (optional)
> > +    - "m_axis_dout_aclk", DOUT AXI4-Stream Master interface clock (opt=
ional)
> > +    - "m_axis_dout_words_aclk", DOUT_WORDS AXI4-Stream Master interfac=
e clock (optional)
> > +    - "m_axis_status_aclk", Status output AXI4-Stream Master interface=
 clock (optional)
> > +- clocks : Clock phandles (see clock_bindings.txt for details).
> > +- reg: Should contain Xilinx SDFEC 16nm Hardened IP block registers
> > +  location and length.
> > +- xlnx,sdfec-code : Should contain "ldpc" or "turbo" to describe the c=
odes
> > +  being used.
> > +- xlnx,sdfec-din-words : A value 0 indicates that the DIN_WORDS interf=
ace is
> > +  driven with a fixed value and is not present on the device, a value =
of 1
> > +  configures the DIN_WORDS to be block based, while a value of 2 confi=
gures the
> > +  DIN_WORDS input to be supplied for each AXI transaction.
> > +- xlnx,sdfec-din-width : Configures the DIN AXI stream where a value o=
f 1
> > +  configures a width of "1x128b", 2 a width of "2x128b" and 4 configur=
es a width
> > +  of "4x128b".
>=20
> Perhaps append with '-bits' and make the values 0, 128, 256, 512.
>=20


The suggested will require the extra code for converting from 128,256,512  =
to 1,2,4, as HW is configured with 1, 2 and 4.


> > +- xlnx,sdfec-dout-words : A value 0 indicates that the DOUT_WORDS inte=
rface is
> > +  driven with a fixed value and is not present on the device, a value =
of 1
> > +  configures the DOUT_WORDS to be block based, while a value of 2 conf=
igures the
> > +  DOUT_WORDS input to be supplied for each AXI transaction.
> > +- xlnx,sdfec-dout-width : Configures the DOUT AXI stream where a value=
 of 1
> > +  configures a width of "1x128b", 2 a width of "2x128b" and 4 configur=
es a width
> > +  of "4x128b".
>=20
> Same here.
>=20


Same comment as previous one.


> > +Optional properties:
> > +- interrupts: should contain SDFEC interrupt number
>=20
> The interrupt may not be wired?


My mistake. It should stay:
	interrupt-parent =3D <&axi_intc>;
	interrupts =3D <1 0>;


>=20
> > +
> > +Example
> > +---------------------------------------
> > +	sd_fec_0: sd-fec@a0040000 {
> > +		compatible =3D "xlnx,sd-fec-1.1";
> > +		clock-names =3D "core_clk","s_axi_aclk","s_axis_ctrl_aclk","s_axis_d=
in_aclk","m_axis_status_aclk","m_axis_dout_aclk";
> > +		clocks =3D <&misc_clk_2>,<&misc_clk_0>,<&misc_clk_1>,<&misc_clk_1>,<=
&misc_clk_1>, <&misc_clk_1>;
> > +		reg =3D <0x0 0xa0040000 0x0 0x40000>;
> > +		interrupt-parent =3D <&gic>;
> > +		interrupts =3D <0 89 4>;
> > +		xlnx,sdfec-code =3D "ldpc";
> > +		xlnx,sdfec-din-words =3D <0>;
> > +		xlnx,sdfec-din-width =3D <2>;
> > +		xlnx,sdfec-dout-words =3D <0>;
> > +		xlnx,sdfec-dout-width =3D <1>;
> > +	};
> > --
> > 2.7.4
> >
