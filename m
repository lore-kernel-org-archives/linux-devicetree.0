From: xuejiancheng <xuejiancheng@huawei.com>
Subject: Re: [PATCH v9 2/6] clk: hisilicon: add CRG driver for hi3519 soc
Date: Tue, 23 Feb 2016 09:25:01 +0800
Message-ID: <56CBB4ED.304@huawei.com>
References: <201602221742.MKAlpbcd%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201602221742.MKAlpbcd%fengguang.wu@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, p.zabel@pengutronix.de, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, khilman@linaro.org, arnd@arndb.de, olof@lixom.net, xuwei5@hisilicon.com, haojian.zhuang@linaro.org, zhangfei.gao@linaro.org, bintian.wang@huawei.com, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, yanhaifeng@hisilicon.com, yanghongwei@hisilicon.com, suwenping@hisilicon.com, raojun@hisilicon.com, ml.yang@hisilicon.com, gaofei@hisilicon.com, zhangzhenxing@hisilicon.com, xuejiancheng@hisilicon.com, lidongpo@hisilicon.com
List-Id: devicetree@vger.kernel.org

Hi all,

I'll fix this warning in next version.

Other comments will be appreciated!

Thank you!

On 2016/2/22 18:01, kbuild test robot wrote:
> Hi Jiancheng,
> 
> [auto build test WARNING on clk/clk-next]
> [also build test WARNING on v4.5-rc5 next-20160222]
> [if your patch is applied to the wrong git tree, please drop us a note to help improving the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Jiancheng-Xue/ARM-hisi-Add-initial-support-including-clock-driver-for-Hi3519-soc/20160222-160736
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
> config: xtensa-allyesconfig (attached as .config)
> reproduce:
>         wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=xtensa 
> 
> All warnings (new ones prefixed by >>):
> 
> warning: (COMMON_CLK_HI3519) selects RESET_HISI which has unmet direct dependencies (COMMON_CLK && ARCH_HISI)
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
> 
