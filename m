From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v3 2/6] clk: mvebu: Add the xtal clock for Armada 3700 SoC
Date: Mon, 15 Aug 2016 14:09:41 -0700
Message-ID: <20160815210941.GA361@codeaurora.org>
References: <1468935742-11218-1-git-send-email-gregory.clement@free-electrons.com>
 <1468935742-11218-3-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1468935742-11218-3-git-send-email-gregory.clement@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Nadav Haklai <nadavh@marvell.com>, Victor Gu <xigu@marvell.com>, Romain Perier <romain.perier@free-electrons.com>, Omri Itach <omrii@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, Hua Jing <jinghua@marvell.com>, Terry Zhou <bjzhou@marvell.com>
List-Id: devicetree@vger.kernel.org

On 07/19, Gregory CLEMENT wrote:
> This clock is the parent of all the Armada 3700 clocks. It is a fixed
> rate clock which depends on the gpio configuration read when resetting
> the SoC.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
