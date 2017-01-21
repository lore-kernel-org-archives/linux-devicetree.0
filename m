From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 3/8] clk: renesas: cpg-mssr: Rename
 cpg_mssr_priv.mstp_lock
Date: Fri, 20 Jan 2017 16:32:39 -0800
Message-ID: <20170121003239.GU20800@codeaurora.org>
References: <1484921306-9967-1-git-send-email-geert+renesas@glider.be>
 <1484921306-9967-4-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1484921306-9967-4-git-send-email-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 01/20, Geert Uytterhoeven wrote:
> The spinlock is used to protect Read-Modify-Write register accesses,
> which won't be limited to SMSTPCR register accesses.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
