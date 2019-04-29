From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v3 1/3] clk: analogbits: add Wide-Range PLL library
Date: Mon, 29 Apr 2019 12:42:07 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1904291141340.7063@viisi.sifive.com>
References: <20190411082733.3736-2-paul.walmsley@sifive.com> <155632691100.168659.14460051101205812433@swboyd.mtv.corp.google.com> <alpine.DEB.2.21.9999.1904262031510.10713@viisi.sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.9999.1904262031510.10713@viisi.sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Paul Walmsley <paul@pwsan.com>, Wesley Terpstra <wesley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, Michael Turquette <mturquette@baylibre.com>, Megan Wachs <megan@sifive.com>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Fri, 26 Apr 2019, Paul Walmsley wrote:

> On Fri, 26 Apr 2019, Stephen Boyd wrote:
> 
> > Quoting Paul Walmsley (2019-04-11 01:27:32)
> > > Add common library code for the Analog Bits Wide-Range PLL (WRPLL) IP
> > > block, as implemented in TSMC CLN28HPC.
> > 
> > I haven't deeply reviewed at all, but I already get two problems when
> > compile testing these patches. I can fix them up if nothing else needs
> > fixing.
> > 
> > drivers/clk/analogbits/wrpll-cln28hpc.c:165 __wrpll_calc_divq() warn: should 'target_rate << divq' be a 64 bit type?
> > drivers/clk/sifive/fu540-prci.c:214:16: error: return expression in void function
> 
> Hmm, that's odd.  I will definitely take a look and repost.

I'm not able to reproduce these problems.  The configs tried here were:

- 64-bit RISC-V defconfig w/ PRCI driver enabled (gcc 8.2.0 built with 
  crosstool-NG 1.24.0)

- 32-bit ARM defconfig w/ PRCI driver enabled (gcc 8.3.0 built with 
  crosstool-NG 1.24.0)

- 32-bit i386 defconfig w/ PRCI driver enabled (gcc 
  5.4.0-6ubuntu1~16.04.11)

Could you post the toolchain and kernel config you're using?


- Paul
