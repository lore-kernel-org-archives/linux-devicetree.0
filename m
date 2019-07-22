From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V5 2/5] arm64: Enable TIMER_IMX_SYS_CTR for ARCH_MXC
 platforms
Date: Mon, 22 Jul 2019 11:12:25 +0800
Message-ID: <20190722031224.GS3738@dragon>
References: <20190710063056.35689-1-Anson.Huang@nxp.com>
 <20190710063056.35689-2-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190710063056.35689-2-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson.Huang@nxp.com
Cc: catalin.marinas@arm.com, will@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, daniel.lezcano@linaro.org, tglx@linutronix.de, leonard.crestez@nxp.com, aisheng.dong@nxp.com, daniel.baluta@nxp.com, ping.bai@nxp.com, l.stach@pengutronix.de, abel.vesa@nxp.com, andrew.smirnov@gmail.com, ccaione@baylibre.com, angus@akkea.ca, agx@sigxcpu.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 10, 2019 at 02:30:53PM +0800, Anson.Huang@nxp.com wrote:
> From: Anson Huang <Anson.Huang@nxp.com>
> 
> ARCH_MXC platforms needs system counter as broadcast timer
> to support cpuidle, enable it by default.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

This one is identical to what I just picked up from v4 series, right?

Shawn
