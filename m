From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 1/3] clk: analogbits: add Wide-Range PLL library
Date: Mon, 29 Apr 2019 15:59:49 -0700
Message-ID: <155657878993.168659.6676692672888882237@swboyd.mtv.corp.google.com>
References: <20190411082733.3736-2-paul.walmsley@sifive.com> <155632691100.168659.14460051101205812433@swboyd.mtv.corp.google.com> <alpine.DEB.2.21.9999.1904262031510.10713@viisi.sifive.com> <alpine.DEB.2.21.9999.1904291141340.7063@viisi.sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.9999.1904291141340.7063@viisi.sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Paul Walmsley <paul@pwsan.com>, Wesley Terpstra <wesley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, Michael Turquette <mturquette@baylibre.com>, Megan Wachs <megan@sifive.com>
List-Id: devicetree@vger.kernel.org

Quoting Paul Walmsley (2019-04-29 12:42:07)
> Hi Stephen,
>=20
> On Fri, 26 Apr 2019, Paul Walmsley wrote:
>=20
> > On Fri, 26 Apr 2019, Stephen Boyd wrote:
> >=20
> > > Quoting Paul Walmsley (2019-04-11 01:27:32)
> > > > Add common library code for the Analog Bits Wide-Range PLL (WRPLL) =
IP
> > > > block, as implemented in TSMC CLN28HPC.
> > >=20
> > > I haven't deeply reviewed at all, but I already get two problems when
> > > compile testing these patches. I can fix them up if nothing else needs
> > > fixing.
> > >=20
> > > drivers/clk/analogbits/wrpll-cln28hpc.c:165 __wrpll_calc_divq() warn:=
 should 'target_rate << divq' be a 64 bit type?
> > > drivers/clk/sifive/fu540-prci.c:214:16: error: return expression in v=
oid function
> >=20
> > Hmm, that's odd.  I will definitely take a look and repost.
>=20
> I'm not able to reproduce these problems.  The configs tried here were:
>=20
> - 64-bit RISC-V defconfig w/ PRCI driver enabled (gcc 8.2.0 built with=20
>   crosstool-NG 1.24.0)
>=20
> - 32-bit ARM defconfig w/ PRCI driver enabled (gcc 8.3.0 built with=20
>   crosstool-NG 1.24.0)
>=20
> - 32-bit i386 defconfig w/ PRCI driver enabled (gcc=20
>   5.4.0-6ubuntu1~16.04.11)
>=20
> Could you post the toolchain and kernel config you're using?
>=20

I'm running sparse and smatch too.
