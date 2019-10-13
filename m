From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v4 3/4] dmaengine: sf-pdma: add platform DMA support for
 HiFive Unleashed A00
Date: Sun, 13 Oct 2019 21:04:47 +0800
Message-ID: <201910132151.A52iK7nK%lkp@intel.com>
References: <20191003090945.29210-4-green.wan@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191003090945.29210-4-green.wan@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: kbuild-all@lists.01.org, linux-hackers@sifive.com, Green Wan <green.wan@sifive.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Dan Williams <dan.j.williams@intel.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, "Paul E. McKenney" <paulmck@linux.ibm.com>, Bin Meng <bmeng.cn@gmail.com>, Yash Shah <yash.shah@sifive.com>, Sagar Kadam <sagar.kadam@sifive.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.i
List-Id: devicetree@vger.kernel.org

Hi Green,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[cannot apply to v5.4-rc2 next-20191011]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Green-Wan/dmaengine-sf-pdma-Add-platform-dma-driver/20191003-172343
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-rc1-43-g0ccb3b4-dirty
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/dma/sf-pdma/sf-pdma.c:100:6: sparse: sparse: symbol 'sf_pdma_disclaim_chan' was not declared. Should it be static?
>> drivers/dma/sf-pdma/sf-pdma.c:107:32: sparse: sparse: symbol 'sf_pdma_prep_dma_memcpy' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
