From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V2] ARM: dts: imx6q-logicpd: Reduce inrush current on
 start
Date: Thu, 11 Apr 2019 13:45:42 +0800
Message-ID: <20190411054541.GS26817@dragon>
References: <20190402191908.4306-1-aford173@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190402191908.4306-1-aford173@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, adam.ford@logicpd.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 02, 2019 at 02:19:08PM -0500, Adam Ford wrote:
> The main 3.3V regulator sources a series of additional regulators.
> This patch adds a small delay, so when the 3.3V regulator comes
> on it delays a bit before the subsequent regulators can come on.
> This reduces the inrush current a bit on the external DC power
> supply to help prevent a situation where the sourcing power supply
> cannot source enough current and overloads and the kit fails to
> start.
> 
> Fixes: 1c207f911fe9 ("ARM: dts: imx: Add support for Logic PD
> i.MX6QD EVM")
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>

Applied, thanks.
