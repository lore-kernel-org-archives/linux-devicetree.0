From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH RESEND 5/7] drm/sun4i: Rely on dma-parent for our RAM
 offset
Date: Sat, 21 Jul 2018 08:03:13 +0800
Message-ID: <201807210745.Wn8dECfz%fengguang.wu@intel.com>
References: <4e8314d579b8e78b8d40f03ff99cdfa22c43d462.1532098561.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="EVF5PPMfhYS0aIcm"
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <4e8314d579b8e78b8d40f03ff99cdfa22c43d462.1532098561.git-series.maxime.ripard@bootlin.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Yong Deng <yong.deng@magewell.com>, Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <maxime.ripard@bootlin.com>, Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, kbuild-all@01.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Frank Rowand <frowand.list@gmail.com>, Dave Martin <dave.martin@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Maxime,

I love your patch! Yet something to improve:

[auto build test ERROR on ]

url:    https://github.com/0day-ci/linux/commits/Maxime-Ripard/sunxi-Add-DT-representation-for-the-MBUS-controller/20180721-052652
base:    
config: arm-sunxi_defconfig (attached as .config)
compiler: arm-linux-gnueabi-gcc (Debian 7.2.0-11) 7.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=7.2.0 make.cross ARCH=arm 

All errors (new ones prefixed by >>):

   drivers/gpu/drm/sun4i/sun4i_backend.c: In function 'sun4i_backend_bind':
