From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH v2 5/7] regulator/mfd: bd718xx: rename bd71837/bd71847
 common instances
Date: Fri, 14 Sep 2018 08:42:11 +0300
Message-ID: <20180914054211.GA2295@localhost.localdomain>
References: <74dc36388bc48a59191cc212094c85b157fd5197.1536750863.git.matti.vaittinen@fi.rohmeurope.com>
 <201809140420.mcXVA0yk%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201809140420.mcXVA0yk%fengguang.wu@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kbuild test robot <lkp@intel.com>
Cc: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, broonie@kernel.org, sboyd@kernel.org, mazziesaccount@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com
List-Id: devicetree@vger.kernel.org

On Fri, Sep 14, 2018 at 04:39:28AM +0800, kbuild test robot wrote:
> Hi Matti,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on regulator/for-next]
> [also build test ERROR on next-20180913]
> [cannot apply to v4.19-rc3]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Matti-Vaittinen/regulator-mfd-dt_bindings-bd718x7-Support-ROHM-bd71847/20180914-000129
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
> config: i386-randconfig-s0-201836 (attached as .config)
> compiler: gcc-6 (Debian 6.4.0-9) 6.4.0 20171026
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=i386 
> 
> Note: the linux-review/Matti-Vaittinen/regulator-mfd-dt_bindings-bd718x7-Support-ROHM-bd71847/20180914-000129 HEAD 0df8e57cacf59e85ad40a25fbb1bd7e842608be8 builds fine.
>       It only hurts bisectibility.
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/regulator/bd71837-regulator.c:407:18: error: 'BD718XX_4TH_NODVS_BUCK_VOLTAGE_NUM' undeclared here (not in a function)
>        .n_voltages = BD718XX_4TH_NODVS_BUCK_VOLTAGE_NUM,
>                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/regulator/bd71837-regulator.c:735:18: error: initializer element is not constant
>        .n_voltages = BD718XX_4TH_NODVS_BUCK_VOLTAGE_NUM,
>                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Sorry all. I've messed up the series. The
BD718XX_4TH_NODVS_BUCK_VOLTAGE_NUM definition is used already in
[PATCH v2 5/7] but only added to header in patch [PATCH v2 6/7].

I'll fix this and send out v3.

Br,
	Matti Vaittinen
