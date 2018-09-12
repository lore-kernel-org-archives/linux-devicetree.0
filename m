From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v9 5/9] media: platform: Add Cedrus VPU
 decoder driver
Date: Wed, 12 Sep 2018 09:23:47 +0200
Message-ID: <20180912072347.nqw4uu23fykjtz72@flea>
References: <20180906222442.14825-1-contact@paulk.fr>
 <20180906222442.14825-6-contact@paulk.fr>
 <20180911124625.6759e429@coco.lan>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4iwt5yvaz3vewot5"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBBH64LOAKGQENGKRU7Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180911124625.6759e429-qA1ZUp+OV9c@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Mauro Carvalho Chehab <mchehab+samsung-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Alexandre Courbot <acourbot-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--4iwt5yvaz3vewot5
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Tue, Sep 11, 2018 at 12:46:25PM -0300, Mauro Carvalho Chehab wrote:
> Em Fri,  7 Sep 2018 00:24:38 +0200
> Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org> escreveu:
> 
> > From: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
> > 
> > This introduces the Cedrus VPU driver that supports the VPU found in
> > Allwinner SoCs, also known as Video Engine. It is implemented through
> > a V4L2 M2M decoder device and a media device (used for media requests).
> > So far, it only supports MPEG-2 decoding.
> > 
> > Since this VPU is stateless, synchronization with media requests is
> > required in order to ensure consistency between frame headers that
> > contain metadata about the frame to process and the raw slice data that
> > is used to generate the frame.
> > 
> > This driver was made possible thanks to the long-standing effort
> > carried out by the linux-sunxi community in the interest of reverse
> > engineering, documenting and implementing support for the Allwinner VPU.
> > 
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
> > Acked-by: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
> 
> There are several checkpatch issues here. Ok, some can be
> ignored, but there are at least some of them that sounda relevant.

Sorry for that. Given that it's intended to be in staging, do you want
us to send subsequent patches or the whole serie?

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--4iwt5yvaz3vewot5--
