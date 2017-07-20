From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: mfd: Add bindings for ZII RAVE
 devices
Date: Thu, 20 Jul 2017 10:04:46 +0100
Message-ID: <20170720090446.gk5xxdimfrgj3tll@dell>
References: <20170718175604.11735-1-andrew.smirnov@gmail.com>
 <20170718175604.11735-3-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170718175604.11735-3-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: linux-kernel@vger.kernel.org, cphealy@gmail.com, Lucas Stach <l.stach@pengutronix.de>, Nikita Yushchenko <nikita.yoush@cogentembedded.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Where is patch 1?

> Cc: cphealy@gmail.com
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: devicetree@vger.kernel.org
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  .../devicetree/bindings/mfd/zii,rave-sp.txt        | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/zii,rave-sp.txt b/Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
> new file mode 100644
> index 000000000000..61d9105ded07
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
> @@ -0,0 +1,39 @@
> +Zodiac Inflight Innovations RAVE Supervisory Processor
> +
> +RAVE Supervisory Processor communicates with SoC over UART. It is
> +expected that its device-tree node is specified as a child of a node

Nit: Device Tree

Once fixed, please apply my:

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

> +corresponding to UART controller used for communication.
> +
> +Required parent device properties:
> +
> + - compatible: Should be one of:
> +	- "zii,rave-sp-niu"
> +	- "zii,rave-sp-mezz"
> +	- "zii,rave-sp-esb"
> +	- "zii,rave-sp-rdu1"
> +	- "zii,rave-sp-rdu2"
> +
> + - current-speed: Should be set to baud rate SP device is using
> +
> +RAVE SP consists of the following sub-devices:
> +
> +Device				 Description
> +------				 -----------
> +rave-sp-wdt			: Watchdog
> +rave-sp-nvmem			: Interface to onborad EEPROM
> +rave-sp-backlight		: Display backlight
> +rave-sp-hwmon			: Interface to onboard hardware sensors
> +rave-sp-leds			: Interface to onboard LEDs
> +rave-sp-input			: Interface to onboard power button
> +
> +Example of usage:
> +
> +	rdu {
> +		compatible = "zii,rave-sp-rdu2";
> +		current-speed = <1000000>;
> +
> +		watchdog {
> +			compatible = "zii,rave-sp-watchdog";
> +		};
> +	};
> +

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
