From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH 5/5] mfd: rn5t618: register restart handler
Date: Sat, 04 Jun 2016 19:52:38 -0700
Message-ID: <7f3c252eb0cb1713a71f8a6b5f52aa93@agner.ch>
References: <201606050940.RZVDWPsV%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201606050940.RZVDWPsV%fengguang.wu@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kbuild test robot <lkp@intel.com>
Cc: kbuild-all@01.org, lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, khilman@baylibre.com, carlo@caione.org, b.galvani@gmail.com, max.oss.09@gmail.com, marcel@ziswiler.com, linux@armlinux.org.uk, galak@codeaurora.org, ijc+devicetree@hellion.org.uk, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 2016-06-04 18:24, kbuild test robot wrote:
> Hi,
> 
> [auto build test ERROR on ljones-mfd/for-mfd-next]
> [also build test ERROR on v4.7-rc1 next-20160603]
> [if your patch is applied to the wrong git tree, please drop us a note
> to help improve the system]
> 
> url:   
> https://github.com/0day-ci/linux/commits/Stefan-Agner/regulator-add-Ricoh-RN5T567-PMIC-support/20160605-082219
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
> config: i386-allmodconfig (attached as .config)
> compiler: gcc-6 (Debian 6.1.1-1) 6.1.1 20160430
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=i386 
> 
> All errors (new ones prefixed by >>):
> 
>>> drivers/mfd/rn5t618.c:24:29: fatal error: asm/system_misc.h: No such file or directory
>     #include <asm/system_misc.h>
>                                 ^
>    compilation terminated.
> 
> vim +24 drivers/mfd/rn5t618.c
> 
>     18	#include <linux/mfd/rn5t618.h>
>     19	#include <linux/module.h>
>     20	#include <linux/of_device.h>
>     21	#include <linux/reboot.h>
>     22	#include <linux/regmap.h>
>     23
>   > 24	#include <asm/system_misc.h>

Hm, that is an artifact of the older kernel version for which I wrote
the kernel first where this was required. Will remove this in v2.
