From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v3 06/10] clk: iproc: Split off dig_filter
Date: Wed, 21 Oct 2015 17:04:36 -0700
Message-ID: <20151022000436.GT19782@codeaurora.org>
References: <1444938513-10758-1-git-send-email-jonmason@broadcom.com>
 <1444938513-10758-7-git-send-email-jonmason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1444938513-10758-7-git-send-email-jonmason@broadcom.com>
Sender: linux-clk-owner@vger.kernel.org
To: Jon Mason <jonmason@broadcom.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On 10/15, Jon Mason wrote:
> The PLL loop filter/gain can be located in a separate register on some
> SoCs.  Split these off into a separate variable, so that an offset can
> be added if necessary.  Also, make the necessary modifications to the
> Cygnus and NSP drivers for this change.
> 
> Signed-off-by: Jon Mason <jonmason@broadcom.com>
> ---

Applied to clk-iproc

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
