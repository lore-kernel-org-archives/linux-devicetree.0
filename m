From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: nvmem: Add binding for RAVE SP
 EEPROM driver
Date: Mon, 16 Apr 2018 10:05:07 -0500
Message-ID: <20180416150507.2wm4s7opgr242v6a@rob-hp-laptop>
References: <20180411015948.19562-1-andrew.smirnov@gmail.com>
 <20180411015948.19562-2-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180411015948.19562-2-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-kernel@vger.kernel.org, Chris Healy <cphealy@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Aleksander Morgado <aleksander@aleksander.es>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 10, 2018 at 06:59:47PM -0700, Andrey Smirnov wrote:
> Add Device Tree bindings for RAVE SP EEPROM driver - an MFD cell of
> parent RAVE SP driver (documented in
> Documentation/devicetree/bindings/mfd/zii,rave-sp.txt).
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: linux-kernel@vger.kernel.org
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Aleksander Morgado <aleksander@aleksander.es>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  .../bindings/nvmem/zii,rave-sp-eeprom.txt          | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.txt
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.txt b/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.txt
> new file mode 100644
> index 000000000000..a4e838c30b67
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.txt
> @@ -0,0 +1,29 @@
> +Zodiac Inflight Innovations RAVE EEPROM Bindings
> +
> +RAVE SP EEPROM device is a "MFD cell" device exposing physical EEPROM
> +attached to RAVE Supervisory Processor. It is expected that its Device
> +Tree node is specified as a child of the node corresponding to the
> +parent RAVE SP device (as documented in
> +Documentation/devicetree/bindings/mfd/zii,rave-sp.txt)
> +
> +Required properties:
> +
> +- compatible: Should be "zii,rave-sp-eeprom"

Need to state somewhere this follows the bindings/nvmem/nvmem.txt 
binding.

> +
> +Example:
> +
> +	rave-sp {
> +		compatible = "zii,rave-sp-rdu1";
> +		current-speed = <38400>;
> +
> +		main-eeprom {

eeprom@a4

> +			compatible = "zii,rave-sp-eeprom";
> +			reg = <0xA4 0x4000>;

lowercase hex please.

> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			wdt_timeout: wdt-timeout@81 {
> +				reg = <0x81 2>;
> +			};
> +		};
> +	}
> -- 
> 2.14.3
> 
