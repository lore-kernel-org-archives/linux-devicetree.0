From: Simon Hatliff <hatliff-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v5 2/2] v4l: cadence: Add Cadence MIPI-CSI2 RX driver
Date: Tue, 30 Jan 2018 15:54:24 +0000
Message-ID: <3F3A3B73-D31C-41D0-8E88-C78BC3E55A81@cadence.com>
References: <20180119081357.20799-1-maxime.ripard@free-electrons.com>
 <20180119081357.20799-3-maxime.ripard@free-electrons.com>
 <20180129191036.GE25980@ti.com> <20180130154126.keytdulix5imq6b3@flea.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180130154126.keytdulix5imq6b3-ZC1Zs529Oq4@public.gmane.org>
Content-Language: en-US
Content-ID: <A0960E0884F50E4E8F6C8A6BDB9C93CB-Tk6F3M/euE6cE4WynfumptQqCkab/8FMAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Richard Sproul <sproul-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Alan Douglas <adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Steve Creaney <screaney-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "nm-l0cyMroinI0@public.gmane.org" <nm-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 30 Jan 2018, at 15:41, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> =
wrote:
>=20
> Since the lanes are not in use, I'm not sure we have to worry about
> lanes collision. Simon, would it cause any trouble if we map to lanes
> to the same physical lane?

Yes IIRC it would cause trouble.  Due to the internals of the design each
lane needs to have a unique mapping even if it's not in use.=
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
