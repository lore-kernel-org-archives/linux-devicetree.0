From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [RFC 1/2] clk: dt: binding for basic divider clock
Date: Tue, 14 Mar 2017 18:07:10 -0700
Message-ID: <20170315010710.GJ10239@codeaurora.org>
References: <20170314202236.39910-1-code@mmayer.net>
 <20170314202236.39910-2-code@mmayer.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170314202236.39910-2-code@mmayer.net>
Sender: linux-clk-owner@vger.kernel.org
To: Markus Mayer <code@mmayer.net>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mike Turquette <mturquette@linaro.org>, Linux Clock Mailing List <linux-clk@vger.kernel.org>, Device Tree Mailing List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Markus Mayer <mmayer@broadcom.com>
List-Id: devicetree@vger.kernel.org

On 03/14, Markus Mayer wrote:
> From: Mike Turquette <mturquette@linaro.org>
> 
> Devicetree binding for the basic clock divider, plus the setup function
> to register the clock.  Based on the existing fixed-clock binding.
> 
> Tero Kristo contributed helpful bug fixes to this patch.
> 
> Signed-off-by: Mike Turquette <mturquette@linaro.org>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>

These sorts of details should go into C code. Is there any
difficulty in writing a driver to do so? So far we've avoided
adding the generic divider, multiplier, mux, bindings because
those usually need some register level details that we've been
reluctant to add to DT.

That's because if something is wrong with these register level
details or we need to make some policy updates, e.g. favor this
divider over another, we can't really do that with a DT update.
So we really want to see DT nodes have some hardware specific
compatible string, and also put the logic for the driver into the
code so that it can be easily fixed and updated after the fact.

The DTS file is there to tell us "I have a divider from company X
here and it's connected to this and that" and the driver is there
to do the work of driving that piece of hardware so it works
properly.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
