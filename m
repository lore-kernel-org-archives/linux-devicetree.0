From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 1/9] of: add helper to lookup compatible child node
Date: Thu, 23 Aug 2018 09:39:53 +0200
Message-ID: <20180823073953.GP14967@localhost>
References: <20180822105547.9634-2-johan@kernel.org>
 <201808231057.oOgtDWTB%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201808231057.oOgtDWTB%fengguang.wu@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kbuild test robot <lkp@intel.com>
Cc: Johan Hovold <johan@kernel.org>, kbuild-all@01.org, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 23, 2018 at 11:17:26AM +0800, kbuild test robot wrote:
> Hi Johan,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on robh/for-next]
> [also build test ERROR on v4.18 next-20180822]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Johan-Hovold/of-fix-compatible-child-node-lookups/20180823-074211
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> config: mips-decstation_defconfig (attached as .config)
> compiler: mipsel-linux-gnu-gcc (Debian 7.2.0-11) 7.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.2.0 make.cross ARCH=mips 
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/irqdomain.h:35:0,
>                     from arch/mips/include/asm/irq.h:14,
>                     from include/linux/irq.h:23,
>                     from include/asm-generic/hardirq.h:13,
>                     from arch/mips/include/asm/hardirq.h:16,
>                     from include/linux/hardirq.h:9,
>                     from include/linux/interrupt.h:11,
>                     from arch/mips/dec/ecc-berr.c:16:
> >> include/linux/of.h:637:28: error: 'of_get_compatible_child' defined but not used [-Werror=unused-function]
>     static struct device_node *of_get_compatible_child(const struct device_node *parent,
>                                ^~~~~~~~~~~~~~~~~~~~~~~
>    cc1: all warnings being treated as errors

Bah, I forgot the inline keyword. I'll fix this in a v2, and I can amend
the commit message and mention the start node while at it.

Johan
