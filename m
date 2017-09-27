From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 07/10] dmaengine: sun6i: Retrieve channel
 count/max request from devicetree
Date: Wed, 27 Sep 2017 11:09:22 +0200
Message-ID: <20170927090922.u2hnvgz7yi55sjl3@flea>
References: <20170917031956.28010-1-stefan.bruens@rwth-aachen.de>
 <6028407.VKu5LCmQv0@sbruens-linux>
 <20170922213027.xpnaut3an5or6edl@flea.home>
 <3154933.I7MMVk5mkV@sbruens-linux>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="n6w3s3tcm42bqjww"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBQ6VVXHAKGQEWUUCLTI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <3154933.I7MMVk5mkV@sbruens-linux>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?iso-8859-1?B?QnL8bnMs?= Stefan <Stefan.Bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Cc: "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--n6w3s3tcm42bqjww
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 23, 2017 at 12:00:15AM +0000, Br=C3=BCns, Stefan wrote:
> On Freitag, 22. September 2017 23:30:27 CEST Maxime Ripard wrote:
> > On Tue, Sep 19, 2017 at 04:17:59PM +0000, Br=C3=BCns, Stefan wrote:
> > > On Dienstag, 19. September 2017 16:25:08 CEST Maxime Ripard wrote:
> > > > On Mon, Sep 18, 2017 at 02:09:43PM +0000, Br=C3=BCns, Stefan wrote:
> > > > > On Montag, 18. September 2017 10:18:24 CEST you wrote:
> > > > > > Hi,
> > > > > >=20
> > > > > > On Sun, Sep 17, 2017 at 05:19:53AM +0200, Stefan Br=C3=BCns wro=
te:
> > > > > > > +	ret =3D of_property_read_u32(np, "dma-channels",
> > > > > > > &sdc->num_pchans);
> > > > > > > +	if (ret && !sdc->num_pchans) {
> > > > > > > +		dev_err(&pdev->dev, "Can't get dma-channels.\n");
> > > > > > > +		return ret;
> > > > > > > +	}
> > > > > > > +
> > > > > > > +	if (sdc->num_pchans > DMA_MAX_CHANNELS) {
> > > > > > > +		dev_err(&pdev->dev, "Number of dma-channels out of range.
> \n");
> > > > > > > +		return -EINVAL;
> > > > > > > +	}
> > > > > > > +
> > > > > > > +	ret =3D of_property_read_u32(np, "dma-requests",
> > > > > > > &sdc->max_request);
> > > > > > > +	if (ret && !sdc->max_request) {
> > > > > > > +		dev_info(&pdev->dev, "Missing dma-requests, using %u.\n",
> > > > > > > +			 DMA_CHAN_MAX_DRQ);
> > > > > > > +		sdc->max_request =3D DMA_CHAN_MAX_DRQ;
> > > > > > > +	}
> > > > > > > +
> > > > > > > +	if (sdc->max_request > DMA_CHAN_MAX_DRQ) {
> > > > > > > +		dev_err(&pdev->dev, "Value of dma-requests out of range.\n=
");
> > > > > > > +		return -EINVAL;
> > > > > > > +	}
> > > > > >=20
> > > > > > I'm not really convinced about these two checks. They don't cat=
ch
> > > > > > all
> > > > > > errors (the range between the actual number of channels / DRQ a=
nd
> > > > > > the
> > > > > > maximum allowed per the registers), they might increase in the
> > > > > > future
> > > > > > too, and if we want to make that check actually working, we wou=
ld
> > > > > > have
> > > > > > to duplicate the number of requests and channels into the drive=
r.
> > > > >=20
> > > > > 1. If these values increase, we have a new register layout and an=
d
> > > > > need a new compatible anyway.
> > > >=20
> > > > And you want to store a new maximum attached to the compatible? Isn=
't
> > > > that exactly the situation you're trying to get away from?
> > >=20
> > > Yes, and no. H3, H5, A64 and R40 have the exact same register layout,=
 but
> > > different number of channels and ports. They could share a compatible=
 (if
> > > DMA channels were generalized), and we already have several register
> > > offsets/ widths (implicitly via the callbacks) attached to the compat=
ible
> > > (so these don't need generalization via DT).
> > >=20
> > > Now, we could also move everything that is currently attached to the
> > > compatible, i.e. clock gate register offset, burst widths/lengths etc=
.
> > > into
> > > the devicetree binding, but that would just be too much.
> > >=20
> > > The idea is to find a middle ground here, using common patterns in th=
e
> > > existing SoCs. The register layout has hardly changed, while the numb=
er of
> > > DMA channels and ports changes all the time. Moving the number of DMA
> > > channels and ports to the DT is trivial, and a pattern also found in
> > > other DMA controller drivers.
> >=20
> > I'm sorry, but the code is inconsistent here. You basically have two
> > variables from one SoC to the other, the number of channels and
> > requests.
> >=20
> > In one case (channels), it mandates that the property is provided in
> > the device tree, and doesn't default to anything.
> >=20
> > In the other case (requests), the property is optional and it will
> > provide a default. All that in 20 lines.
>=20
> The channel number is a hardware property. Using more channels than the=
=20
> hardware provides is a bug. There is no default.
>=20
> The port/request is just some lax property to limit the resource allocati=
on=20
> upfront. As long as the bindings of the different IP blocks (SPI, audio, =
...)=20
> provide the correct port numbers, all required information is available.

Using an improper request ID or out of bounds will be just as much as
a bug. You will not get your DMA transfer to the proper device you
were trying to, the data will not reach the device or memory, your
driver will not work =3D> a bug.

It will not be for the same reasons, you will not overwrite other
registers, but the end result is just the same: your transfer will not
work.

> > I guess we already reached that middle ground by providing them
> > through the DT, we just have to make sure we remain consistent.
> >=20
> > > *If* the number of dma channels and ports is ever increased,
> > > exceeding the current maximum, this would amount to major changes in
> > > the driver and maybe even warrant a completely new driver.
> > >=20
> > > > > 2. As long as the the limits are adhered to, no other
> > > > > registers/register
> > > > > fields are overwritten. As the channel number and port are used t=
o
> > > > > calculate memory offsets bounds checking is IMHO a good idea.
> > > >=20
> > > > And this is true for many other resources, starting with the one
> > > > defined in reg. We don't error check every register range, clock
> > > > index, reset line, interrupt, DMA channel, the memory size, etc. ye=
t
> > > > you could make the same argument.
> > > >=20
> > > > The DT has to be right, and we have to trust it. Otherwise we can j=
ust
> > > > throw it away.
> > >=20
> > > So your argument here basically is - don't do any checks on DT provid=
ed
> > > values, these are always correct. So, following this argument, not on=
ly
> > > the
> > > range check, but also the of_property_read return values should be
> > > ignored, as the DT is correct, thus of_property_read will never retur=
n an
> > > error.
> > No, my argument is don't do a check if you can catch only half of the
> > errors, and with no hope of fixing it.
> >=20
> > The functions you mentionned have a 100% error catch rate. This is the
> > difference.
> >=20
> > > That clearly does not match the implementation of drivers throughout =
the
> > > various subsystems for DT properties, which is in general - do all th=
e
> > > checks that can be done, trust everything you can not verify.
> >=20
> > And my point is that we're falling into the latter here. You cannot
> > verify it properly.
>=20
> Please check the following line:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/dma/sun6i-dma.c#n951
>=20
> Thats far from 100% - the highest allowed port for each SoC differs betwe=
en RX=20
> and TX, and port allocation is sparse.

But until your patches, you *could* fix it and reach that 100%.

And I guess now we could indeed remove it.

Look, this discussion is going nowhere. I told you what the condition
for my Acked-by was already.

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

--n6w3s3tcm42bqjww
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZy2rCAAoJEBx+YmzsjxAgIRkP/1WxS9bUFq4qdLPSSk3elHKa
JcW+4OI8mwx6TZ4pSRuZ2vHaRzLldIX3qBKh+DE717wH0ggxLZWgicJ6CWWs+Mon
5XRzows9jecNMd8gFLGUPMY1kXBbvI6IXPp/CuBBMbjtSjXE+h3Oiiz/dA5+pEz7
EaKZedLeAXul0kIzwPwhw7K6BFjqlQ1gX3Vk6tjsWUqNpS8ndwvUyh4RJsvbkjVK
tJsAvLLJBkx/mSFg9Gy49bC22HAeNh7pwqXnD2H17rvbGGytI9Uh8933R+lvgrDl
oMsSoYpnAun0ghCE7UYoeIDT/C9necOgodR8mud7BohaC+hMxbaX8dExcH+LNKZu
7KUk1VYjVngHPfsLtRMAybv3DLfKGXFKf7htUxT+k9n4lQ/Z80UrX3sRjI8Gv6bo
2F9xHJi7kIiWOweXPdvGoX3KWEED0dLqNSt7pCTszwNKTAu6pETZWmIB3wwnztk4
WyyML2VYjJl7HEvAij3fiRfJKUsA0Y7Og+PQQT8rNmPd1cyCGXnqIzb7MUUBOSzN
IQFyhuiS9GU9NpmNlLWIk7dJW+uuNuVfblUClr+OJmkT+J7oXOQT9HAtsAavPhhu
l13lTiXDx2AIpXwdwPZn0z9EwrAxlEJngDx+CzUtzVksQocpeTqBB80biLlW3EhY
3/rHb6A9e19zonIyd1ou
=cRGR
-----END PGP SIGNATURE-----

--n6w3s3tcm42bqjww--
