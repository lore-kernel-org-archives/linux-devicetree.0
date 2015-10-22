From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v3 08/10] clk: ns2: add clock support for Broadcom
 Northstar 2 SoC
Date: Wed, 21 Oct 2015 17:25:16 -0700
Message-ID: <20151022002516.GW19782@codeaurora.org>
References: <1444938513-10758-1-git-send-email-jonmason@broadcom.com>
 <1444938513-10758-9-git-send-email-jonmason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1444938513-10758-9-git-send-email-jonmason@broadcom.com>
Sender: linux-clk-owner@vger.kernel.org
To: Jon Mason <jonmason@broadcom.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On 10/15, Jon Mason wrote:
> The Broadcom Northstar 2 SoC is architected under the iProc
> architecture. It has the following PLLs: GENPLL SCR, GENPLL SW,
> LCPLL DDR, LCPLL Ports, all derived from an onboard crystal.
> 
> Signed-off-by: Jon Mason <jonmason@broadcom.com>
> ---

Applied to clk-iproc

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
