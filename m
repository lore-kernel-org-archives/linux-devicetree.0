From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH RFC 0/3] clk: dt: bindings for mux & divider clocks
Date: Fri, 7 Jun 2013 13:51:31 +0800
Message-ID: <20130607055128.GA20780@S2101-09.ap.freescale.net>
References: <1370281990-15090-1-git-send-email-mturquette@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1370281990-15090-1-git-send-email-mturquette@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Mike,

On Mon, Jun 03, 2013 at 10:53:07AM -0700, Mike Turquette wrote:
> I am using this code while converting the OMAP4 clock data over to DT

I see these basic clk bindings can be useful for platforms that have
a relatively simple clock tree, but I'm a little surprised that you plan
to move OMAP4 to it.  I'm wondering how many nodes you will have to add
to OMAP4 device tree.  For imx6q example, it means ~200 nodes addition
to device tree, which is obviously a bloating of device tree.

Shawn

> and some common boilerplate code can be factored out of several clock
> drivers if this is merged.
