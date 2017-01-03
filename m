From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 03/12] Document: dt: binding: imx: update clock doc
 for imx6sll
Date: Tue, 3 Jan 2017 11:48:25 -0600
Message-ID: <20170103174825.sbw5pjvejjm46mbm@rob-hp-laptop>
References: <1482832070-22668-1-git-send-email-ping.bai@nxp.com>
 <1482832070-22668-4-git-send-email-ping.bai@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1482832070-22668-4-git-send-email-ping.bai@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bai Ping <ping.bai@nxp.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, p.zabel@pengutronix.de, mturquette@baylibre.com, daniel.lezcano@linaro.org, sboyd@codeaurora.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, kernel@pengutronix.de, jacky.baip@gmail.com, fabio.estevam@nxp.com, tglx@linutronix.de, shawnguo@kernel.org, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 27, 2016 at 05:47:41PM +0800, Bai Ping wrote:
> Add clock binding doc uppdate for imx6sll.

s/uppdate/update/

> 
> Signed-off-by: Bai Ping <ping.bai@nxp.com>
> ---
>  .../devicetree/bindings/clock/imx6sll-clock.txt    | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/imx6sll-clock.txt
> 
> diff --git a/Documentation/devicetree/bindings/clock/imx6sll-clock.txt b/Documentation/devicetree/bindings/clock/imx6sll-clock.txt
> new file mode 100644
> index 0000000..3a46787
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/imx6sll-clock.txt
> @@ -0,0 +1,37 @@
> +* Clock bindings for Freescale i.MX6 SLL
> +
> +Required properties:
> +- compatible: Should be "fsl,imx6sll-ccm"
> +- reg: Address and length of the register set
> +- #clock-cells: Should be <1>
> +- clocks: list of clock specifiers, must contain an entry for each required
> +  entry in clock-names
> +- clock-names: should include entries "ckil", "osc", "ipp_di0" and "ipp_di1"
> +
> +The clock consumer should specify the desired clock by having the clock
> +ID in its "clocks" phandle cell.  See include/dt-bindings/clock/imx6sll-clock.h
> +for the full list of i.MX6 SLL clock IDs.
> +
> +Examples:
> +
> +#include <dt-bindings/clock/imx6sll-clock.h>
> +
> +clks: ccm@020c4000 {

Drop leading 0s.

> +		compatible = "fsl,imx6sll-ccm";
> +		reg = <0x020c4000 0x4000>;
> +		interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
> +		#clock-cells = <1>;
> +		clocks = <&ckil>, <&osc>, <&ipp_di0>, <&ipp_di1>;
> +		clock-names = "ckil", "osc", "ipp_di0", "ipp_di1";
> +};
> +
> +uart1: serial@02020000 {

ditto.

> +		compatible = "fsl,imx6sl-uart", "fsl,imx6q-uart", "fsl,imx21-uart";
> +		reg = <0x02020000 0x4000>;
> +		interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&clks IMX6SLL_CLK_UART1_IPG>,
> +			 <&clks IMX6SLL_CLK_UART1_SERIAL>;
> +		clock-names = "ipg", "per";
> +		status = "disabled";
> +};
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
