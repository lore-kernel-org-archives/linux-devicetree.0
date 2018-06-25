From: Appana Durga Kedareswara Rao <appanad@xilinx.com>
Subject: RE: [PATCH 1/2] dt-bindings: dmaengine: xilinx_dma: Add VDMA vertical
 flip property
Date: Mon, 25 Jun 2018 09:06:49 +0000
Message-ID: <SN1PR02MB169323BF21815A019D0C486BDC4A0@SN1PR02MB1693.namprd02.prod.outlook.com>
References: <1528875288-9140-1-git-send-email-radhey.shyam.pandey@xilinx.com>
 <1528875288-9140-2-git-send-email-radhey.shyam.pandey@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1528875288-9140-2-git-send-email-radhey.shyam.pandey@xilinx.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "vkoul@kernel.org" <vkoul@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Michal Simek <michals@xilinx.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "lars@metafoo.de" <lars@metafoo.de>
Cc: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Radhey Shyam Pandey <radheys@xilinx.com>
List-Id: devicetree@vger.kernel.org

<Snip>=20
>=20
> The AXI VDMA core supports Vertical flip in S2MM path when Enable Vertica=
l
> Flip (Advanced tab) is selected. To allow vertical flip programming defin=
e an
> optional 'xlnx,enable-vert-flip' channel child node property.
>=20
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>

Acked-by: Kedareswara rao Appana <appanad@xilinx.com>  =20

Regards,
Kedar.

> ---
>  .../devicetree/bindings/dma/xilinx/xilinx_dma.txt  |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
> b/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
> index a2b8bfa..174af2c 100644
> --- a/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
> +++ b/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
> @@ -66,6 +66,8 @@ Optional child node properties:
>  Optional child node properties for VDMA:
>  - xlnx,genlock-mode: Tells Genlock synchronization is
>  	enabled/disabled in hardware.
> +- xlnx,enable-vert-flip: Tells vertical flip is
> +	enabled/disabled in hardware(S2MM path).
>  Optional child node properties for AXI DMA:
>  -dma-channels: Number of dma channels in child node.
>=20
> --
> 1.7.1
