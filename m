From: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: [PATCH 3/9] irq: convert generic-chip to use irq_domain
Date: Thu, 15 Dec 2011 13:25:20 +0800
Message-ID: <20111215052512.GB21815@S2101-09.ap.freescale.net>
References: <1323876538-20406-1-git-send-email-robherring2@gmail.com>
 <1323876538-20406-4-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1323876538-20406-4-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>, Kukjin Kim <kgene.kim@samsung.com>, Kevin Hilman <khilman@ti.com>, Tony Lindgren <tony@atomide.com>, Barry Song <baohua.song@csr.com>, Linus Walleij <linus.ml.walleij@gmail.com>, Rob Herring <rob.herring@calxeda.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 14, 2011 at 09:28:52AM -0600, Rob Herring wrote:
> From: Rob Herring <rob.herring@calxeda.com>
> 
> Add irq domain support to irq generic-chip. This enables users of
> generic-chip to support dynamic irq assignment needed for DT interrupt
> binding. Users must be converted to use irq_data.hwirq for determining
> local interrupt numbers rather than using the Linux irq number.
> 
> irq_base is kept for now as there are a few users of it. Once they
> are converted to use the irq domain, it can be removed.
> 
> Signed-off-by: Rob Herring <rob.herring@calxeda.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> ---

Tested-by: Shawn Guo <shawn.guo@linaro.org>

-- 
Regards,
Shawn
