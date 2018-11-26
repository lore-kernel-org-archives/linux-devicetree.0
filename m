From: Parthiban Nallathambi <pn@denx.de>
Subject: Re: [PATCH v3 4/4] arm64: dts: actions: s700-cubieboard7: Enable SIRQ
Date: Mon, 26 Nov 2018 18:37:25 +0100
Message-ID: <24b1d0a6-851d-af9a-f639-74954289abbb@denx.de>
References: <20181126100940.2944780-1-pn@denx.de>
 <201811270010.jiasM1Ez%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201811270010.jiasM1Ez%fengguang.wu@intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: kbuild test robot <lkp@intel.com>
Cc: pn@denx.de, kbuild-all@01.org, marc.zyngier@arm.com, tglx@linutronix.de, jason@lakedaemon.net, robh+dt@kernel.org, mark.rutland@arm.com, afaerber@suse.de, catalin.marinas@arm.com, will.deacon@arm.com, manivannan.sadhasivam@linaro.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, thomas.liau@actions-semi.com, mp-cs@actions-semi.com, linux@cubietech.com, edgar.righi@lsitec.org.br, laisa.costa@lsitec.org.br, guilherme.simoes@lsitec.org.br, mkzuffo@lsi.usp.br
List-Id: devicetree@vger.kernel.org



On 11/26/18 5:59 PM, kbuild test robot wrote:
> Hi Parthiban,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on tip/irq/core]
> [also build test ERROR on v4.20-rc4 next-20181126]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Parthiban-Nallathambi/Add-Actions-Semi-Owl-family-sirq-support/20181126-181439
> config: arm64-allmodconfig (attached as .config)
> compiler: aarch64-linux-gnu-gcc (Debian 7.2.0-11) 7.2.0
> reproduce:
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # save the attached .config to linux build tree
>          GCC_VERSION=7.2.0 make.cross ARCH=arm64
> 
> All errors (new ones prefixed by >>):
> 
>>> Error: arch/arm64/boot/dts/actions/s700-cubieboard7.dts:46.1-9 Label or path pinctrl not found
>>> FATAL ERROR: Syntax error parsing input tree

For the reference, this patch depends on pinctrl for s700, which is yet
to be merged.

https://lore.kernel.org/patchwork/patch/1012859/

> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
> 

-- 
Thanks,
Parthiban N

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-22 Fax: (+49)-8142-66989-80 Email: pn@denx.de
