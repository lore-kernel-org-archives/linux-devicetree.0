From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v5 1/6] clk: add of_clk_get_parent_rate function
Date: Thu, 26 Feb 2015 06:54:06 +0100
Message-ID: <20150226055406.GB28214@pengutronix.de>
References: <rjui@broadcom.com>
 <1423097705-22939-1-git-send-email-rjui@broadcom.com>
 <1423097705-22939-2-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1423097705-22939-2-git-send-email-rjui@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ray Jui <rjui@broadcom.com>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Matt Porter <mporter@linaro.org>, Alex Elder <elder@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Scott Branden <sbranden@broadcom.com>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazau <anatol@google.com>, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

Hi Ray,

On Wed, Feb 04, 2015 at 04:55:00PM -0800, Ray Jui wrote:
> Sometimes a clock needs to know the rate of its parent before itself is
> registered to the framework. An example is that a PLL may need to
> initialize itself to a specific VCO frequency, before registering to the
> framework. The parent rate needs to be known, for PLL multipliers and
> divisors to be configured properly.
> 
> Introduce helper function of_clk_get_parent_rate, which can be used to
> obtain the parent rate of a clock, given a device node and index.

I can't see how this patch helps you. First it's not guaranteed that
the parent is already registered, what do you do in this case?
Then the clock framework doesn't require that you initialize the PLL
before registering. That can be done in the clk ops later.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
