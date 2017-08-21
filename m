From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/3] media: V3s: Add support for
 Allwinner CSI.
Date: Mon, 21 Aug 2017 22:21:45 +0200
Message-ID: <20170821202145.kmxancepyq55v3o2@flea.lan>
References: <1501131697-1359-1-git-send-email-yong.deng@magewell.com>
 <1501131697-1359-2-git-send-email-yong.deng@magewell.com>
 <20170728160233.xooevio4hoqkgfaq@flea.lan>
 <20170730060801.bkc2kvm72ktixy74@tarshish>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="phq7ixndptki6bzi"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBZEB5XGAKGQEWC5XRRI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170730060801.bkc2kvm72ktixy74@tarshish>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Cc: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jean-Christophe Trotin <jean-christophe.trotin-qxv4g6HH51o@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--phq7ixndptki6bzi
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

Hi Baruch,

On Sun, Jul 30, 2017 at 09:08:01AM +0300, Baruch Siach wrote:
> On Fri, Jul 28, 2017 at 06:02:33PM +0200, Maxime Ripard wrote:
> > Hi, 
> > 
> > Thanks for the second iteration!
> > 
> > On Thu, Jul 27, 2017 at 01:01:35PM +0800, Yong Deng wrote:
> > > Allwinner V3s SoC have two CSI module. CSI0 is used for MIPI interface
> > > and CSI1 is used for parallel interface. This is not documented in
> > > datasheet but by testing and guess.
> > > 
> > > This patch implement a v4l2 framework driver for it.
> > > 
> > > Currently, the driver only support the parallel interface. MIPI-CSI2,
> > > ISP's support are not included in this patch.
> > > 
> > > Signed-off-by: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
> 
> [...]
> 
> > > +#ifdef DEBUG
> > > +static void sun6i_csi_dump_regs(struct sun6i_csi_dev *sdev)
> > > +{
> > > +	struct regmap *regmap = sdev->regmap;
> > > +	u32 val;
> > > +
> > > +	regmap_read(regmap, CSI_EN_REG, &val);
> > > +	printk("CSI_EN_REG=0x%x\n",		val);
> > > +	regmap_read(regmap, CSI_IF_CFG_REG, &val);
> > > +	printk("CSI_IF_CFG_REG=0x%x\n",		val);
> > > +	regmap_read(regmap, CSI_CAP_REG, &val);
> > > +	printk("CSI_CAP_REG=0x%x\n",		val);
> > > +	regmap_read(regmap, CSI_SYNC_CNT_REG, &val);
> > > +	printk("CSI_SYNC_CNT_REG=0x%x\n",	val);
> > > +	regmap_read(regmap, CSI_FIFO_THRS_REG, &val);
> > > +	printk("CSI_FIFO_THRS_REG=0x%x\n",	val);
> > > +	regmap_read(regmap, CSI_PTN_LEN_REG, &val);
> > > +	printk("CSI_PTN_LEN_REG=0x%x\n",	val);
> > > +	regmap_read(regmap, CSI_PTN_ADDR_REG, &val);
> > > +	printk("CSI_PTN_ADDR_REG=0x%x\n",	val);
> > > +	regmap_read(regmap, CSI_VER_REG, &val);
> > > +	printk("CSI_VER_REG=0x%x\n",		val);
> > > +	regmap_read(regmap, CSI_CH_CFG_REG, &val);
> > > +	printk("CSI_CH_CFG_REG=0x%x\n",		val);
> > > +	regmap_read(regmap, CSI_CH_SCALE_REG, &val);
> > > +	printk("CSI_CH_SCALE_REG=0x%x\n",	val);
> > > +	regmap_read(regmap, CSI_CH_F0_BUFA_REG, &val);
> > > +	printk("CSI_CH_F0_BUFA_REG=0x%x\n",	val);
> > > +	regmap_read(regmap, CSI_CH_F1_BUFA_REG, &val);
> > > +	printk("CSI_CH_F1_BUFA_REG=0x%x\n",	val);
> > > +	regmap_read(regmap, CSI_CH_F2_BUFA_REG, &val);
> > > +	printk("CSI_CH_F2_BUFA_REG=0x%x\n",	val);
> > > +	regmap_read(regmap, CSI_CH_STA_REG, &val);
> > > +	printk("CSI_CH_STA_REG=0x%x\n",		val);
> > > +	regmap_read(regmap, CSI_CH_INT_EN_REG, &val);
> > > +	printk("CSI_CH_INT_EN_REG=0x%x\n",	val);
> > > +	regmap_read(regmap, CSI_CH_INT_STA_REG, &val);
> > > +	printk("CSI_CH_INT_STA_REG=0x%x\n",	val);
> > > +	regmap_read(regmap, CSI_CH_FLD1_VSIZE_REG, &val);
> > > +	printk("CSI_CH_FLD1_VSIZE_REG=0x%x\n",	val);
> > > +	regmap_read(regmap, CSI_CH_HSIZE_REG, &val);
> > > +	printk("CSI_CH_HSIZE_REG=0x%x\n",	val);
> > > +	regmap_read(regmap, CSI_CH_VSIZE_REG, &val);
> > > +	printk("CSI_CH_VSIZE_REG=0x%x\n",	val);
> > > +	regmap_read(regmap, CSI_CH_BUF_LEN_REG, &val);
> > > +	printk("CSI_CH_BUF_LEN_REG=0x%x\n",	val);
> > > +	regmap_read(regmap, CSI_CH_FLIP_SIZE_REG, &val);
> > > +	printk("CSI_CH_FLIP_SIZE_REG=0x%x\n",	val);
> > > +	regmap_read(regmap, CSI_CH_FRM_CLK_CNT_REG, &val);
> > > +	printk("CSI_CH_FRM_CLK_CNT_REG=0x%x\n",	val);
> > > +	regmap_read(regmap, CSI_CH_ACC_ITNL_CLK_CNT_REG, &val);
> > > +	printk("CSI_CH_ACC_ITNL_CLK_CNT_REG=0x%x\n",	val);
> > > +	regmap_read(regmap, CSI_CH_FIFO_STAT_REG, &val);
> > > +	printk("CSI_CH_FIFO_STAT_REG=0x%x\n",	val);
> > > +	regmap_read(regmap, CSI_CH_PCLK_STAT_REG, &val);
> > > +	printk("CSI_CH_PCLK_STAT_REG=0x%x\n",	val);
> > > +}
> > > +#endif
> > 
> > You can already dump a regmap through debugfs, that's redundant.
> 
> The advantage of in-code registers dump routine is the ability to
> synchronize the snapshot with the driver code execution. This is
> particularly important for the capture statistics registers. I have
> found it useful here.

