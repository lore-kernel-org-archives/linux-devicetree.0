From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC 1/2] dt-bindings: imx-ocotp: Add fusable-node property
Date: Thu, 13 Jun 2019 17:00:55 -0600
Message-ID: <20190613230055.GA19296@bogus>
References: <20190520032020.7920-1-peng.fan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190520032020.7920-1-peng.fan@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peng Fan <peng.fan@nxp.com>
Cc: "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 20, 2019 at 03:06:35AM +0000, Peng Fan wrote:
> Introduce fusable-node property for i.MX OCOTP driver.
> The property will only be used by Firmware(eg. U-Boot) to
> runtime disable the nodes.
> 
> Take i.MX6ULL for example, there are several parts that only
> have limited modules enabled controlled by OCOTP fuse. It is
> not flexible to provide several dts for the serval parts, instead
> we could provide one device tree and let Firmware to runtime disable
> the device tree nodes for those modules that are disable(fused).
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> 
> Currently NXP vendor use U-Boot to set status to disabled for devices
> that could not function,
> https://source.codeaurora.org/external/imx/uboot-imx/tree/arch/arm/mach-imx/mx6/module_fuse.c?h=imx_v2018.03_4.14.98_2.0.0_ga#n149
> But this approach is will not work if kernel dts node path changed.

Why would the path change? The DT should be stable.

Rob
