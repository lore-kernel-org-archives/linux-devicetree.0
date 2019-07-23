From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/3] clk: imx8: Add DSP related clocks
Date: Tue, 23 Jul 2019 15:59:34 +0800
Message-ID: <20190723075933.GN15632@dragon>
References: <20190718151346.3523-1-daniel.baluta@nxp.com>
 <20190718151346.3523-2-daniel.baluta@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190718151346.3523-2-daniel.baluta@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, shengjiu.wang@nxp.com, paul.olaru@nxp.com, aisheng.dong@nxp.com, leonard.crestez@nxp.com, anson.huang@nxp.com, peng.fan@nxp.com, Frank.Li@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 18, 2019 at 06:13:44PM +0300, Daniel Baluta wrote:
> i.MX8QXP contains Hifi4 DSP. There are four clocks
> associated with DSP:
>   * dsp_lpcg_core_clk
>   * dsp_lpcg_ipg_clk
>   * dsp_lpcg_adb_aclk
>   * ocram_lpcg_ipg_clk
> 
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>

I already picked this one up, so you do not need to include it in the
series any more.

Shawn
