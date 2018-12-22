Return-Path: <SRS0=U7ak=O7=intel.com=lkp@kernel.org>
Date: Sun, 23 Dec 2018 05:42:46 +0800
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH 2/3] mmc: sdhci-esdhc-imx: add SD clock limitation for
 imx6ull
Message-ID: <201812230517.NA9cg3Ar%fengguang.wu@intel.com>
References: <1545292612-14471-2-git-send-email-haibo.chen@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1545292612-14471-2-git-send-email-haibo.chen@nxp.com>
To: BOUGH CHEN <haibo.chen@nxp.com>
Cc: kbuild-all@01.org, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "adrian.hunter@intel.com" <adrian.hunter@intel.com>, dl-linux-imx <linux-imx@nxp.com>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-ID: <devicetree@vger.kernel.org>


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi BOUGH,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on ulf.hansson-mmc/next]
[also build test ERROR on v4.20-rc7 next-20181221]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/BOUGH-CHEN/dt-bindings-mmc-fsl-imx-esdhc-add-imx6ull-compatible-string/20181223-011123
base:   git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git next
config: arm-allmodconfig (attached as .config)
compiler: arm-linux-gnueabi-gcc (Debian 7.2.0-11) 7.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=7.2.0 make.cross ARCH=arm 

All error/warnings (new ones prefixed by >>):

   drivers/mmc//host/sdhci-esdhc-imx.c: In function 'esdhc_pltfm_set_clock':
>> drivers/mmc//host/sdhci-esdhc-imx.c:782:21: error: invalid storage class for function 'esdhc_pltfm_get_ro'
    static unsigned int esdhc_pltfm_get_ro(struct sdhci_host *host)
                        ^~~~~~~~~~~~~~~~~~
>> drivers/mmc//host/sdhci-esdhc-imx.c:782:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
    static unsigned int esdhc_pltfm_get_ro(struct sdhci_host *host)
    ^~~~~~
>> drivers/mmc//host/sdhci-esdhc-imx.c:801:13: error: invalid storage class for function 'esdhc_pltfm_set_bus_width'
    static void esdhc_pltfm_set_bus_width(struct sdhci_host *host, int width)
                ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mmc//host/sdhci-esdhc-imx.c:821:13: error: invalid storage class for function 'esdhc_prepare_tuning'
    static void esdhc_prepare_tuning(struct sdhci_host *host, u32 val)
                ^~~~~~~~~~~~~~~~~~~~
>> drivers/mmc//host/sdhci-esdhc-imx.c:838:13: error: invalid storage class for function 'esdhc_post_tuning'
    static void esdhc_post_tuning(struct sdhci_host *host)
                ^~~~~~~~~~~~~~~~~
