From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v6 6/6] clk: renesas: Renesas RZ/N1 clock driver
Date: Thu, 24 May 2018 08:17:06 +0800
Message-ID: <201805240746.iNt9qbSr%fengguang.wu@intel.com>
References: <1526983321-41949-7-git-send-email-michel.pollet@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1526983321-41949-7-git-send-email-michel.pollet@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: kbuild-all@01.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>, phil.edworthy@renesas.com, Michel Pollet <buserror+upstream@gmail.com>, Michel Pollet <michel.pollet@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Michel,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on next-20180517]
[also build test WARNING on v4.17-rc6]
[cannot apply to robh/for-next renesas-drivers/clk-renesas renesas/devel v4.17-rc6 v4.17-rc5 v4.17-rc4]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Michel-Pollet/arm-Base-support-for-Renesas-RZN1D-DB-Board/20180524-052042
reproduce:
        # apt-get install sparse
        make ARCH=x86_64 allmodconfig
        make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)

>> drivers/clk/renesas/rzn1-clocks.c:270:22: sparse: cast removes address space of expression
>> drivers/clk/renesas/rzn1-clocks.c:271:29: sparse: incorrect type in argument 1 (different address spaces) @@    expected unsigned int [noderef] [usertype] <asn:2>*reg @@    got eref] [usertype] <asn:2>*reg @@
   drivers/clk/renesas/rzn1-clocks.c:271:29:    expected unsigned int [noderef] [usertype] <asn:2>*reg
   drivers/clk/renesas/rzn1-clocks.c:271:29:    got unsigned int [usertype] *reg
   drivers/clk/renesas/rzn1-clocks.c:274:25: sparse: incorrect type in argument 2 (different address spaces) @@    expected unsigned int [noderef] [usertype] <asn:2>*reg @@    got eref] [usertype] <asn:2>*reg @@
   drivers/clk/renesas/rzn1-clocks.c:274:25:    expected unsigned int [noderef] [usertype] <asn:2>*reg
   drivers/clk/renesas/rzn1-clocks.c:274:25:    got unsigned int [usertype] *reg
   drivers/clk/renesas/rzn1-clocks.c:281:22: sparse: cast removes address space of expression
   drivers/clk/renesas/rzn1-clocks.c:282:29: sparse: incorrect type in argument 1 (different address spaces) @@    expected unsigned int [noderef] [usertype] <asn:2>*reg @@    got eref] [usertype] <asn:2>*reg @@
   drivers/clk/renesas/rzn1-clocks.c:282:29:    expected unsigned int [noderef] [usertype] <asn:2>*reg
   drivers/clk/renesas/rzn1-clocks.c:282:29:    got unsigned int [usertype] *reg
   drivers/clk/renesas/rzn1-clocks.c:430:22: sparse: cast removes address space of expression
   drivers/clk/renesas/rzn1-clocks.c:431:30: sparse: incorrect type in argument 1 (different address spaces) @@    expected unsigned int [noderef] [usertype] <asn:2>*reg @@    got eref] [usertype] <asn:2>*reg @@
   drivers/clk/renesas/rzn1-clocks.c:431:30:    expected unsigned int [noderef] [usertype] <asn:2>*reg
   drivers/clk/renesas/rzn1-clocks.c:431:30:    got unsigned int [usertype] *reg
   drivers/clk/renesas/rzn1-clocks.c:516:22: sparse: cast removes address space of expression
   drivers/clk/renesas/rzn1-clocks.c:528:38: sparse: incorrect type in argument 2 (different address spaces) @@    expected unsigned int [noderef] [usertype] <asn:2>*reg @@    got eref] [usertype] <asn:2>*reg @@
   drivers/clk/renesas/rzn1-clocks.c:528:38:    expected unsigned int [noderef] [usertype] <asn:2>*reg
   drivers/clk/renesas/rzn1-clocks.c:528:38:    got unsigned int [usertype] *reg

vim +270 drivers/clk/renesas/rzn1-clocks.c

   264	
   265	/* register/bit pairs are encoded as an uint16_t */
   266	static void clk_rdesc_set(
   267		struct rzn1_priv *clocks,
   268		uint16_t one, unsigned int on)
   269	{
 > 270		u32 *reg = ((u32 *)clocks->reg) + (one >> 5);
 > 271		u32 val = clk_readl(reg);
   272	
   273		val = (val & ~(1U << (one & 0x1f))) | ((!!on) << (one & 0x1f));
   274		clk_writel(val, reg);
   275	}
   276	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
