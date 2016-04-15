From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v5 2/2] clk: add artpec-6 clock controller
Date: Fri, 15 Apr 2016 15:58:58 -0700
Message-ID: <20160415225858.GB14441@codeaurora.org>
References: <cover.1459447089.git.larper@axis.com>
 <24806729fd9726fe79d315a3c88ecf1c9ea237ef.1459447089.git.larper@axis.com>
 <20160402013928.GF18567@codeaurora.org>
 <570224CA.7040500@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <570224CA.7040500@axis.com>
Sender: linux-clk-owner@vger.kernel.org
To: Lars Persson <lars.persson@axis.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, mturquette@baylibre.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/04, Lars Persson wrote:
> 
> On 04/02/2016 03:39 AM, Stephen Boyd wrote:
> >On 03/31, Lars Persson wrote:
> >>+
> >>+	/* EPROBE_DEFER on the apb_clock is not handled in amba devices. */
> >
> >Shouldn't we fix that then?
> 
> Marek Szyprowski recently tried to fix this, but Russel NAKed the
> change due to userspace breakage:
> https://lkml.org/lkml/2016/2/15/555
> 

Thanks for the pointer. It looks like the discussion stalled
though... I guess I'll merge v6 assuming it's all good otherwise
and make a todo to circle back once the amba bus is fixed.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
