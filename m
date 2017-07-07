From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/4] [media] rc: pwm-ir-tx: add new driver
Date: Fri, 7 Jul 2017 08:59:28 -0500
Message-ID: <20170707135928.6cs6vx7z6lj3birp@rob-hp-laptop>
References: <cover.1498992850.git.sean@mess.org>
 <88fa0219db3388fad7bcc7b20cf30dd41e763aee.1498992850.git.sean@mess.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <88fa0219db3388fad7bcc7b20cf30dd41e763aee.1498992850.git.sean-hENCXIMQXOg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Young <sean-hENCXIMQXOg@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Ivaylo Dimitrov <ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Timo Kokkonen <timo.t.kokkonen-X3B1VOXEql0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jul 02, 2017 at 12:06:13PM +0100, Sean Young wrote:
> This is new driver which uses pwm, so it is more power-efficient
> than the bit banging gpio-ir-tx driver.
> 
> Signed-off-by: Sean Young <sean-hENCXIMQXOg@public.gmane.org>
> ---
>  .../devicetree/bindings/leds/irled/pwm-ir-tx.txt   |  13 ++

Please make this a separate patch.

>  drivers/media/rc/Kconfig                           |  12 ++
>  drivers/media/rc/Makefile                          |   1 +
>  drivers/media/rc/pwm-ir-tx.c                       | 165 +++++++++++++++++++++
>  4 files changed, 191 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/irled/pwm-ir-tx.txt
>  create mode 100644 drivers/media/rc/pwm-ir-tx.c
> 
> diff --git a/Documentation/devicetree/bindings/leds/irled/pwm-ir-tx.txt b/Documentation/devicetree/bindings/leds/irled/pwm-ir-tx.txt
> new file mode 100644
> index 0000000..6887a71
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/irled/pwm-ir-tx.txt
> @@ -0,0 +1,13 @@
> +Device tree bindings for IR LED connected through pwm pin which is used as
> +IR transmitter.
> +
> +Required properties:
> +- compatible: should be "pwm-ir-tx".
> +- pwms : PWM property to point to the PWM device (phandle)/port (id) and to
> +  specify the period time to be used: <&phandle id period_ns>;
> +
> +Example:
> +	irled {
> +		compatible = "pwm-ir-tx";
> +		pwms = <&pwm0 0 10000000>;
> +	};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