You also have the option to use the traces to do that, but if that's
useful, this should be added to regmap itself. It can benefit others
too.

> > > +static irqreturn_t sun6i_csi_isr(int irq, void *dev_id)
> > > +{
> > > +	struct sun6i_csi_dev *sdev = (struct sun6i_csi_dev *)dev_id;
> > > +	struct regmap *regmap = sdev->regmap;
> > > +	u32 status;
> > > +
> > > +	regmap_read(regmap, CSI_CH_INT_STA_REG, &status);
> > > +
> > > +	if ((status & CSI_CH_INT_STA_FIFO0_OF_PD) ||
> > > +	    (status & CSI_CH_INT_STA_FIFO1_OF_PD) ||
> > > +	    (status & CSI_CH_INT_STA_FIFO2_OF_PD) ||
> > > +	    (status & CSI_CH_INT_STA_HB_OF_PD)) {
> > > +		regmap_write(regmap, CSI_CH_INT_STA_REG, status);
> > > +		regmap_update_bits(regmap, CSI_EN_REG, CSI_EN_CSI_EN, 0);
> > > +		regmap_update_bits(regmap, CSI_EN_REG, CSI_EN_CSI_EN,
> > > +				   CSI_EN_CSI_EN);
> > 
> > You need to enable / disable it at every frame? How do you deal with
> > double buffering? (or did you choose to ignore it for now?)
> 
> These *_OF_PD status bits indicate an overflow error condition.

Shouldn't we return an error code then? The names of these flags could
be better too.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--phq7ixndptki6bzi--
