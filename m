From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH V5] clk: bcm: Add driver for BCM53573 ILP clock
Date: Thu, 25 Aug 2016 12:58:23 -0700
Message-ID: <20160825195823.GN19826@codeaurora.org>
References: <20160823061745.8162-1-zajec5@gmail.com>
 <20160823062613.13865-1-zajec5@gmail.com>
 <20160824084738.GB6502@codeaurora.org>
 <CACna6rzUc2Gz2JJdTC_S3+Fo24X4rTisxRz7-THvnyCt5rk4Xw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACna6rzUc2Gz2JJdTC_S3+Fo24X4rTisxRz7-THvnyCt5rk4Xw@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eric Anholt <eric@anholt.net>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 08/25, Rafał Miłecki wrote:
> On 24 August 2016 at 10:47, Stephen Boyd <sboyd@codeaurora.org> wrote:
> > On 08/23, Rafał Miłecki wrote:
> >> +static int bcm53573_ilp_enable(struct clk_hw *hw)
> >> +{
> >> +     struct bcm53573_ilp *ilp = container_of(hw, struct bcm53573_ilp, hw);
> >> +
> >> +     writel(0x10199, ilp->pmu + PMU_SLOW_CLK_PERIOD);
> >> +     writel(0x10000, ilp->pmu + 0x674);
> >
> > Is there a name for 0x674?
> 
> No in any sources published by Broadcom. I was experimenting with bit
> 0x10000 in PMU_SLOW_CLK_PERIOD and 0x10000 in 0x674. Both have to be
> set. I was suspecting that maybe one of them is just some trigger and
> it can be switched back to 0, but it's not the case. I definitely need
> to set both of them to get clock working.

Ok no worries, raw number is fine.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
