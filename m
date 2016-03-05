From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V4 4/6] slim: qcom: Add Qualcomm Slimbus controller driver
Date: Sat, 5 Mar 2016 14:23:15 +0900
Message-ID: <20160305052315.GE18327@sirena.org.uk>
References: <1454784265-5194-1-git-send-email-sdharia@codeaurora.org>
 <1454784265-5194-5-git-send-email-sdharia@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SzOcR4QRIppbnuw2"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1454784265-5194-5-git-send-email-sdharia-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sagar Dharia <sdharia-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, bp-l3A5Bk7waGM@public.gmane.org, poeschel-Xtl8qvBWbHwb1SvskN2V4Q@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gong.chen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, andreas.noever-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, oded.gabbay-5C7GfCeVMHo@public.gmane.org, jkosina-AlSwsSmVLrQ@public.gmane.org, sharon.dvir1-MQgwKvJRKlGYZoqfULhbRA@public.gmane.org, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, michael.opdenacker-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kheitke-hxvC4TZJLZFWk0Htik3J/w@public.gmane.org, mlocke-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--SzOcR4QRIppbnuw2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 06, 2016 at 11:44:23AM -0700, Sagar Dharia wrote:

> =20
> +if SLIMBUS
> +config SLIM_QCOM_CTRL
> +	tristate "Qualcomm Slimbus Manager Component"
> +	depends on SLIMBUS
> +	default n
> +	help

n is the default.

> +static irqreturn_t msm_slim_interrupt(int irq, void *d)
> +{
> +	struct msm_slim_ctrl *dev =3D d;
> +	u32 stat =3D readl_relaxed(dev->base + MGR_INT_STAT);
> +	int err =3D 0;

> +	if (stat & MGR_INT_TX_MSG_SENT || stat & MGR_INT_TX_NACKED_2) {

> +	if (stat & MGR_INT_RX_MSG_RCVD) {

> +	}

> +	/**
> +	 * All interrupts are handled: complex RX messages requiring more work
> +	 * are queued to work-queue, others are handled above
> +	 */
> +	return IRQ_HANDLED;

This unconditionally returns IRQ_HANDLED even if no interrupts were
flagged.  This will break if the interrupt gets shared in some hardware
design or if something goes wrong with the hardware.

> +	ret =3D devm_request_irq(&pdev->dev, dev->irq, msm_slim_interrupt,
> +				IRQF_TRIGGER_HIGH, "msm_slim_irq", dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "request IRQ failed\n");
> +		goto err_request_irq_failed;
> +	}

Are you sure this is safe and we don't deallocate things the interrupt
handler uses before we disable the interrupt?

> +	ret =3D clk_prepare_enable(hclk);
> +	if (ret)
> +		goto err_hclk_enable_failed;
> +
> +	ret =3D clk_prepare_enable(rclk);
> +	if (ret)
> +		goto err_rclk_enable_failed;

The remove path doesn't disable these.

> +	/* Register with framework before enabling frame, clock */
> +	ret =3D slim_register_controller(&dev->ctrl);
> +	if (ret) {
> +		dev_err(dev->dev, "error adding controller\n");
> +		goto err_ctrl_failed;
> +	}

Should we have a devm_ version of slim_register_controller()?  I'd also
expect this to be the last thing we do in probe, things may start using
the device before we've finished initializing it.

--SzOcR4QRIppbnuw2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW2m1BAAoJECTWi3JdVIfQvAkH/R//R0W4mTulH8M7eIeQD/7+
NK528KXU4e3lhcUf9abULoRUR9i5b517zfWnFNTJSFMT2/+7tlcq4YMjb2RfwnxN
QsfUKy1ztFVhmd1WciI00RyANbWVi8p4DyBTrinsLtZwuUSNXp6utkAJMl7kAi5S
PwiRKNnOzyshxHE5Vkl1RtNl+vs2FDQIx9lMti/jXzxk6Wq1fovEn4KYeAOJd51k
imStt2mivshsKVBMMd+9+a7le6a0ur/RXzCxawafLNauQEbODDal5MWeuL+9xKn5
h9o9WU55xDmWTld8aLH5uQQU/LWh7L8q2SNKf1bsHGUcRzIq9KmGroJGmKINtKY=
=Lt9y
-----END PGP SIGNATURE-----

--SzOcR4QRIppbnuw2--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
