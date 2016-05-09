From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v3 3/4] mfd: arizona: Switch to using clock driver for
 32k clock
Date: Mon, 9 May 2016 12:34:04 -0700
Message-ID: <20160509193404.GP3492@codeaurora.org>
References: <1452252582-20834-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1452252582-20834-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20160507005510.GO3492@codeaurora.org>
 <20160509074459.GD8324@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160509074459.GD8324@dell>
Sender: linux-clk-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, mturquette@baylibre.com, cw00.choi@samsung.com, myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On 05/09, Lee Jones wrote:
> On Fri, 06 May 2016, Stephen Boyd wrote:
> 
> > On 01/08, Charles Keepax wrote:
> > > Now we have a clock driver that can control the 32k clock use this
> > > rather than directly controlling the 32k clock from the MFD device.
> > > 
> > > Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> > > ---
> > 
> > Applied to clk-next
> 
> If you're going to take the set though the clk tree, don't forget to
> sent out a pull-request of the immutable branch you created.  If
> you're not happy to do that, drop the patch and I'll happily oblige.
> 

Oh sorry, I got confused. I thought you acked this mfd patch so I could
take it through the clk tree but it seems you acked them so you
could apply it later without re-reviewing it?

Either way, I'm going to drop these patches for now and wait for
a v4 because Charles has suggested there are some more issues to
work out.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
