From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V2 1/3] arm64: dts: imx8mq: Use correct clock for usdhc's
 ipg clk
Date: Mon, 14 Oct 2019 21:10:25 +0800
Message-ID: <20191014131023.GV12262@dragon>
References: <1570496145-11053-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1570496145-11053-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, leonard.crestez@nxp.com, daniel.lezcano@linaro.org, ping.bai@nxp.com, daniel.baluta@nxp.com, jun.li@nxp.com, abel.vesa@nxp.com, l.stach@pengutronix.de, andrew.smirnov@gmail.com, ccaione@baylibre.com, angus@akkea.ca, agx@sigxcpu.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On Tue, Oct 08, 2019 at 08:55:43AM +0800, Anson Huang wrote:
> On i.MX8MQ, usdhc's ipg clock is from IMX8MQ_CLK_IPG_ROOT,
> assign it explicitly instead of using IMX8MQ_CLK_DUMMY.
> 
> Fixes: 748f908cc882 ("arm64: add basic DTS for i.MX8MQ")
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied all, thanks.
