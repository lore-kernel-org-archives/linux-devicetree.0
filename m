From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v12 2/5] clk: imx: add fractional PLL output clock
Date: Fri, 09 Nov 2018 09:25:26 -0800
Message-ID: <154178432653.88331.17907414252177481094@swboyd.mtv.corp.google.com>
References: <1541594266-16712-3-git-send-email-abel.vesa@nxp.com>
 <201811091832.kSh4BXdS%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201811091832.kSh4BXdS%fengguang.wu@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kbuild test robot <lkp@intel.com>
Cc: kbuild-all@01.org, Sascha Hauer <kernel@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>, "A.s. Dong" <aisheng.dong@nxp.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Abel Vesa <abelvesa@linux.com>, Abel Vesa <abel.vesa@nxp.com>
List-Id: devicetree@vger.kernel.org

Quoting kbuild test robot (2018-11-09 02:18:24)
> Hi Lucas,
> =

> I love your patch! Yet something to improve:
> =

> [auto build test ERROR on shawnguo/for-next]
> [also build test ERROR on v4.20-rc1 next-20181109]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help improve the system]
> =

> url:    https://github.com/0day-ci/linux/commits/Abel-Vesa/Add-i-MX8MQ-cl=
ock-driver/20181109-063930
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.gi=
t for-next
> config: arm-multi_v5_defconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (Debian 7.2.0-11) 7.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=3D7.2.0 make.cross ARCH=3Darm =

> =

> All errors (new ones prefixed by >>):
> =

>    drivers/clk/imx/clk-frac-pll.o: In function `clk_pll_recalc_rate':
> >> clk-frac-pll.c:(.text+0x74): undefined reference to `__aeabi_uldivmod'
>    drivers/clk/imx/clk-frac-pll.o: In function `clk_pll_round_rate':
>    clk-frac-pll.c:(.text+0xbc): undefined reference to `__aeabi_uldivmod'
> =


Why does the code do essentially:

	u64 val;

	do_div(val, div);
	val /=3D div2;

That should be using do_div() twice it seems.
