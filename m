From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCHv5 2/2] Add a GPIO driver for Altera FPGA Manager Fabric I/O
Date: Tue, 31 Oct 2017 11:04:15 +0100
Message-ID: <CACRpkdaxh45e1V_xc6AdjmkAv12_AMuXb45+1b8nFOw3N3A3aA@mail.gmail.com>
References: <AM5PR0701MB26575D4E585B51AC8784E49BE4450@AM5PR0701MB2657.eurprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <AM5PR0701MB26575D4E585B51AC8784E49BE4450@AM5PR0701MB2657.eurprd07.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Bernd Edlinger <bernd.edlinger@hotmail.de>
Cc: Rob Herring <robh@kernel.org>, Christian Lamparter <chunkeey@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 26, 2017 at 5:28 PM, Bernd Edlinger
<bernd.edlinger@hotmail.de> wrote:

> This is an internal 32-bit input and 32-bit output port to the FPGA logic.
>
> Instantiate this in the device tree as:
>
>   gpio3: gpio@ff706010 {
>    #address-cells = <1>;
>    #size-cells = <0>;
>    compatible = "altr,fpgamgr-gpio";
>    reg = <0xff706010 0x8>;
>    status = "okay";
>
>    portd: gpio-controller@0 {
>     compatible = "altr,fpgamgr-gpio-output";
>     gpio-controller;
>     #gpio-cells = <2>;
>     reg = <0>;
>    };
>
>    porte: gpio-controller@1 {
>     compatible = "altr,fpgamgr-gpio-input";
>     gpio-controller;
>     #gpio-cells = <2>;
>     reg = <1>;
>    };
>   };
>
> Signed-off-by: Bernd Edlinger <bernd.edlinger@hotmail.de>
(...)
> +       err = bgpio_init(&port->bgc, gpio->dev, 4, dat, NULL, NULL,
> +                        NULL, NULL, pp->idx ? BGPIOF_NO_OUTPUT : 0);

Don't magically use the index to determine which block
us input-only.

Use the port-specific compatible string and match to
handle this using .data in the match.

Yours,
Linus Walleij
