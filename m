From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7] DMA: sun6i: Add driver for the Allwinner A31 DMA
 controller
Date: Fri, 2 May 2014 22:04:29 +0530
Message-ID: <20140502163429.GA32284@intel.com>
References: <20140430070408.GR32284@intel.com>
 <20140430215322.GH3000@lukather>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VywGB/WGlW4DM4P8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140430215322.GH3000@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, kevin.z.m.zh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sunny-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, zhuzhenhua-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--VywGB/WGlW4DM4P8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2014 at 02:53:22PM -0700, Maxime Ripard wrote:
> Hi Vinod,
>=20
> On Wed, Apr 30, 2014 at 12:34:08PM +0530, Vinod Koul wrote:
> > On Thu, Apr 24, 2014 at 04:22:44PM +0200, Maxime Ripard wrote:
> > > +static inline void sun6i_dma_free(struct sun6i_dma_dev *sdc)
> > > +{
> > > +	int i;
> > > +
> > > +	for (i =3D 0; i < NR_MAX_VCHANS; i++) {
> > > +		struct sun6i_vchan *vchan =3D &sdc->vchans[i];
> > > +
> > > +		list_del(&vchan->vc.chan.device_node);
> > > +		tasklet_kill(&vchan->vc.task);
> > > +	}
> > > +
> > > +	tasklet_kill(&sdc->task);
> > This is again not good. see http://lwn.net/Articles/588457/
> > At this point HW can still generate interrupts or you can have irq runn=
ing!
>=20
> I'm not sure to fully understand the issue here, but what is not good?
> the first or the second tasklet_kill calls, or both?
>=20
> From what I understood, the issue is only there whenever you are
> calling tasklet_disable without making sure that no one will schedule
> your tasklet before disabling it.
>=20
> But the point is I don't actually use either _enable/_disable. I might
> be wrong in not using those functions, but I don't really see how I
> can be impacted.

Well that was one part of it. How do you ensure the tasklet is not scheduled
while and after you are killing it. You need to ensure irq is disabled and =
pending irqs
have finished processing. I dont see that bit.

--=20
~Vinod


--VywGB/WGlW4DM4P8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQIcBAEBAgAGBQJTY8kVAAoJEHwUBw8lI4NHMwoP/i4gEC/gYCpkacQiL5wED/DR
vMKJK48oAo5gejkWrd65m7HyyxiGtBDZLU+XJ/EjlZJovr8fDdcNt+mf180hyXY4
+uwxu5tFuH9UlQeFmz6RmPAIMhJfPH/H0YYYkCaC38/nUlYUaQDRguHLR5ntepa0
4gpAx8bZvcLPt/ni0XxeiI7mBxDrjsAtpxe50yo4WwSsI85BiycH5q6+zO2yR9O2
veCV6HT0RN/5WwOHSTYCBHpSL1ustsm1boFhiJuy8tEP7QJbWwxYFKBcrCCrt3+X
2n8XASdx29lTeGkOzNSAObqW5eIs8Vtm4k4WdCiGETi3YpjlTqurm9yb58UTp/81
RR+zA8wTbjHFftzKQsg1b7qDdaNekJyQh+evFwQgZ6n7hMyJ+ZzbXA5hFg7SL/72
tpuR860W61IGJZLk7Q617XWNs0ShpmS9wEF/oByOyrznaiNB5ZIrYDbS+a0Y6Zdh
uTK63VDfwIJnpYpotw+xz80NhHy/GlKDpXbKbHrxiY7iANTjg7shz4UOnoSBx36e
zfsBHq5V16PedzD6PVzS4Q6JS/G8oEC6bJvbSVde+iy/StSSGEdR1yNExzrR3QpP
jXyHlwwJRJsj8+FmI45sNjB9xzpxRi6RR0NqEiicFFs172JHhN+oPUL5fjZrtABw
YwqV+SLBJGqv8rfhCFp1
=X/X1
-----END PGP SIGNATURE-----

--VywGB/WGlW4DM4P8--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
