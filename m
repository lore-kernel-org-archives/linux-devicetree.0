From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 2/2] ARM: dts: imx7: add USDHC NAND and IPG clock to
 SDHC instances
Date: Mon, 15 May 2017 09:53:35 +0800
Message-ID: <20170515015334.GH8471@dragon>
References: <20170410210015.1620-1-stefan@agner.ch>
 <20170410210015.1620-2-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170410210015.1620-2-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: kernel@pengutronix.de, sboyd@codeaurora.org, aisheng.dong@nxp.com, fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 10, 2017 at 02:00:15PM -0700, Stefan Agner wrote:
> The USDHC instances need the USDHC NAND and IPG clock in order to
> operate. Reference them properly by replacing the dummy clocks with
> the actual clocks.
> 
> Note that both clocks are currently implicitly enabled since they
> are part of the i.MX 7 clock drivers init_on list. This might
> change in the future.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>

Applied, thanks.
