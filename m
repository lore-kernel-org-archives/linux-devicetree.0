From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v3 1/3] clk: analogbits: add Wide-Range PLL library
Date: Fri, 26 Apr 2019 20:32:20 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1904262031510.10713@viisi.sifive.com>
References: <20190411082733.3736-2-paul.walmsley@sifive.com>
 <155632691100.168659.14460051101205812433@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <155632691100.168659.14460051101205812433@swboyd.mtv.corp.google.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, Paul Walmsley <paul@pwsan.com>, Wesley Terpstra <wesley@sifive.com>, Michael Turquette <mturquette@baylibre.com>, Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org, Megan Wachs <megan@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 26 Apr 2019, Stephen Boyd wrote:

> Quoting Paul Walmsley (2019-04-11 01:27:32)
> > Add common library code for the Analog Bits Wide-Range PLL (WRPLL) IP
> > block, as implemented in TSMC CLN28HPC.
> 
> I haven't deeply reviewed at all, but I already get two problems when
> compile testing these patches. I can fix them up if nothing else needs
> fixing.
> 
> drivers/clk/analogbits/wrpll-cln28hpc.c:165 __wrpll_calc_divq() warn: should 'target_rate << divq' be a 64 bit type?
> drivers/clk/sifive/fu540-prci.c:214:16: error: return expression in void function

Hmm, that's odd.  I will definitely take a look and repost.

- Paul
