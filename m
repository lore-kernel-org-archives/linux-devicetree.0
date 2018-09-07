From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: [PATCH v8 4/8] media: platform: Add Cedrus VPU
 decoder driver
Date: Fri, 07 Sep 2018 17:04:29 +0200
Message-ID: <d581b9cc8153d063360d8cde290329f5c1786ae9.camel@paulk.fr>
References: <20180828073424.30247-1-paul.kocialkowski@bootlin.com>
	 <20180828073424.30247-5-paul.kocialkowski@bootlin.com>
	 <5faf5eed-eb2c-f804-93e3-5a42f6204d99@xs4all.nl>
	 <b7b3cb2320978d45acb34475d15abd7bf03da367.camel@paulk.fr>
	 <461c6a0d-a346-b9da-b75e-4aab907054df@xs4all.nl>
	 <890469f8-434f-4ca1-ec95-20542610fd78@xs4all.nl>
Reply-To: contact-W9ppeneeCTY@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-/svZRu+03gLxIKygAmz+"
Return-path: <linux-sunxi+bncBC75HK6WUAEBBE5HZLOAKGQECTKMN7A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <890469f8-434f-4ca1-ec95-20542610fd78-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>, Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Alexandre Courbot <acourbot-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--=-/svZRu+03gLxIKygAmz+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 06 septembre 2018 =C3=A0 09:22 +0200, Hans Verkuil a =C3=A9crit :
> On 09/06/2018 09:01 AM, Hans Verkuil wrote:
> > On 09/05/2018 06:29 PM, Paul Kocialkowski wrote:
> > > Hi and thanks for the review!
> > >=20
> > > Le lundi 03 septembre 2018 =C3=A0 11:11 +0200, Hans Verkuil a =C3=A9c=
rit :
> > > > On 08/28/2018 09:34 AM, Paul Kocialkowski wrote:
> > > > > +static int cedrus_queue_setup(struct vb2_queue *vq, unsigned int=
 *nbufs,
> > > > > +			      unsigned int *nplanes, unsigned int sizes[],
> > > > > +			      struct device *alloc_devs[])
> > > > > +{
> > > > > +	struct cedrus_ctx *ctx =3D vb2_get_drv_priv(vq);
> > > > > +	struct cedrus_dev *dev =3D ctx->dev;
> > > > > +	struct v4l2_pix_format_mplane *mplane_fmt;
> > > > > +	struct cedrus_format *fmt;
> > > > > +	unsigned int i;
> > > > > +
> > > > > +	switch (vq->type) {
> > > > > +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> > > > > +		mplane_fmt =3D &ctx->src_fmt;
> > > > > +		fmt =3D cedrus_find_format(mplane_fmt->pixelformat,
> > > > > +					 CEDRUS_DECODE_SRC,
> > > > > +					 dev->capabilities);
> > > > > +		break;
> > > > > +
> > > > > +	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> > > > > +		mplane_fmt =3D &ctx->dst_fmt;
> > > > > +		fmt =3D cedrus_find_format(mplane_fmt->pixelformat,
> > > > > +					 CEDRUS_DECODE_DST,
> > > > > +					 dev->capabilities);
> > > > > +		break;
> > > > > +
> > > > > +	default:
> > > > > +		return -EINVAL;
> > > > > +	}
> > > > > +
> > > > > +	if (!fmt)
> > > > > +		return -EINVAL;
> > > > > +
> > > > > +	if (fmt->num_buffers =3D=3D 1) {
> > > > > +		sizes[0] =3D 0;
> > > > > +
> > > > > +		for (i =3D 0; i < fmt->num_planes; i++)
> > > > > +			sizes[0] +=3D mplane_fmt->plane_fmt[i].sizeimage;
> > > > > +	} else if (fmt->num_buffers =3D=3D fmt->num_planes) {
> > > > > +		for (i =3D 0; i < fmt->num_planes; i++)
> > > > > +			sizes[i] =3D mplane_fmt->plane_fmt[i].sizeimage;
> > > > > +	} else {
> > > > > +		return -EINVAL;
> > > > > +	}
> > > > > +
> > > > > +	*nplanes =3D fmt->num_buffers;
> > > >=20
> > > > This code does not take VIDIOC_CREATE_BUFFERS into account.
> > > >=20
> > > > If it is called from that ioctl, then *nplanes is non-zero and you =
need
> > > > to check if *nplanes equals fmt->num_buffers and that sizes[n] is >=
=3D
> > > > the required size of the format. If so, then return 0, otherwise re=
turn
> > > > -EINVAL.
> > >=20
> > > Thanks for spotting this, I'll fix it as you suggested in the next
> > > revision.
> > >=20
> > > > Doesn't v4l2-compliance fail on that? Or is that test skipped becau=
se this
> > > > is a decoder for which streaming is not supported (yet)?
> > >=20
> > > Apparently, v4l2-compliance doesn't fail since I'm getting:
> > > test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> >=20
> > It is tested, but only with the -s option. I'll see if I can improve th=
e
> > tests.
>=20
> I've improved the tests. v4l2-compliance should now fail when run (withou=
t the
> -s option) against this driver. Can you check that that is indeed the cas=
e?

I think this wasn't being tested with v8 of the driver as no default
format was provided (for the G_FMT test), which probably led to MMAP
not being picked up in valid_memorytype. Thus the subsequent
CREATE_BUFS test was reported as not failing, but it really didn't test
much of anything.

Cheers,

Paul

--=20
Developer of free digital technology and hardware support.

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--=-/svZRu+03gLxIKygAmz+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAluSk30ACgkQhP3B6o/u
lQz+Ng//bav/aEq2NkHpux+N1/OBbbVqSlgP4nqMGPiq2oBW1qfpgpC6By9xgGnY
s7hO9XGTiM5kvyM3oanjxVUHVBgqP082E+UFHtyhXBFulKLzr03NyJK+jnGC/rbN
f8beigEdUb1TBGjrXpLoOGlg2qEYh/wwRAJEfyMuAt4Y7WKtqONDALOa5VD/7UUl
57zAhA4ZFGM2lFl/ezg6kmX+yp0rrrF1vrU9axJw3bHyv8hbxPNQ28XDr+qjSukA
lOIYg6DA+2CVVe+9XYdA+Nc5zdCB10AHSHBeURpXwZhtVnGR9UPlXc4wlEra9J6U
U5XrNhDNYxbmjnPAgq6hoENGZX0OSE6uRGp1D28nIV+QE+od4WbwMlvGhXi39rkA
XDUXPBdsP6gGRBNKkomJifNmE4DR06RNCMQvSc2BnVFgFwBXt6oZE9iSQyWsb8Dz
yPWiacQFTDdncAEUzjx/RIu/b/OifYlXQYahuhi7FvuodsrvMV60JCPOi623RHSr
nMJzYdALtNqriN4bPXRj2J9HQBaUWbn/ddVmgg0fj5IYiAFyj1KqfoTk+S52/EFD
rTsbPe93JrthQilTbmT3APgv44jTcNUWOANFudoEZs3+qWj6l77rd9RTrF+kFlAp
8IsoUFsFUQUOszV2yY3G2hBGEzpdn10h06kCg+5NRLFLNTV4fRE=
=5i8q
-----END PGP SIGNATURE-----

--=-/svZRu+03gLxIKygAmz+--
