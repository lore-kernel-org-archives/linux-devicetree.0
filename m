From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH v2 3/6] Documentation: DT: vdma: update binding doc for
 AXI DMA
Date: Sun, 27 Mar 2016 12:26:00 -0700
Message-ID: <20160327192600.GI19212@xsjsorenbubuntu>
References: <1459101966-9932-1-git-send-email-appanad@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1459101966-9932-1-git-send-email-appanad@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, michal.simek@xilinx.com, vinod.koul@intel.com, dan.j.williams@intel.com, anuragku@xilinx.com, appanad@xilinx.com, moritz.fischer@ettus.com, laurent.pinchart@ideasonboard.com, luis@debethencourt.com, svemula@xilinx.com, anirudh@xilinx.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, 2016-03-27 at 23:36:05 +0530, Kedareswara rao Appana wrote:
> This patch updates the device-tree binding doc for
> adding support for AXI DMA.
>=20
> Signed-off-by: Kedareswara rao Appana <appanad@xilinx.com>
> ---
> Changes for v2:
> ---> Modified commit message as suggested by Vinod.
> ---> Moved the patch to forward in the series as suggested by vinod.
>=20
>  .../devicetree/bindings/dma/xilinx/xilinx_vdma.txt | 22 ++++++++++++=
+++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma=
=2Etxt b/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
> index a86737c..5841421 100644
> --- a/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
> +++ b/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
> @@ -3,8 +3,13 @@ It can be configured to have one channel or two chan=
nels. If configured
>  as two channels, one is to transmit to the video device and another =
is
>  to receive from the video device.
> =20
> +Xilinx AXI DMA engine, it does transfers between memory and AXI4 str=
eam
> +target devices. It can be configured to have one channel or two chan=
nels.
> +If configured as two channels, one is to transmit to the device and =
another
> +is to receive from the device.
> +
>  Required properties:
> -- compatible: Should be "xlnx,axi-vdma-1.00.a"
> +- compatible: Should be "xlnx,axi-vdma-1.00.a" or "xlnx,axi-dma-1.00=
=2Ea"
>  - #dma-cells: Should be <1>, see "dmas" property below
>  - reg: Should contain VDMA registers location and length.
>  - xlnx,num-fstores: Should be the number of framebuffers as configur=
ed in h/w.
> @@ -59,6 +64,21 @@ axi_vdma_0: axivdma@40030000 {
>  	} ;
>  } ;
> =20
> +axi_dma_0: axidma@40400000 {

The node names should follow the generic names, hence
'dma-controller@...'.

> +	compatible =3D "xlnx,axi-dma-1.00.a";
> +	#dma-cells =3D <1>;
> +	reg =3D < 0x40400000 0x10000 >;
> +	dma-channel@40400000 {
> +		compatible =3D "xlnx,axi-dma-mm2s-channel";
> +		interrupts =3D < 0 59 4 >;
> +		xlnx,datawidth =3D <0x40>;
> +	} ;
> +	dma-channel@40400030 {
> +		compatible =3D "xlnx,axi-dma-s2mm-channel";
> +		interrupts =3D < 0 58 4 >;
> +		xlnx,datawidth =3D <0x40>;

Nit: The spacing around the '<' '>' is inconsistent. I'd just remove al=
l
redundant spaces.

	S=C3=B6ren
