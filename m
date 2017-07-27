From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/3] media: V3s: Add support for
 Allwinner CSI.
Date: Thu, 27 Jul 2017 14:25:51 +0200
Message-ID: <20170727122551.qca4atjeet6whfrs@flea.lan>
References: <1501131697-1359-1-git-send-email-yong.deng@magewell.com>
 <1501131697-1359-2-git-send-email-yong.deng@magewell.com>
 <20170727121644.jtpge4x432gfxhvw@tarshish>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kjaywmgek52r2jvf"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBUFX47FQKGQEOMBORNY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170727121644.jtpge4x432gfxhvw@tarshish>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Cc: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jean-Christophe Trotin <jean-christophe.trotin-qxv4g6HH51o@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--kjaywmgek52r2jvf
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Thu, Jul 27, 2017 at 03:16:44PM +0300, Baruch Siach wrote:
> Hi Yong,
> 
> I managed to get the Frame Done interrupt with the previous version of this 
> driver on the A33 OLinuXino. No data yet (all zeros). I'm still working on it.
> 
> One comment below.
> 
> On Thu, Jul 27, 2017 at 01:01:35PM +0800, Yong Deng wrote:
> > Allwinner V3s SoC have two CSI module. CSI0 is used for MIPI interface
> > and CSI1 is used for parallel interface. This is not documented in
> > datasheet but by testing and guess.
> > 
> > This patch implement a v4l2 framework driver for it.
> > 
> > Currently, the driver only support the parallel interface. MIPI-CSI2,
> > ISP's support are not included in this patch.
> > 
> > Signed-off-by: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
> > ---
> 
> [...]
> 
> > +static int update_buf_addr(struct sun6i_csi *csi, dma_addr_t addr)
> > +{
> > +	struct sun6i_csi_dev *sdev = sun6i_csi_to_dev(csi);
> > +	/* transform physical address to bus address */
> > +	dma_addr_t bus_addr = addr - 0x40000000;
> 
> What is the source of this magic number? Is it platform dependent? Are there 
> other devices doing DMA that need this adjustment?

This is the RAM base address in most (but not all) Allwinner
SoCs. You'll want to use PHYS_OFFSET instead.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--kjaywmgek52r2jvf--
