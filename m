From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h6: Introduce Tanix TX6 board
Date: Sun, 18 Aug 2019 20:59:42 +0200
Message-ID: <7640522.c0V0aH5rf2@jernej-laptop>
References: <20190816205342.29552-3-jernej.skrabec@siol.net> <201908190222.ZdIp2gT1%lkp@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201908190222.ZdIp2gT1%lkp@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kbuild test robot <lkp@intel.com>
Cc: kbuild-all@01.org, robh+dt@kernel.org, mark.rutland@arm.com, mripard@kernel.org, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Dne nedelja, 18. avgust 2019 ob 20:42:49 CEST je kbuild test robot napisal(a):
> Hi Jernej,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on linus/master]
> [cannot apply to v5.3-rc4 next-20190816]
> [if your patch is applied to the wrong git tree, please drop us a note to
> help improve the system]
> 
> url:   
> https://github.com/0day-ci/linux/commits/Jernej-Skrabec/dt-bindings-arm-sun
> xi-Add-compatible-for-Tanix-TX6-board/20190819-002034 config:
> arm64-defconfig (attached as .config)
> compiler: aarch64-linux-gcc (GCC) 7.4.0
> reproduce:
>         wget
> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O
> ~/bin/make.cross chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.4.0 make.cross ARCH=arm64
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> >> Error: arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts:83.1-6 Label
> >> or path r_ir not found FATAL ERROR: Syntax error parsing input tree

Strange, Allwinner tree has commit, which introduces r_ir node:
https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git/commit/?
h=sunxi/dt-for-5.4&id=9267811aad3524c857cf2e16bbadd8c569e15ab9

Maybe kbuild test robot tree doesn't have it?

Best regards,
Jernej

> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology
> Center https://lists.01.org/pipermail/kbuild-all                   Intel
> Corporation
