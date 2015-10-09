From: Josh Cartwright <joshc-acOepvfBmUk@public.gmane.org>
Subject: Re: [PATCH 3/3] fpga manager: Adding FPGA Manager support for Xilinx
 Zynq 7000
Date: Fri, 9 Oct 2015 11:33:36 -0500
Message-ID: <20151009163336.GM10631@jcartwri.amer.corp.natinst.com>
References: <1444344307-22509-1-git-send-email-moritz.fischer@ettus.com>
 <1444344307-22509-4-git-send-email-moritz.fischer@ettus.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MzdA25v054BPvyZa"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444344307-22509-4-git-send-email-moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Cc: michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--MzdA25v054BPvyZa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Moritz-

On Fri, Oct 09, 2015 at 12:45:07AM +0200, Moritz Fischer wrote:
> This commit adds FPGA Manager support for the Xilinx Zynq chip.
> The code heavily borrows from the xdevcfg driver in Xilinx'
> vendor tree.
>=20
> Signed-off-by: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
[..]
> +++ b/drivers/fpga/zynq-fpga.c
[..]
> +static irqreturn_t zynq_fpga_isr(int irq, void *data)
> +{
> +	u32 intr_status;
> +	struct zynq_fpga_priv *priv =3D data;
> +
> +	spin_lock(&priv->lock);

I'm confused about the locking here.  You have this lock, but it's only
used in the isr.  It's claimed purpose is to protect 'error', but that
clearly isn't happening.

> +	intr_status =3D zynq_fpga_read(priv, INT_STS_OFFSET);
> +
> +	if (!intr_status) {
> +		spin_unlock(&priv->lock);
> +		return IRQ_NONE;
> +	}
> +
> +	zynq_fpga_write(priv, INT_STS_OFFSET, intr_status);
> +
> +	if ((intr_status & IXR_D_P_DONE_MASK) =3D=3D IXR_D_P_DONE_MASK)
> +		complete(&priv->dma_done);

Just so I understand, wouldn't you also want to complete() in the error
case, too?

> +	if ((intr_status & IXR_ERROR_FLAGS_MASK) =3D=3D
> +			IXR_ERROR_FLAGS_MASK) {
> +		priv->error =3D true;
> +		dev_err(priv->dev, "%s dma error\n", __func__);
> +	}
> +	spin_unlock(&priv->lock);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int zynq_fpga_ops_write_init(struct fpga_manager *mgr, u32 flags,
> +				    const char *buf, size_t count)
> +{
> +	struct zynq_fpga_priv *priv;
> +	u32 ctrl, status;
> +	int err;
> +
> +	priv =3D mgr->priv;
> +
> +	err =3D clk_enable(priv->clk);
> +	if (err)
> +		return err;
> +
> +	/* only reset if we're not doing partial reconfig */
> +	if (!(flags & FPGA_MGR_PARTIAL_RECONFIG)) {
> +		/* assert AXI interface resets */
> +		regmap_write(priv->slcr, SLCR_FPGA_RST_CTRL_OFFSET,
> +			     FPGA_RST_ALL_MASK);
> +
> +		/* disable level shifters */
> +		regmap_write(priv->slcr, SLCR_LVL_SHFTR_EN_OFFSET,
> +			     LVL_SHFTR_DISABLE_ALL_MASK);
> +		/* enable output level shifters */
> +		regmap_write(priv->slcr, SLCR_LVL_SHFTR_EN_OFFSET,
> +			     LVL_SHFTR_ENABLE_PS_TO_PL);
> +
> +		/* create a rising edge on PCFG_INIT. PCFG_INIT follows
> +		 * PCFG_PROG_B, so we need to poll it after setting PCFG_PROG_B
> +		 * to make sure the rising edge actually happens
> +		 */
> +		ctrl =3D zynq_fpga_read(priv, CTRL_OFFSET);
> +		ctrl |=3D CTRL_PCFG_PROG_B_MASK;
> +
> +		zynq_fpga_write(priv, CTRL_OFFSET, ctrl);
> +
> +		zynq_fpga_poll_timeout(priv, STATUS_OFFSET, status, status &
> +				       STATUS_PCFG_INIT_MASK, 20, 0);

And if we timeout?

> +
> +		ctrl =3D zynq_fpga_read(priv, CTRL_OFFSET);
> +		ctrl &=3D ~CTRL_PCFG_PROG_B_MASK;
> +
> +		zynq_fpga_write(priv, CTRL_OFFSET, ctrl);
> +
> +		zynq_fpga_poll_timeout(priv, STATUS_OFFSET, status, !(status &
> +				       STATUS_PCFG_INIT_MASK), 20, 0);

And if we timeout?

> +
> +		ctrl =3D zynq_fpga_read(priv, CTRL_OFFSET);
> +		ctrl |=3D CTRL_PCFG_PROG_B_MASK;
> +
> +		zynq_fpga_write(priv, CTRL_OFFSET, ctrl);
> +
> +		zynq_fpga_poll_timeout(priv, STATUS_OFFSET, status, status &
> +				       STATUS_PCFG_INIT_MASK, 20, 0);

And if we timeout?

> +	}
> +
> +	clk_disable(priv->clk);
> +
> +	return 0;
> +}
> +
> +static int zynq_fpga_ops_write(struct fpga_manager *mgr,
> +			       const char *buf, size_t count)
> +{
> +	struct zynq_fpga_priv *priv;
> +	int err;
> +	char *kbuf;
> +	size_t i, in_count;
> +	dma_addr_t dma_addr;
> +	u32 transfer_length =3D 0;
> +	bool endian_swap =3D false;
> +
> +	in_count =3D count;
> +	priv =3D mgr->priv;
> +
> +	kbuf =3D dma_alloc_coherent(priv->dev, count, &dma_addr, GFP_KERNEL);
> +	if (!kbuf)
> +		return -ENOMEM;
> +
> +	memcpy(kbuf, buf, count);
> +
> +	/* look for the sync word */
> +	for (i =3D 0; i < count - 4; i++) {
> +		if (memcmp(kbuf + i, "\x66\x55\x99\xAA", 4) =3D=3D 0) {
> +			dev_dbg(priv->dev, "Found normal sync word\n");
> +			endian_swap =3D false;
> +			break;
> +		}
> +		if (memcmp(kbuf + i, "\xAA\x99\x55\x66", 4) =3D=3D 0) {
> +			dev_dbg(priv->dev, "Found swapped sync word\n");
> +			endian_swap =3D true;
> +			break;
> +		}
> +	}

How much control do we have over mandating the format of firmware at
this point?  It'd be swell if we could just mandate a specific
endianness, and leave this munging to usermode.

> +	/* remove the header, align the data on word boundary */
> +	if (i !=3D count - 4) {
> +		count -=3D i;
> +		memmove(kbuf, kbuf + i, count);
> +	}
> +
> +	/* fixup endianness of the data */
> +	if (endian_swap) {
> +		for (i =3D 0; i < count; i +=3D 4) {

Aren't we writing beyond the buffer, if count isn't word-aligned?

> +			u32 *p =3D (u32 *)&kbuf[i];
> +			*p =3D swab32(*p);
> +		}
> +	}
> +
> +	/* enable clock */
> +	err =3D clk_enable(priv->clk);
> +	if (err)
> +		goto out_free;
> +
> +	zynq_fpga_write(priv, INT_STS_OFFSET, IXR_ALL_MASK);
> +
> +	/* enable DMA and error IRQs */
> +	zynq_fpga_unmask_irqs(priv);
> +
> +	priv->error =3D false;
> +
> +	/* the +1 in the src addr is used to hold off on DMA_DONE IRQ */
> +	/* until both AXI and PCAP are done */
> +	if (count < PAGE_SIZE)
> +		zynq_fpga_write(priv, DMA_SRC_ADDR_OFFSET, (u32)(dma_addr + 1));
> +	else
> +		zynq_fpga_write(priv, DMA_SRC_ADDR_OFFSET, (u32)(dma_addr));
> +
> +	zynq_fpga_write(priv, DMA_DEST_ADDR_OFFSET, (u32)DMA_INVALID_ADDRESS);
> +
> +	/* convert #bytes to #words */
> +	transfer_length =3D (count + 3) / 4;
> +
> +	zynq_fpga_write(priv, DMA_SRC_LEN_OFFSET, transfer_length);
> +	zynq_fpga_write(priv, DMA_DEST_LEN_OFFSET, 0);
> +
> +	wait_for_completion_interruptible(&priv->dma_done);

And if we're interrupted?

> +	if (priv->error) {
> +		dev_err(priv->dev, "Error configuring FPGA.\n");
> +		err =3D -EFAULT;
> +	}
> +
> +	/* disable DMA and error IRQs */
> +	zynq_fpga_mask_irqs(priv);
> +
> +	clk_disable(priv->clk);
> +
> +out_free:
> +	dma_free_coherent(priv->dev, in_count, kbuf, dma_addr);
> +
> +	return err;
> +}
[..]
> +static int zynq_fpga_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct zynq_fpga_priv *priv;
> +	struct resource *res;
> +	u32 ctrl_reg;
> +	int ret;
> +
[..]
> +	priv->irq =3D platform_get_irq(pdev, 0);
> +	if (priv->irq < 0) {
> +		dev_err(dev, "No IRQ available");
> +		return priv->irq;
> +	}
> +
> +	ret =3D devm_request_irq(dev, priv->irq, zynq_fpga_isr, 0,
> +			       dev_name(dev), priv);
> +	if (IS_ERR_VALUE(ret))

This is the wrong check for error in this case.  You should check 'ret'
being non-zero.

> +		return ret;
> +
> +	priv->clk =3D devm_clk_get(dev, "ref_clk");
> +	if (IS_ERR(priv->clk)) {
> +		dev_err(dev, "input clock not found\n");
> +		return PTR_ERR(priv->clk);
> +	}
> +
> +	ret =3D clk_prepare_enable(priv->clk);
> +	if (ret) {
> +		dev_err(dev, "unable to enable clock\n");
> +		return ret;
> +	}
> +
> +	/* unlock the device */
> +	zynq_fpga_write(priv, UNLOCK_OFFSET, UNLOCK_MASK);
> +
> +	/* set configuration register with following options:
> +	* - reset FPGA
> +	* - enable PCAP interface for partial reconfig
> +	* - set throughput for maximum speed
> +	* - set CPU in user mode
> +	*/
> +	ctrl_reg =3D zynq_fpga_read(priv, CTRL_OFFSET);
> +	zynq_fpga_write(priv, CTRL_OFFSET, (CTRL_PCFG_PROG_B_MASK |
> +		CTRL_PCAP_PR_MASK | CTRL_PCAP_MODE_MASK | ctrl_reg));
> +
> +	/* ensure internal PCAP loopback is disabled */
> +	ctrl_reg =3D zynq_fpga_read(priv, MCTRL_OFFSET);
> +	zynq_fpga_write(priv, MCTRL_OFFSET, (~MCTRL_PCAP_LPBK_MASK & ctrl_reg));

Why do all of this initialization in probe()?  Is it necessary to read
FPGA state()?
>
> +
> +	ret =3D fpga_mgr_register(dev, "Xilinx Zynq FPGA Manager",
> +				&zynq_fpga_ops, priv);
> +	if (ret) {
> +		dev_err(dev, "unable to register FPGA manager");
> +		clk_disable_unprepare(priv->clk);
> +		return ret;
> +	}

I would have expected the clock to have been disabled after even a
successful probe.

> +	return 0;
> +}
> +
> +static int zynq_fpga_remove(struct platform_device *pdev)
> +{
> +	fpga_mgr_unregister(&pdev->dev);

Your clock management is unbalanced.

  Josh

--MzdA25v054BPvyZa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJWF+xdAAoJEKp7ZBKwQFArmvUH/0gmOxWGaVoOZnH+yAjDH12x
AMJ2SV7rMZLIPaUh77qSaRA+rxIAN4ZZKQ77GMn1mJdiHLiZXyYmQrrr+miLlolM
NeCP3foMmkgoRUvUbvPSug2R1vdjiTvaWrRemQN6j654hqfI32qlLQKYVg3RrVDL
ZLDyYuoX4lQ0aqwxVbDb13u5+2I1cPsHzAxijA9XlutFfbHnv/2NIw/cs2ga/8pg
YOWN/PuGzHCEHNgsyLKuiym3bmBnuu1mZ9feV7RUs5NzOt3Gz4EcQYpMsMja94Oc
x25GkolSf9pQmC13DK3XHVS6tUGjymg3qbE8kVt6zxoGSf5PEC9Sj3rzC0ho3iA=
=NYt9
-----END PGP SIGNATURE-----

--MzdA25v054BPvyZa--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
