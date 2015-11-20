From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v4 0/3] clk: Broadcom BCM63138 support
Date: Fri, 20 Nov 2015 10:46:12 -0800
Message-ID: <20151120184612.GT32672@codeaurora.org>
References: <1446168199-5959-1-git-send-email-f.fainelli@gmail.com>
 <564E70A4.8060001@gmail.com>
 <564E712C.50309@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <564E712C.50309@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-clk@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, jonmason@broadcom.com, mturquette@baylibre.com, linux@arm.linux.org.uk, sbranden@broadcom.com, rjui@broadcom.com
List-Id: devicetree@vger.kernel.org

On 11/19, Florian Fainelli wrote:
> On 19/11/15 17:00, Florian Fainelli wrote:
> > On 29/10/15 18:23, Florian Fainelli wrote:
> >> This patch series adds support for the Broadcom BCM63138 DSL SoCs
> >> clocking framework.
> >>
> >> Since the HW is identical to the one found in Broadcom iProc SoCs, but the
> >> integration is different (obviously), there is still a new compatible string
> >> introduced just in case we happen to find issues in the future.
> >>
> >> Stephen, could you stage the two patches in a clk-bcm63xx branch that I could
> >> later utilize while doing the arm-soc DT pull request?
> > 
> > Stephen, can you queue the first two patches in a topic branch for me to
> > merge as part of the commit adding the DTS changes?
> 
> Well, now that I look back at the changes, you can actually merge the
> two patches in clk-next, and the DTS changes can come in before or
> after, it does not really matter, this would not cause breakage or
> anything. Sorry for the noise.

Really? I thought if the clk patches aren't there then the dts
change would cause some clocks to be orphaned. If that's ok with
you it's ok with me.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
