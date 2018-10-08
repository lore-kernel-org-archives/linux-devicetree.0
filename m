From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] dt-bindings: misc: bk4: Add device tree binding for
 Liebherr's BK4 SPI bus
Date: Mon, 8 Oct 2018 22:43:52 +0800
Message-ID: <20181008144350.GS3587@dragon>
References: <20180927222655.24482-1-lukma@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180927222655.24482-1-lukma@denx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Majewski <lukma@denx.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 28, 2018 at 12:26:55AM +0200, Lukasz Majewski wrote:
> Add Device Tree binding document for Liebherr's BK4 external SPI bus.
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>

There should really be a patch series consisting of this one and spidev
change [1].

Since spidev has already been picked up, having a series including this
and dts change would be the second option.  With DT folks' ACK, I can
send bindings change together with DTS using it.

Shawn

[1] https://lkml.org/lkml/2018/9/28/48

> ---
>  Documentation/devicetree/bindings/misc/lwn-bk4.txt | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/lwn-bk4.txt
> 
> diff --git a/Documentation/devicetree/bindings/misc/lwn-bk4.txt b/Documentation/devicetree/bindings/misc/lwn-bk4.txt
> new file mode 100644
> index 000000000000..d6a8c188c087
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/lwn-bk4.txt
> @@ -0,0 +1,26 @@
> +* Liebherr's BK4 controller external SPI
> +
> +A device which handles data acquisition from compatible industrial
> +peripherals.
> +The SPI is used for data and management purposes in both master and
> +slave modes.
> +
> +Required properties:
> +
> +- compatible : Should be "lwn,bk4"
> +
> +Required SPI properties:
> +
> +- reg : Should be address of the device chip select within
> +  the controller.
> +
> +- spi-max-frequency : Maximum SPI clocking speed of device in Hz, should be
> +  30MHz at most for the Liebherr's BK4 external bus.
> +
> +Example:
> +
> +spidev0: spi@0 {
> +	compatible = "lwn,bk4";
> +	spi-max-frequency = <30000000>;
> +	reg = <0>;
> +};
> -- 
> 2.11.0
> 
