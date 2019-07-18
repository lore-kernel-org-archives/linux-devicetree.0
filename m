From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V2 1/2] arm64: dts: imx8mm: Correct OPP table according
 to latest datasheet
Date: Thu, 18 Jul 2019 16:03:57 +0800
Message-ID: <20190718080356.GL3738@dragon>
References: <20190629102157.8026-1-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190629102157.8026-1-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson.Huang@nxp.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, leonard.crestez@nxp.com, viresh.kumar@linaro.org, ping.bai@nxp.com, daniel.baluta@nxp.com, l.stach@pengutronix.de, abel.vesa@nxp.com, andrew.smirnov@gmail.com, ccaione@baylibre.com, angus@akkea.ca, agx@sigxcpu.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On Sat, Jun 29, 2019 at 06:21:56PM +0800, Anson.Huang@nxp.com wrote:
> From: Anson Huang <Anson.Huang@nxp.com>
> 
> According to latest datasheet (Rev.0.2, 04/2019) from below links,
> 1.8GHz is ONLY available for consumer part, so the market segment
> bits for 1.8GHz opp should ONLY available for consumer part accordingly.
> 
> https://www.nxp.com/docs/en/data-sheet/IMX8MMIEC.pdf
> https://www.nxp.com/docs/en/data-sheet/IMX8MMCEC.pdf
> 
> Fixes: f403a26c865b (arm64: dts: imx8mm: Add cpu speed grading and all OPPs)
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied both, thanks.