>> drivers/gpu/drm/sun4i/sun4i_backend.c:776:9: error: too few arguments to function 'of_dma_configure'
      ret = of_dma_configure(drm->dev, dev->of_node);
            ^~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/sun4i/sun4i_backend.c:24:0:
   include/linux/of_device.h:58:5: note: declared here
    int of_dma_configure(struct device *dev,
        ^~~~~~~~~~~~~~~~

vim +/of_dma_configure +776 drivers/gpu/drm/sun4i/sun4i_backend.c

   749	
   750	static int sun4i_backend_bind(struct device *dev, struct device *master,
   751				      void *data)
   752	{
   753		struct platform_device *pdev = to_platform_device(dev);
   754		struct drm_device *drm = data;
   755		struct sun4i_drv *drv = drm->dev_private;
   756		struct sun4i_backend *backend;
   757		const struct sun4i_backend_quirks *quirks;
   758		struct resource *res;
   759		void __iomem *regs;
   760		int i, ret;
   761	
   762		backend = devm_kzalloc(dev, sizeof(*backend), GFP_KERNEL);
   763		if (!backend)
   764			return -ENOMEM;
   765		dev_set_drvdata(dev, backend);
   766		spin_lock_init(&backend->frontend_lock);
   767	
   768		if (of_find_property(dev->of_node, "dma-parent", NULL)) {
   769			/*
   770			 * This assume we have the same DMA constraints for all our the
   771			 * devices in our pipeline (all the backends, but also the
   772			 * frontends). This sounds bad, but it has always been the case
   773			 * for us, and DRM doesn't do per-device allocation either, so
   774			 * we would need to fix DRM first...
   775			 */
 > 776			ret = of_dma_configure(drm->dev, dev->of_node);
   777			if (ret)
   778				return ret;
   779		} else {
   780			/*
   781			 * If we don't have the dma-parent property, most likely
   782			 * because of an old DT, we need to set the DMA offset by hand
   783			 * on our device since the RAM mapping is at 0 for the DMA bus,
   784			 * unlike the CPU.
   785			 */
   786			drm->dev->dma_pfn_offset = PHYS_PFN_OFFSET;
   787		}
   788	
   789		backend->engine.node = dev->of_node;
   790		backend->engine.ops = &sun4i_backend_engine_ops;
   791		backend->engine.id = sun4i_backend_of_get_id(dev->of_node);
   792		if (backend->engine.id < 0)
   793			return backend->engine.id;
   794	
   795		backend->frontend = sun4i_backend_find_frontend(drv, dev->of_node);
   796		if (IS_ERR(backend->frontend))
   797			dev_warn(dev, "Couldn't find matching frontend, frontend features disabled\n");
   798	
   799		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   800		regs = devm_ioremap_resource(dev, res);
   801		if (IS_ERR(regs))
   802			return PTR_ERR(regs);
   803	
   804		backend->reset = devm_reset_control_get(dev, NULL);
   805		if (IS_ERR(backend->reset)) {
   806			dev_err(dev, "Couldn't get our reset line\n");
   807			return PTR_ERR(backend->reset);
   808		}
   809	
   810		ret = reset_control_deassert(backend->reset);
   811		if (ret) {
   812			dev_err(dev, "Couldn't deassert our reset line\n");
   813			return ret;
   814		}
   815	
   816		backend->bus_clk = devm_clk_get(dev, "ahb");
   817		if (IS_ERR(backend->bus_clk)) {
   818			dev_err(dev, "Couldn't get the backend bus clock\n");
   819			ret = PTR_ERR(backend->bus_clk);
   820			goto err_assert_reset;
   821		}
   822		clk_prepare_enable(backend->bus_clk);
   823	
   824		backend->mod_clk = devm_clk_get(dev, "mod");
   825		if (IS_ERR(backend->mod_clk)) {
   826			dev_err(dev, "Couldn't get the backend module clock\n");
   827			ret = PTR_ERR(backend->mod_clk);
   828			goto err_disable_bus_clk;
   829		}
   830		clk_prepare_enable(backend->mod_clk);
   831	
   832		backend->ram_clk = devm_clk_get(dev, "ram");
   833		if (IS_ERR(backend->ram_clk)) {
   834			dev_err(dev, "Couldn't get the backend RAM clock\n");
   835			ret = PTR_ERR(backend->ram_clk);
   836			goto err_disable_mod_clk;
   837		}
   838		clk_prepare_enable(backend->ram_clk);
   839	
   840		if (of_device_is_compatible(dev->of_node,
   841					    "allwinner,sun8i-a33-display-backend")) {
   842			ret = sun4i_backend_init_sat(dev);
   843			if (ret) {
   844				dev_err(dev, "Couldn't init SAT resources\n");
   845				goto err_disable_ram_clk;
   846			}
   847		}
   848	
   849		backend->engine.regs = devm_regmap_init_mmio(dev, regs,
   850							     &sun4i_backend_regmap_config);
   851		if (IS_ERR(backend->engine.regs)) {
   852			dev_err(dev, "Couldn't create the backend regmap\n");
   853			return PTR_ERR(backend->engine.regs);
   854		}
   855	
   856		list_add_tail(&backend->engine.list, &drv->engine_list);
   857	
   858		/*
   859		 * Many of the backend's layer configuration registers have
   860		 * undefined default values. This poses a risk as we use
   861		 * regmap_update_bits in some places, and don't overwrite
   862		 * the whole register.
   863		 *
   864		 * Clear the registers here to have something predictable.
   865		 */
   866		for (i = 0x800; i < 0x1000; i += 4)
   867			regmap_write(backend->engine.regs, i, 0);
   868	
   869		/* Disable registers autoloading */
   870		regmap_write(backend->engine.regs, SUN4I_BACKEND_REGBUFFCTL_REG,
   871			     SUN4I_BACKEND_REGBUFFCTL_AUTOLOAD_DIS);
   872	
   873		/* Enable the backend */
   874		regmap_write(backend->engine.regs, SUN4I_BACKEND_MODCTL_REG,
   875			     SUN4I_BACKEND_MODCTL_DEBE_EN |
   876			     SUN4I_BACKEND_MODCTL_START_CTL);
   877	
   878		/* Set output selection if needed */
   879		quirks = of_device_get_match_data(dev);
   880		if (quirks->needs_output_muxing) {
   881			/*
   882			 * We assume there is no dynamic muxing of backends
   883			 * and TCONs, so we select the backend with same ID.
   884			 *
   885			 * While dynamic selection might be interesting, since
   886			 * the CRTC is tied to the TCON, while the layers are
   887			 * tied to the backends, this means, we will need to
   888			 * switch between groups of layers. There might not be
   889			 * a way to represent this constraint in DRM.
   890			 */
   891			regmap_update_bits(backend->engine.regs,
   892					   SUN4I_BACKEND_MODCTL_REG,
   893					   SUN4I_BACKEND_MODCTL_OUT_SEL,
   894					   (backend->engine.id
   895					    ? SUN4I_BACKEND_MODCTL_OUT_LCD1
   896					    : SUN4I_BACKEND_MODCTL_OUT_LCD0));
   897		}
   898	
   899		return 0;
   900	
   901	err_disable_ram_clk:
   902		clk_disable_unprepare(backend->ram_clk);
   903	err_disable_mod_clk:
   904		clk_disable_unprepare(backend->mod_clk);
   905	err_disable_bus_clk:
   906		clk_disable_unprepare(backend->bus_clk);
   907	err_assert_reset:
   908		reset_control_assert(backend->reset);
   909		return ret;
   910	}
   911	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--EVF5PPMfhYS0aIcm
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
thO1/Gzde7TrBxv/DwJtFSuCgwEA

--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--EVF5PPMfhYS0aIcm--
