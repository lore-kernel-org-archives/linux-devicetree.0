From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V3] ARM: dts: imx: Add support for Logic PD i.MX6QD EVM
Date: Mon, 11 Feb 2019 14:11:57 +0800
Message-ID: <20190211061155.GO22487@dragon>
References: <20190210205723.15708-1-aford173@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190210205723.15708-1-aford173@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Feb 10, 2019 at 02:57:23PM -0600, Adam Ford wrote:
> The EVM consists of a system on module (SOM) and baseboard, and LCD.
> This patch adds a DTSI file for the SOM and baseboard separately,
> then a wrapper to combine them and specify processor type and a
> LCD information.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>

Applied, thanks.
