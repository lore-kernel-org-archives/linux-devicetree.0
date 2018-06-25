From: Appana Durga Kedareswara Rao <appanad@xilinx.com>
Subject: RE: [PATCH 2/2] dmaengine: xilinx_dma: Enable VDMA S2MM vertical flip
 support
Date: Mon, 25 Jun 2018 09:05:58 +0000
Message-ID: <SN1PR02MB16933049734FBC759F8D8F48DC4A0@SN1PR02MB1693.namprd02.prod.outlook.com>
References: <1528875288-9140-1-git-send-email-radhey.shyam.pandey@xilinx.com>
 <1528875288-9140-3-git-send-email-radhey.shyam.pandey@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1528875288-9140-3-git-send-email-radhey.shyam.pandey@xilinx.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "vkoul@kernel.org" <vkoul@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Michal Simek <michals@xilinx.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "lars@metafoo.de" <lars@metafoo.de>
Cc: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Radhey Shyam Pandey <radheys@xilinx.com>
List-Id: devicetree@vger.kernel.org


<Snip>
>=20
> Vertical flip state is exported in xilinx_vdma_config and depending on IP
> configuration(c_enable_vert_flip) vertical flip state is programmed in
> hardware.
>=20
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>

Acked-by: Kedareswara rao Appana <appanad@xilinx.com> =20

> ---
>  drivers/dma/xilinx/xilinx_dma.c |   22 ++++++++++++++++++++++
>  include/linux/dma/xilinx_dma.h  |    2 ++
>  2 files changed, 24 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/dma/xilinx/xilinx_dma.c
> b/drivers/dma/xilinx/xilinx_dma.c index 27b5235..c124423 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -115,6 +115,9 @@
>  #define XILINX_VDMA_REG_START_ADDRESS(n)	(0x000c + 4 * (n))
>  #define XILINX_VDMA_REG_START_ADDRESS_64(n)	(0x000c + 8 * (n))
>=20
> +#define XILINX_VDMA_REG_ENABLE_VERTICAL_FLIP	0x00ec
> +#define XILINX_VDMA_ENABLE_VERTICAL_FLIP	BIT(0)
> +
>  /* HW specific definitions */
>  #define XILINX_DMA_MAX_CHANS_PER_DEVICE	0x20
>=20
> @@ -340,6 +343,7 @@ struct xilinx_dma_tx_descriptor {
>   * @start_transfer: Differentiate b/w DMA IP's transfer
>   * @stop_transfer: Differentiate b/w DMA IP's quiesce
>   * @tdest: TDEST value for mcdma
> + * @has_vflip: S2MM vertical flip
>   */
>  struct xilinx_dma_chan {
>  	struct xilinx_dma_device *xdev;
> @@ -376,6 +380,7 @@ struct xilinx_dma_chan {
>  	void (*start_transfer)(struct xilinx_dma_chan *chan);
>  	int (*stop_transfer)(struct xilinx_dma_chan *chan);
>  	u16 tdest;
> +	bool has_vflip;
>  };
>=20
>  /**
> @@ -1092,6 +1097,14 @@ static void xilinx_vdma_start_transfer(struct
> xilinx_dma_chan *chan)
>  				desc->async_tx.phys);
>=20
>  	/* Configure the hardware using info in the config structure */
> +	if (chan->has_vflip) {
> +		reg =3D dma_read(chan,
> XILINX_VDMA_REG_ENABLE_VERTICAL_FLIP);
> +		reg &=3D ~XILINX_VDMA_ENABLE_VERTICAL_FLIP;
> +		reg |=3D config->vflip_en;
> +		dma_write(chan,
> XILINX_VDMA_REG_ENABLE_VERTICAL_FLIP,
> +			  reg);
> +	}
> +
>  	reg =3D dma_ctrl_read(chan, XILINX_DMA_REG_DMACR);
>=20
>  	if (config->frm_cnt_en)
> @@ -2105,6 +2118,8 @@ int xilinx_vdma_channel_set_config(struct
> dma_chan *dchan,
>  	}
>=20
>  	chan->config.frm_cnt_en =3D cfg->frm_cnt_en;
> +	chan->config.vflip_en =3D cfg->vflip_en;
> +
>  	if (cfg->park)
>  		chan->config.park_frm =3D cfg->park_frm;
>  	else
> @@ -2428,6 +2443,13 @@ static int xilinx_dma_chan_probe(struct
> xilinx_dma_device *xdev,
>  		chan->direction =3D DMA_DEV_TO_MEM;
>  		chan->id =3D chan_id;
>  		chan->tdest =3D chan_id - xdev->nr_channels;
> +		chan->has_vflip =3D of_property_read_bool(node,
> +					"xlnx,enable-vert-flip");
> +		if (chan->has_vflip) {
> +			chan->config.vflip_en =3D dma_read(chan,
> +				XILINX_VDMA_REG_ENABLE_VERTICAL_FLIP)
> &
> +				XILINX_VDMA_ENABLE_VERTICAL_FLIP;
> +		}
>=20
>  		chan->ctrl_offset =3D XILINX_DMA_S2MM_CTRL_OFFSET;
>  		if (xdev->dma_config->dmatype =3D=3D XDMA_TYPE_VDMA) { diff
> --git a/include/linux/dma/xilinx_dma.h b/include/linux/dma/xilinx_dma.h
> index 34b98f2..5b6e61e 100644
> --- a/include/linux/dma/xilinx_dma.h
> +++ b/include/linux/dma/xilinx_dma.h
> @@ -27,6 +27,7 @@
>   * @delay: Delay counter
>   * @reset: Reset Channel
>   * @ext_fsync: External Frame Sync source
> + * @vflip_en:  Vertical Flip enable
>   */
>  struct xilinx_vdma_config {
>  	int frm_dly;
> @@ -39,6 +40,7 @@ struct xilinx_vdma_config {
>  	int delay;
>  	int reset;
>  	int ext_fsync;
> +	bool vflip_en;
>  };
>=20
>  int xilinx_vdma_channel_set_config(struct dma_chan *dchan,
> --
> 1.7.1
