From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v3 2/4] clk: bcm2835: Add binding docs for the new
 platform clock driver.
Date: Thu, 1 Oct 2015 17:13:17 -0700
Message-ID: <20151002001317.GC1213@codeaurora.org>
References: <1443475325-22270-1-git-send-email-eric@anholt.net>
 <1443475325-22270-2-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1443475325-22270-2-git-send-email-eric@anholt.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Anholt <eric@anholt.net>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Mike Turquette <mturquette@baylibre.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 09/28, Eric Anholt wrote:
> Previously we've only supported a few fixed clocks based on
> assumptions about how the firmware sets up the clocks, but this
> binding will let us control the actual (audio power domain) clock
> manager.
> 
> Signed-off-by: Eric Anholt <eric@anholt.net>
> Acked-by: Stephen Warren <swarren@wwwdotorg.org>
> ---

Applied to clk-bcm2385 and merged into clk-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
