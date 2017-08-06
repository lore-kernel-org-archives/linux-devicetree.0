From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add support for rk3399 excavator main board
Date: Sun, 06 Aug 2017 17:46:01 +0200
Message-ID: <3974482.WU7faVNnLz@phil>
References: <201708040551.mSxlH21s%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201708040551.mSxlH21s%fengguang.wu@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kbuild test robot <lkp@intel.com>
Cc: Jacob Chen <jacob-chen@iotwrt.com>, kbuild-all@01.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, kever.yang@rock-chips.com, mark.yao@rock-chips.com, zhangqing@rock-chips.com
List-Id: devicetree@vger.kernel.org

Am Freitag, 4. August 2017, 05:28:40 CEST schrieb kbuild test robot:
> Hi Jacob,
> 
> [auto build test ERROR on rockchip/for-next]
> [also build test ERROR on v4.13-rc3 next-20170803]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Jacob-Chen/arm64-dts-rockchip-Add-support-for-rk3399-sapphire-SOM/20170804-002840
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
> config: arm64-defconfig (attached as .config)
> compiler: aarch64-linux-gnu-gcc (Debian 6.1.1-9) 6.1.1 20160705
> reproduce:
>         wget https://raw.githubusercontent.com/01org/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=arm64 
> 
> All errors (new ones prefixed by >>):
> 
> >> Error: arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi:197.1-6 Label or path hdmi not found
> >> Error: arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi:632.1-6 Label or path vopb not found
> >> Error: arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi:636.1-10 Label or path vopb_mmu not found
> >> Error: arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi:640.1-6 Label or path vopl not found
> >> Error: arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi:644.1-10 Label or path vopl_mmu not found
> >> Error: arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts:157.1-5 Label or path edp not found
>    FATAL ERROR: Syntax error parsing input tree

that's ok, it just depended on the series from Jacob adding these
display-related nodes and I've applied that series before picking up
this new board, so everything still compiles fine.


Heiko
