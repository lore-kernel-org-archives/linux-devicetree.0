From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 07/10] dmaengine: sun6i: Retrieve channel
 count/max request from devicetree
Date: Fri, 22 Sep 2017 23:30:27 +0200
Message-ID: <20170922213027.xpnaut3an5or6edl@flea.home>
References: <20170917031956.28010-1-stefan.bruens@rwth-aachen.de>
 <2791817.czGZyN6WKS@sbruens-linux>
 <20170919142508.woslovwjtecgygpo@flea.lan>
 <6028407.VKu5LCmQv0@sbruens-linux>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jvxhcs6lrr6gn7cn"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB7UBS3HAKGQEIYWZPBA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <6028407.VKu5LCmQv0@sbruens-linux>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?iso-8859-1?B?QnL8bnMs?= Stefan <Stefan.Bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Cc: "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--jvxhcs6lrr6gn7cn
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 19, 2017 at 04:17:59PM +0000, Br=C3=BCns, Stefan wrote:
> On Dienstag, 19. September 2017 16:25:08 CEST Maxime Ripard wrote:
> > On Mon, Sep 18, 2017 at 02:09:43PM +0000, Br=C3=BCns, Stefan wrote:
> > > On Montag, 18. September 2017 10:18:24 CEST you wrote:
> > > > Hi,
> > > >=20
> > > > On Sun, Sep 17, 2017 at 05:19:53AM +0200, Stefan Br=C3=BCns wrote:
> > > > > +	ret =3D of_property_read_u32(np, "dma-channels", &sdc->num_pcha=
ns);
> > > > > +	if (ret && !sdc->num_pchans) {
> > > > > +		dev_err(&pdev->dev, "Can't get dma-channels.\n");
> > > > > +		return ret;
> > > > > +	}
> > > > > +
> > > > > +	if (sdc->num_pchans > DMA_MAX_CHANNELS) {
> > > > > +		dev_err(&pdev->dev, "Number of dma-channels out of range.\n");
> > > > > +		return -EINVAL;
> > > > > +	}
> > > > > +
> > > > > +	ret =3D of_property_read_u32(np, "dma-requests", &sdc->max_requ=
est);
> > > > > +	if (ret && !sdc->max_request) {
> > > > > +		dev_info(&pdev->dev, "Missing dma-requests, using %u.\n",
> > > > > +			 DMA_CHAN_MAX_DRQ);
> > > > > +		sdc->max_request =3D DMA_CHAN_MAX_DRQ;
> > > > > +	}
> > > > > +
> > > > > +	if (sdc->max_request > DMA_CHAN_MAX_DRQ) {
> > > > > +		dev_err(&pdev->dev, "Value of dma-requests out of range.\n");
> > > > > +		return -EINVAL;
> > > > > +	}
> > > >=20
> > > > I'm not really convinced about these two checks. They don't catch a=
ll
> > > > errors (the range between the actual number of channels / DRQ and t=
he
> > > > maximum allowed per the registers), they might increase in the futu=
re
> > > > too, and if we want to make that check actually working, we would h=
ave
> > > > to duplicate the number of requests and channels into the driver.
> > >=20
> > > 1. If these values increase, we have a new register layout and and
> > > need a new compatible anyway.
> >=20
> > And you want to store a new maximum attached to the compatible? Isn't
> > that exactly the situation you're trying to get away from?
>=20
> Yes, and no. H3, H5, A64 and R40 have the exact same register layout, but=
=20
> different number of channels and ports. They could share a compatible (if=
 DMA=20
> channels were generalized), and we already have several register offsets/
> widths (implicitly via the callbacks) attached to the compatible (so thes=
e=20
> don't need generalization via DT).
>=20
> Now, we could also move everything that is currently attached to the=20
> compatible, i.e. clock gate register offset, burst widths/lengths etc. in=
to=20
> the devicetree binding, but that would just be too much.
>=20
> The idea is to find a middle ground here, using common patterns in the=20
> existing SoCs. The register layout has hardly changed, while the number o=
f DMA=20
> channels and ports changes all the time. Moving the number of DMA channel=
s and=20
> ports to the DT is trivial, and a pattern also found in other DMA control=
ler=20
> drivers.

I'm sorry, but the code is inconsistent here. You basically have two
variables from one SoC to the other, the number of channels and
requests.

In one case (channels), it mandates that the property is provided in
the device tree, and doesn't default to anything.

In the other case (requests), the property is optional and it will
provide a default. All that in 20 lines.

I guess we already reached that middle ground by providing them
through the DT, we just have to make sure we remain consistent.

> *If* the number of dma channels and ports is ever increased,
> exceeding the current maximum, this would amount to major changes in
> the driver and maybe even warrant a completely new driver.
>=20
> > > 2. As long as the the limits are adhered to, no other registers/regis=
ter
> > > fields are overwritten. As the channel number and port are used to
> > > calculate memory offsets bounds checking is IMHO a good idea.
> >=20
> > And this is true for many other resources, starting with the one
> > defined in reg. We don't error check every register range, clock
> > index, reset line, interrupt, DMA channel, the memory size, etc. yet
> > you could make the same argument.
> >=20
> > The DT has to be right, and we have to trust it. Otherwise we can just
> > throw it away.
>=20
> So your argument here basically is - don't do any checks on DT provided=
=20
> values, these are always correct. So, following this argument, not only t=
he=20
> range check, but also the of_property_read return values should be ignore=
d, as=20
> the DT is correct, thus of_property_read will never return an error.

No, my argument is don't do a check if you can catch only half of the
errors, and with no hope of fixing it.

The functions you mentionned have a 100% error catch rate. This is the
difference.

> That clearly does not match the implementation of drivers throughout the=
=20
> various subsystems for DT properties, which is in general - do all the ch=
ecks=20
> that can be done, trust everything you can not verify.

And my point is that we're falling into the latter here. You cannot
verify it properly.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--jvxhcs6lrr6gn7cn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZxYDzAAoJEBx+YmzsjxAgOZAP/A9UYqY3e8bo8AMc/GJIuTlX
U9GX0kNnO/mSMcYAA1JKxUa9IeduPd/owSVIQ0GZJxSbpciSJWXOh1kTrjTpBZLl
eedsiP8YZOOMY4qkQqY2zRRsB+5tlfKsmewaAxVn5JkHe0LEDpgIuk1X0BD1ypl9
SBZ/U33E4MNHkzOJEq+Axxq1v30I6f6RkTc7lS5kY93QtBYpfP15emy5rNqOisUl
2iT+P46ATD9VWs3qoe62Vq+fi//rLEShVWCABN4HvnfmxjRzaW0gZv85Hq6G3riY
AdfRnIRKF6bAn5VQ/tXah+nbYrHOiObDx9b2z3bdmu1ud7EDczKIVlkgCPXU86C5
UOCfkRPV8bz+wYLgsu2MCHKYuOhqXGMFdTTVXaEZsdn5ldzvSZd2/8GiYkSovuVR
zX8h6Ya87j05/1xX8OjLDo51sGWxTUDqvXtqajY1JiDBVsA4dwNa4EMkXMDUuFcf
7EcwPDSzdcI7x14fcDtQUWvLyRfQeZS/OP/TMAWi8KwCZFP+2SpK5PkJ6NsqUdXm
Wz6DuGsD2OhMv84WzT+1qy4l+hy0FAFioUyB43EwpernbvK1VwGImoeqbIM51ObS
8jZrq2s8mJJWoDHm6hn41xX1VcRFaKsidby1qu+6o6Q7K0Dom72wjZLy/+U2oMV5
+OFpck4JV1/ypw3vhZ3f
=Y91i
-----END PGP SIGNATURE-----

--jvxhcs6lrr6gn7cn--
