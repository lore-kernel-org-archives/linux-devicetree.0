From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 3/4] mfd: arizona: Switch to using clock driver for 32k
 clock
Date: Wed, 6 Jan 2016 09:37:52 +0000
Message-ID: <20160106093752.GC1490@localhost.localdomain>
References: <1452008502-3749-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <201601060012.oyAzKzVL%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201601060012.oyAzKzVL%fengguang.wu@intel.com>
Sender: linux-clk-owner@vger.kernel.org
Cc: kbuild-all@01.org, mturquette@baylibre.com, cw00.choi@samsung.com, lee.jones@linaro.org, sboyd@codeaurora.org, myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Wed, Jan 06, 2016 at 12:19:56AM +0800, kbuild test robot wrote:
> Hi Charles,
> 
> [auto build test WARNING on clk/clk-next]
> [also build test WARNING on v4.4-rc8 next-20160105]
> [if your patch is applied to the wrong git tree, please drop us a note to help improving the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Charles-Keepax/extcon-arizona-Remove-enable-disable-of-32k-clock/20160105-234658
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
> config: x86_64-randconfig-x013-01041832 (attached as .config)
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=x86_64 
> 
> All warnings (new ones prefixed by >>):
> 
> warning: (MFD_ARIZONA) selects COMMON_CLK_ARIZONA which has unmet direct dependencies (COMMON_CLK && MFD_ARIZONA)

Apologies this is caused by the select I put in the MFD Kconfig,
since it doesn't really make much sense to build the MFD without
the clock driver.

But I think probably the simplest solution is just to drop that,
otherwise we start kicking off all sorts of exciting circular
dependencies that Kconfig doesn't like. Its not necessarily a
sensible config to use but at least it will all build fine.

I will send a version 2 with the other small comment fixed up
as well.

Thanks,
Charles
