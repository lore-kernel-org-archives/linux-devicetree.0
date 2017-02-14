From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCHv2 2/3] clk: mvebu: adjust clock handling for the CP110
 system controller
Date: Tue, 14 Feb 2017 10:59:12 -0800
Message-ID: <20170214185912.GT25384@codeaurora.org>
References: <1482316017-22154-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1482316017-22154-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <20161222001456.GX8288@codeaurora.org>
 <20170214162718.0777d95f@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170214162718.0777d95f@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Nadav Haklai <nadavh@marvell.com>, Hanna Hawa <hannah@marvell.com>, Yehuda Yitschak <yehuday@marvell.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 02/14, Thomas Petazzoni wrote:
> Hello Stephen,
> 
> On Wed, 21 Dec 2016 16:14:56 -0800, Stephen Boyd wrote:
> > On 12/21, Thomas Petazzoni wrote:
> > > This commit:
> > > 
> > >  - makes the GOP_DP (bit 9) gatable clock a child clock of the
> > >    SD_MMC_GOP (bit 18) clock, as it should have been. The clock for bit
> > >    18 was just named SD_MMC, but since it also covers the GOP block, it
> > >    is renamed SD_MMC_GOP.
> > > 
> > >  - makes the MG (bit 5) gatable clock a child clock of the MG_CORE
> > >    clock (bit 6)
> > > 
> > > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > > ---  
> > 
> > Applied to clk-next
> 
> I don't see my patch in clk-next at
> https://git.kernel.org/cgit/linux/kernel/git/clk/linux.git/log/drivers/clk/mvebu/cp110-system-controller.c?h=clk-next,
> nor in linux-next. Am I missing something?
> 

Odd. I don't know what happened. I've applied it now.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
