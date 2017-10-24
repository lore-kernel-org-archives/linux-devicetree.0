From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v5 0/9] Mediatek MT2712 clock and scpsys support
Date: Tue, 24 Oct 2017 01:38:30 -0700
Message-ID: <20171024083830.GD15990@codeaurora.org>
References: <1508381330-3700-1-git-send-email-weiyi.lu@mediatek.com>
 <e67f2b01-552b-e9b3-6c38-141e3063439d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e67f2b01-552b-e9b3-6c38-141e3063439d@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Weiyi Lu <weiyi.lu@mediatek.com>, Rob Herring <robh@kernel.org>, Michael Turquette <mturquette@baylibre.com>, James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

On 10/19, Matthias Brugger wrote:
> 
> 
> On 10/19/2017 04:48 AM, Weiyi Lu wrote:
> > This series is based on v4.14-rc1 and composed of
> > clock control (PATCH 1-4) and scpsys control (PATCH 5-9)
> > 
> > changes since v4:
> > - Refine scpsys and infracfg for bus protection by passing 
> >   a boolean flag to determine the register update method.
> > 
> > changes since v3:
> > - Rebase to v4.14-rc1.
> > 
> > changes since v2:
> > - ensure the clocks used by clocksource driver are registered
> >   before clocksource init() by using CLK_OF_DECLARE()
> > - correct the frequency of clk32k/clkrtc_ext/clkrtc_int
> > 
> > changes since v1:
> > - Rebase to v4.13-next-soc.
> > - Refine scpsys and infracfg for bus protection.
> > 
> > Weiyi Lu (9):
> >   dt-bindings: ARM: Mediatek: Document bindings for MT2712
> >   clk: mediatek: Add dt-bindings for MT2712 clocks
> >   clk: mediatek: Add MT2712 clock support
> 
> Stephen, Mike: are you ok with the patches 1-3 of this series?
> 
> If so, then I will take the rest through my tree.
> 

Do you need a branch for headers? I'm see there's a v6 so I'll
review that one.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
