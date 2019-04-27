From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 1/3] clk: analogbits: add Wide-Range PLL library
Date: Fri, 26 Apr 2019 18:01:51 -0700
Message-ID: <155632691100.168659.14460051101205812433@swboyd.mtv.corp.google.com>
References: <20190411082733.3736-2-paul.walmsley@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190411082733.3736-2-paul.walmsley@sifive.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul@pwsan.com>, Wesley Terpstra <wesley@sifive.com>, Michael Turquette <mturquette@baylibre.com>, Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, Megan Wachs <megan@sifive.com>
List-Id: devicetree@vger.kernel.org

Quoting Paul Walmsley (2019-04-11 01:27:32)
> Add common library code for the Analog Bits Wide-Range PLL (WRPLL) IP
> block, as implemented in TSMC CLN28HPC.
> 
> There is no bus interface or register target associated with this PLL.
> This library is intended to be used by drivers for IP blocks that
> expose registers connected to the PLL configuration and status
> signals.
> 
> Based on code originally written by Wesley Terpstra
> <wesley@sifive.com>:
> https://github.com/riscv/riscv-linux/commit/999529edf517ed75b56659d456d221b2ee56bb60
> 
> This version incorporates several changes requested by Stephen
> Boyd <sboyd@kernel.org>.
> 
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Paul Walmsley <paul@pwsan.com>
> Cc: Wesley Terpstra <wesley@sifive.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Megan Wachs <megan@sifive.com>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---

I haven't deeply reviewed at all, but I already get two problems when
compile testing these patches. I can fix them up if nothing else needs
fixing.

drivers/clk/analogbits/wrpll-cln28hpc.c:165 __wrpll_calc_divq() warn: should 'target_rate << divq' be a 64 bit type?
drivers/clk/sifive/fu540-prci.c:214:16: error: return expression in void function
