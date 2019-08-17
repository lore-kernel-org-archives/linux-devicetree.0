From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 1/5] dt-bindings: clock: Add Bitmain BM1880 SoC clock
 controller binding
Date: Sat, 17 Aug 2019 09:28:45 +0530
Message-ID: <20190817035845.GD14652@Mani-XPS-13-9360>
References: <20190705151440.20844-1-manivannan.sadhasivam@linaro.org>
 <20190705151440.20844-2-manivannan.sadhasivam@linaro.org>
 <20190808050128.E3DA52186A@mail.kernel.org>
 <20190817033422.GB14652@Mani-XPS-13-9360>
 <20190817034612.6DA7E21721@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190817034612.6DA7E21721@mail.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, robh+dt@kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, haitao.suo@bitmain.com, darren.tsao@bitmain.com, fisher.cheng@bitmain.com, alec.lin@bitmain.com
List-Id: devicetree@vger.kernel.org

On Fri, Aug 16, 2019 at 08:46:11PM -0700, Stephen Boyd wrote:
> Quoting Manivannan Sadhasivam (2019-08-16 20:34:22)
> > On Wed, Aug 07, 2019 at 10:01:28PM -0700, Stephen Boyd wrote:
> > > Quoting Manivannan Sadhasivam (2019-07-05 08:14:36)
> > > > +It is expected that it is defined using standard clock bindings as "osc".
> > > > +
> > > > +Example: 
> > > > +
> > > > +        clk: clock-controller@800 {
> > > > +                compatible = "bitmain,bm1880-clk";
> > > > +                reg = <0xe8 0x0c>,<0x800 0xb0>;
> > > 
> > > It looks weird still. What hardware module is this actually part of?
> > > Some larger power manager block?
> > > 
> > 
> > These are all part of the sysctrl block (clock + pinctrl + reset) and the
> > register domains got split between system and pll.
> > 
> 
> And that can't be one node that probes the clk, pinctrl, and reset
> drivers from C code?

It is not a MFD for sure. It's just grouping of the register domains together.

Thanks,
Mani
> 
