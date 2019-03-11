From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V4 1/3] dt-bindings: memory-controllers: freescale: add
 MMDC binding doc
Date: Mon, 11 Mar 2019 17:53:09 -0500
Message-ID: <20190311225309.GA32334@bogus>
References: <1551403185-16314-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1551403185-16314-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 01, 2019 at 01:24:18AM +0000, Anson Huang wrote:
> Freescale MMDC (Multi Mode DDR Controller) driver is supported
> since i.MX6Q, but not yet documented, this patch adds binding
> doc for MMDC module driver.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V3:
> 	- add i.MX6QP compatible name.
> ---
>  .../bindings/memory-controllers/fsl/mmdc.txt       | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/fsl/mmdc.txt
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/fsl/mmdc.txt b/Documentation/devicetree/bindings/memory-controllers/fsl/mmdc.txt
> new file mode 100644
> index 0000000..e4e0b50
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/fsl/mmdc.txt
> @@ -0,0 +1,33 @@
> +Freescale Multi Mode DDR controller (MMDC)
> +
> +Required properties :
> +- compatible : should be one of following:
> +	for i.MX6Q/i.MX6DL:
> +	- "fsl,imx6q-mmdc";
> +	for i.MX6QP:
> +	- "fsl,imx6qp-mmdc", "fsl,imx6q-mmdc";
> +	for i.MX6SL:
> +	- "fsl,imx6sl-mmdc", "fsl,imx6q-mmdc";
> +	for i.MX6SLL:
> +	- "fsl,imx6sll-mmdc", "fsl,imx6q-mmdc";
> +	for i.MX6SX:
> +	- "fsl,imx6sx-mmdc", "fsl,imx6q-mmdc";
> +	for i.MX6UL/i.MX6ULL/i.MX6ULZ:
> +	- "fsl,imx6ul-mmdc", "fsl,imx6q-mmdc";
> +	for i.MX7ULP:
> +	- "fsl,imx7ulp-mmdc", "fsl,imx6q-mmdc";
> +- reg : address and size of MMDC DDR controller registers
> +
> +Optional properties :
> +- clocks : the clock provided by the SoC to access the MMDC registers
> +
> +Example :
> +	mmdc0: memory-controller@21b0000 { /* MMDC0 */
> +		compatible = "fsl,imx6q-mmdc";
> +		reg = <0x021b0000 0x4000>;
> +		clocks = <&clks IMX6QDL_CLK_MMDC_P0_IPG>;
> +	}
> +
> +	mmdc1: memory-controller@21b4000 { /* MMDC1 */
> +		reg = <0x021b4000 0x4000>;

What is this node? No compatible here should be considered invalid.

Seems like maybe the 1st node should have 2 register ranges if you want 
a single device.

Rob
