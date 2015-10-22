From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v3 07/10] clk: iproc: Separate status and control
 variables
Date: Wed, 21 Oct 2015 17:04:52 -0700
Message-ID: <20151022000452.GU19782@codeaurora.org>
References: <1444938513-10758-1-git-send-email-jonmason@broadcom.com>
 <1444938513-10758-8-git-send-email-jonmason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1444938513-10758-8-git-send-email-jonmason@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Mason <jonmason@broadcom.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On 10/15, Jon Mason wrote:
> Some PLLs have separate registers for Status and Control.  The means the
> pll_base needs to be split into 2 new variables, so that those PLLs can
> specify device tree registers for those independently.  Also, add a new
> driver flag to identify this presence of the split, and let the driver
> know that additional registers need to be used.
> 
> Signed-off-by: Jon Mason <jonmason@broadcom.com>
> ---

Applied to clk-iproc

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
