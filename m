Return-Path: <robherring2@gmail.com>
Message-ID: <5baa1af1.1c69fb81.498e2.432d@mx.google.com>
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: himax,hx8837: add HiMax HX8837 bindings
References: <20180918204359.24894-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180918204359.24894-1-lkundrak@v3.sk>
Date: Mon, 24 Sep 2018 14:38:22 -0700
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Jens Frederich <jfrederich@gmail.com>, Daniel Drake <dsd@laptop.org>, Jon Nettleton <jon.nettleton@gmail.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Sep 18, 2018 at 10:43:58PM +0200, Lubomir Rintel wrote:
> HiMax HX8837 is a display controller used on OLPC platforms.
> It controlls backlight and is able to capture and freeze a frame when

s/controlls/controls/

> the LCD controller (and the rest of the plaform) is powered off.
> 
> What is missing here is the description of connections to the LCD
> controller and the panel. Maybe it would be a good idea to plug in it
> betweend the two in a manner described in
> <Documentation/devicetree/bindings/graph.txt>.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  .../devicetree/bindings/misc/himax,hx8837.txt  | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/himax,hx8837.txt
> 
> diff --git a/Documentation/devicetree/bindings/misc/himax,hx8837.txt b/Documentation/devicetree/bindings/misc/himax,hx8837.txt
> new file mode 100644
> index 000000000000..7ffcc516a1b4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/himax,hx8837.txt
> @@ -0,0 +1,18 @@
> +HX8837 Display Controller
> +
> +Required properties:
> +- compatible: Should be "himax,hx8837".
> +- reg: I2C address, must be 0x0d
> +- stat-gpios: gpio specifier of DCON_STAT0 and DCON_STAT1 pins (active high)
> +- load-gpio: gpio specifier of DCON_LOAD pin (active high)

load-gpios

> +- irq-gpio: gpio specifier of DCON_IRQ pin (active high)

You should use the interrupts binding instead.

> +
> +Example:
> +	dcon@d {
> +		compatible = "himax,hx8837";
> +		reg = <0x0d>;
> +		stat-gpios = <&gpio 100 GPIO_ACTIVE_HIGH
> +			      &gpio 101 GPIO_ACTIVE_HIGH>;
> +		load-gpio = <&gpio 142 GPIO_ACTIVE_HIGH>;
> +		irq-gpio = <&gpio 124 GPIO_ACTIVE_HIGH>;
> +	};
> -- 
> 2.17.1
> 
