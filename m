From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v3 1/9] arm: dts: mt7623: add mt7623-mt6323.dtsi file
Date: Fri, 12 May 2017 17:46:06 +0200
Message-ID: <7f1d5fb3-5295-bb61-f21b-9d08bfaf070c@gmail.com>
References: <201705121837.eDU3hOId%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201705121837.eDU3hOId%fengguang.wu@intel.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: kbuild test robot <lkp@intel.com>, sean.wang@mediatek.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, kbuild-all@01.org, john@phrozen.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 12/05/17 12:46, kbuild test robot wrote:
> Hi John,
> 
> [auto build test ERROR on robh/for-next]
> [also build test ERROR on v4.11 next-20170512]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

Mediatek dts patches should be tested against this branch:
https://github.com/mbgg/linux-mediatek.git for-next

Thanks for maintaining the kbuild test robot.

Matthias

> 
> url:    https://github.com/0day-ci/linux/commits/sean-wang-mediatek-com/arm-dts-extend-mt7623-support/20170512-165138
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> config: arm-at91_dt_defconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (Debian 6.1.1-9) 6.1.1 20160705
> reproduce:
>          wget https://raw.githubusercontent.com/01org/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # save the attached .config to linux build tree
>          make.cross ARCH=arm
> 
> All errors (new ones prefixed by >>):
> 
>>> Error: arch/arm/boot/dts/mt7623-mt6323.dtsi:33.1-7 Label or path pwrap not found
>>> Error: arch/arm/boot/dts/mt7623-mt6323.dtsi:261.1-6 Label or path mmc0 not found
>>> Error: arch/arm/boot/dts/mt7623-mt6323.dtsi:266.1-6 Label or path mmc1 not found
>     FATAL ERROR: Syntax error parsing input tree
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
> 
