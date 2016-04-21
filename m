From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 3/3] dmaengine: vdma: Add clock support
Date: Thu, 21 Apr 2016 09:21:53 -0700
Message-ID: <20160421162153.GZ7128@xsjsorenbubuntu>
References: <1461235118-800-1-git-send-email-appanad@xilinx.com>
 <1461235118-800-4-git-send-email-appanad@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1461235118-800-4-git-send-email-appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kedareswara rao Appana <appana.durga.rao-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org, anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, shubhraj-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2016-04-21 at 16:08:38 +0530, Kedareswara rao Appana wrote:
> Added basic clock support for axi dma's.
> The clocks are requested at probe and released at remove.
>=20
> Reviewed-by: Shubhrajyoti Datta <shubhraj-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Kedareswara rao Appana <appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
> Changes for v3:
> ---> Added clock support for all the AXI DMA's.
> ---> Fixed clk_unprepare leak during probe fail as suggested by Morit=
z.
> ---> Fixed comment driver specifically asks for the clocks it needs a=
nd return
> an error if a mandatory clock is missing as suggested by soren.
> Changes for v2:
> ---> None.
>=20
>  drivers/dma/xilinx/xilinx_vdma.c | 225 +++++++++++++++++++++++++++++=
+++++++++-
>  1 file changed, 223 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/dma/xilinx/xilinx_vdma.c b/drivers/dma/xilinx/xi=
linx_vdma.c
> index 5bfaa32..41bb5b3 100644
> --- a/drivers/dma/xilinx/xilinx_vdma.c
> +++ b/drivers/dma/xilinx/xilinx_vdma.c
> @@ -44,6 +44,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/of_irq.h>
>  #include <linux/slab.h>
> +#include <linux/clk.h>
> =20
>  #include "../dmaengine.h"
> =20
> @@ -344,6 +345,9 @@ struct xilinx_dma_chan {
> =20
>  struct dma_config {
>  	enum xdma_ip_type dmatype;
> +	int (*clk_init)(struct platform_device *pdev, struct clk **axi_clk,
> +			struct clk **tx_clk, struct clk **txs_clk,
> +			struct clk **rx_clk, struct clk **rxs_clk);
>  };
> =20
>  /**
> @@ -365,7 +369,13 @@ struct xilinx_dma_device {
>  	bool has_sg;
>  	u32 flush_on_fsync;
>  	bool ext_addr;
> +	struct platform_device  *pdev;
>  	const struct dma_config *dma_config;
> +	struct clk *axi_clk;
> +	struct clk *tx_clk;
> +	struct clk *txs_clk;
> +	struct clk *rx_clk;
> +	struct clk *rxs_clk;
>  };

the struct members could be documented

> =20
>  /* Macros */
> @@ -1757,6 +1767,200 @@ static void xilinx_dma_chan_remove(struct xil=
inx_dma_chan *chan)
>  	list_del(&chan->common.device_node);
>  }
> =20
> +static int axidma_clk_init(struct platform_device *pdev, struct clk =
**axi_clk,
> +			    struct clk **tx_clk, struct clk **rx_clk,
> +			    struct clk **sg_clk, struct clk **tmp_clk)
> +{
> +	int err;
> +
> +	*tmp_clk =3D NULL;
> +
> +	*axi_clk =3D devm_clk_get(&pdev->dev, "s_axi_lite_aclk");
> +	if (IS_ERR(*axi_clk)) {
> +		err =3D PTR_ERR(*axi_clk);
> +		dev_err(&pdev->dev, "failed to get axi_aclk (%u)\n", err);
> +		return err;
> +	}
> +
> +	*tx_clk =3D devm_clk_get(&pdev->dev, "m_axi_mm2s_aclk");
> +	if (IS_ERR(*tx_clk))
> +		*tx_clk =3D NULL;
> +
> +	*rx_clk =3D devm_clk_get(&pdev->dev, "m_axi_s2mm_aclk");
> +	if (IS_ERR(*rx_clk))
> +		*rx_clk =3D NULL;
> +
> +	*sg_clk =3D devm_clk_get(&pdev->dev, "m_axi_sg_aclk");
> +	if (IS_ERR(*sg_clk))
> +		*sg_clk =3D NULL;
> +
> +
> +	err =3D clk_prepare_enable(*axi_clk);

Should this be called if you know that the pointer might be NULL?

> +	if (err) {
> +		dev_err(&pdev->dev, "failed to enable axi_clk (%u)\n", err);
> +		return err;
> +	}
> +
> +	err =3D clk_prepare_enable(*tx_clk);
> +	if (err) {
> +		dev_err(&pdev->dev, "failed to enable tx_clk (%u)\n", err);
> +		goto err_disable_axiclk;
> +	}
> +
> +	err =3D clk_prepare_enable(*rx_clk);
> +	if (err) {
> +		dev_err(&pdev->dev, "failed to enable txs_clk (%u)\n", err);
> +		goto err_disable_txclk;
> +	}
> +
> +	err =3D clk_prepare_enable(*sg_clk);
> +	if (err) {
> +		dev_err(&pdev->dev, "failed to enable rxs_clk (%u)\n", err);
> +		goto err_disable_rxclk;
> +	}
> +
> +	return 0;
> +
> +err_disable_rxclk:
> +	clk_disable_unprepare(*rx_clk);
> +err_disable_txclk:
> +	clk_disable_unprepare(*tx_clk);
> +err_disable_axiclk:
> +	clk_disable_unprepare(*axi_clk);
> +
> +	return err;
> +}
> +
> +static int axicdma_clk_init(struct platform_device *pdev, struct clk=
 **axi_clk,
> +			    struct clk **dev_clk, struct clk **tmp_clk,
> +			    struct clk **tmp1_clk, struct clk **tmp2_clk)
> +{
> +	int err;
> +
> +	*tmp_clk =3D NULL;
> +	*tmp1_clk =3D NULL;
> +	*tmp2_clk =3D NULL;
> +
> +	*axi_clk =3D devm_clk_get(&pdev->dev, "s_axi_lite_aclk");
> +	if (IS_ERR(*axi_clk)) {
> +		err =3D PTR_ERR(*axi_clk);
> +		dev_err(&pdev->dev, "failed to get axi_aclk (%u)\n", err);
> +		return err;
> +	}
> +
> +	*dev_clk =3D devm_clk_get(&pdev->dev, "m_axi_aclk");
> +	if (IS_ERR(*dev_clk))
> +		*dev_clk =3D NULL;

This is a required clock according to binding but a failure is ignored
here.

> +
> +
> +	err =3D clk_prepare_enable(*axi_clk);
> +	if (err) {
> +		dev_err(&pdev->dev, "failed to enable axi_clk (%u)\n", err);
> +		return err;
> +	}
> +
> +	err =3D clk_prepare_enable(*dev_clk);
> +	if (err) {
> +		dev_err(&pdev->dev, "failed to enable tx_clk (%u)\n", err);
> +		goto err_disable_axiclk;
> +	}
> +
> +
> +	return 0;
> +
> +err_disable_axiclk:
> +	clk_disable_unprepare(*axi_clk);
> +
> +	return err;
> +}
> +
> +static int axivdma_clk_init(struct platform_device *pdev, struct clk=
 **axi_clk,
> +			    struct clk **tx_clk, struct clk **txs_clk,
> +			    struct clk **rx_clk, struct clk **rxs_clk)
> +{
> +	int err;
> +
> +	*axi_clk =3D devm_clk_get(&pdev->dev, "s_axi_lite_aclk");
> +	if (IS_ERR(*axi_clk)) {
> +		err =3D PTR_ERR(*axi_clk);
> +		dev_err(&pdev->dev, "failed to get axi_aclk (%u)\n", err);
> +		return err;
> +	}
> +
> +	*tx_clk =3D devm_clk_get(&pdev->dev, "m_axi_mm2s_aclk");
> +	if (IS_ERR(*tx_clk))
> +		*tx_clk =3D NULL;
> +
> +	*txs_clk =3D devm_clk_get(&pdev->dev, "m_axis_mm2s_aclk");
> +	if (IS_ERR(*txs_clk))
> +		*txs_clk =3D NULL;
> +
> +	*rx_clk =3D devm_clk_get(&pdev->dev, "m_axi_s2mm_aclk");
> +	if (IS_ERR(*rx_clk))
> +		*rx_clk =3D NULL;
> +
> +	*rxs_clk =3D devm_clk_get(&pdev->dev, "s_axis_s2mm_aclk");
> +	if (IS_ERR(*rxs_clk))
> +		*rxs_clk =3D NULL;
> +
> +
> +	err =3D clk_prepare_enable(*axi_clk);
> +	if (err) {
> +		dev_err(&pdev->dev, "failed to enable axi_clk (%u)\n", err);
> +		return err;
> +	}
> +
> +	err =3D clk_prepare_enable(*tx_clk);
> +	if (err) {
> +		dev_err(&pdev->dev, "failed to enable tx_clk (%u)\n", err);
> +		goto err_disable_axiclk;
> +	}
> +
> +	err =3D clk_prepare_enable(*txs_clk);
> +	if (err) {
> +		dev_err(&pdev->dev, "failed to enable txs_clk (%u)\n", err);
> +		goto err_disable_txclk;
> +	}
> +
> +	err =3D clk_prepare_enable(*rx_clk);
> +	if (err) {
> +		dev_err(&pdev->dev, "failed to enable rx_clk (%u)\n", err);
> +		goto err_disable_txsclk;
> +	}
> +
> +	err =3D clk_prepare_enable(*rxs_clk);
> +	if (err) {
> +		dev_err(&pdev->dev, "failed to enable rxs_clk (%u)\n", err);
> +		goto err_disable_rxclk;
> +	}
> +
> +	return 0;
> +
> +err_disable_rxclk:
> +	clk_disable_unprepare(*rx_clk);
> +err_disable_txsclk:
> +	clk_disable_unprepare(*txs_clk);
> +err_disable_txclk:
> +	clk_disable_unprepare(*tx_clk);
> +err_disable_axiclk:
> +	clk_disable_unprepare(*axi_clk);
> +
> +	return err;
> +}
> +
> +static void xdma_disable_allclks(struct xilinx_dma_device *xdev)
> +{
> +	if (!IS_ERR(xdev->rxs_clk))

The init functions set the optional clocks to NULL if not present. So,
these pointers should be valid or NULL, but not an error pointer (I
think NULL is not considered an error pointer as there is a
IS_ERR_OR_NULL macro).

> +		clk_disable_unprepare(xdev->rxs_clk);
> +	if (!IS_ERR(xdev->rx_clk))
> +		clk_disable_unprepare(xdev->rx_clk);
> +	if (!IS_ERR(xdev->txs_clk))
> +		clk_disable_unprepare(xdev->txs_clk);
> +	if (!IS_ERR(xdev->tx_clk))
> +		clk_disable_unprepare(xdev->tx_clk);
> +	clk_disable_unprepare(xdev->axi_clk);
> +}
> +
>  /**
>   * xilinx_dma_chan_probe - Per Channel Probing
>   * It get channel features from the device tree entry and
> @@ -1900,14 +2104,17 @@ static struct dma_chan *of_dma_xilinx_xlate(s=
truct of_phandle_args *dma_spec,
> =20
>  static const struct dma_config axidma_config =3D {
>  	.dmatype =3D XDMA_TYPE_AXIDMA,
> +	.clk_init =3D axidma_clk_init,
>  };
> =20
>  static const struct dma_config axicdma_config =3D {
>  	.dmatype =3D XDMA_TYPE_CDMA,
> +	.clk_init =3D axicdma_clk_init,
>  };
> =20
>  static const struct dma_config axivdma_config =3D {
>  	.dmatype =3D XDMA_TYPE_VDMA,
> +	.clk_init =3D axivdma_clk_init,
>  };
> =20
>  static const struct of_device_id xilinx_dma_of_ids[] =3D {
> @@ -1926,9 +2133,13 @@ MODULE_DEVICE_TABLE(of, xilinx_dma_of_ids);
>   */
>  static int xilinx_dma_probe(struct platform_device *pdev)
>  {
> +	int (*clk_init)(struct platform_device *, struct clk **, struct clk=
 **,
> +			struct clk **, struct clk **, struct clk **)
> +					=3D axivdma_clk_init;
>  	struct device_node *node =3D pdev->dev.of_node;
>  	struct xilinx_dma_device *xdev;
>  	struct device_node *child, *np =3D pdev->dev.of_node;
> +	struct clk *axi_clk, *tx_clk, *txs_clk, *rx_clk, *rxs_clk;

Are these local vars ever transferred into the struct xilinx_dma_device
(I actually think you can directly use the struct instead of these
locals).

>  	struct resource *io;
>  	u32 num_frames, addr_width;
>  	int i, err;
> @@ -1943,10 +2154,16 @@ static int xilinx_dma_probe(struct platform_d=
evice *pdev)
>  		const struct of_device_id *match;
> =20
>  		match =3D of_match_node(xilinx_dma_of_ids, np);
> -		if (match && match->data)
> +		if (match && match->data) {
>  			xdev->dma_config =3D match->data;
> +			clk_init =3D xdev->dma_config->clk_init;
> +		}
>  	}
> =20
> +	err =3D clk_init(pdev, &axi_clk, &tx_clk, &txs_clk, &rx_clk, &rxs_c=
lk);
> +	if (err)
> +		return err;
> +
>  	/* Request and map I/O memory */
>  	io =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	xdev->regs =3D devm_ioremap_resource(&pdev->dev, io);
> @@ -2019,7 +2236,7 @@ static int xilinx_dma_probe(struct platform_dev=
ice *pdev)
>  	for_each_child_of_node(node, child) {
>  		err =3D xilinx_dma_chan_probe(xdev, child);
>  		if (err < 0)
> -			goto error;
> +			goto disable_clks;
>  	}
> =20
>  	if (xdev->dma_config->dmatype =3D=3D XDMA_TYPE_VDMA) {
> @@ -2043,6 +2260,8 @@ static int xilinx_dma_probe(struct platform_dev=
ice *pdev)
> =20
>  	return 0;
> =20
> +disable_clks:
> +	xdma_disable_allclks(xdev);
>  error:
>  	for (i =3D 0; i < XILINX_DMA_MAX_CHANS_PER_DEVICE; i++)
>  		if (xdev->chan[i])
> @@ -2070,6 +2289,8 @@ static int xilinx_dma_remove(struct platform_de=
vice *pdev)
>  		if (xdev->chan[i])
>  			xilinx_dma_chan_remove(xdev->chan[i]);
> =20
> +	xdma_disable_allclks(xdev);
> +
>  	return 0;
>  }

S=C3=B6ren
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
