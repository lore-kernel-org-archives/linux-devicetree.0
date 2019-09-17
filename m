From: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH 3/5] regulator: da9062: add voltage selection gpio support
Date: Tue, 17 Sep 2019 16:34:57 +0200
Message-ID: <20190917143457.cmnko5wmdozjtoe5@pengutronix.de>
References: <20190917124246.11732-4-m.felsch@pengutronix.de>
 <201909172223.Jhc0dAmS%lkp@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201909172223.Jhc0dAmS%lkp@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: support.opensource@diasemi.com, lee.jones@linaro.org, robh+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, stwiss.opensource@diasemi.com, kernel@pengutronix.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

please ignore this error because the kbuild don't apply the dependency I
noted in the cover-letter.

Regards,
  Marco

On 19-09-17 22:22, kbuild test robot wrote:
> Hi Marco,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on linus/master]
> [cannot apply to v5.3 next-20190916]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Marco-Felsch/DA9062-PMIC-fixes-and-features/20190917-205911
> config: x86_64-randconfig-e004-201937 (attached as .config)
> compiler: gcc-7 (Debian 7.4.0-11) 7.4.0
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=x86_64 
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/regulator/da9062-regulator.c:19:10: fatal error: linux/mfd/da9062/gpio.h: No such file or directory
>     #include <linux/mfd/da9062/gpio.h>
>              ^~~~~~~~~~~~~~~~~~~~~~~~~
>    compilation terminated.
> 
> vim +19 drivers/regulator/da9062-regulator.c
> 
>      5	
>      6	#include <linux/kernel.h>
>      7	#include <linux/module.h>
>      8	#include <linux/init.h>
>      9	#include <linux/err.h>
>     10	#include <linux/gpio/consumer.h>
>     11	#include <linux/slab.h>
>     12	#include <linux/of.h>
>     13	#include <linux/platform_device.h>
>     14	#include <linux/regmap.h>
>     15	#include <linux/regulator/driver.h>
>     16	#include <linux/regulator/machine.h>
>     17	#include <linux/regulator/of_regulator.h>
>     18	#include <linux/mfd/da9062/core.h>
>   > 19	#include <linux/mfd/da9062/gpio.h>
>     20	#include <linux/mfd/da9062/registers.h>
>     21	
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation



-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
