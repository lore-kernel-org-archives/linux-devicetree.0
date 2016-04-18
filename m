From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/2] ARM: dts: imx35: restore existing used clock
 enumeration
Date: Mon, 18 Apr 2016 12:39:49 +0800
Message-ID: <20160418043949.GV28903@tiger>
References: <1460669450-11729-1-git-send-email-akurz@blala.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1460669450-11729-1-git-send-email-akurz@blala.de>
Sender: linux-clk-owner@vger.kernel.org
To: Alexander Kurz <akurz@blala.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Philippe Reynes <tremyfr@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 14, 2016 at 11:30:49PM +0200, Alexander Kurz wrote:
> A new element got inserted into enum mx35_clks with commit 3713e3f5e927
> ("clk: imx35: define two clocks for rtc"). This insertion shifted most
> nummerical clock assignments to a new nummerical value which in turn
> rendered most hardcoded nummeric values in imx35.dtsi incorrect.
> 
> Restore the existing order by moving the newly introduced clock to the
> end of the enum. Update the dts documentation accordingly.
> 
> Signed-off-by: Alexander Kurz <akurz@blala.de>

Applied as a fix and Cc-ed stable, thanks.

Shawn
