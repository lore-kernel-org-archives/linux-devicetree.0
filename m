From: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v6 4/8] media: platform: Add Cedrus VPU
 decoder driver
Date: Tue, 07 Aug 2018 09:19:54 +0200
Message-ID: <94e3eaf26ed7d6859d74abad0a0dbc94a3308a2e.camel@bootlin.com>
References: <20180725100256.22833-1-paul.kocialkowski@bootlin.com>
	 <20180725100256.22833-5-paul.kocialkowski@bootlin.com>
	 <b45a8a89-1313-7a08-206d-b93017724754@xs4all.nl>
	 <dba0f9496b393c76f355398018b14ae06b2b18c9.camel@bootlin.com>
	 <CAAFQd5DgFDFupACthsz1iLpAeYRtUtEfzQC1E5XZQ6gPZAYi1Q@mail.gmail.com>
Reply-To: paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ZkudRXiEFCPQyFqeie9D"
Return-path: <linux-sunxi+bncBCOO3QWNR4KRBJUQUXNQKGQE426XAMA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAAFQd5DgFDFupACthsz1iLpAeYRtUtEfzQC1E5XZQ6gPZAYi1Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Alexandre Courbot <acourbot-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "list-Y9sIeH5OGRo@public.gmane.org:IOMMU DRIVERS
 <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>,	Joerg   Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>," <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, thomas.petazzoni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hugues FRUCHET <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, ayaka <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>, Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--=-ZkudRXiEFCPQyFqeie9D
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, 2018-08-06 at 23:10 +0900, Tomasz Figa wrote:
> Hi Paul,
> 
> On Mon, Aug 6, 2018 at 10:50 PM Paul Kocialkowski
> <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> > 
> > Hi Hans and thanks for the review!
> > 
> > On Sat, 2018-08-04 at 14:18 +0200, Hans Verkuil wrote:
> > > Hi Paul,
> > > 
> > > See below for my review comments. Mostly small fry, the main issue I found is
> > > that there is no support for VIDIOC_DECODER_CMD. That's the proper way of
> > > stopping a decoder. Don't rely on the deprecated allow_zero_bytesused field.
> > 
> > Mhh, it looks like this was kept around by negligence, but we do expect
> > that streamoff stops the decoder, not a zero bytesused field.
> > 
> > Is it still required to implement the V4L2_DEC_CMD_STOP
> > VIDIOC_DECODER_CMD in that case? I read in the doc that this ioctl
> > should be optional.
> 
> If I understand correctly that this decoder is stateless, there should
> be no need for any special flush sequence, since a 1:1 relation
> between OUTPUT and CAPTURE buffers is expected, which means that
> userspace can just stop queuing new OUTPUT buffers and keep dequeuing
> CAPTURE buffers until it matches all OUTPUT buffers queued before.

This is indeed a stateless decoder and I don't have any particular need
for a particular stop command indeed, since flushing remaining buffers
when stopping is already implemented at streamoff time.

> By the way, I guess we will also need some documentation for the
> stateless codec interface. Do you or Maxime (who sent the H264 part)
> have any plans to work on it? We have some internal documents, which
> should be convertible to rst using pandoc, but we might need some help
> with updating to latest request API and further editing. Alexandre
> (moved from Cc to To) is going to be looking into this.

As far as I'm concerned, I am interested in contributing to this
documentation although our priorities for the Allwinner VPU effort are
currently focused on H265 support. This might mean that my contributions
to this documentation will be made on a best-effort basis (as opposed to
during the workday). Either way, if someone was to come up with an
initial draft, I'd be happy to review it!

Cheers,

Paul

-- 
Paul Kocialkowski, Bootlin (formerly Free Electrons)
Embedded Linux and kernel engineering
https://bootlin.com
--=-ZkudRXiEFCPQyFqeie9D--
