From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v7] DMA: sun6i: Add driver for the Allwinner
 A31 DMA controller
Date: Tue, 13 May 2014 15:42:58 +0200
Message-ID: <20140513134258.GA29258@lukather>
References: <20140430070408.GR32284@intel.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB2ODZCNQKGQE5SKUBOI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140430070408.GR32284-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, kevin.z.m.zh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sunny-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, zhuzhenhua-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Vinod,

On Wed, Apr 30, 2014 at 12:34:08PM +0530, Vinod Koul wrote:
> > +
> > +static int sun6i_dma_terminate_all(struct sun6i_vchan *vchan)
> > +{
> > +	struct sun6i_dma_dev *sdev =3D to_sun6i_dma_dev(vchan->vc.chan.device=
);
> > +	struct sun6i_pchan *pchan =3D vchan->phy;
> > +	unsigned long flags;
> > +	LIST_HEAD(head);
> > +
> > +	spin_lock(&sdev->lock);
> > +	list_del_init(&vchan->node);
> > +	spin_unlock(&sdev->lock);
> > +
> > +	spin_lock_irqsave(&vchan->vc.lock, flags);
> > +
> > +	vchan_get_all_descriptors(&vchan->vc, &head);
> > +
> > +	if (pchan) {
> > +		writel(DMA_CHAN_ENABLE_STOP, pchan->base + DMA_CHAN_ENABLE);
> > +		writel(DMA_CHAN_PAUSE_RESUME, pchan->base + DMA_CHAN_PAUSE);
> > +
> > +		vchan->phy =3D NULL;
> > +		pchan->vchan =3D NULL;
> > +		pchan->desc =3D NULL;
> > +		pchan->done =3D NULL;
> > +	}
> > +
> > +	spin_unlock_irqrestore(&vchan->vc.lock, flags);
> > +
> > +	vchan_dma_desc_free_list(&vchan->vc, &head);
>=20
> shouldn't you kill the tasklet as well here?

Just to be clear, which tasklet? vchan's or the driver's?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTciFiAAoJEBx+YmzsjxAgqzYP/imjB1PIl5O0NsHM7Hz8ZFVg
IaveYGrL5rwsadTN1K02wtLpdbA0bMSDKqI5QW8gi+Y9qLxypPzf68UlbeSxtkuc
05QaLgtikOgeGuHFsEVaA63mHcsgKS3KpyehRKir6VnH/fDN4MPJ89T30gKjFgru
7AHpKpqKPyB11CTOCPvsYW3iCcr2wMMO+qDPPKRWK0rz+dC1JVBLkbNbM5s4RwVw
IUv++F2EyUofq74Mvoi17Y7zgpfCD4H9Cq4krtOIse/I6ovjqwcmfKsPY9xspqgX
4VF7JxSV8YwD8U7HexdaszgMacJF25OpgsaKDjP00hlauEdU90OgbfIQsDPnjNUd
RiqQf4PVuyUzlpTLyRhAx5hTU8atZ9OWAO+MfgzmToMmvY+i8J6xzryyJxpGtY2s
ciO70QKq5cB98899rg87MZOWmZNCyeCS1pEVv8Ezs18en6IE1njqs6YXBCRWOf+i
Q4CvwEml6M+n2jbB9BqazmwlGRsc0harVMJ2sw/9gO8y1m7S8tXDxl6fsb8cZxL/
aEgSyHh6Cvg32BNp+Ua+qLc4kYkLv+RdDExXfJaq3mZZrq4jJBIUrk1OskiOjlkv
6/wFf/jBfs0ADTX9Coy8SGLZwMszKLJt+7qzlE5KZu9slSHRPcLdSW40H7U5ebK1
6Ks6wDn9ftS3mI8tyz+j
=kaUC
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--
