From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7] DMA: sun6i: Add driver for the Allwinner
 A31 DMA controller
Date: Wed, 21 May 2014 10:59:01 +0530
Message-ID: <20140521052901.GH21128@intel.com>
References: <20140430070408.GR32284@intel.com>
 <20140430215322.GH3000@lukather>
 <20140502163429.GA32284@intel.com>
 <20140508031949.GQ7047@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xo44VMWPx7vlQ2+2"
Return-path: <linux-sunxi+bncBDLNNTP63EBBBSH26CNQKGQEH2GE3WY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140508031949.GQ7047@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, kevin.z.m.zh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sunny-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, zhuzhenhua-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--xo44VMWPx7vlQ2+2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2014 at 10:19:49PM -0500, Maxime Ripard wrote:
> On Fri, May 02, 2014 at 10:04:29PM +0530, Vinod Koul wrote:
> > On Wed, Apr 30, 2014 at 02:53:22PM -0700, Maxime Ripard wrote:
> > > Hi Vinod,
> > >=20
> > > On Wed, Apr 30, 2014 at 12:34:08PM +0530, Vinod Koul wrote:
> > > > On Thu, Apr 24, 2014 at 04:22:44PM +0200, Maxime Ripard wrote:
> > > > > +static inline void sun6i_dma_free(struct sun6i_dma_dev *sdc)
> > > > > +{
> > > > > +	int i;
> > > > > +
> > > > > +	for (i =3D 0; i < NR_MAX_VCHANS; i++) {
> > > > > +		struct sun6i_vchan *vchan =3D &sdc->vchans[i];
> > > > > +
> > > > > +		list_del(&vchan->vc.chan.device_node);
> > > > > +		tasklet_kill(&vchan->vc.task);
> > > > > +	}
> > > > > +
> > > > > +	tasklet_kill(&sdc->task);
> > > > This is again not good. see http://lwn.net/Articles/588457/
> > > > At this point HW can still generate interrupts or you can have irq =
running!
> > >=20
> > > I'm not sure to fully understand the issue here, but what is not good?
> > > the first or the second tasklet_kill calls, or both?
> > >=20
> > > From what I understood, the issue is only there whenever you are
> > > calling tasklet_disable without making sure that no one will schedule
> > > your tasklet before disabling it.
> > >=20
> > > But the point is I don't actually use either _enable/_disable. I might
> > > be wrong in not using those functions, but I don't really see how I
> > > can be impacted.
> >=20
> > Well that was one part of it. How do you ensure the tasklet is not sche=
duled
> > while and after you are killing it. You need to ensure irq is disabled =
and pending irqs
> > have finished processing. I dont see that bit.
>=20
> Ok. I'll change that.
>=20
> Do you want me to use tasklet_enable and tasklet_disable as well?
I dont think it will help in this usage.

--=20
~Vinod

--xo44VMWPx7vlQ2+2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQIcBAEBAgAGBQJTfDmdAAoJEHwUBw8lI4NHv24QAM2bPoq9t+i4e7iSqn91wWs1
QcFEUvENuBhfGmrSTZfLHIsz89Y7njp8jBK5VpjIXYcMD0w+ox5j2Zn9Z0VFNB5a
dE8dZ4JwcmHnilgTI5e6NpCnlXmlugIscPC5NgLuu9I2opr1zf3wMeX1OMBO59Gt
J9Qm8AKA04XRAjNDlUbZ3izyvMAz7j1ajzCl+FdlYucKXvIMDJPg5VB1vtFVSWxu
lxeqjMW6DFz9yIx2G6uMQBZH+VyTMAkkwhlRoT6r6HwPFXbCG5295Gbz4OZ9SDXX
6Wr8Z+H3l/gP4M9227GxXHjscWgWZOXGtjLcmU7AsWr4iwzw0NQ40s683c+DkKl4
49/Dv6RJNYsGLaoVGJmb5Ics9uqljR3c3mhlmb3/V3XbWOyfu8UiaiPmh2PptiS0
5GiKMvtapd4R8XZz09k/1nPzD6sZRaJrxiC8MErxbc6ZkbPcMReUkm3DVKvvuMIM
0QCoVxYwsrcf1TwB+yULACAzd+x7ua9bCeCdnIzt7jKgEghXcvMgvBIBF4Lng3Fi
kqMJHol7prmIXoD43mGJl6KDLr5+Q7QHxThOkhw9p5fBguue0M8fiL1bOb5o/xIh
MooBNGa3tjf2S3KJJrVTs4J+lhoxfNg4eD9GXya4DAcAQthC8+hXc9X+AIX2cteD
BIS3mxpnuXuQ8vMsmlE2
=YrhV
-----END PGP SIGNATURE-----

--xo44VMWPx7vlQ2+2--
