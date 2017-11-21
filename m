From: "Marty E. Plummer" <hanetzer@startmail.com>
Subject: Re: [PATCH v2 1/3] clk: hisilicon: add CRG driver Hi3521A SoC
Date: Tue, 21 Nov 2017 05:56:12 -0600
Message-ID: <20171121115611.bmdriap3uoazmyiw@proprietary-killer.fossland>
References: <20171017223854.6980-1-hanetzer@startmail.com>
 <20171017223854.6980-2-hanetzer@startmail.com>
 <20171024184250.d4wmzr6osd4o53oz@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171024184250.d4wmzr6osd4o53oz@rob-hp-laptop>
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com, sboyd@codeaurora.org, mark.rutland@arm.com, xuejiancheng@hisilicon.com, zhangfei.gao@linaro.org, wnpan@hisilicon.com, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, xuwei5@hisilicon.com, linux@armlinux.org.uk
List-Id: devicetree@vger.kernel.org

On Tue, Oct 24, 2017 at 01:42:50PM -0500, Rob Herring wrote:
> On Tue, Oct 17, 2017 at 05:38:52PM -0500, Marty E. Plummer wrote:
> > Add CRG driver for Hi3521A SoC. CRG (Clock and Reset Generator) module
> > generates clock and reset signals used by other module blocks on SoC.
> > 
> > Signed-off-by: Marty E. Plummer <hanetzer@startmail.com>
> > ---
> > Changes in v2:
> >   - Switched to SPDX tags and GPL-2.0+
> > 
> >  drivers/clk/hisilicon/Kconfig             |   7 ++
> >  drivers/clk/hisilicon/Makefile            |   1 +
> >  drivers/clk/hisilicon/crg-hi3521a.c       | 196 ++++++++++++++++++++++++++++++
> 
> >  include/dt-bindings/clock/hi3521a-clock.h |  23 ++++
> 
> Acked-by: Rob Herring <robh@kernel.org>
Actually nack this for now. I need to change some stuff over to use a
different clock for the sp804 timer@12000000, apparently I'm going to
need to use CLK_OF_DECLARE to get the clock in question working that
early in boot.

