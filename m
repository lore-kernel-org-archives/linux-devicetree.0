From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCHv4 2/2] Add a GPIO driver for Altera FPGA Manager Fabric I/O
Date: Fri, 20 Oct 2017 10:10:16 +0200
Message-ID: <CACRpkdaSQRuEEpUC2=Z8K80vrrqbSfoCU4YUNJR+9vBXUgWRyA@mail.gmail.com>
References: <AM5PR0701MB26576FCB30CDCA6F989C9B80E4420@AM5PR0701MB2657.eurprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <AM5PR0701MB26576FCB30CDCA6F989C9B80E4420@AM5PR0701MB2657.eurprd07.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Bernd Edlinger <bernd.edlinger@hotmail.de>
Cc: Rob Herring <robh@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 19, 2017 at 6:29 PM, Bernd Edlinger
<bernd.edlinger@hotmail.de> wrote:

Does this really work?

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

So you have output-only and input-only ports....

> +static int fpgamgr_gpio_add_port(struct fpgamgr_gpio *gpio,
> +                                struct fpgamgr_port_property *pp,
> +                                unsigned int offs)
> +{
> +       struct fpgamgr_gpio_port *port;
> +       void __iomem *dat;
> +       int err;
> +
> +       port = &gpio->ports[offs];
> +       port->gpio = gpio;
> +       port->idx = pp->idx;
> +
> +       dat = gpio->regs + (pp->idx * 4);
> +
> +       err = bgpio_init(&port->bgc, gpio->dev, 4, dat, NULL, NULL,
> +                        NULL, NULL, 0);

But all you add is input-only GPIO chips. Also for the output ports.

Yours,
Linus Walleij
