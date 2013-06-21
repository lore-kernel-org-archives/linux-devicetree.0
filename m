From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCHv2 06/11] CLK: omap: move part of the machine specific
 clock header contents to driver
Date: Fri, 21 Jun 2013 00:32:50 -0700
Message-ID: <20130621073250.GO5523@atomide.com>
References: <1371647942-4811-1-git-send-email-t-kristo@ti.com>
 <1371647942-4811-7-git-send-email-t-kristo@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-omap-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1371647942-4811-7-git-send-email-t-kristo@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: Tero Kristo <t-kristo@ti.com>
Cc: linux-omap@vger.kernel.org, mturquette@linaro.org, paul@pwsan.com, nm@ti.com, rnayak@ti.com, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [130619 06:25]:
> Some of the clock.h contents are needed by the new OMAP clock driver,
> including dpll_data and clk_hw_omap. Thus, move these to the generic
> omap header file which can be accessed by the driver.

Do you mean "are only needed by the new OMAP clock driver"?

Otherwise it sounds like this will break things for other
omaps that don't yet have clocks configured in DT..

Regards,

Tony
