From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v4 1/3] clk: iproc: Extend binding to cover BCM63138
Date: Fri, 20 Nov 2015 15:48:24 -0800
Message-ID: <20151120234824.GC9555@codeaurora.org>
References: <1446168199-5959-1-git-send-email-f.fainelli@gmail.com>
 <1446168199-5959-2-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1446168199-5959-2-git-send-email-f.fainelli@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-clk@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, jonmason@broadcom.com, mturquette@baylibre.com, linux@arm.linux.org.uk, sbranden@broadcom.com, rjui@broadcom.com
List-Id: devicetree@vger.kernel.org

On 10/29, Florian Fainelli wrote:
> Broadcom BCM63138 DSL SoCs have the same ARMPLL clocking infrastructure
> as the Cygnus and iProc chips, add a dedicated compatible string and
> document that the ARMPLL node is a valid node for this chip.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---

Applied to clk-bcm63xx

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
