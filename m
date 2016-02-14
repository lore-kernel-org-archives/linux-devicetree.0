From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V3 1/5] clk: imx: Add clock support for imx6qp
Date: Sun, 14 Feb 2016 11:21:03 +0800
Message-ID: <20160214032103.GD6756@tiger>
References: <1454407298-15545-1-git-send-email-ping.bai@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1454407298-15545-1-git-send-email-ping.bai@nxp.com>
Sender: linux-clk-owner@vger.kernel.org
To: Bai Ping <ping.bai@nxp.com>
Cc: kernel@pengutronix.de, pawel.moll@arm.com, robh+dt@kernel.org, mturquette@baylibre.com, sboyd@codeaurora.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, jacky.baip@gmail.com
List-Id: devicetree@vger.kernel.org

On Tue, Feb 02, 2016 at 06:01:34PM +0800, Bai Ping wrote:
> most of the clock tree structures on i.MX6 Quad Plus are
> same as on i.MX6Q. there still some differences between
> these two SOCs. compared to the i.XM6Q, the differents of
> clocks on i.MX6QP is mainly on:
> 
> 1. New clock gate added to support the PRE and PRG modules
> 2. 24MHz OSC clock option added to the UART, IPG, ECSPI, and
>    CAN clock roots.
> 3. MMDC channel 1 clock gate is now controllable.
> 4. clock gating added to the LDB_DIx_IPU clocks on i.MX6QP
> 5. EMI clock root divider fix
> 6. other updates fo CSCMRx, CSCDRx and CS2CDR registers.
> 
> detailed infomation, please refer to the i.MX6QP RM.
> 
> Signed-off-by: Bai Ping <ping.bai@nxp.com>

Applied all, thanks.
