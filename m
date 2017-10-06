From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 05/10] clk: bcm: Add Broadcom Hurricane 2 clock support
Date: Fri, 6 Oct 2017 13:06:33 -0700
Message-ID: <20171006200633.GI457@codeaurora.org>
References: <20170928231502.27069-1-f.fainelli@gmail.com>
 <20170928231502.27069-6-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170928231502.27069-6-f.fainelli@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, "maintainer:BROADCOM IPROC ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, Michael Turquette <mturquette@baylibre.com>, Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 09/28, Florian Fainelli wrote:
> Add support for the Broadcom Hurricane 2 SoC clock controller. We can
> re-use the existing iProc clock library since the SoC's architecture is
> largely the same as its predecessors. For now, we just initialize the
> iProc ARM PLL.
> 
> Acked-by: Jon Mason <jon.mason@broadcom.com>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
