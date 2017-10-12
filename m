From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 05/10] clk: bcm: Add Broadcom Hurricane 2 clock support
Date: Thu, 12 Oct 2017 11:31:47 -0700
Message-ID: <20171012183147.3473-1-f.fainelli@gmail.com>
References: <20170928231502.27069-1-f.fainelli@gmail.com> <20170928231502.27069-6-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170928231502.27069-6-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, 28 Sep 2017 16:14:57 -0700, Florian Fainelli <f.fainelli@gmail.com> wrote:
> Add support for the Broadcom Hurricane 2 SoC clock controller. We can
> re-use the existing iProc clock library since the SoC's architecture is
> largely the same as its predecessors. For now, we just initialize the
> iProc ARM PLL.
> 
> Acked-by: Jon Mason <jon.mason@broadcom.com>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---

Applied to drivers/next, thanks!
--
Florian
