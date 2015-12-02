From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/3] clk: imx: Add a virtual arm clk on i.mx7d
Date: Wed, 2 Dec 2015 13:40:19 +0800
Message-ID: <20151202054019.GF692@tiger>
References: <1448360716-1741-1-git-send-email-b51503@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1448360716-1741-1-git-send-email-b51503@freescale.com>
Sender: linux-clk-owner@vger.kernel.org
To: Bai Ping <b51503@freescale.com>
Cc: kernel@pengutronix.de, l.stach@pengutronix.de, robh+dt@kernel.org, pawel.moll@arm.com, mturquette@baylibre.com, sboyd@codeaurora.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 24, 2015 at 06:25:14PM +0800, Bai Ping wrote:
> Add a virtual arm clk to abstract the actual steps
> when changing the ARM core frequency.So we can using
> the 'cpufreq-dt' driver on i.MX7D/Solo.
> 
> Signed-off-by: Bai Ping <b51503@freescale.com>

Applied all, thanks.
