From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH v3 7/7] regulator: bd718xx: rename bd71837 to 718xx
Date: Wed, 19 Sep 2018 09:32:47 +0300
Message-ID: <20180919063247.GC2295@localhost.localdomain>
References: <6b3e7b3aeef67d85083f49894e0b0fe482fc08c4.1536912922.git.matti.vaittinen@fi.rohmeurope.com>
 <201809181853.7HyPgIo6%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201809181853.7HyPgIo6%fengguang.wu@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kbuild test robot <lkp@intel.com>
Cc: kbuild-all@01.org, lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, broonie@kernel.org, sboyd@kernel.org, mazziesaccount@gmail.com, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello All,

On Tue, Sep 18, 2018 at 06:13:48PM +0800, kbuild test robot wrote:
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on regulator/for-next]
> [also build test ERROR on next-20180913]
> [cannot apply to v4.19-rc4]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Matti-Vaittinen/regulator-mfd-dt_bindings-bd718x7-Support-ROHM-bd71847/20180914-210454
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
> config: x86_64-randconfig-s4-09181517 (attached as .config)
> compiler: gcc-7 (Debian 7.3.0-1) 7.3.0
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=x86_64 
> 
> All error/warnings (new ones prefixed by >>):
> 
> >> drivers/regulator/bd718x7-regulator.c:364:16: error: implicit declaration of function 'of_match_ptr'; did you mean 'hash_ptr'? [-Werror=implicit-function-declaration]
>        .of_match = of_match_ptr("BUCK1"),
>                    ^~~~~~~~~~~~
>                    hash_ptr

This error is not introduced in this patch series. The already in-tree
implementation of bd71837 driver has this bug already. I'll send a
trivial patch to Mark for adding the missing include.

Br,
	Matti Vaittinen
