From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 1/3] ARM: imx: clk-vf610: fix SAI clock tree
Date: Mon, 30 Nov 2015 12:55:37 -0800
Message-ID: <20151130205537.GP11298@codeaurora.org>
References: <1445141122-14183-1-git-send-email-stefan@agner.ch>
 <20151123014613.GB13744@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151123014613.GB13744@tiger>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Stefan Agner <stefan@agner.ch>, kernel@pengutronix.de, mturquette@baylibre.com, galak@codeaurora.org, ijc+devicetree@hellion.org.uk, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, Li.Xiubo@freescale.com, zidan.wang@freescale.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/23, Shawn Guo wrote:
> On Sat, Oct 17, 2015 at 09:05:20PM -0700, Stefan Agner wrote:
> > 
> > Since Patch 3 also uses the fixed clock layout, it should be
> > applied after the clock tree fix too...
> > 
> > Not sure through which tree these changes should go?
> 
> Mike, Stephen,
> 
> Can I have your ACK on patch #1 so that I can send it together with 
> #2 for v4.4-rc inclusion?
> 

Yes that's fine.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
