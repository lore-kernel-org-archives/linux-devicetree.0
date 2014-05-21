From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7] DMA: sun6i: Add driver for the Allwinner
 A31 DMA controller
Date: Wed, 21 May 2014 16:32:32 +0530
Message-ID: <20140521110232.GP21128@intel.com>
References: <20140430070408.GR32284@intel.com>
 <20140513134258.GA29258@lukather>
 <20140521053105.GI21128@intel.com>
 <20140521085829.GP27329@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/2994txjAzEdQwm5"
Return-path: <linux-sunxi+bncBDLNNTP63EBBB5MW6KNQKGQEGQQUQIA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140521085829.GP27329@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, kevin.z.m.zh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sunny-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, zhuzhenhua-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--/2994txjAzEdQwm5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2014 at 10:58:29AM +0200, Maxime Ripard wrote:
> On Wed, May 21, 2014 at 11:01:05AM +0530, Vinod Koul wrote:
> > On Tue, May 13, 2014 at 03:42:58PM +0200, Maxime Ripard wrote:
> > > Hi Vinod,
> > >=20
> > > On Wed, Apr 30, 2014 at 12:34:08PM +0530, Vinod Koul wrote:
> > > > > +
> > > > > +static int sun6i_dma_terminate_all(struct sun6i_vchan *vchan)
> > > > > +{
> > > > > +	struct sun6i_dma_dev *sdev =3D to_sun6i_dma_dev(vchan->vc.chan.=
device);
> > > > > +	struct sun6i_pchan *pchan =3D vchan->phy;
> > > > > +	unsigned long flags;
> > > > > +	LIST_HEAD(head);
> > > > > +
> > > > > +	spin_lock(&sdev->lock);
> > > > > +	list_del_init(&vchan->node);
> > > > > +	spin_unlock(&sdev->lock);
> > > > > +
> > > > > +	spin_lock_irqsave(&vchan->vc.lock, flags);
> > > > > +
> > > > > +	vchan_get_all_descriptors(&vchan->vc, &head);
> > > > > +
> > > > > +	if (pchan) {
> > > > > +		writel(DMA_CHAN_ENABLE_STOP, pchan->base + DMA_CHAN_ENABLE);
> > > > > +		writel(DMA_CHAN_PAUSE_RESUME, pchan->base + DMA_CHAN_PAUSE);
> > > > > +
> > > > > +		vchan->phy =3D NULL;
> > > > > +		pchan->vchan =3D NULL;
> > > > > +		pchan->desc =3D NULL;
> > > > > +		pchan->done =3D NULL;
> > > > > +	}
> > > > > +
> > > > > +	spin_unlock_irqrestore(&vchan->vc.lock, flags);
> > > > > +
> > > > > +	vchan_dma_desc_free_list(&vchan->vc, &head);
> > > >=20
> > > > shouldn't you kill the tasklet as well here?
> > >=20
> > > Just to be clear, which tasklet? vchan's or the driver's?
> > You need to take care of both. But I suspect if we ensure irq is not tr=
iggered
> > and any pending ones are completed you can simply kill both of the task=
lets
> > happily. See the fixes merged in dmaengine last cycle (hint: patchlog s=
hows what
> > we need to do)
>=20
> I still don't get why I should kill the driver tasklet in terminate_all.
>=20
> The tasklet is common to all the channels, if you kill it, you'll
> prevent it from scheduling while other channels might have had a need
> for it to actually run.
I think I was under the impression that your tasklet is per channel, If tha=
t is
not the case it makes no sense then for this case
>=20
> About the commits themselves, I guess you talk about 9068b032 and
> ccc7aad0. Both these commits only fix the remove path, not the
> terminate_all one, and both these drivers are not doing anything
> related to the tasklet in terminate_all.
Yup as you would have noticed these were not per channel as well

>=20
> > Btw just noticed, you *should* use dmaengine: as the subsytem name on t=
he patch
> > series...
>=20
> Ok, I will.
Thanks

--=20
~Vinod

--/2994txjAzEdQwm5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQIcBAEBAgAGBQJTfIfIAAoJEHwUBw8lI4NHyjAP/jCMyCH/kBWP6zWna4ZZc94T
ZfpXUb2NDd/6CRkgaC/7iPQJmuL35vgo0j5P5M2EysoysJH+ekNMfP+t6ATuPigg
kQNww3MsrrXb+n5l1M+RWDOp9M9OFi7C6tw0qxAx7K8PHcUmmTuP6DGIb5RhUVdQ
QJr7UB772v4GJITJOj3eflPuN7gluesw4pwOM4//kAalAO8GseltT+pG3EsnXDml
gphQlicZMSA74nCsae/2KRihsIh6GaG7mEqbtl7atxlIuSIOTmADx1FjCsYDuUZB
+v2ORH8u/cZsfpXjpzXAFYnsRnhY1gFHPu+myyrUG4Ruv6QzkUtT9L0p2wA2yXd4
Zt0WbAiQnWiLscrhtaLn/OLZY2bv9OgWB+y92N/nli2PKJ+8b9WY+Vma/0o8V9T1
RUBRJQCgrVMu9/1IFPWQ2jK4US07Eq/wrepQtzqd9AhvP4oifXF+RGTUq0aWDdq3
jXpk+Ud+R/C41bSvC9Rmet07QarVw9oVHf81ZOwIDgPOcES6XdQYn4UVb4wh89JA
z4Asx1Kguuw9vy98leG0yg+Lo8oD0nqiKP0XqmQGs0cwlVsNc0A97SebKKD+7tsy
VE47dKjsqyxEx+qWd5ioqLqnrxmmmDYAt6U28RpSiEXv2e9v13vR1h+V9DNRYxgv
LZEuXLh39DrTqBytq6GO
=Qiiy
-----END PGP SIGNATURE-----

--/2994txjAzEdQwm5--
