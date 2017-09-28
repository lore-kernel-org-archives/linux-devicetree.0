From: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH 3/8] ARM: dts: aspeed: Add I2C buses
Date: Thu, 28 Sep 2017 11:35:33 -0700
Message-ID: <CAFd5g46LrdCkPq-dZyrA3Nnw28=r-sCsPvp5bWngYUF=3RmDYA@mail.gmail.com>
References: <20170928075149.8154-1-joel@jms.id.au> <20170928075149.8154-4-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170928075149.8154-4-joel@jms.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Joel Stanley <joel@jms.id.au>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>, Rick Altherr <raltherr@google.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 28, 2017 at 12:51 AM, Joel Stanley <joel@jms.id.au> wrote:
> Now with an upstream i2c bus driver, we can add  the 14 i2c buses that
> exist in ASPEED G4 and G5 generation SoCs.
>
> It also adds aliases for the 14 built-in I2C busses to ensure userspace
> sees the numbering staring from zero and counting up.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>

nit: can we make the i2c labels and the pinctrl labels match?

For example:

> +
> +       i2c13: i2c-bus@480 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               #interrupt-cells = <1>;
> +
> +               reg = <0x480 0x40>;
> +               compatible = "aspeed,ast2500-i2c-bus";
> +               clocks = <&clk_apb>;
> +               bus-frequency = <100000>;
> +               interrupts = <13>;
> +               interrupt-parent = <&i2c_ic>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c14_default>;
> +               status = "disabled";
> +       };

"i2c13" has a pinctrl-0 of "pinctrl_i2c14_default"

I know that pinctrl_i2c14_default is consistent with the function and
groups it uses, but I would like to see them all be consistent at some
point in the future.