>> drivers/mmc//host/sdhci-esdhc-imx.c:848:12: error: invalid storage class for function 'esdhc_executing_tuning'
    static int esdhc_executing_tuning(struct sdhci_host *host, u32 opcode)
               ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/mmc//host/sdhci-esdhc-imx.c:884:12: error: invalid storage class for function 'esdhc_change_pinstate'
    static int esdhc_change_pinstate(struct sdhci_host *host,
               ^~~~~~~~~~~~~~~~~~~~~
>> drivers/mmc//host/sdhci-esdhc-imx.c:928:13: error: invalid storage class for function 'esdhc_set_strobe_dll'
    static void esdhc_set_strobe_dll(struct sdhci_host *host)
                ^~~~~~~~~~~~~~~~~~~~
>> drivers/mmc//host/sdhci-esdhc-imx.c:960:13: error: invalid storage class for function 'esdhc_reset_tuning'
    static void esdhc_reset_tuning(struct sdhci_host *host)
                ^~~~~~~~~~~~~~~~~~
>> drivers/mmc//host/sdhci-esdhc-imx.c:982:13: error: invalid storage class for function 'esdhc_set_uhs_signaling'
    static void esdhc_set_uhs_signaling(struct sdhci_host *host, unsigned timing)
                ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mmc//host/sdhci-esdhc-imx.c:1034:13: error: invalid storage class for function 'esdhc_reset'
    static void esdhc_reset(struct sdhci_host *host, u8 mask)
                ^~~~~~~~~~~
>> drivers/mmc//host/sdhci-esdhc-imx.c:1042:21: error: invalid storage class for function 'esdhc_get_max_timeout_count'
    static unsigned int esdhc_get_max_timeout_count(struct sdhci_host *host)
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mmc//host/sdhci-esdhc-imx.c:1051:13: error: invalid storage class for function 'esdhc_set_timeout'
    static void esdhc_set_timeout(struct sdhci_host *host, struct mmc_command *cmd)
                ^~~~~~~~~~~~~~~~~
>> drivers/mmc//host/sdhci-esdhc-imx.c:1072:27: error: initializer element is not constant
     .get_max_timeout_count = esdhc_get_max_timeout_count,
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc//host/sdhci-esdhc-imx.c:1072:27: note: (near initialization for 'sdhci_esdhc_ops.get_max_timeout_count')
   drivers/mmc//host/sdhci-esdhc-imx.c:1073:12: error: initializer element is not constant
     .get_ro = esdhc_pltfm_get_ro,
               ^~~~~~~~~~~~~~~~~~
   drivers/mmc//host/sdhci-esdhc-imx.c:1073:12: note: (near initialization for 'sdhci_esdhc_ops.get_ro')
   drivers/mmc//host/sdhci-esdhc-imx.c:1074:17: error: initializer element is not constant
     .set_timeout = esdhc_set_timeout,
                    ^~~~~~~~~~~~~~~~~
   drivers/mmc//host/sdhci-esdhc-imx.c:1074:17: note: (near initialization for 'sdhci_esdhc_ops.set_timeout')
   drivers/mmc//host/sdhci-esdhc-imx.c:1075:19: error: initializer element is not constant
     .set_bus_width = esdhc_pltfm_set_bus_width,
                      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc//host/sdhci-esdhc-imx.c:1075:19: note: (near initialization for 'sdhci_esdhc_ops.set_bus_width')
   drivers/mmc//host/sdhci-esdhc-imx.c:1076:23: error: initializer element is not constant
     .set_uhs_signaling = esdhc_set_uhs_signaling,
                          ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc//host/sdhci-esdhc-imx.c:1076:23: note: (near initialization for 'sdhci_esdhc_ops.set_uhs_signaling')
   drivers/mmc//host/sdhci-esdhc-imx.c:1077:11: error: initializer element is not constant
     .reset = esdhc_reset,
              ^~~~~~~~~~~
   drivers/mmc//host/sdhci-esdhc-imx.c:1077:11: note: (near initialization for 'sdhci_esdhc_ops.reset')
>> drivers/mmc//host/sdhci-esdhc-imx.c:1088:13: error: invalid storage class for function 'sdhci_esdhc_imx_hwinit'
    static void sdhci_esdhc_imx_hwinit(struct sdhci_host *host)
                ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/mmc//host/sdhci-esdhc-imx.c:1146:1: error: invalid storage class for function 'sdhci_esdhc_imx_probe_dt'
    sdhci_esdhc_imx_probe_dt(struct platform_device *pdev,
    ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mmc//host/sdhci-esdhc-imx.c:1204:12: error: invalid storage class for function 'sdhci_esdhc_imx_probe_nondt'
    static int sdhci_esdhc_imx_probe_nondt(struct platform_device *pdev,
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mmc//host/sdhci-esdhc-imx.c:1269:12: error: invalid storage class for function 'sdhci_esdhc_imx_probe'
    static int sdhci_esdhc_imx_probe(struct platform_device *pdev)
               ^~~~~~~~~~~~~~~~~~~~~
>> drivers/mmc//host/sdhci-esdhc-imx.c:1385:12: error: invalid storage class for function 'sdhci_esdhc_imx_remove'
    static int sdhci_esdhc_imx_remove(struct platform_device *pdev)
               ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/mmc//host/sdhci-esdhc-imx.c:1408:12: error: invalid storage class for function 'sdhci_esdhc_suspend'
    static int sdhci_esdhc_suspend(struct device *dev)
               ^~~~~~~~~~~~~~~~~~~

vim +/esdhc_pltfm_get_ro +782 drivers/mmc//host/sdhci-esdhc-imx.c

8ba9580a8 Lucas Stach       2013-06-05  781  
913413c30 Shawn Guo         2011-06-21 @782  static unsigned int esdhc_pltfm_get_ro(struct sdhci_host *host)
913413c30 Shawn Guo         2011-06-21  783  {
842afc02c Shawn Guo         2011-07-06  784  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
070e6d3ff Jisheng Zhang     2016-02-16  785  	struct pltfm_imx_data *imx_data = sdhci_pltfm_priv(pltfm_host);
842afc02c Shawn Guo         2011-07-06  786  	struct esdhc_platform_data *boarddata = &imx_data->boarddata;
913413c30 Shawn Guo         2011-06-21  787  
913413c30 Shawn Guo         2011-06-21  788  	switch (boarddata->wp_type) {
913413c30 Shawn Guo         2011-06-21  789  	case ESDHC_WP_GPIO:
fbe5fdd12 Shawn Guo         2012-12-11  790  		return mmc_gpio_get_ro(host->mmc);
913413c30 Shawn Guo         2011-06-21  791  	case ESDHC_WP_CONTROLLER:
913413c30 Shawn Guo         2011-06-21  792  		return !(readl(host->ioaddr + SDHCI_PRESENT_STATE) &
913413c30 Shawn Guo         2011-06-21  793  			       SDHCI_WRITE_PROTECT);
913413c30 Shawn Guo         2011-06-21  794  	case ESDHC_WP_NONE:
913413c30 Shawn Guo         2011-06-21  795  		break;
913413c30 Shawn Guo         2011-06-21  796  	}
913413c30 Shawn Guo         2011-06-21  797  
913413c30 Shawn Guo         2011-06-21  798  	return -ENOSYS;
913413c30 Shawn Guo         2011-06-21  799  }
913413c30 Shawn Guo         2011-06-21  800  
2317f56c0 Russell King      2014-04-25 @801  static void esdhc_pltfm_set_bus_width(struct sdhci_host *host, int width)
af51079e6 Sascha Hauer      2013-01-21  802  {
af51079e6 Sascha Hauer      2013-01-21  803  	u32 ctrl;
af51079e6 Sascha Hauer      2013-01-21  804  
af51079e6 Sascha Hauer      2013-01-21  805  	switch (width) {
af51079e6 Sascha Hauer      2013-01-21  806  	case MMC_BUS_WIDTH_8:
af51079e6 Sascha Hauer      2013-01-21  807  		ctrl = ESDHC_CTRL_8BITBUS;
af51079e6 Sascha Hauer      2013-01-21  808  		break;
af51079e6 Sascha Hauer      2013-01-21  809  	case MMC_BUS_WIDTH_4:
af51079e6 Sascha Hauer      2013-01-21  810  		ctrl = ESDHC_CTRL_4BITBUS;
af51079e6 Sascha Hauer      2013-01-21  811  		break;
af51079e6 Sascha Hauer      2013-01-21  812  	default:
af51079e6 Sascha Hauer      2013-01-21  813  		ctrl = 0;
af51079e6 Sascha Hauer      2013-01-21  814  		break;
af51079e6 Sascha Hauer      2013-01-21  815  	}
af51079e6 Sascha Hauer      2013-01-21  816  
af51079e6 Sascha Hauer      2013-01-21  817  	esdhc_clrset_le(host, ESDHC_CTRL_BUSWIDTH_MASK, ctrl,
af51079e6 Sascha Hauer      2013-01-21  818  			SDHCI_HOST_CONTROL);
af51079e6 Sascha Hauer      2013-01-21  819  }
af51079e6 Sascha Hauer      2013-01-21  820  
0322191e6 Dong Aisheng      2013-09-13 @821  static void esdhc_prepare_tuning(struct sdhci_host *host, u32 val)
0322191e6 Dong Aisheng      2013-09-13  822  {
0322191e6 Dong Aisheng      2013-09-13  823  	u32 reg;
0322191e6 Dong Aisheng      2013-09-13  824  
0322191e6 Dong Aisheng      2013-09-13  825  	/* FIXME: delay a bit for card to be ready for next tuning due to errors */
0322191e6 Dong Aisheng      2013-09-13  826  	mdelay(1);
0322191e6 Dong Aisheng      2013-09-13  827  
0322191e6 Dong Aisheng      2013-09-13  828  	reg = readl(host->ioaddr + ESDHC_MIX_CTRL);
0322191e6 Dong Aisheng      2013-09-13  829  	reg |= ESDHC_MIX_CTRL_EXE_TUNE | ESDHC_MIX_CTRL_SMPCLK_SEL |
0322191e6 Dong Aisheng      2013-09-13  830  			ESDHC_MIX_CTRL_FBCLK_SEL;
0322191e6 Dong Aisheng      2013-09-13  831  	writel(reg, host->ioaddr + ESDHC_MIX_CTRL);
0322191e6 Dong Aisheng      2013-09-13  832  	writel(val << 8, host->ioaddr + ESDHC_TUNE_CTRL_STATUS);
0322191e6 Dong Aisheng      2013-09-13  833  	dev_dbg(mmc_dev(host->mmc),
d04f8d5b9 Beno�t Th�baudeau 2017-05-30  834  		"tuning with delay 0x%x ESDHC_TUNE_CTRL_STATUS 0x%x\n",
0322191e6 Dong Aisheng      2013-09-13  835  			val, readl(host->ioaddr + ESDHC_TUNE_CTRL_STATUS));
0322191e6 Dong Aisheng      2013-09-13  836  }
0322191e6 Dong Aisheng      2013-09-13  837  
0322191e6 Dong Aisheng      2013-09-13 @838  static void esdhc_post_tuning(struct sdhci_host *host)
0322191e6 Dong Aisheng      2013-09-13  839  {
0322191e6 Dong Aisheng      2013-09-13  840  	u32 reg;
0322191e6 Dong Aisheng      2013-09-13  841  
0322191e6 Dong Aisheng      2013-09-13  842  	reg = readl(host->ioaddr + ESDHC_MIX_CTRL);
0322191e6 Dong Aisheng      2013-09-13  843  	reg &= ~ESDHC_MIX_CTRL_EXE_TUNE;
da0295ff1 Dong Aisheng      2016-07-12  844  	reg |= ESDHC_MIX_CTRL_AUTO_TUNE_EN;
0322191e6 Dong Aisheng      2013-09-13  845  	writel(reg, host->ioaddr + ESDHC_MIX_CTRL);
0322191e6 Dong Aisheng      2013-09-13  846  }
0322191e6 Dong Aisheng      2013-09-13  847  
0322191e6 Dong Aisheng      2013-09-13 @848  static int esdhc_executing_tuning(struct sdhci_host *host, u32 opcode)
0322191e6 Dong Aisheng      2013-09-13  849  {
0322191e6 Dong Aisheng      2013-09-13  850  	int min, max, avg, ret;
0322191e6 Dong Aisheng      2013-09-13  851  
0322191e6 Dong Aisheng      2013-09-13  852  	/* find the mininum delay first which can pass tuning */
0322191e6 Dong Aisheng      2013-09-13  853  	min = ESDHC_TUNE_CTRL_MIN;
0322191e6 Dong Aisheng      2013-09-13  854  	while (min < ESDHC_TUNE_CTRL_MAX) {
0322191e6 Dong Aisheng      2013-09-13  855  		esdhc_prepare_tuning(host, min);
9979dbe51 Chaotian Jing     2015-10-27  856  		if (!mmc_send_tuning(host->mmc, opcode, NULL))
0322191e6 Dong Aisheng      2013-09-13  857  			break;
0322191e6 Dong Aisheng      2013-09-13  858  		min += ESDHC_TUNE_CTRL_STEP;
0322191e6 Dong Aisheng      2013-09-13  859  	}
0322191e6 Dong Aisheng      2013-09-13  860  
0322191e6 Dong Aisheng      2013-09-13  861  	/* find the maxinum delay which can not pass tuning */
0322191e6 Dong Aisheng      2013-09-13  862  	max = min + ESDHC_TUNE_CTRL_STEP;
0322191e6 Dong Aisheng      2013-09-13  863  	while (max < ESDHC_TUNE_CTRL_MAX) {
0322191e6 Dong Aisheng      2013-09-13  864  		esdhc_prepare_tuning(host, max);
9979dbe51 Chaotian Jing     2015-10-27  865  		if (mmc_send_tuning(host->mmc, opcode, NULL)) {
0322191e6 Dong Aisheng      2013-09-13  866  			max -= ESDHC_TUNE_CTRL_STEP;
0322191e6 Dong Aisheng      2013-09-13  867  			break;
0322191e6 Dong Aisheng      2013-09-13  868  		}
0322191e6 Dong Aisheng      2013-09-13  869  		max += ESDHC_TUNE_CTRL_STEP;
0322191e6 Dong Aisheng      2013-09-13  870  	}
0322191e6 Dong Aisheng      2013-09-13  871  
0322191e6 Dong Aisheng      2013-09-13  872  	/* use average delay to get the best timing */
0322191e6 Dong Aisheng      2013-09-13  873  	avg = (min + max) / 2;
0322191e6 Dong Aisheng      2013-09-13  874  	esdhc_prepare_tuning(host, avg);
9979dbe51 Chaotian Jing     2015-10-27  875  	ret = mmc_send_tuning(host->mmc, opcode, NULL);
0322191e6 Dong Aisheng      2013-09-13  876  	esdhc_post_tuning(host);
0322191e6 Dong Aisheng      2013-09-13  877  
d04f8d5b9 Beno�t Th�baudeau 2017-05-30  878  	dev_dbg(mmc_dev(host->mmc), "tuning %s at 0x%x ret %d\n",
0322191e6 Dong Aisheng      2013-09-13  879  		ret ? "failed" : "passed", avg, ret);
0322191e6 Dong Aisheng      2013-09-13  880  
0322191e6 Dong Aisheng      2013-09-13  881  	return ret;
0322191e6 Dong Aisheng      2013-09-13  882  }
0322191e6 Dong Aisheng      2013-09-13  883  
ad93220de Dong Aisheng      2013-09-13 @884  static int esdhc_change_pinstate(struct sdhci_host *host,
ad93220de Dong Aisheng      2013-09-13  885  						unsigned int uhs)
ad93220de Dong Aisheng      2013-09-13  886  {
ad93220de Dong Aisheng      2013-09-13  887  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
070e6d3ff Jisheng Zhang     2016-02-16  888  	struct pltfm_imx_data *imx_data = sdhci_pltfm_priv(pltfm_host);
ad93220de Dong Aisheng      2013-09-13  889  	struct pinctrl_state *pinctrl;
ad93220de Dong Aisheng      2013-09-13  890  
ad93220de Dong Aisheng      2013-09-13  891  	dev_dbg(mmc_dev(host->mmc), "change pinctrl state for uhs %d\n", uhs);
ad93220de Dong Aisheng      2013-09-13  892  
ad93220de Dong Aisheng      2013-09-13  893  	if (IS_ERR(imx_data->pinctrl) ||
ad93220de Dong Aisheng      2013-09-13  894  		IS_ERR(imx_data->pins_default) ||
ad93220de Dong Aisheng      2013-09-13  895  		IS_ERR(imx_data->pins_100mhz) ||
ad93220de Dong Aisheng      2013-09-13  896  		IS_ERR(imx_data->pins_200mhz))
ad93220de Dong Aisheng      2013-09-13  897  		return -EINVAL;
ad93220de Dong Aisheng      2013-09-13  898  
ad93220de Dong Aisheng      2013-09-13  899  	switch (uhs) {
ad93220de Dong Aisheng      2013-09-13  900  	case MMC_TIMING_UHS_SDR50:
9f3278453 Haibo Chen        2017-04-19  901  	case MMC_TIMING_UHS_DDR50:
ad93220de Dong Aisheng      2013-09-13  902  		pinctrl = imx_data->pins_100mhz;
ad93220de Dong Aisheng      2013-09-13  903  		break;
ad93220de Dong Aisheng      2013-09-13  904  	case MMC_TIMING_UHS_SDR104:
429a5b45f Dong Aisheng      2013-10-30  905  	case MMC_TIMING_MMC_HS200:
28b07674f Haibo Chen        2015-08-11  906  	case MMC_TIMING_MMC_HS400:
ad93220de Dong Aisheng      2013-09-13  907  		pinctrl = imx_data->pins_200mhz;
ad93220de Dong Aisheng      2013-09-13  908  		break;
ad93220de Dong Aisheng      2013-09-13  909  	default:
ad93220de Dong Aisheng      2013-09-13  910  		/* back to default state for other legacy timing */
ad93220de Dong Aisheng      2013-09-13  911  		pinctrl = imx_data->pins_default;
ad93220de Dong Aisheng      2013-09-13  912  	}
ad93220de Dong Aisheng      2013-09-13  913  
ad93220de Dong Aisheng      2013-09-13  914  	return pinctrl_select_state(imx_data->pinctrl, pinctrl);
ad93220de Dong Aisheng      2013-09-13  915  }
ad93220de Dong Aisheng      2013-09-13  916  
28b07674f Haibo Chen        2015-08-11  917  /*
d04f8d5b9 Beno�t Th�baudeau 2017-05-30  918   * For HS400 eMMC, there is a data_strobe line. This signal is generated
28b07674f Haibo Chen        2015-08-11  919   * by the device and used for data output and CRC status response output
28b07674f Haibo Chen        2015-08-11  920   * in HS400 mode. The frequency of this signal follows the frequency of
d04f8d5b9 Beno�t Th�baudeau 2017-05-30  921   * CLK generated by host. The host receives the data which is aligned to the
28b07674f Haibo Chen        2015-08-11  922   * edge of data_strobe line. Due to the time delay between CLK line and
28b07674f Haibo Chen        2015-08-11  923   * data_strobe line, if the delay time is larger than one clock cycle,
d04f8d5b9 Beno�t Th�baudeau 2017-05-30  924   * then CLK and data_strobe line will be misaligned, read error shows up.
28b07674f Haibo Chen        2015-08-11  925   * So when the CLK is higher than 100MHz, each clock cycle is short enough,
d04f8d5b9 Beno�t Th�baudeau 2017-05-30  926   * host should configure the delay target.
28b07674f Haibo Chen        2015-08-11  927   */
28b07674f Haibo Chen        2015-08-11 @928  static void esdhc_set_strobe_dll(struct sdhci_host *host)
28b07674f Haibo Chen        2015-08-11  929  {
28b07674f Haibo Chen        2015-08-11  930  	u32 v;
28b07674f Haibo Chen        2015-08-11  931  
28b07674f Haibo Chen        2015-08-11  932  	if (host->mmc->actual_clock > ESDHC_STROBE_DLL_CLK_FREQ) {
7ac6da262 Dong Aisheng      2016-07-12  933  		/* disable clock before enabling strobe dll */
7ac6da262 Dong Aisheng      2016-07-12  934  		writel(readl(host->ioaddr + ESDHC_VENDOR_SPEC) &
7ac6da262 Dong Aisheng      2016-07-12  935  		       ~ESDHC_VENDOR_SPEC_FRC_SDCLK_ON,
7ac6da262 Dong Aisheng      2016-07-12  936  		       host->ioaddr + ESDHC_VENDOR_SPEC);
7ac6da262 Dong Aisheng      2016-07-12  937  
28b07674f Haibo Chen        2015-08-11  938  		/* force a reset on strobe dll */
28b07674f Haibo Chen        2015-08-11  939  		writel(ESDHC_STROBE_DLL_CTRL_RESET,
28b07674f Haibo Chen        2015-08-11  940  			host->ioaddr + ESDHC_STROBE_DLL_CTRL);
28b07674f Haibo Chen        2015-08-11  941  		/*
28b07674f Haibo Chen        2015-08-11  942  		 * enable strobe dll ctrl and adjust the delay target
28b07674f Haibo Chen        2015-08-11  943  		 * for the uSDHC loopback read clock
28b07674f Haibo Chen        2015-08-11  944  		 */
28b07674f Haibo Chen        2015-08-11  945  		v = ESDHC_STROBE_DLL_CTRL_ENABLE |
28b07674f Haibo Chen        2015-08-11  946  			(7 << ESDHC_STROBE_DLL_CTRL_SLV_DLY_TARGET_SHIFT);
28b07674f Haibo Chen        2015-08-11  947  		writel(v, host->ioaddr + ESDHC_STROBE_DLL_CTRL);
28b07674f Haibo Chen        2015-08-11  948  		/* wait 1us to make sure strobe dll status register stable */
28b07674f Haibo Chen        2015-08-11  949  		udelay(1);
28b07674f Haibo Chen        2015-08-11  950  		v = readl(host->ioaddr + ESDHC_STROBE_DLL_STATUS);
28b07674f Haibo Chen        2015-08-11  951  		if (!(v & ESDHC_STROBE_DLL_STS_REF_LOCK))
28b07674f Haibo Chen        2015-08-11  952  			dev_warn(mmc_dev(host->mmc),
28b07674f Haibo Chen        2015-08-11  953  				"warning! HS400 strobe DLL status REF not lock!\n");
28b07674f Haibo Chen        2015-08-11  954  		if (!(v & ESDHC_STROBE_DLL_STS_SLV_LOCK))
28b07674f Haibo Chen        2015-08-11  955  			dev_warn(mmc_dev(host->mmc),
28b07674f Haibo Chen        2015-08-11  956  				"warning! HS400 strobe DLL status SLV not lock!\n");
28b07674f Haibo Chen        2015-08-11  957  	}
28b07674f Haibo Chen        2015-08-11  958  }
28b07674f Haibo Chen        2015-08-11  959  
d9370424c Haibo Chen        2017-04-18 @960  static void esdhc_reset_tuning(struct sdhci_host *host)
d9370424c Haibo Chen        2017-04-18  961  {
d9370424c Haibo Chen        2017-04-18  962  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
d9370424c Haibo Chen        2017-04-18  963  	struct pltfm_imx_data *imx_data = sdhci_pltfm_priv(pltfm_host);
d9370424c Haibo Chen        2017-04-18  964  	u32 ctrl;
d9370424c Haibo Chen        2017-04-18  965  
d04f8d5b9 Beno�t Th�baudeau 2017-05-30  966  	/* Reset the tuning circuit */
d9370424c Haibo Chen        2017-04-18  967  	if (esdhc_is_usdhc(imx_data)) {
d9370424c Haibo Chen        2017-04-18  968  		if (imx_data->socdata->flags & ESDHC_FLAG_MAN_TUNING) {
d9370424c Haibo Chen        2017-04-18  969  			ctrl = readl(host->ioaddr + ESDHC_MIX_CTRL);
d9370424c Haibo Chen        2017-04-18  970  			ctrl &= ~ESDHC_MIX_CTRL_SMPCLK_SEL;
d9370424c Haibo Chen        2017-04-18  971  			ctrl &= ~ESDHC_MIX_CTRL_FBCLK_SEL;
d9370424c Haibo Chen        2017-04-18  972  			writel(ctrl, host->ioaddr + ESDHC_MIX_CTRL);
d9370424c Haibo Chen        2017-04-18  973  			writel(0, host->ioaddr + ESDHC_TUNE_CTRL_STATUS);
d9370424c Haibo Chen        2017-04-18  974  		} else if (imx_data->socdata->flags & ESDHC_FLAG_STD_TUNING) {
869f8a69b Adrian Hunter     2018-11-15  975  			ctrl = readl(host->ioaddr + SDHCI_AUTO_CMD_STATUS);
d9370424c Haibo Chen        2017-04-18  976  			ctrl &= ~ESDHC_MIX_CTRL_SMPCLK_SEL;
869f8a69b Adrian Hunter     2018-11-15  977  			writel(ctrl, host->ioaddr + SDHCI_AUTO_CMD_STATUS);
d9370424c Haibo Chen        2017-04-18  978  		}
d9370424c Haibo Chen        2017-04-18  979  	}
d9370424c Haibo Chen        2017-04-18  980  }
d9370424c Haibo Chen        2017-04-18  981  

:::::: The code at line 782 was first introduced by commit
:::::: 913413c307c919f8b21edccea23a9fd9d9d49a64 mmc: sdhci-esdhc-imx: extend card_detect and write_protect support for mx5

:::::: TO: Shawn Guo <shawn.guo@linaro.org>
:::::: CC: Shawn Guo <shawn.guo@linaro.org>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--7JfCtLOvnd9MIVvH
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
FrTh/wdl1tOFE0QEAA==

--7JfCtLOvnd9MIVvH--
