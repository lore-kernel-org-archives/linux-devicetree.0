From: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 14/15] arm64: dts: allwinner: h5: Add Video
 Engine and reserved memory node
Date: Fri, 30 Nov 2018 14:16:50 +0100
Message-ID: <2a52719446c1050990494e44a991acb932da8273.camel@bootlin.com>
References: <20181115145013.3378-1-paul.kocialkowski@bootlin.com>
	 <20181115145013.3378-15-paul.kocialkowski@bootlin.com>
	 <CAGb2v64pVKG4mSAF48xR54yj00rQ6iTvgYQB9Bf-XWmH2FhVqQ@mail.gmail.com>
Reply-To: paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-453EcI7CdM8GuIru8Jyr"
Return-path: <linux-sunxi+bncBCOO3QWNR4KRBQ7QQTQAKGQEOCMZUHI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v64pVKG4mSAF48xR54yj00rQ6iTvgYQB9Bf-XWmH2FhVqQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--=-453EcI7CdM8GuIru8Jyr
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, 2018-11-15 at 23:35 +0800, Chen-Yu Tsai wrote:
> On Thu, Nov 15, 2018 at 10:51 PM Paul Kocialkowski
> <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> > This adds nodes for the Video Engine and the associated reserved memory
> > for the H5. Up to 96 MiB of memory are dedicated to the CMA pool.
> > 
> > The pool is located at the end of the first 256 MiB of RAM so that the
> > VPU can access it. It is unclear whether this is still a hard
> > requirement for this platform, but it seems safer that way.
> 
> I think we can actually test this. You could move the reserved memory
> pool beyond 256 MiB, and have cedrus decode stuff, and try to display
> the results. If it's gibberish, or the system crashes, it's likely the
> memory access wrapped around at 256 MiB.
> 
> What do you think?

I did the test on various platforms and found that starting with the
A33, the VPU can map any address in RAM! SO we shouldn't need reserved
memory nodes for these devices after all.

Cheers,

Paul

-- 
Paul Kocialkowski, Bootlin (formerly Free Electrons)
Embedded Linux and kernel engineering
https://bootlin.com
--=-453EcI7CdM8GuIru8Jyr--
