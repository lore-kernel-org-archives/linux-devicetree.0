From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH] arm64: dts: rockchip: Explicitly set pclk_pmu_src on
 rk3399
Date: Tue, 30 Aug 2016 10:06:36 -0700
Message-ID: <20160830170635.GA129134@google.com>
References: <1472494284-11315-1-git-send-email-dianders@chromium.org>
 <20160829181841.GA8682@localhost>
 <57C4DA73.5000505@rock-chips.com>
 <4298293.ZqJ4n19bHK@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4298293.ZqJ4n19bHK@diego>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Elaine Zhang <zhangqing@rock-chips.com>, Douglas Anderson <dianders@chromium.org>, linux-rockchip@lists.infradead.org, zhengxing@rock-chips.com, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, wxt@rock-chips.com, jay.xu@rock-chips.com, david.wu@rock-chips.com, yamada.masahiro@socionext.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 30, 2016 at 09:05:06AM +0200, Heiko Stuebner wrote:
> Am Dienstag, 30. August 2016, 08:59:31 schrieb Elaine Zhang:
> > On 08/30/2016 02:18 AM, Brian Norris wrote:
> > > On Mon, Aug 29, 2016 at 11:11:24AM -0700, Doug Anderson wrote:
> > >> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> > >> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> > >> @@ -908,8 +908,8 @@
> > >> 
> > >>   		reg = <0x0 0xff750000 0x0 0x1000>;
> > >>   		#clock-cells = <1>;
> > >>   		#reset-cells = <1>;
> > >> 
> > >> -		assigned-clocks = <&pmucru PLL_PPLL>;
> > >> -		assigned-clock-rates = <676000000>;
> > >> +		assigned-clocks = <&pmucru PLL_PPLL>, <&pmucru PCLK_SRC_PMU>;
> > >> +		assigned-clock-rates = <676000000>, <112666667>;
> > > 
> > > I think this makes sense and is a good idea. One alternative would be to
> > > have the various children actually set a rate that they expect, but
> > > several of them don't have a separate driver at all, and that would be
> > > of dubious value anyway I think.
> > 
> > I agree with you. This clk default div is set in the uboot or coreboot.
> > And if is need to set in kernel ,I hope the freq is 50M(<48285714>).
> > This freq can meet the performance,and the power consumption is not too
> > much.
> 
> can you maybe also provide a tag like the one Brian did below. Your sentence 
> above indicates that you reviewed and approve, but it's helpful to also state 
> that explicitly :-)

If I understand Elaine correctly, that's not actually a full agreement;
it looks like a suggestion to change that from 112 MHz to 48.2 MHz. I
haven't tested that out personally yet, but if that's a formal
recommendation from Rockchip, we'd like to know more about it :)

Brian
