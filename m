From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx: Fix the assigned-clock mismatch issue on
 imx6q/dl
Date: Mon, 14 Dec 2015 11:07:50 +0800
Message-ID: <20151214030750.GF25756@tiger>
References: <1449648955-30835-1-git-send-email-b51503@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1449648955-30835-1-git-send-email-b51503@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bai Ping <b51503@freescale.com>
Cc: kernel@pengutronix.de, mark.rutland@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 09, 2015 at 04:15:55PM +0800, Bai Ping wrote:
> The 'assigned-clock-parents' and 'assigned-clock-rates' list
> should corresponding to the 'assigned-clocks' property clock list.
> 
> Signed-off-by: Bai Ping <b51503@freescale.com>

Applied, thanks.
