From: Jiaying Liang <jliang-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: [RFC LINUX PATCH] Dcoumentation: dt: mailbox: Add Xilinx IPI
 Mailbox
Date: Fri, 22 Sep 2017 06:05:18 +0000
Message-ID: <BY1PR0201MB0885E6563EBAFE83DF8822A4B0670@BY1PR0201MB0885.namprd02.prod.outlook.com>
References: <1506034724-14639-1-git-send-email-jliang@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1506034724-14639-1-git-send-email-jliang-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jiaying Liang <jliang-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cyril Chemparathy <cyrilc-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Michal Simek <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Soren Brinkmann <sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Wendy Liang [mailto:wendy.liang-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org]
> Sent: Thursday, September 21, 2017 3:59 PM
> To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; Cyril Chemparathy <cyrilc-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>;
> Michal Simek <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>; Jiaying Liang <jliang-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Subject: [RFC LINUX PATCH] Dcoumentation: dt: mailbox: Add Xilinx IPI
> Mailbox
>=20
> Xilinx ZynqMP IPI(Inter Processor Interrupt) is a hardware block in ZynqM=
P
> SoC used for the communication between various processor systems.
>=20
> Signed-off-by: Wendy Liang <jliang-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
>  .../bindings/mailbox/xlnx,zynqmp-ipi-mailbox.txt   | 88
> ++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.txt
>=20
> diff --git a/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-
> mailbox.txt b/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-
> mailbox.txt
> new file mode 100644
> index 0000000..5d915d1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.
> +++ txt
> @@ -0,0 +1,88 @@
> +Xilinx IPI Mailbox Driver
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The Xilinx IPI(Inter Processor Interrupt) mailbox driver is a mailbox
> +controller that manages the messaging between two IPI agents. Each IPI
> +mailbox has request and response buffers between the two IPI agents.
> +
> ++-------------------------------------+
> +|                                     | Xilinx ZynqMP IPI Mailbox
> +| Controller|
> +|                                     |
> +|                       +-------------+
> +|                       |     SMC     |
> +|                       |             |
> ++--------+--------------+------+------+
> +         |                     |
> +         |          +-----------------+
> +         |                     |   ATF (ARM trusted firmware)
> +         |                     |
> ++-------------------------------------+
> +         |                     |   Hardware
> +         |                     |
> + +--------------------------------------+
> +                               |        |
> + +----------------------+ +-----------+ |
> + | | Buffers between    | | IPI Agent | |
> + | | two IPI agents     | | Registers | |
> + | +--------------------+ +-----------+ |
> + |                                      |
> + |   Xilinx ZynqMP IPI                  |
> + +--------------------------------------+
> +
> +
> +Message Manager Device Node:
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +Required properties:
> +--------------------
> +- compatible:		Shall be: "xlnx,zynqmp-ipi-mailbox"
> +- ipi-smc-fid-base	Base offset of SMC function IDs for IPI mailbox SMC.
> +			It contains the IPI IDs of the two IPI agents.
> +- reg:			IPI request and response buffers address range. It
> +			can be the IPI buffers from the hardware or it can
> +			be carved out shared memory.
> +- reg-names:		Reg resource name of the IPI request and response
> +			buffers.
> +- #mbox-cells:		Shall be 1. Contains the logical channel IDs of the
> +			channels on the IPI mailbox.
> +- interrupt-parent:	Phandle for the interrupt controller.
> +- interrupts:		Interrupt mapping.
> +
> +Required properties:
> +--------------------
> +- method:		The method of accessing the IPI agent registers.
> +			Permitted values are: "smc" and "hvc". Default is
> +			"smc".
> +Example:
> +------------
> +	/* APU IPI mailbox driver */
> +	ipis {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		ipi_mailbox_apu_rpu0: ipi_mailbox@0 {
> +			compatible =3D "xlnx,zynqmp-ipi-mailbox";
> +			reg =3D <0 0xff990400 40>;
> +			reg-names =3D "apu-rpu0";
> +			ipi-smc-fid-base =3D <0x1010>;
> +			method =3D "smc";
> +			#mbox-cells =3D <1>;
> +			interrupt-parent =3D <&gic>;
> +			interrupts =3D <0 35 4>;
> +		};
> +		ipi_mailbox_apu_rpu1: ipi_mailbox@1 {
> +			compatible =3D "xlnx,zynqmp-ipi-mailbox";
> +			reg =3D <0 0xff990440 40>;
> +			reg-names =3D "apu-rpu1";
> +			ipi-smc-fid-base =3D <0x1020>;
> +			method =3D "smc";
> +			#mbox-cells =3D <1>;
> +			interrupt-parent =3D <&gic>;
> +			interrupts =3D <0 35 4>;
> +		};
> +	};
> +	device0: device0 {
> +		...
> +		mbox-names =3D "rpu0", "rpu1",
> +		mboxes =3D <&ipi_mailbox_apu_rpu0 0>,
> +			 < &ipi_mailbox_apu_rpu1 0>;
> +	};
> --
> 2.7.4

cc: device tree and linux arm kernel mailing lists.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
