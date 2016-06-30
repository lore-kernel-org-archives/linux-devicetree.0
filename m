From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH/RFC v3 00/22] soc: renesas: Add R-Car RST driver for
 obtaining mode pin state
Date: Thu, 30 Jun 2016 13:14:08 -0700
Message-ID: <20160630201407.GA27880@codeaurora.org>
References: <1464808880-343-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1464808880-343-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, Dirk Behme <dirk.behme@de.bosch.com>, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/01, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> Currently the R-Car Clock Pulse Generator (CPG) drivers obtains the
> state of the mode pins either by a call from the board code, or directly
> by using a hardcoded register access. This is a bit messy, and creates a
> dependency between driver and platform code.
> 
> This RFC patch series converts the various Renesas R-Car clock drivers
> and support code from reading the mode pin states using a hardcoded
> register access to using a new R-Car RST driver.

Dumb question, can we use the nvmem reading APIs instead of an
SoC specific function to read the modes?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
