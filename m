From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 1/2] clk: lpc32xx: add clock frequency output
 configuration
Date: Tue, 9 Feb 2016 10:57:23 -0800
Message-ID: <20160209185723.GC31947@codeaurora.org>
References: <1455043670-19025-1-git-send-email-slemieux.tyco@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1455043670-19025-1-git-send-email-slemieux.tyco@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: slemieux.tyco@gmail.com
Cc: robh+dt@kernel.org, mturquette@baylibre.com, stigge@antcom.de, vz@mleia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 02/09, slemieux.tyco@gmail.com wrote:
> From: Sylvain Lemieux <slemieux@tycoint.com>
> 
> This patch add the support to setup the clock frequency output
> using an optional parameter from the device tree.
> 
> The previous kernel version did not change the clock frequency
> output setup by the kickstart and/or bootloader;
> this version always setup the clock frequency output to 208MHz.
> 
> Signed-off-by: Sylvain Lemieux <slemieux@tycoint.com>
> ---

We have assigned-clock-rates, can you use that instead?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
