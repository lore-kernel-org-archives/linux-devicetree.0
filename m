From: =?iso-8859-1?Q?Br=FCns=2C_Stefan?= <Stefan.Bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Subject: Re: [PATCH v2 07/10] dmaengine: sun6i: Retrieve channel
 count/max request from devicetree
Date: Sat, 23 Sep 2017 00:00:15 +0000
Message-ID: <3154933.I7MMVk5mkV@sbruens-linux>
References: <20170917031956.28010-1-stefan.bruens@rwth-aachen.de>
 <6028407.VKu5LCmQv0@sbruens-linux>
 <20170922213027.xpnaut3an5or6edl@flea.home>
Reply-To: stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDIYL7P2SAMRBEGIS3HAKGQEH6KNYQI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170922213027.xpnaut3an5or6edl-YififvaboMKzQB+pC5nmwQ@public.gmane.org>
Content-Language: en-US
Content-ID: <758DC10755E7CE4DAAECBDDD8174164F-KnNo0XtUZUuELgA04lAiVw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Freitag, 22. September 2017 23:30:27 CEST Maxime Ripard wrote:
> On Tue, Sep 19, 2017 at 04:17:59PM +0000, Br=C3=BCns, Stefan wrote:
> > On Dienstag, 19. September 2017 16:25:08 CEST Maxime Ripard wrote:
> > > On Mon, Sep 18, 2017 at 02:09:43PM +0000, Br=C3=BCns, Stefan wrote:
> > > > On Montag, 18. September 2017 10:18:24 CEST you wrote:
> > > > > Hi,
> > > > >=20
> > > > > On Sun, Sep 17, 2017 at 05:19:53AM +0200, Stefan Br=C3=BCns wrote=
:
> > > > > > +	ret =3D of_property_read_u32(np, "dma-channels",
> > > > > > &sdc->num_pchans);
> > > > > > +	if (ret && !sdc->num_pchans) {
> > > > > > +		dev_err(&pdev->dev, "Can't get dma-channels.\n");
> > > > > > +		return ret;
> > > > > > +	}
> > > > > > +
> > > > > > +	if (sdc->num_pchans > DMA_MAX_CHANNELS) {
> > > > > > +		dev_err(&pdev->dev, "Number of dma-channels out of range.
\n");
> > > > > > +		return -EINVAL;
> > > > > > +	}
> > > > > > +
> > > > > > +	ret =3D of_property_read_u32(np, "dma-requests",
> > > > > > &sdc->max_request);
> > > > > > +	if (ret && !sdc->max_request) {
> > > > > > +		dev_info(&pdev->dev, "Missing dma-requests, using %u.\n",
> > > > > > +			 DMA_CHAN_MAX_DRQ);
> > > > > > +		sdc->max_request =3D DMA_CHAN_MAX_DRQ;
> > > > > > +	}
> > > > > > +
> > > > > > +	if (sdc->max_request > DMA_CHAN_MAX_DRQ) {
> > > > > > +		dev_err(&pdev->dev, "Value of dma-requests out of range.\n")=
;
> > > > > > +		return -EINVAL;
> > > > > > +	}
> > > > >=20
> > > > > I'm not really convinced about these two checks. They don't catch
> > > > > all
> > > > > errors (the range between the actual number of channels / DRQ and
> > > > > the
> > > > > maximum allowed per the registers), they might increase in the
> > > > > future
> > > > > too, and if we want to make that check actually working, we would
> > > > > have
> > > > > to duplicate the number of requests and channels into the driver.
> > > >=20
> > > > 1. If these values increase, we have a new register layout and and
> > > > need a new compatible anyway.
> > >=20
> > > And you want to store a new maximum attached to the compatible? Isn't
> > > that exactly the situation you're trying to get away from?
> >=20
> > Yes, and no. H3, H5, A64 and R40 have the exact same register layout, b=
ut
> > different number of channels and ports. They could share a compatible (=
if
> > DMA channels were generalized), and we already have several register
> > offsets/ widths (implicitly via the callbacks) attached to the compatib=
le
> > (so these don't need generalization via DT).
> >=20
> > Now, we could also move everything that is currently attached to the
> > compatible, i.e. clock gate register offset, burst widths/lengths etc.
> > into
> > the devicetree binding, but that would just be too much.
> >=20
> > The idea is to find a middle ground here, using common patterns in the
> > existing SoCs. The register layout has hardly changed, while the number=
 of
> > DMA channels and ports changes all the time. Moving the number of DMA
> > channels and ports to the DT is trivial, and a pattern also found in
> > other DMA controller drivers.
>=20
> I'm sorry, but the code is inconsistent here. You basically have two
> variables from one SoC to the other, the number of channels and
> requests.
>=20
> In one case (channels), it mandates that the property is provided in
> the device tree, and doesn't default to anything.
>=20
> In the other case (requests), the property is optional and it will
> provide a default. All that in 20 lines.

The channel number is a hardware property. Using more channels than the=20
hardware provides is a bug. There is no default.

The port/request is just some lax property to limit the resource allocation=
=20
upfront. As long as the bindings of the different IP blocks (SPI, audio, ..=
.)=20
provide the correct port numbers, all required information is available.
=20
> I guess we already reached that middle ground by providing them
> through the DT, we just have to make sure we remain consistent.
>=20
> > *If* the number of dma channels and ports is ever increased,
> > exceeding the current maximum, this would amount to major changes in
> > the driver and maybe even warrant a completely new driver.
> >=20
> > > > 2. As long as the the limits are adhered to, no other
> > > > registers/register
> > > > fields are overwritten. As the channel number and port are used to
> > > > calculate memory offsets bounds checking is IMHO a good idea.
> > >=20
> > > And this is true for many other resources, starting with the one
> > > defined in reg. We don't error check every register range, clock
> > > index, reset line, interrupt, DMA channel, the memory size, etc. yet
> > > you could make the same argument.
> > >=20
> > > The DT has to be right, and we have to trust it. Otherwise we can jus=
t
> > > throw it away.
> >=20
> > So your argument here basically is - don't do any checks on DT provided
> > values, these are always correct. So, following this argument, not only
> > the
> > range check, but also the of_property_read return values should be
> > ignored, as the DT is correct, thus of_property_read will never return =
an
> > error.
> No, my argument is don't do a check if you can catch only half of the
> errors, and with no hope of fixing it.
>=20
> The functions you mentionned have a 100% error catch rate. This is the
> difference.
>=20
> > That clearly does not match the implementation of drivers throughout th=
e
> > various subsystems for DT properties, which is in general - do all the
> > checks that can be done, trust everything you can not verify.
>=20
> And my point is that we're falling into the latter here. You cannot
> verify it properly.

Please check the following line:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/
drivers/dma/sun6i-dma.c#n951

Thats far from 100% - the highest allowed port for each SoC differs between=
 RX=20
and TX, and port allocation is sparse.

Regards,

Stefan




--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
