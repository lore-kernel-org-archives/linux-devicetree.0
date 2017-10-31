From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCHv5 1/2] Add device tree bindings for Altera FPGA Manager GPIO
Date: Tue, 31 Oct 2017 11:06:01 +0100
Message-ID: <CACRpkdZb4_pyvDE0UfO+54LKMa1eLvszYzicPknmUmAHPjRzrw@mail.gmail.com>
References: <AM5PR0701MB2657C7D3D62759DCFCF65048E4450@AM5PR0701MB2657.eurprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <AM5PR0701MB2657C7D3D62759DCFCF65048E4450@AM5PR0701MB2657.eurprd07.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Bernd Edlinger <bernd.edlinger@hotmail.de>
Cc: Rob Herring <robh@kernel.org>, Christian Lamparter <chunkeey@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 26, 2017 at 5:28 PM, Bernd Edlinger
<bernd.edlinger@hotmail.de> wrote:

> Signed-off-by: Bernd Edlinger <bernd.edlinger@hotmail.de>
> ---
>  .../bindings/gpio/gpio-altera-fpgamgr.txt          | 43 ++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-altera-fpgamgr.txt
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-altera-fpgamgr.txt b/Documentation/devicetree/bindings/gpio/gpio-altera-fpgamgr.txt
> new file mode 100644
> index 0000000..6e2ad47
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-altera-fpgamgr.txt
> @@ -0,0 +1,43 @@
> +Altera FPGA Manager GPIO controller bindings
> +
> +Required controller properties:
> +- #address-cells : Should be 1
> +- #size-cells : Should be 0
> +- compatible:
> +  - "altr,fpgamgr-gpio"
> +- reg: Physical base address and length of the controller's registers.
> +
> +The FPGA Manager has two 32-bit ports, one for input and one for output.
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

Don't do this. Create one device using a compatible
for each port. Do not create a top-level device containing
the two ports.

If you anyway want a top level device, use "simple-bus"
or something, not "altr,fpgamgr-gpio".

Only two compatibles/devices:
> +  - "altr,fpgamgr-gpio-output"
> +  - "altr,fpgamgr-gpio-input"


Yours,
Linus Walleij
