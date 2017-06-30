From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH V1 9/9] arm64: dts: add ccu for SC9860
Date: Thu, 29 Jun 2017 17:57:08 -0700
Message-ID: <20170630005708.GI22780@codeaurora.org>
References: <20170618015855.27738-1-chunyan.zhang@spreadtrum.com>
 <20170618015855.27738-10-chunyan.zhang@spreadtrum.com>
 <20170620012411.GF4493@codeaurora.org>
 <CAAfSe-tBtcsyocumaDAyUP674ey1z+xmfAOR7cqnakM_+MOtfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAAfSe-tBtcsyocumaDAyUP674ey1z+xmfAOR7cqnakM_+MOtfQ@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Chunyan Zhang <chunyan.zhang@spreadtrum.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Xiaolong Zhang <xiaolong.zhang@spreadtrum.com>, Orson Zhai <orson.zhai@spreadtrum.com>, Geng Ren <geng.ren@spreadtrum.com>, Ben Li <ben.li@spreadtrum.com>
List-Id: devicetree@vger.kernel.org

On 06/22, Chunyan Zhang wrote:
> Hi Stephen,
> 
> On 20 June 2017 at 09:24, Stephen Boyd <sboyd@codeaurora.org> wrote:
> > On 06/18, Chunyan Zhang wrote:
> 
> >
> >> +             compatible = "sprd,sc9860-ccu";
> >> +             #clock-cells = <1>;
> >> +             reg = <0 0x20000000 0 0x400>,
> >> +                   <0 0x20210000 0 0x3000>,
> >> +                   <0 0x402b0000 0 0x4000>,
> >> +                   <0 0x402d0000 0 0x400>,
> >> +                   <0 0x402e0000 0 0x4000>,
> >> +                   <0 0x40400000 0 0x400>,
> >> +                   <0 0x40880000 0 0x400>,
> >> +                   <0 0x415e0000 0 0x400>,
> >> +                   <0 0x60200000 0 0x400>,
> >> +                   <0 0x61000000 0 0x400>,
> >> +                   <0 0x61100000 0 0x3000>,
> >> +                   <0 0x62000000 0 0x4000>,
> >> +                   <0 0x62100000 0 0x4000>,
> >> +                   <0 0x63000000 0 0x400>,
> >> +                   <0 0x63100000 0 0x3000>,
> >> +                   <0 0x70b00000 0 0x3000>;
> >
> > There are a lot of reg properties here. Perhaps there needs to be
> > different nodes for the different clock controllers in this SoC?
> >
> 
> On Spreadtrum's platform, clocks are basically located in a few
> address areas due to some hardware design issue, that says there're
> more than one kinds of clocks in one address range, and one kind of
> clocks have more than one physical address bases, except ccu_pll and
> ccu_div in this patchset.
> 
> We're planning to map the whole device area at one time before
> initializing each of them, once that has been done and upstreamed, I
> will remove these lists of addressed.

Ok. Does this mean we need to wait for those patches to be sent
out for review? Is it more like certain clks are embedded inside
other devices like display controllers, i2c controllers, etc? Is
there any more information I can get on this SoC?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
