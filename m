From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: [PATCH 02/02] clk: clk-of: Use alloc_bootmem() instead of
 kzalloc()
Date: Thu, 21 Jun 2012 21:18:44 +0900
Message-ID: <20120621121843.GA20236@linux-sh.org>
References: <1339512111-11172-1-git-send-email-robherring2@gmail.com>
 <87bokd15x7.fsf@octavius.laptop.org>
 <87395p15or.fsf_-_@octavius.laptop.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87395p15or.fsf_-_@octavius.laptop.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Ball <cjb@laptop.org>
Cc: Rob Herring <robherring2@gmail.com>, Mitch Bradley <wmb@laptop.org>, mturquette@linaro.org, devicetree-discuss@lists.ozlabs.org, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, skannan@codeaurora.org, shawn.guo@linaro.org, s.hauer@pengutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 21, 2012 at 03:32:04AM -0400, Chris Ball wrote:
> When of_clk_add_provider() is used at boot time (during .init_early on
> ARM, in the motivating case for this patch), kzalloc() cannot be used
> because slab isn't up yet.
> 
> Signed-off-by: Chris Ball <cjb@laptop.org>

I wouldn't use alloc_bootmem() unconditionally for this, as you have no
idea where other platforms may wire the call site up. slab is also
available a lot earlier now than it used to be, so many places that
required bootmem pages previously can get away with slab allocations now.

You could rework this as:

	if (slab_is_available())
		cp = kzalloc(...)
	else
		cp = alloc_bootmem(...)

and then it doesn't matter when and where it gets called.
