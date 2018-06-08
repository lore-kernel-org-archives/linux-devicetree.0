Return-Path: <SRS0=zHxe=I2=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:54263 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751117AbeFHIsZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 8 Jun 2018 04:48:25 -0400
Subject: Re: [PATCH v2 1/2] cpufreq: imx6q/thermal: imx: register cooling
 device depending on OF
References: <20180607095105.5185-1-bst@pengutronix.de>
 <201806081511.SiPYchYr%fengguang.wu@intel.com>
From: Bastian Stender <bst@pengutronix.de>
Message-ID: <54279590-052c-22d0-3ebd-dcf661becf47@pengutronix.de>
Date: Fri, 8 Jun 2018 10:48:14 +0200
MIME-Version: 1.0
In-Reply-To: <201806081511.SiPYchYr%fengguang.wu@intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: kbuild test robot <lkp@intel.com>
Cc: devicetree@vger.kernel.org, Anson Huang <anson.huang@nxp.com>, linux-pm@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, kbuild-all@01.org, kernel@pengutronix.de, Zhang Rui <rui.zhang@intel.com>, Leonard Crestez <leonard.crestez@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

On 06/08/2018 09:22 AM, kbuild test robot wrote:
> Hi Bastian,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on soc-thermal/next]
> [also build test ERROR on v4.17 next-20180607]
> [cannot apply to shawnguo/for-next]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Bastian-Stender/cpufreq-imx6q-thermal-imx-register-cooling-device-depending-on-OF/20180608-134429
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/evalenti/linux-soc-thermal.git next
> config: arm-multi_v7_defconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (Debian 7.2.0-11) 7.2.0
> reproduce:
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # save the attached .config to linux build tree
>          make.cross ARCH=arm
> 
> All error/warnings (new ones prefixed by >>):
> 
>     drivers//cpufreq/imx6q-cpufreq.c: In function 'imx6q_cpufreq_ready':
>>> drivers//cpufreq/imx6q-cpufreq.c:208:10: error: implicit declaration of function 'of_cpufreq_power_cooling_register'; did you mean 'of_cpufreq_cooling_register'? [-Werror=implicit-function-declaration]
>        cdev = of_cpufreq_power_cooling_register(np, policy,
>               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>               of_cpufreq_cooling_register
>>> drivers//cpufreq/imx6q-cpufreq.c:208:8: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
>        cdev = of_cpufreq_power_cooling_register(np, policy,
>             ^
>     cc1: some warnings being treated as errors

Sorry for that. I missed changes in the CPU cooling API and confused my
kconfig ultimately resulting in the drivers not getting compiled. Will
fix and simplify this in v3.

Regards,
Bastian

-- 
Pengutronix e.K.
Industrial Linux Solutions
http://www.pengutronix.de/
Peiner Str. 6-8, 31137 Hildesheim, Germany
Amtsgericht Hildesheim, HRA 2686
