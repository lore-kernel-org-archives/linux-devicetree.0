From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 6/7] DMA: sun6i: Add driver for the
 Allwinner A31 DMA controller
Date: Mon, 10 Mar 2014 17:51:56 +0100
Message-ID: <20140310165156.GI2815@lukather>
References: <1394462512-11620-1-git-send-email-maxime.ripard@free-electrons.com>
 <1394462512-11620-7-git-send-email-maxime.ripard@free-electrons.com>
 <2475487.axlvKsBQ0c@wuerfel>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VaKJWhUROU/xPxjb"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBZ6466MAKGQEP4E4Z7Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2475487.axlvKsBQ0c@wuerfel>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, kevin.z.m.zh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sunny-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, zhuzhenhua-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org


--VaKJWhUROU/xPxjb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Mon, Mar 10, 2014 at 04:34:04PM +0100, Arnd Bergmann wrote:
> On Monday 10 March 2014 15:41:51 Maxime Ripard wrote:
>=20
> > +/*
> > + * Hardware representation of the LLI
> > + *
> > + * The hardware will be fed the physical address of this structure,
> > + * and read its content in order to start the transfer.
> > + */
> > +struct sun6i_dma_lli {
> > +	u32			cfg;
> > +	u32			src;
> > +	u32			dst;
> > +	u32			len;
> > +	u32			para;
> > +	u32			p_lli_next;
> > +	struct sun6i_dma_lli	*v_lli_next;
> > +} __packed;
>=20
> It looks strange to have a pointer in a hardware structure, since
> the pointer doesn't make sense to the device.

Actually, it's not used at all by the device itself. It's used only by
the driver to be able to follow that list whenever we need to
free/dump it.

> Also, the '__packed' attribute seems strange. Are you sure
> you want to reduce the alignment from 4 bytes to 1 byte?

What I wanted to make sure is that the structure is actually what I
declared above in memory, but it's true that it's completely useless
here.

> > +static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
> > +{
> > +	struct sun6i_dma_dev *sdev =3D dev_id;
> > +	struct sun6i_vchan *vchan;
> > +	struct sun6i_pchan *pchan;
> > +	int i, j, ret =3D IRQ_NONE;
> > +	u32 status;
> > +
> > +	for (i =3D 0; i < 2; i++) {
> > +		status =3D readl(sdev->base + DMA_IRQ_STAT(i));
> > +		if (!status)
> > +			continue;
> > +
> > +		dev_dbg(sdev->slave.dev, "DMA irq status %s: 0x%x\n",
> > +			i ? "high" : "low", status);
> > +
> > +		writel(status, sdev->base + DMA_IRQ_STAT(i));
> > +
> > +		for (j =3D 0; (j < 8) && status; j++) {
> > +			if (status & DMA_IRQ_QUEUE) {
> > +				pchan =3D sdev->pchans + j;
> > +				vchan =3D pchan->vchan;
> > +
> > +				if (vchan) {
> > +					unsigned long flags;
> > +
> > +					spin_lock_irqsave(&vchan->vc.lock,
> > +							  flags);
>=20
> Interrupts are already disabled here.

True.

> > +	sdc->clk =3D devm_clk_get(&pdev->dev, NULL);
> > +	if (IS_ERR(sdc->clk)) {
> > +		dev_err(&pdev->dev, "No clock specified\n");
> > +		return PTR_ERR(sdc->clk);
> > +	}
> > +
> > +	mux =3D devm_clk_get(&pdev->dev, "ahb1_mux");
> > +	if (IS_ERR(mux)) {
> > +		dev_err(&pdev->dev, "Couldn't get AHB1 Mux\n");
> > +		return PTR_ERR(mux);
> > +	}
> > +
> > +	pll6 =3D devm_clk_get(&pdev->dev, "pll6");
> > +	if (IS_ERR(pll6)) {
> > +		dev_err(&pdev->dev, "Couldn't get PLL6\n");
> > +		return PTR_ERR(pll6);
> > +	}
> > +
> > +	ret =3D clk_set_parent(mux, pll6);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "Couldn't reparent AHB1 on PLL6\n");
> > +		return ret;
> > +	}
>=20
> Neither "pll6" nor "ahb1_mux" are listed in the DT binding. Also, why
> is it the driver's business to set the parent?

Those are global clocks, so it's not really part pof the driver
binding itself. But I can add them.

About the reparenting itself, other devices are actually fine having
any parent they want, only the DMA is picky about it (at least, from
what we know), so it made sense to me to put it into the driver
itself. Where would you put it?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--VaKJWhUROU/xPxjb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTHe2sAAoJEBx+YmzsjxAgnAAQAMLEx7dr11SSRY5QJI2grTNg
1tajitylZcNJwmXmpbHvIXi/rnHb5P/szTf2ljdAjvfnj2KxWMUq/eBAkYlE+MDN
xQxsXjPYfkSph2nm//Hfd6tkjuouvVrLP8xixDr00NqpP41inHeq1XGIEl0Hdggg
XiRZocizZ3ZgJmna44nTNphNly8irFNGX9zL0GoLRqJozUKzcHFY2mxo5S+DX0EP
8VoDhUwkwrFo2GSJO2HeASAU0WOU41qZn36aGXwWow3OY2LlrpTC4+fZ00ttljSC
MhhVKEV17UXQiuFloh+Xe5y61sok2bVcKMJ5GTjbgGlmhckSoeANy4+YbUBvLqXX
8IAlUeMtXmV31IH9Z2WAardJWYODmTD6+mg3meGchgl4VoKDL42Ys6VfpqlQxE85
9VpEB1BRArlGGUTD7KIGEJI9B9JKtsk2RJa05PIJ4rJ8vfuXrHbG3gAdLHBpaA3E
Gbpqi2kFAGVGbC93kNyXnjV8fhg9LLEL9Hsl7I6kQmfHq17xfeUcxIBnC916UeAE
E5N7L9yjLXER+NAcwMVoH5+x97+VG2af6FFdUqdy7RxsqaksKR1v3TfVXoHUGBlg
MJ4im0DgHvitnySwUJ5v7wN2L/cKHKtcBrCL9XaPd6CtSACKYgufO+sgQ7xbUanY
h9HFGhwjo6QNIbFczkE/
=Bxt3
-----END PGP SIGNATURE-----

--VaKJWhUROU/xPxjb--
