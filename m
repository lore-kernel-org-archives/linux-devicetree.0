From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: Re: [PATCH v3] ARM: dts: pxa: add mioa701 board description
Date: Fri, 31 Aug 2018 11:48:10 +0200
Message-ID: <1535708890.8035.42.camel@ziswiler.com>
References: <20180830195941.6118-1-robert.jarzmik@free.fr>
         <201808311515.Fq0HyEql%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201808311515.Fq0HyEql%fengguang.wu@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kbuild test robot <lkp@intel.com>, Robert Jarzmik <robert.jarzmik@free.fr>
Cc: kbuild-all@01.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 2018-08-31 at 15:45 +0800, kbuild test robot wrote:
> Hi Robert,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on robh/for-next]
> [also build test ERROR on v4.19-rc1 next-20180831]
> [if your patch is applied to the wrong git tree, please drop us a
> note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Robert-Jarzmik/ARM-d
> ts-pxa-add-mioa701-board-description/20180831-134244
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.gi
> t for-next
> config: arm-keystone_defconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (Debian 7.2.0-11) 7.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master
> /sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.2.0 make.cross ARCH=arm 
> 
> All errors (new ones prefixed by >>):
> 
> > > Error: arch/arm/boot/dts/mioa701.dts:47.10-11 syntax error
> 
>    FATAL ERROR: Unable to parse input tree

I guess it just missed the dependency on the following:

https://lore.kernel.org/lkml/20180830195912.6025-1-robert.jarzmik@free.
fr/

> ---
> 0-DAY kernel test infrastructure                Open Source
> Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel
> Corporation
