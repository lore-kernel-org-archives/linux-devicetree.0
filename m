From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v5 1/6] clk: add of_clk_get_parent_rate function
Date: Wed, 25 Feb 2015 14:09:51 -0800
Message-ID: <54EE482F.4010402@codeaurora.org>
References: <Ray Jui <rjui@broadcom.com> <1423097705-22939-1-git-send-email-rjui@broadcom.com> <1423097705-22939-2-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423097705-22939-2-git-send-email-rjui@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ray Jui <rjui@broadcom.com>, Mike Turquette <mturquette@linaro.org>, Matt Porter <mporter@linaro.org>, Alex Elder <elder@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Scott Branden <sbranden@broadcom.com>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazau <anatol@google.com>, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On 02/04/15 16:55, Ray Jui wrote:
> Sometimes a clock needs to know the rate of its parent before itself is
> registered to the framework. An example is that a PLL may need to
> initialize itself to a specific VCO frequency, before registering to the
> framework. The parent rate needs to be known, for PLL multipliers and
> divisors to be configured properly.
>
> Introduce helper function of_clk_get_parent_rate, which can be used to
> obtain the parent rate of a clock, given a device node and index.
>
> Signed-off-by: Ray Jui <rjui@broadcom.com>

Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
