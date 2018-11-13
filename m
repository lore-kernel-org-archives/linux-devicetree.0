From: Jiaying Liang <jliang@xilinx.com>
Subject: RE: [PATCH v5 2/2] dt-bindings: mailbox: Add Xilinx IPI Mailbox
Date: Tue, 13 Nov 2018 07:16:26 +0000
Message-ID: <DM5PR02MB22334437172F9379477A115CB0C20@DM5PR02MB2233.namprd02.prod.outlook.com>
References: <1541457421-14820-1-git-send-email-wendy.liang@xilinx.com>
 <1541457421-14820-3-git-send-email-wendy.liang@xilinx.com>
 <5bea0eb3.1c69fb81.20e73.a4f9@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5bea0eb3.1c69fb81.20e73.a4f9@mx.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, Michal Simek <michals@xilinx.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Rob Herring [mailto:robh@kernel.org]
> Sent: Monday, November 12, 2018 9:56 AM
> To: Jiaying Liang <jliang@xilinx.com>
> Cc: jassisinghbrar@gmail.com; Michal Simek <michals@xilinx.com>;
> mark.rutland@arm.com; linux-kernel@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; devicetree@vger.kernel.org
> Subject: Re: [PATCH v5 2/2] dt-bindings: mailbox: Add Xilinx IPI Mailbox
>=20
> On Mon, Nov 05, 2018 at 02:37:01PM -0800, Wendy Liang wrote:
> > Xilinx ZynqMP IPI(Inter Processor Interrupt) is a hardware block in
> > ZynqMP SoC used for the communication between various processor
> > systems.
> >
> > Signed-off-by: Wendy Liang <wendy.liang@xilinx.com>
> > ---
> >  .../bindings/mailbox/xlnx,zynqmp-ipi-mailbox.txt   | 128
> +++++++++++++++++++++
> >  1 file changed, 128 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.txt
> >
> > diff --git
> > a/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.tx
> > t
> > b/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-
> mailbox.tx
> > t
> > new file mode 100644
> > index 0000000..18fd7b4
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-
> mailbo
> > +++ x.txt
> > @@ -0,0 +1,128 @@
> > +Xilinx IPI Mailbox Controller
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The Xilinx IPI(Inter Processor Interrupt) mailbox controller is to
> > +manage messaging between two Xilinx Zynq UltraScale+ MPSoC IPI
> > +agents. Each IPI agent owns registers used for notification and buffer=
s for
> message.
> > +
> > +               +-------------------------------------+
> > +               | Xilinx ZynqMP IPI Controller        |
> > +               +-------------------------------------+
> > +    +--------------------------------------------------+
> > +ATF                    |                     |
> > +                       |                     |
> > +                       |                     |
> > +    +--------------------------+             |
> > +                       |                     |
> > +                       |                     |
> > +    +--------------------------------------------------+
> > +            +------------------------------------------+
> > +            |  +----------------+   +----------------+ |
> > +Hardware    |  |  IPI Agent     |   |  IPI Buffers   | |
> > +            |  |  Registers     |   |                | |
> > +            |  |                |   |                | |
> > +            |  +----------------+   +----------------+ |
> > +            |                                          |
> > +            | Xilinx IPI Agent Block                   |
> > +            +------------------------------------------+
> > +
> > +
> > +Controller Device Node:
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > +Required properties:
> > +--------------------
> > +IPI agent node:
> > +- compatible:		Shall be: "xlnx,zynqmp-ipi-mailbox"
> > +- interrupt-parent:	Phandle for the interrupt controller
> > +- interrupts:		Interrupt information corresponding to the
> > +			interrupt-names property.
> > +- xlnx,ipi-id:		local Xilinx IPI agent ID
> > +- #address-cells:	number of address cells of internal IPI mailbox node=
s
> > +- #size-cells:		number of size cells of internal IPI mailbox nodes
> > +
> > +Internal IPI mailbox node:
> > +- reg:			IPI buffers address ranges
> > +- reg-names:		Names of the reg resources. It should have:
> > +			* local_request_region
> > +			  - IPI request msg buffer written by local and read
> > +			    by remote
> > +			* local_response_region
> > +			  - IPI response msg buffer written by local and read
> > +			    by remote
> > +			* remote_request_region
> > +			  - IPI request msg buffer written by remote and read
> > +			    by local
> > +			* remote_response_region
> > +			  - IPI response msg buffer written by remote and
> read
> > +			    by local
> > +- #mbox-cells:		Shall be 1. It contains:
> > +			* tx(0) or rx(1) channel
> > +- xlnx,ipi-id:		remote Xilinx IPI agent ID of which the mailbox is
> > +			connected to.
> > +
> > +Optional properties:
> > +--------------------
> > +- method:              The method of accessing the IPI agent registers=
.
> > +                       Permitted values are: "smc" and "hvc". Default =
is
> > +                       "smc".
> > +
> > +Client Device Node:
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > +Required properties:
> > +--------------------
> > +- mboxes:		Standard property to specify a mailbox
> > +			(See ./mailbox.txt)
> > +- mbox-names:		List of identifier  strings for each mailbox
> > +			channel.
> > +
> > +Example:
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > +	zynqmp_ipi {
> > +		compatible =3D "xlnx,zynqmp-ipi-mailbox";
> > +		interrupt-parent =3D <&gic>;
> > +		interrupts =3D <0 29 4>;
> > +		xlnx,ipi-id =3D <0>;
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <1>;
>=20
> Both the parent and children are mailbox providers?
[Wendy] children are mailbox providers.
As the mailbox providers shared the same interrupt
And the same local IPI agent ID, and thus, use
This parent/child structure
>=20
> > +
> > +		/* APU<->RPU0 IPI mailbox controller */
> > +		ipi_mailbox_rpu0: mailbox@ff90400 {
> > +			compatible =3D "xlnx,zynqmp-ipi-mailbox";
>=20
> You can't have the same compatible in the parent and here.
[Wendy] Will remove the compatible in the child node.

>=20
> > +			reg =3D <0xff990400 0x20>,
> > +			      <0xff990420 0x20>,
> > +			      <0xff990080 0x20>,
> > +			      <0xff9900a0 0x20>;
> > +			reg-names =3D "local_request_region",
> > +				    "local_response_region",
> > +				    "remote_request_region",
> > +				    "remote_response_region";
> > +			#mbox-cells =3D <1>;
> > +			xlnx,ipi-id =3D <1>;
> > +		};
> > +		/* APU<->RPU1 IPI mailbox controller */
> > +		ipi_mailbox_rpu1: mailbox@ff990440 {
> > +			compatible =3D "xlnx,zynqmp-ipi-mailbox";
> > +			reg =3D <0xff990440 0x20>,
> > +			      <0xff990460 0x20>,
> > +			      <0xff990280 0x20>,
> > +			      <0xff9902a0 0x20>;
> > +			reg-names =3D "local_request_region",
> > +				    "local_response_region",
> > +				    "remote_request_region",
> > +				    "remote_response_region";
> > +			#mbox-cells =3D <1>;
> > +			xlnx,ipi-id =3D <2>;
> > +		};
> > +	};
> > +	rpu0 {
> > +		...
> > +		mboxes =3D <&ipi_mailbox_rpu0 0>,
> > +			 <&ipi_mailbox_rpu0 1>;
> > +		mbox-names =3D "tx", "rx";
> > +	};
> > +	rpu1 {
> > +		...
> > +		mboxes =3D <&ipi_mailbox_rpu1 0>,
> > +			 <&ipi_mailbox_rpu1 1>;
> > +		mbox-names =3D "tx", "rx";
> > +	};
> > --
> > 2.7.4
> >
