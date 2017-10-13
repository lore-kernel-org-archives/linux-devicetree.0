From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCHv3 1/2] Add device tree bindings for Altera FPGA Manager
 GPIO
Date: Fri, 13 Oct 2017 15:06:09 -0500
Message-ID: <20171013200609.x6cjol7a57eypohl@rob-hp-laptop>
References: <AM5PR0701MB2657FDDE2E0CE80D0EECB4B3E4770@AM5PR0701MB2657.eurprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AM5PR0701MB2657FDDE2E0CE80D0EECB4B3E4770@AM5PR0701MB2657.eurprd07.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Bernd Edlinger <bernd.edlinger@hotmail.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, Oct 08, 2017 at 11:30:27AM +0000, Bernd Edlinger wrote:
> These are the bindings for the gpio-altera-fpgamgr driver.

Bindings are for h/w devices, not drivers.

> 
> Signed-off-by: Bernd Edlinger <bernd.edlinger@hotmail.de>
> ---
>  .../bindings/gpio/gpio-altera-fpgamgr.txt          | 45 ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-altera-fpgamgr.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-altera-fpgamgr.txt b/Documentation/devicetree/bindings/gpio/gpio-altera-fpgamgr.txt
> new file mode 100644
> index 0000000..7e9434f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-altera-fpgamgr.txt
> @@ -0,0 +1,45 @@
> +Altera FPGA Manager GPIO controller bindings
> +
> +Required controller properties:
> +- #address-cells : Should be 1
> +- #size-cells : Should be 0
> +- compatible:
> +  - "altr,fpgamgr-gpio"

Seems kind of generic. Only 1 implementation of h/w?

> +- reg: Physical base address and length of the controller's registers.
> +- status : "okay" or "disabled".

No need to document status.

> +
> +The FPGA Manager has two 32-bit ports, one for input and one for output.

This sounds more like a system control/status register to tie off all 
the leftover signals than a GPIO block. Linus likely has some opinions 
on that.

> +
> +Port properties:
> +- compatible:
> +  - "altr,fpgamgr-gpio-output"
> +  - "altr,fpgamgr-gpio-input"
> +- #gpio-cells : Should be 2
> +  - The first cell is the gpio offset number.
> +  - The second cell is reserved and is currently unused.
> +- gpio-controller : Marks the device node as a GPIO controller.
> +- reg : Port number, 0 for output, 1 for input.
> +
> +Example:
> +
> +gpio3: gpio@ff706010 {
> +  #address-cells = <1>;
> +  #size-cells = <0>;
> +  compatible = "altr,fpgamgr-gpio";
> +  reg = <0xff706010 0x8>;
> +  status = "okay";
> +
> +  portd: gpio-controller@0 {
> +    compatible = "altr,fpgamgr-gpio-output";
> +    gpio-controller;
> +    #gpio-cells = <2>;
> +    reg = <0>;
> +  };
> +
> +  porte: gpio-controller@1 {
> +    compatible = "altr,fpgamgr-gpio-input";
> +    gpio-controller;
> +    #gpio-cells = <2>;
> +    reg = <1>;
> +  };

These child nodes don't really add anything. Can't you just define the 
controller has 64 lines with the 1st 32 being outputs.

Rob
