From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] devicetree: serial: Add documentation for imx serial
Date: Tue, 21 Aug 2012 13:27:27 -0500
Message-ID: <5033D30F.5060909@gmail.com>
References: <1345568699-31842-1-git-send-email-fabio.estevam@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1345568699-31842-1-git-send-email-fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/21/2012 12:04 PM, Fabio Estevam wrote:
> Add documentation for imx serial.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---

Applied for 3.7.

Rob

> Changes since v1:
> - Add 'alias' entry
>  .../devicetree/bindings/serial/fsl-imx-uart.txt    |   35 ++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/serial/fsl-imx-uart.txt
> 
> diff --git a/Documentation/devicetree/bindings/serial/fsl-imx-uart.txt b/Documentation/devicetree/bindings/serial/fsl-imx-uart.txt
> new file mode 100644
> index 0000000..c58573b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/serial/fsl-imx-uart.txt
> @@ -0,0 +1,35 @@
> +* Freescale i.MX UART controller
> +
> +Required properties:
> +- compatible : should be "fsl,imx21-uart"
> +- reg : Address and length of the register set for the device
> +- interrupts : Should contain UART interrupt number
> +
> +Optional properties:
> +- fsl,uart-has-rtscts: indicate that RTS/CTS signals are used
> +
> +Note: Each uart controller should have an alias correctly numbered
> +in "aliases" node.
> +
> +Example:
> +
> +- From imx51.dtsi:
> +aliases {
> +	serial0 = &uart1;
> +	serial1 = &uart2;
> +	serial2 = &uart3;
> +};
> +
> +uart1: serial@73fbc000 {
> +	compatible = "fsl,imx51-uart", "fsl,imx21-uart";
> +	reg = <0x73fbc000 0x4000>;
> +	interrupts = <31>;
> +	status = "disabled";
> +}
> +
> +- From imx51-babbage.dts:
> +uart1: serial@73fbc000 {
> +	fsl,uart-has-rtscts;
> +	status = "okay";
> +};
> +
> 
