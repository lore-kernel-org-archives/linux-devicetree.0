From: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH] arm: dts: mt2701: Add clock controller device nodes
Date: Mon, 28 Mar 2016 11:47:32 +0200
Message-ID: <56F8FDB4.8070105@openwrt.org>
References: <201603281638.VIBfNFp6%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201603281638.VIBfNFp6%fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kbuild-all-JC7UmRfGjtg@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 28/03/2016 10:13, kbuild test robot wrote:
> Hi James,
> 
> [auto build test ERROR on robh/for-next]
> [also build test ERROR on v4.6-rc1 next-20160327]
> [if your patch is applied to the wrong git tree, please drop us a note to help improving the system]
> 
> url:    https://github.com/0day-ci/linux/commits/James-Liao/arm-dts-mt2701-Add-clock-controller-device-nodes/20160328-133113
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux for-next
> config: arm-multi_v7_defconfig (attached as .config)
> reproduce:
>         wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=arm 
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from arch/arm/boot/dts/mt2701-evb.dts:16:0:
>>> arch/arm/boot/dts/mt2701.dtsi:15:42: fatal error: dt-bindings/clock/mt2701-clk.h: No such file or directory
>     #include <dt-bindings/clock/mt2701-clk.h>

Hi James,

looks like the mt2701 clock patches did not make it into v4.6-rc1. i had
a few minor fixes i wanted to send this week for MT7623 support and
noticed this last week already :(

	John


>                                              ^
>    compilation terminated.
> 
> vim +15 arch/arm/boot/dts/mt2701.dtsi
> 
>      9	 * This program is distributed in the hope that it will be useful,
>     10	 * but WITHOUT ANY WARRANTY; without even the implied warranty of
>     11	 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>     12	 * GNU General Public License for more details.
>     13	 */
>     14	
>   > 15	#include <dt-bindings/clock/mt2701-clk.h>
>     16	#include <dt-bindings/interrupt-controller/irq.h>
>     17	#include <dt-bindings/interrupt-controller/arm-gic.h>
>     18	#include "skeleton64.dtsi"
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
> 
> 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
