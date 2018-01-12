From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re: [PATCH v5 2/2] media: V3s: Add support for
 Allwinner CSI.
Date: Fri, 12 Jan 2018 09:37:49 +0100
Message-ID: <20180112083749.syxtwiigxafxw4zq@flea.lan>
References: <1515639966-35902-1-git-send-email-yong.deng@magewell.com>
 <20180111132844.mok7upqjycpx3bqm@flea.lan>
 <20180112095114.b2414fe44cff7bf7cf6f8822@magewell.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mzjxflidhun7f3lz"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBX7H4HJAKGQEVMPBF2I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180112095114.b2414fe44cff7bf7cf6f8822-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Yong <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rick Chang <rick.chang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, megous@mego
List-Id: devicetree@vger.kernel.org


--mzjxflidhun7f3lz
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Fri, Jan 12, 2018 at 09:51:14AM +0800, Yong wrote:
> Hi Maxime,
> 
> On Thu, 11 Jan 2018 14:28:44 +0100
> Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> 
> > Hi Yong,
> > 
> > On Thu, Jan 11, 2018 at 11:06:06AM +0800, Yong Deng wrote:
> > > Allwinner V3s SoC features two CSI module. CSI0 is used for MIPI CSI-2
> > > interface and CSI1 is used for parallel interface. This is not
> > > documented in datasheet but by test and guess.
> > > 
> > > This patch implement a v4l2 framework driver for it.
> > > 
> > > Currently, the driver only support the parallel interface. MIPI-CSI2,
> > > ISP's support are not included in this patch.
> > > 
> > > Signed-off-by: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
> > 
> > I've needed this patch in order to fix a NULL pointer dereference:
> > http://code.bulix.org/oz6gmb-257359?raw
> > 
> > This is needed because while it's ok to have a NULL pointer to
> > v4l2_subdev_pad_config when you call the subdev set_fmt with
> > V4L2_SUBDEV_FORMAT_ACTIVE, it's not with V4L2_SUBDEV_FORMAT_TRY, and
> > sensors will assume taht it's a valid pointer.
> > 
> > Otherwise,
> > Tested-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> 
> I revisit some code of subdevs and you are right.
> 
> Squash your patch into my driver patch and add your Tested-by in
> commit. Is it right?

Yep, that's perfect :)

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--mzjxflidhun7f3lz--
