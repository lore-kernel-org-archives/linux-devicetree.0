From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 08/10] dt-bindings: media: Document
 bindings for the Sunxi-Cedrus VPU driver
Date: Fri, 4 May 2018 10:12:14 +0200
Message-ID: <20180504081214.3luailyresuq5x4z@flea>
References: <20180419154124.17512-1-paul.kocialkowski@bootlin.com>
 <20180419154536.17846-4-paul.kocialkowski@bootlin.com>
 <1524153860.3416.9.camel@pengutronix.de>
 <CAAFQd5DT_xjUbZzFOoKk7_duiSZ8Awb1J=0dPEhVTBk0P3gppA@mail.gmail.com>
 <5fa80b1e88ad2a215f51ea3a2b9b62274fa9b1ec.camel@bootlin.com>
 <20180427030436.3ptrb2ldhtnssipj@rob-hp-laptop>
 <ce85c790b639bf9101b8c33526bdf149070bcc03.camel@bootlin.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fjsv7zqvnkrt3jk5"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB2NLWDLQKGQEHQMO6GY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <ce85c790b639bf9101b8c33526bdf149070bcc03.camel-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "list-Y9sIeH5OGRo@public.gmane.org:IOMMU DRIVERS	<iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>,	Joerg  Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>," <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, wens-jdAy2FN1RRM@public.gmane.org, Pawel Osciak <pawel-FA/gS7QP4orQT0dZR+AlfA@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Alexandre Courbot <acourbot-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--fjsv7zqvnkrt3jk5
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Fri, May 04, 2018 at 09:56:20AM +0200, Paul Kocialkowski wrote:
> > > I agree that the term VPU is more commonly associated with video
> > > decoding, while video engine could mean a number of things.
> > > 
> > > The reason I went with "video-engine" here (while still presenting
> > > the
> > > driver as a VPU driver) is that Video Engine is the term used in
> > > Allwinner's litterature. Other nodes in Allwinner device-trees
> > > generally
> > > stick to these terms (for instance, we have "display-engine" nodes).
> > > This also makes it easier to find the matching parts in the
> > > documentation.
> > 
> > 'video-codec' is what is defined in the DT spec.
> 
> Is that an actively-enforced guideline or a suggestion? I'd like to keep
> video-engine just to stick with the technical documentation wording and
> my personal taste is also to prefer vpu over video-codec (in terms of
> clarity/straightforwardness) as a second choice.
> 
> Still, if the choice isn't up to me, we can go with video-codec (or
> vpu).

The unit-name is supposed to reflect the class of the device, and
nothing else. If there's already a pre-existing class name defined for
these kind of devices, then there's no point in choosing something
else.

Maxime

-- 
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--fjsv7zqvnkrt3jk5--
