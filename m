From: Yong <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v6 2/2] media: V3s: Add support for
 Allwinner CSI.
Date: Fri, 26 Jan 2018 09:46:58 +0800
Message-ID: <20180126094658.aa70ed3f890464f6051e21e4@magewell.com>
References: <1516695531-23349-1-git-send-email-yong.deng@magewell.com>
	<201801260759.RyNhDZz4%fengguang.wu@intel.com>
Reply-To: yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD2JNYHK4MEBBH4RVLJQKGQEUSRNBCI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <201801260759.RyNhDZz4%fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: kbuild-all-JC7UmRfGjtg@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rick Chang <rick.chang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.orgli
List-Id: devicetree@vger.kernel.org

Hi Maxime,

Do you have any experience in solving this problem?
It seems the PHYS_OFFSET maybe undeclared when the ARCH is not arm.

On Fri, 26 Jan 2018 08:04:18 +0800
kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> wrote:

> Hi Yong,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on linuxtv-media/master]
> [also build test ERROR on v4.15-rc9 next-20180119]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Yong-Deng/dt-bindings-media-Add-Allwinner-V3s-Camera-Sensor-Interface-CSI/20180126-054511
> base:   git://linuxtv.org/media_tree.git master
> config: i386-allmodconfig (attached as .config)
> compiler: gcc-7 (Debian 7.2.0-12) 7.2.1 20171025
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=i386 
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c: In function 'sun6i_csi_update_buf_addr':
> >> drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c:567:31: error: 'PHYS_OFFSET' undeclared (first use in this function); did you mean 'PAGE_OFFSET'?
>      dma_addr_t bus_addr = addr - PHYS_OFFSET;
>                                   ^~~~~~~~~~~
>                                   PAGE_OFFSET
>    drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c:567:31: note: each undeclared identifier is reported only once for each function it appears in
> 
> vim +567 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> 
>    562	
>    563	void sun6i_csi_update_buf_addr(struct sun6i_csi *csi, dma_addr_t addr)
>    564	{
>    565		struct sun6i_csi_dev *sdev = sun6i_csi_to_dev(csi);
>    566		/* transform physical address to bus address */
>  > 567		dma_addr_t bus_addr = addr - PHYS_OFFSET;
>    568	
>    569		regmap_write(sdev->regmap, CSI_CH_F0_BUFA_REG,
>    570			     (bus_addr + sdev->planar_offset[0]) >> 2);
>    571		if (sdev->planar_offset[1] != -1)
>    572			regmap_write(sdev->regmap, CSI_CH_F1_BUFA_REG,
>    573				     (bus_addr + sdev->planar_offset[1]) >> 2);
>    574		if (sdev->planar_offset[2] != -1)
>    575			regmap_write(sdev->regmap, CSI_CH_F2_BUFA_REG,
>    576				     (bus_addr + sdev->planar_offset[2]) >> 2);
>    577	}
>    578	
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation


Thanks,
Yong
