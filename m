From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH 1/3] clk: ingenic: Add proper Kconfig entries
Date: Wed, 22 Aug 2018 09:30:24 +0800
Message-ID: <201808220915.eyVfvvWX%fengguang.wu@intel.com>
References: <20180821123819.25020-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180821123819.25020-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
Cc: kbuild-all@01.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, od@zcrc.me, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

Hi Paul,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on v4.18 next-20180821]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Paul-Cercueil/clk-ingenic-Add-proper-Kconfig-entries/20180822-003241
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
reproduce:
        # apt-get install sparse
        make ARCH=x86_64 allmodconfig
        make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)

>> drivers/clk/ingenic/cgu.c:137:13: sparse: expression using sizeof(void)
>> drivers/clk/ingenic/cgu.c:137:13: sparse: expression using sizeof(void)
   drivers/clk/ingenic/cgu.c:138:13: sparse: expression using sizeof(void)
   drivers/clk/ingenic/cgu.c:138:13: sparse: expression using sizeof(void)
   drivers/clk/ingenic/cgu.c:141:13: sparse: expression using sizeof(void)
   drivers/clk/ingenic/cgu.c:141:13: sparse: expression using sizeof(void)
   drivers/clk/ingenic/cgu.c:142:13: sparse: expression using sizeof(void)
   drivers/clk/ingenic/cgu.c:142:13: sparse: expression using sizeof(void)
   drivers/clk/ingenic/cgu.c:408:15: sparse: expression using sizeof(void)
   drivers/clk/ingenic/cgu.c:408:15: sparse: expression using sizeof(void)
   drivers/clk/ingenic/cgu.c:409:15: sparse: expression using sizeof(void)
   include/linux/slab.h:631:13: sparse: undefined identifier '__builtin_mul_overflow'

vim +137 drivers/clk/ingenic/cgu.c

b066303f Paul Burton 2015-05-24  120  
b066303f Paul Burton 2015-05-24  121  static unsigned long
b066303f Paul Burton 2015-05-24  122  ingenic_pll_calc(const struct ingenic_cgu_clk_info *clk_info,
b066303f Paul Burton 2015-05-24  123  		 unsigned long rate, unsigned long parent_rate,
b066303f Paul Burton 2015-05-24  124  		 unsigned *pm, unsigned *pn, unsigned *pod)
b066303f Paul Burton 2015-05-24  125  {
b066303f Paul Burton 2015-05-24  126  	const struct ingenic_cgu_pll_info *pll_info;
b066303f Paul Burton 2015-05-24  127  	unsigned m, n, od;
b066303f Paul Burton 2015-05-24  128  
b066303f Paul Burton 2015-05-24  129  	pll_info = &clk_info->pll;
b066303f Paul Burton 2015-05-24  130  	od = 1;
b066303f Paul Burton 2015-05-24  131  
b066303f Paul Burton 2015-05-24  132  	/*
b066303f Paul Burton 2015-05-24  133  	 * The frequency after the input divider must be between 10 and 50 MHz.
b066303f Paul Burton 2015-05-24  134  	 * The highest divider yields the best resolution.
b066303f Paul Burton 2015-05-24  135  	 */
b066303f Paul Burton 2015-05-24  136  	n = parent_rate / (10 * MHZ);
b066303f Paul Burton 2015-05-24 @137  	n = min_t(unsigned, n, 1 << clk_info->pll.n_bits);
b066303f Paul Burton 2015-05-24  138  	n = max_t(unsigned, n, pll_info->n_offset);
b066303f Paul Burton 2015-05-24  139  
b066303f Paul Burton 2015-05-24  140  	m = (rate / MHZ) * od * n / (parent_rate / MHZ);
b066303f Paul Burton 2015-05-24  141  	m = min_t(unsigned, m, 1 << clk_info->pll.m_bits);
b066303f Paul Burton 2015-05-24  142  	m = max_t(unsigned, m, pll_info->m_offset);
b066303f Paul Burton 2015-05-24  143  
b066303f Paul Burton 2015-05-24  144  	if (pm)
b066303f Paul Burton 2015-05-24  145  		*pm = m;
b066303f Paul Burton 2015-05-24  146  	if (pn)
b066303f Paul Burton 2015-05-24  147  		*pn = n;
b066303f Paul Burton 2015-05-24  148  	if (pod)
b066303f Paul Burton 2015-05-24  149  		*pod = od;
b066303f Paul Burton 2015-05-24  150  
b066303f Paul Burton 2015-05-24  151  	return div_u64((u64)parent_rate * m, n * od);
b066303f Paul Burton 2015-05-24  152  }
b066303f Paul Burton 2015-05-24  153  

:::::: The code at line 137 was first introduced by commit
:::::: b066303fb3e72a902a1f94dc06636ce82c3a5577 clk: ingenic: add driver for Ingenic SoC CGU clocks

:::::: TO: Paul Burton <paul.burton@imgtec.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
