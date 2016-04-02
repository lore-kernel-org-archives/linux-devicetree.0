From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v4 1/5] clk: unconditionally recurse into clk/mvebu/
Date: Fri, 1 Apr 2016 18:25:58 -0700
Message-ID: <20160402012558.GC18567@codeaurora.org>
References: <1459070777-18049-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1459070777-18049-2-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1459070777-18049-2-git-send-email-thomas.petazzoni@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Hanna Hawa <hannah@marvell.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 03/27, Thomas Petazzoni wrote:
> The drivers/clk/mvebu directory is only being built when
> CONFIG_PLAT_ORION=y. As we are going to support additional mvebu
> platforms in drivers/clk/mvebu, which don't have CONFIG_PLAT_ORION=y,
> we need to recurse into this directory regardless of the value of
> CONFIG_PLAT_ORION.
> 
> Since all files in drivers/clk/mvebu/ are already conditionally
> compiled depending on various Kconfig options, we can recurse
> unconditionally into drivers/clk/mvebu without any other change.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
