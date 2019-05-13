From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 1/4] dt-bindings: fsl: scu: add ocotp binding
Date: Mon, 13 May 2019 16:05:30 -0500
Message-ID: <20190513210530.GA30749@bogus>
References: <20190508030927.16668-1-peng.fan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190508030927.16668-1-peng.fan@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "van.freenix@gmail.com" <van.freenix@gmail.com>, Peng Fan <peng.fan@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Anson Huang <anson.huang@nxp.com>
List-Id: devicetree@vger.kernel.org

On Wed, 8 May 2019 02:56:02 +0000, Peng Fan wrote:
> NXP i.MX8QXP is an ARMv8 SoC with a Cortex-M4 core inside as
> system controller(SCU), the ocotp controller is being controlled
> by the SCU, so Linux need use RPC to SCU for ocotp handling. This
> patch adds binding doc for i.MX8 SCU OCOTP driver.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Aisheng Dong <aisheng.dong@nxp.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Anson Huang <anson.huang@nxp.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> 
> V2:
>  Move OCOTP to end, add example, add "scu"
> 
>  .../devicetree/bindings/arm/freescale/fsl,scu.txt  | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
