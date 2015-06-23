From: Josh Cartwright <joshc-acOepvfBmUk@public.gmane.org>
Subject: Re: [PATCHv5 2/2] mailbox: Adding driver for Xilinx LogiCORE IP
 mailbox.
Date: Tue, 23 Jun 2015 13:51:10 -0500
Message-ID: <20150623185110.GB9591@jcartwri.amer.corp.natinst.com>
References: <1435082402-29239-1-git-send-email-moritz.fischer@ettus.com>
 <1435082402-29239-3-git-send-email-moritz.fischer@ettus.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xXmbgvnjoT4axfJE"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435082402-29239-3-git-send-email-moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Cc: jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--xXmbgvnjoT4axfJE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Moritz-

Just a couple more nits, nothing big.  Looks pretty clean!

On Tue, Jun 23, 2015 at 11:00:02AM -0700, Moritz Fischer wrote:
> The Xilinx LogiCORE IP mailbox is a FPGA core that allows for
> interprocessor communication via AXI4 memory mapped / AXI4 stream
> interfaces.
>=20
> It is single channel per core and allows for transmit and receive.
>=20
> Changes from v4:
> - Have separate mbox_ops structs for polling / irq mode
> - Moved clk handling to startup / shutdown
> - Embedded struct mbox_chan in struct xilinx_mbox
> - Misc stylistic issues
>=20
> Changes from v3:
> - Stylistic
>=20
> Changes from v2:
> - Fixed error handling for IRQ from >=3D 0 to > 0
> - Fixed error handling for clock enabling
> - Addressed Michal's stylistic comments
>=20
> Changes from v1:
> - Added common clock framework support
> - Deal with IRQs that happend before driver load,
>   since HW will not let us know about them when we enable IRQs
>=20
> Changes from v0:
> - Several stylistic issues
> - Dropped superfluous intr_mode member
> - Really masking the IRQs on mailbox_shutdown
> - No longer using polling by accident in non-IRQ mode
> - Swapped doc and driver commits
>=20
> Signed-off-by: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
> Acked-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>=20
> mailbox: Address some feedback, make ops const.
>=20
> Signed-off-by: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
>=20
> mailbox: xilinx-mailbox: Addressed more of Josh's feedback.
>=20
> Signed-off-by: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>

Did you intend for this intermediate history to exist?  Seems verbose,
doesn't provide any meaningful detail?

[..]
> +++ b/drivers/mailbox/mailbox-xilinx.c
[..]
> +static int xilinx_mbox_poll_startup(struct mbox_chan *chan)
> +{
> +	struct xilinx_mbox *mbox =3D mbox_chan_to_xilinx_mbox(chan);
> +
> +	/* prep and enable the clock */

Nit: Is this comment conveying anything useful?

> +	clk_prepare_enable(mbox->clk);
> +
> +	/* setup polling timer */

Nit: Same here.

> +	setup_timer(&mbox->rxpoll_timer, xilinx_mbox_poll_rx,
> +		    (unsigned long)chan);

setup_timer() could conceivably be done in probe().

[..]
> +static int xilinx_mbox_poll_send_data(struct mbox_chan *chan, void *data)
> +{
> +	struct xilinx_mbox *mbox =3D mbox_chan_to_xilinx_mbox(chan);
> +	u32 *udata =3D data;
> +
> +	if (!mbox || !data)

Nit: How could this happen?

> +		return -EINVAL;
> +
> +	if (xilinx_mbox_full(mbox))
> +		return -EBUSY;
> +
> +	writel_relaxed(*udata, mbox->mbox_base + MAILBOX_REG_WRDATA);
> +
> +	return 0;
> +}
[..]
> +static struct mbox_chan_ops xilinx_mbox_irq_ops =3D {

const?

> +	.send_data =3D xilinx_mbox_irq_send_data,
> +	.startup =3D xilinx_mbox_irq_startup,
> +	.shutdown =3D xilinx_mbox_irq_shutdown,
> +	.last_tx_done =3D xilinx_mbox_last_tx_done,
> +	.peek_data =3D xilinx_mbox_peek_data,
> +};
> +
> +static struct mbox_chan_ops xilinx_mbox_poll_ops =3D {

const?

> +	.send_data =3D xilinx_mbox_poll_send_data,
> +	.startup =3D xilinx_mbox_poll_startup,
> +	.shutdown =3D xilinx_mbox_poll_shutdown,
> +	.last_tx_done =3D xilinx_mbox_last_tx_done,
> +	.peek_data =3D xilinx_mbox_peek_data,
> +};

Splitting up the ops seemed to clean things up quite a bit!

> +
> +static int xilinx_mbox_probe(struct platform_device *pdev)
> +{
> +	struct xilinx_mbox *mbox;
> +	struct resource	*regs;
> +	int ret;
> +
> +	mbox =3D devm_kzalloc(&pdev->dev, sizeof(*mbox), GFP_KERNEL);
> +	if (!mbox)
> +		return -ENOMEM;
> +
> +	/* get clk and enable */
> +	mbox->clk =3D devm_clk_get(&pdev->dev, "mbox");
> +	if (IS_ERR(mbox->clk)) {
> +		dev_err(&pdev->dev, "Couldn't get clk.\n");
> +		return PTR_ERR(mbox->clk);
> +	}
> +
> +	regs =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +
> +	mbox->mbox_base =3D devm_ioremap_resource(&pdev->dev, regs);
> +	if (IS_ERR(mbox->mbox_base))
> +		return PTR_ERR(mbox->mbox_base);
> +
> +	mbox->irq =3D platform_get_irq(pdev, 0);
> +	/* if irq is present, we can use it, otherwise, poll */
> +	if (mbox->irq > 0) {
> +		mbox->controller.txdone_irq =3D true;
> +	} else {
> +		dev_info(&pdev->dev, "IRQ not found, fallback to polling.\n");
> +		mbox->controller.txdone_poll =3D true;
> +		mbox->controller.txpoll_period =3D MBOX_POLLING_MS;
> +	}
> +
> +	mbox->dev =3D &pdev->dev;
> +
> +	/* hardware supports only one channel. */
> +	mbox->controller.dev =3D mbox->dev;
> +	mbox->controller.num_chans =3D 1;
> +	mbox->controller.chans =3D &mbox->chan;
> +
> +	if (mbox->irq > 0)
> +		mbox->controller.ops =3D &xilinx_mbox_irq_ops;
> +	else
> +		mbox->controller.ops =3D &xilinx_mbox_poll_ops;

Nit: you're already checking this above, seems like you can just move
the .ops assignment there.

  Josh

--xXmbgvnjoT4axfJE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJViaqbAAoJEKp7ZBKwQFArfdAIAIAvLfef3h6d1WdsMxKzlBrV
s87H58GPLfllb9Ng4Ip/sve8+gU+zjkv4j8kDhx49zhAsrUCZhnY84RRdN2LzsST
7xGT6q7ydOibhyqaVuVBXR0rWIL61uJl6Aa9uDzDY4T0iYMTmaVZ2tmmqmv2kgX+
JLDBaz1dJiW53ANn7WR1njCY8QDlUgW5uiWcIQmDly0eqLQvvg/XcNEqFF1DKakx
9rv1jGYP3vxnGAlP3c2BXZ6tHw1qhkzGsvz0HsX77JgDekhgkjqzosr/Ig301lcB
dNYGSFlQPBcMIEyix3Tw9yWOeMFNRR8UHHKi0tfVMUtO7HmDQYXmPioVVX0ofeY=
=jRqi
-----END PGP SIGNATURE-----

--xXmbgvnjoT4axfJE--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
