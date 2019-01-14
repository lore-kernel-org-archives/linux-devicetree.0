From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 0/6] Add clock support for Actions Semi S500 SoC
Date: Mon, 14 Jan 2019 14:48:50 +0530
Message-ID: <20190114091850.GB13162@Mani-XPS-13-9360>
References: <20181231185517.18517-1-manivannan.sadhasivam@linaro.org>
 <154724706468.169631.2903523518830581075@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <154724706468.169631.2903523518830581075@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: afaerber@suse.de, mturquette@baylibre.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Fri, Jan 11, 2019 at 02:51:04PM -0800, Stephen Boyd wrote:
> Quoting Manivannan Sadhasivam (2018-12-31 10:55:11)
> > Hello,
> > 
> > This patchset adds common clock support for Actions Semi S500 SoC of
> > the Owl family SoCs. This series is based on the initial work done
> > by Edgar Bernardi Righi. https://patchwork.kernel.org/cover/10587527/
> > 
> > Since there isn't any update from him for long time, I took the liberty
> > to modify his patches, address review comments and send to list for review.
> > 
> > This series has been tested on Allo Sparky SBC.
> > 
> > Thanks,
> > Mani
> > 
> > Edgar Bernardi Righi (1):
> >   dt-bindings: clock: Add DT bindings for Actions Semi S500 CMU
> > 
> > Manivannan Sadhasivam (5):
> >   clk: actions: Add configurable PLL delay
> >   ARM: dts: Add CMU support for Actions Semi Owl S500 SoC
> >   ARM: dts: Remove fake UART clock for S500 based SBCs
> >   clk: actions: Add clock driver for S500 SoC
> >   MAINTAINERS: Add linux-actions mailing list for Actions Semi
> 
> What's the merge strategy for these patches? Some are for clk, others
> are for arm-soc, etc. I see a sandwich of patches too so it sounds like
> I can't even take just the clk ones for fear of breaking something that
> the dts bits in the middle clear out of the way.
> 

As we did with previous patchsets, clk patches will go through your tree
and I'll take the ARM/MAINTAINERS patches through Actions sub-tree. Let's
target these for 5.1. Even if your patches reach first, there won't be
any regression with existing DTS.

Thanks,
Mani
