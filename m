From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH RFC 0/3] clk: dt: bindings for mux & divider clocks
Date: Sat, 8 Jun 2013 11:02:41 +0800
Message-ID: <20130608030240.GB22134@S2101-09.ap.freescale.net>
References: <1370281990-15090-1-git-send-email-mturquette@linaro.org>
 <20130607055128.GA20780@S2101-09.ap.freescale.net>
 <20130607175254.10233.7661@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130607175254.10233.7661@quantum>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 07, 2013 at 10:52:54AM -0700, Mike Turquette wrote:
> Yes, there was a time when I was firmly against doing such a thing.
> However I'm not sure it is so bad now.  More and more SoCs are going to
> keep getting merged into the kernel and that just means more and more
> clock data.  Perhaps DT is best suited to handle this bloat.  I broke
> the clock data out into a separate file so that it didn't overwhelm the
> existing omap4.dtsi.

I'm actually more concerned by run-time impact.  Any of_find_node_*()
call will possibly have to scan all those hundreds of nodes to find the
desired one.  Anyway, it's an OMAP folks decision, and the impact might
not be that much on those fast CPUs.

Shawn

> 
> Either way I marked this series as RFC precisely due to your point.  I
> want feedback on how the OMAP folks feel about this.  So far no has has
> NACKed it ;-)
