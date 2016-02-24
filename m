From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2] clk: add userspace clock consumer
Date: Wed, 24 Feb 2016 14:08:19 -0800
Message-ID: <20160224220819.GF4847@codeaurora.org>
References: <1456141719-2543-1-git-send-email-akinobu.mita@gmail.com>
 <20160223214944.GA20852@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160223214944.GA20852@rob-hp-laptop>
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Akinobu Mita <akinobu.mita@gmail.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>
List-Id: devicetree@vger.kernel.org

On 02/23, Rob Herring wrote:
> On Mon, Feb 22, 2016 at 08:48:39PM +0900, Akinobu Mita wrote:
> > This adds userspace consumer for common clock.
> > 
> > This driver is inspired from Userspace regulator consumer
> > (REGULATOR_USERSPACE_CONSUMER) and it is useful for test purposes and
> > some classes of devices that are controlled entirely from user space.
> 
> Whether the kernel handles a clock or userspace does should have nothing 
> to do with DT. Plus DT does not expose many of the clocks, so any 
> debug feature needs to expose all clocks and be independent of DT.
> 
> Beyond debug, I don't think we should be exposing clock control to 
> userspace.

Agreed. Plus, the userspace regulator consumer doesn't have any
DT binding for it, so I don't see why we would have a DT binding
for the clk one.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
