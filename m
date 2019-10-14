From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v4 02/11] crypto: Add Allwinner sun8i-ce Crypto Engine
Date: Tue, 15 Oct 2019 00:32:42 +0800
Message-ID: <201910150009.4PL0gO1Q%lkp@intel.com>
References: <20191012184852.28329-3-clabbe.montjoie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191012184852.28329-3-clabbe.montjoie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: kbuild-all@lists.01.org, catalin.marinas@arm.com, davem@davemloft.net, herbert@gondor.apana.org.au, linux@armlinux.org.uk, mark.rutland@arm.com, mripard@kernel.org, robh+dt@kernel.org, wens@csie.org, will@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Corentin Labbe <clabbe.montjoie@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Corentin,

I love your patch! Perhaps something to improve:

[auto build test WARNING on cryptodev/master]
[cannot apply to v5.4-rc3 next-20191014]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Corentin-Labbe/crypto-add-sun8i-ce-driver-for-Allwinner-crypto-engine/20191014-104401
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-rc1-43-g0ccb3b4-dirty
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c:415:25: sparse: sparse: symbol 'sun8i_ce_pm_ops' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
