From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: fsl: scu: Update RTC compatible string
Date: Mon, 8 Jul 2019 20:28:51 -0600
Message-ID: <20190709022851.GA28421@bogus>
References: <20190611063333.48501-1-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190611063333.48501-1-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson.Huang@nxp.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, a.zummo@towertech.it, alexandre.belloni@bootlin.com, aisheng.dong@nxp.com, ulf.hansson@linaro.org, peng.fan@nxp.com, daniel.baluta@nxp.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On Tue, 11 Jun 2019 14:33:31 +0800, Anson.Huang@nxp.com wrote:
> From: Anson Huang <Anson.Huang@nxp.com>
> 
> Update RTC compatible string to make system controller RTC
> driver more generic for all i.MX SoCs with system controller
> inside.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> This patch should be based on below patch which is already picked by
> watchdog maintainer:
> https://patchwork.kernel.org/patch/10962183/
> ---
>  Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
