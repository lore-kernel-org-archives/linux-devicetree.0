From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 1/5] mfd: lochnagar: Add support for the Cirrus Logic
 Lochnagar
Date: Fri, 7 Sep 2018 09:44:13 +0100
Message-ID: <20180907084413.GG1653@imbe.wolfsonmicro.main>
References: <20180905104120.17252-1-ckeepax@opensource.cirrus.com>
 <201809070844.CGeY6FIt%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201809070844.CGeY6FIt%fengguang.wu@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, broonie@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
List-Id: devicetree@vger.kernel.org

On Fri, Sep 07, 2018 at 08:06:52AM +0800, kbuild test robot wrote:
> Hi Charles,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on ljones-mfd/for-mfd-next]
> [also build test ERROR on v4.19-rc2 next-20180906]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Charles-Keepax/mfd-lochnagar-Add-support-for-the-Cirrus-Logic-Lochnagar/20180907-010308
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
> config: alpha-allmodconfig (attached as .config)
> compiler: alpha-linux-gnu-gcc (Debian 7.2.0-11) 7.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.2.0 make.cross ARCH=alpha 
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/mfd/lochnagar-i2c.o: In function `lochnagar_i2c_probe':
> >> (.text+0x4ec): undefined reference to `__devm_regmap_init_i2c'
>    (.text+0x500): undefined reference to `__devm_regmap_init_i2c'

Sorry seems I am missing a select REGMAP_I2C in the Kconfig will
fix up for v2 after any other comments.

>    drivers/mfd/lochnagar-i2c.o: In function `lochnagar_i2c_init':
> >> (.init.text+0x10): undefined reference to `i2c_register_driver'
>    (.init.text+0x24): undefined reference to `i2c_register_driver'

Not sure what is causing this one there is a depends on I2C in
there will have a look and see if I can figure that out.

Thanks,
Charles
