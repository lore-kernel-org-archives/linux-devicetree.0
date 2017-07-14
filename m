From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] dt-bindings: mfd: Add bindings for ZII RAVE devices
Date: Fri, 14 Jul 2017 10:51:53 -0500
Message-ID: <20170714155153.ytt2iblkfz626oza@rob-hp-laptop>
References: <20170710170449.4544-1-andrew.smirnov@gmail.com>
 <20170710170449.4544-3-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170710170449.4544-3-andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cphealy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nikita Yushchenko <nikita.yoush-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 10, 2017 at 10:04:49AM -0700, Andrey Smirnov wrote:
> Cc: cphealy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> Cc: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Cc: Nikita Yushchenko <nikita.yoush-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../devicetree/bindings/mfd/zii,rave-sp.txt        | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/zii,rave-sp.txt b/Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
> new file mode 100644
> index 0000000..53192f9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
> @@ -0,0 +1,40 @@
> +Zodiac Inflight Innovations RAVE Supervisory Processor
> +
> +RAVE Supervisory Processor communicates with SoC over UART and is
> +presented to the kernel as a "serdev". It is expected that its

Drop the "and is ..." part. That's a kernel detail and not part of the 
binding. With that,

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> +device-tree node is specified as a child of a node corresponding to
> +UART controller used for communication.
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
> -- 
> 2.9.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
