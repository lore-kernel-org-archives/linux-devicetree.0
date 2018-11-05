From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 bus+gpio 4/4] dt-bindings: gpio: Document GPIOs via
 Moxtet bus
Date: Mon, 5 Nov 2018 16:14:46 -0600
Message-ID: <20181105221446.GA825@bogus>
References: <20181102103539.6077-1-marek.behun@nic.cz>
 <20181102103539.6077-4-marek.behun@nic.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181102103539.6077-4-marek.behun@nic.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc: Linus Walleij <linus.walleij@linaro.org>, Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 02, 2018 at 11:35:39AM +0100, Marek Behún wrote:
> This patch adds documentation of the device tree bindings for GPIOs
> on the devices connected via Moxtet bus.
> 
> Signed-off-by: Marek Behún <marek.behun@nic.cz>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../devicetree/bindings/gpio/gpio-moxtet.txt   | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-moxtet.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-moxtet.txt b/Documentation/devicetree/bindings/gpio/gpio-moxtet.txt
> new file mode 100644
> index 000000000000..7e9b5770585d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-moxtet.txt
> @@ -0,0 +1,18 @@
> +Turris Mox Moxtet GPIO expander via Moxtet bus
> +
> +Required properties:
> + - compatible		: Should be "cznic,moxtet-gpio".
> + - gpio-controller	: Marks the device node as a GPIO controller.
> + - #gpio-cells		: Should be two. For consumer use see gpio.txt.
> +
> +Other properties are required for a Moxtet bus device, please refer to
> +Documentation/devicetree/bindings/bus/moxtet.txt.
> +
> +Example:
> +
> +	moxtet_sfp: moxtet-sfp@0 {

gpio@0

> +		compatible = "cznic,moxtet-gpio";
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		reg = <0>;
> +	}
> -- 
> 2.18.1
> 
