From: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 07/16] iio: adc: sun4i-gpadc-iio: rework:
 support nvmem calibration data
Date: Thu, 1 Feb 2018 06:49:29 +0800
Message-ID: <201802010647.sYlui5vv%fengguang.wu@intel.com>
References: <20180128232919.12639-8-embed3d@gmail.com>
Reply-To: fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDJ4N37Q6EERBEEQZHJQKGQENP3BZLY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180128232919.12639-8-embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: kbuild-all-JC7UmRfGjtg@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org, clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sean-hENCXIMQXOg@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org, edu.molinas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, singhalsimran0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Philipp,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on v4.15 next-20180126]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Philipp-Rossak/IIO-based-thermal-sensor-driver-for-Allwinner-H3-and-A83T-SoC/20180201-043415
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
reproduce:
        # apt-get install sparse
        make ARCH=x86_64 allmodconfig
        make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)

>> drivers/iio/adc/sun4i-gpadc-iio.c:608:53: sparse: cast to restricted __be32
>> drivers/iio/adc/sun4i-gpadc-iio.c:608:53: sparse: cast to restricted __be32
>> drivers/iio/adc/sun4i-gpadc-iio.c:608:53: sparse: cast to restricted __be32
>> drivers/iio/adc/sun4i-gpadc-iio.c:608:53: sparse: cast to restricted __be32
>> drivers/iio/adc/sun4i-gpadc-iio.c:608:53: sparse: cast to restricted __be32
>> drivers/iio/adc/sun4i-gpadc-iio.c:608:53: sparse: cast to restricted __be32
   drivers/iio/adc/sun4i-gpadc-iio.c:613:53: sparse: cast to restricted __be32
   drivers/iio/adc/sun4i-gpadc-iio.c:613:53: sparse: cast to restricted __be32
   drivers/iio/adc/sun4i-gpadc-iio.c:613:53: sparse: cast to restricted __be32
   drivers/iio/adc/sun4i-gpadc-iio.c:613:53: sparse: cast to restricted __be32
   drivers/iio/adc/sun4i-gpadc-iio.c:613:53: sparse: cast to restricted __be32
   drivers/iio/adc/sun4i-gpadc-iio.c:613:53: sparse: cast to restricted __be32

vim +608 drivers/iio/adc/sun4i-gpadc-iio.c

   564	
   565	static int sun4i_gpadc_probe_dt(struct platform_device *pdev,
   566					struct iio_dev *indio_dev)
   567	{
   568		struct sun4i_gpadc_iio *info = iio_priv(indio_dev);
   569		struct resource *mem;
   570		void __iomem *base;
   571		int ret;
   572		struct nvmem_cell *cell;
   573		ssize_t cell_size;
   574		u64 *cell_data;
   575	
   576		info->data = of_device_get_match_data(&pdev->dev);
   577		if (!info->data)
   578			return -ENODEV;
   579	
   580		info->no_irq = true;
   581		indio_dev->num_channels = ARRAY_SIZE(sun8i_a33_gpadc_channels);
   582		indio_dev->channels = sun8i_a33_gpadc_channels;
   583	
   584		mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   585		base = devm_ioremap_resource(&pdev->dev, mem);
   586		if (IS_ERR(base))
   587			return PTR_ERR(base);
   588	
   589		info->has_calibration_data[0] = false;
   590		info->has_calibration_data[1] = false;
   591	
   592		if (!info->data->supports_nvmem)
   593			goto no_nvmem;
   594	
   595		cell = nvmem_cell_get(&pdev->dev, "calibration");
   596		if (IS_ERR(cell)) {
   597			if (PTR_ERR(cell) == -EPROBE_DEFER)
   598				return PTR_ERR(cell);
   599			goto no_nvmem;
   600		}
   601	
   602		cell_data = (u64 *)nvmem_cell_read(cell, &cell_size);
   603		nvmem_cell_put(cell);
   604		switch (cell_size) {
   605			case 8:
   606			case 6:
   607				info->has_calibration_data[1] = true;
 > 608				info->calibration_data[1] = be32_to_cpu(
   609						upper_32_bits(cell_data[0]));
   610			case 4:
   611			case 2:
   612				info->has_calibration_data[0] = true;
   613				info->calibration_data[0] = be32_to_cpu(
   614						lower_32_bits(cell_data[0]));
   615				break;
   616			default:
   617				break;
   618		}
   619	
   620	no_nvmem:
   621	
   622		info->regmap = devm_regmap_init_mmio(&pdev->dev, base,
   623						     &sun4i_gpadc_regmap_config);
   624		if (IS_ERR(info->regmap)) {
   625			ret = PTR_ERR(info->regmap);
   626			dev_err(&pdev->dev, "failed to init regmap: %d\n", ret);
   627			return ret;
   628		}
   629	
   630		if (info->data->has_bus_rst) {
   631			info->reset = devm_reset_control_get(&pdev->dev, NULL);
   632			if (IS_ERR(info->reset)) {
   633				ret = PTR_ERR(info->reset);
   634				return ret;
   635			}
   636	
   637			ret = reset_control_deassert(info->reset);
   638			if (ret)
   639				return ret;
   640		}
   641	
   642		if (info->data->has_bus_clk) {
   643			info->bus_clk = devm_clk_get(&pdev->dev, "bus");
   644			if (IS_ERR(info->bus_clk)) {
   645				ret = PTR_ERR(info->bus_clk);
   646				goto assert_reset;
   647			}
   648	
   649			ret = clk_prepare_enable(info->bus_clk);
   650			if (ret)
   651				goto assert_reset;
   652		}
   653	
   654		if (info->data->has_mod_clk) {
   655			info->mod_clk = devm_clk_get(&pdev->dev, "mod");
   656			if (IS_ERR(info->mod_clk)) {
   657				ret = PTR_ERR(info->mod_clk);
   658				goto disable_bus_clk;
   659			}
   660	
   661			/* Running at 6MHz */
   662			ret = clk_set_rate(info->mod_clk, 4000000);
   663			if (ret)
   664				goto disable_bus_clk;
   665	
   666			ret = clk_prepare_enable(info->mod_clk);
   667			if (ret)
   668				goto disable_bus_clk;
   669		}
   670	
   671		if (IS_ENABLED(CONFIG_THERMAL_OF))
   672			info->sensor_device = &pdev->dev;
   673	
   674		return 0;
   675	
   676	disable_bus_clk:
   677		clk_disable_unprepare(info->bus_clk);
   678	
   679	assert_reset:
   680		reset_control_assert(info->reset);
   681	
   682		return ret;
   683	}
   684	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
