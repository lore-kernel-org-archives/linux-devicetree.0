From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 2/4] dt-bindings: mailbox: provide imx-mailbox
 documentation
Date: Tue, 12 Jun 2018 13:41:42 -0600
Message-ID: <20180612194142.GA16521@rob-hp-laptop>
References: <20180601065821.28234-1-o.rempel@pengutronix.de>
 <20180601065821.28234-3-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180601065821.28234-3-o.rempel@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 01, 2018 at 08:58:19AM +0200, Oleksij Rempel wrote:
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  .../bindings/mailbox/imx-mailbox.txt          | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/imx-mailbox.txt
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/imx-mailbox.txt b/Documentation/devicetree/bindings/mailbox/imx-mailbox.txt
> new file mode 100644
> index 000000000000..a45604b33039
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/imx-mailbox.txt
> @@ -0,0 +1,35 @@
> +i.MX Messaging Unit
> +===================
> +
> +The i.MX Messaging Unit (MU) contains two register sets: "A" and "B". In most cases
> +they are accessible from all Processor Units. On one hand, at least for mailbox functionality,
> +it makes no difference which application or processor is using which set of the MU. On

Please wrap lines correctly (<80).

> +other hand, the register sets for each of the MU parts are not identical.
> +
> +Required properties:
> +- compatible :	Shell be one of:
> +                    "fsl,imx7s-mu-a" and "fsl,imx7s-mu-b" for i.MX7S or i.MX7D
> +- reg : 	physical base address of the mailbox and length of

Mix of space and tab.

> +		memory mapped region.
> +- #mbox-cells:	Common mailbox binding property to identify the number
> +		of cells required for the mailbox specifier. Should be 1.
> +- interrupts :	interrupt number. The interrupt specifier format
> +		depends on the interrupt controller parent.

Just need to say how many interrupts and what they are if more than 1.

> +- clocks     :  phandle to the input clock.
> +
> +Example:
> +	mu0a: mu@30aa0000 {

mailbox@...

> +		compatible = "fsl,imx7s-mu-a";
> +		reg = <0x30aa0000 0x28>;
> +		interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&clks IMX7D_MU_ROOT_CLK>;
> +		#mbox-cells = <1>;
> +	};
> +
> +	mu0b: mu@30ab0000 {

mailbox@...

> +		compatible = "fsl,imx7s-mu-b";
> +		reg = <0x30ab0000 0x28>;
> +		interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&clks IMX7D_MU_ROOT_CLK>;
> +		#mbox-cells = <1>;
> +	};
> -- 
> 2.17.1
> 
