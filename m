From: Nava kishore Manne <navam@xilinx.com>
Subject: RE: [RFC PATCH 1/2] ARM: dt: fpga: Added binding docs for Xilinx
 zynqmp FPGA manager
Date: Tue, 31 Jul 2018 13:07:55 +0000
Message-ID: <MWHPR0201MB34813A97EC92F8DC6E3F9CA6C22E0@MWHPR0201MB3481.namprd02.prod.outlook.com>
References: <20180801100457.25614-1-nava.manne@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180801100457.25614-1-nava.manne@xilinx.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Nava kishore Manne <navam@xilinx.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Michal Simek <michals@xilinx.com>, Soren Brinkmann <sorenb@xilinx.com>, "atull@opensource.altera.com" <atull@opensource.altera.com>, "moritz.fischer@ettus.com" <moritz.fischer@ettus.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Appana Durga Kedareswara Rao <appanad@xilinx.com>, "chinnikishore369@gmail.com" <chinnikishore369@gmail.com>, "atull@kernel.org" <atull@kernel.org>
List-Id: devicetree@vger.kernel.org

+Alan Tull

> -----Original Message-----
> From: Nava kishore Manne [mailto:nava.manne@xilinx.com]
> Sent: Wednesday, August 1, 2018 3:35 PM
> To: robh+dt@kernel.org; mark.rutland@arm.com; Michal Simek
> <michals@xilinx.com>; Soren Brinkmann <sorenb@xilinx.com>;
> atull@opensource.altera.com; moritz.fischer@ettus.com; Nava kishore Manne
> <navam@xilinx.com>; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Appana Durga
> Kedareswara Rao <appanad@xilinx.com>; chinnikishore369@gmail.com
> Cc: Nava kishore Manne <navam@xilinx.com>
> Subject: [RFC PATCH 1/2] ARM: dt: fpga: Added binding docs for Xilinx zyn=
qmp
> FPGA manager
>=20
> New bindings document for zynqmp fpga manager.
>=20
> Signed-off-by: Nava kishore Manne <navam@xilinx.com>
> ---
>  .../devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.txt   | 9 +++++++++
>  1 file changed, 9 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fpga/xlnx,zynqmp-
> pcap-fpga.txt
>=20
> diff --git a/Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-
> fpga.txt b/Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-
> fpga.txt
> new file mode 100644
> index 000000000000..0eac747747f5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.txt
> @@ -0,0 +1,9 @@
> +Xilinx Zynqmp FPGA Manager
> +
> +Required properties:
> +- compatible:		should contain "xlnx,zynqmp-pcap-fpga"
> +
> +Example:
> +	pcap: pcap@00 {
> +		compatible =3D "xlnx,zynqmp-pcap-fpga";
> +	};
> --
> 2.18.0
