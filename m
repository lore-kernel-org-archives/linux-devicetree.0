From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v4 0/2] clk: Add Artpec-6 SoC support
Date: Fri, 25 Mar 2016 16:08:20 -0700
Message-ID: <20160325230820.GE18567@codeaurora.org>
References: <cover.1456411894.git.larper@axis.com>
 <56F256A9.6040405@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56F256A9.6040405@axis.com>
Sender: linux-clk-owner@vger.kernel.org
To: Lars Persson <lars.persson@axis.com>
Cc: mturquette@baylibre.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 03/23, Lars Persson wrote:
> Michael & Stephen,
> 
> Should we resubmit this series for 4.7 ?
> 
> Also to follow up on your previous request to use the platform
> driver framework. We have noticed recent submissions use a style
> that mixes early clocks registered with CLK_OF_DECLARE and the
> remaining clocks registered through a platform driver. Is this the
> style we should implement ?
> 

Yes that would be good. Thanks.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
