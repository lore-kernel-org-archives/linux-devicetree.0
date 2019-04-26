From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v3 0/3] clk: add driver for the SiFive FU540 PRCI and
 PLLs it controls
Date: Fri, 26 Apr 2019 10:01:23 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1904261000090.28496@viisi.sifive.com>
References: <20190411082618.3502-1-paul.walmsley@sifive.com> <155624271876.15276.8637203698438742304@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <155624271876.15276.8637203698438742304@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, mturquette@baylibre.com
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Thu, 25 Apr 2019, Stephen Boyd wrote:

> Quoting Paul Walmsley (2019-04-11 01:26:16)
> > clk: add driver for the SiFive FU540 PRCI and PLLs it controls
> > 
> > Add a driver for the SiFive FU540 PRCI IP block, which handles clock and
> > some device reset control for the SiFive FU540 chip.  Also add a driver-
> > independent library for the Analog Bits Wide-Range PLL (WRPLL), used by
> > the PRCI driver to monitor and control the WRPLL instances on the FU540
> > chip.
> > 
> > Boot-tested on a SiFive HiFive Unleashed board, using BBL and the
> > open-source FSBL with a mainline-focused DTB.
> > 
> > This third version incorporates changes requested by Stephen Boyd
> > <sboyd@kernel.org> and Rob Herring <robh@kernel.org>.
> > 
> > This patch series is also available, along with the DT macro prerequisite
> > patch, at:
> 
> Can you please send the dt macro patch along with the rest of the
> patches? I can't apply these patches and build them without it.

It's upstream now as commit 6ec4bae178d8 ("dt-bindings: clock: sifive: add 
FU540-C000 PRCI clock constants")

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6ec4bae178d8a1e9814eb3bfdd321b0475de0468


- Paul
