From: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 2/2] dt-bindings: mfd: Add bindings for ZII RAVE devices
Date: Tue, 25 Jul 2017 11:42:49 -0700
Message-ID: <CAHQ1cqFQT_gWvgeU1tKxEnnGLd7x47YYSjkB0P1jt1R4B99swQ@mail.gmail.com>
References: <20170725150245.2192-1-andrew.smirnov@gmail.com> <20170725150245.2192-3-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170725150245.2192-3-andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chris Healy <cphealy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nikita Yushchenko <nikita.yoush-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Rest of the series ended up missing proper "To:" field. I'll resend
the series shortly. Please disregard this e-mail.

Sorry about the noise.
Andrey Smirnov

On Tue, Jul 25, 2017 at 8:02 AM, Andrey Smirnov
<andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Cc: cphealy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> Cc: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Cc: Nikita Yushchenko <nikita.yoush-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Acked-by: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Acked-for-MFD-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../devicetree/bindings/mfd/zii,rave-sp.txt        | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
>
> diff --git a/Documentation/devicetree/bindings/mfd/zii,rave-sp.txt b/Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
> new file mode 100644
> index 000000000000..088eff9ddb78
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
> @@ -0,0 +1,39 @@
> +Zodiac Inflight Innovations RAVE Supervisory Processor
> +
> +RAVE Supervisory Processor communicates with SoC over UART. It is
> +expected that its Device Tree node is specified as a child of a node
> +corresponding to UART controller used for communication.
> +
> +Required parent device properties:
> +
> + - compatible: Should be one of:
> +       - "zii,rave-sp-niu"
> +       - "zii,rave-sp-mezz"
> +       - "zii,rave-sp-esb"
> +       - "zii,rave-sp-rdu1"
> +       - "zii,rave-sp-rdu2"
> +
> + - current-speed: Should be set to baud rate SP device is using
> +
> +RAVE SP consists of the following sub-devices:
> +
> +Device                          Description
> +------                          -----------
> +rave-sp-wdt                    : Watchdog
> +rave-sp-nvmem                  : Interface to onborad EEPROM
> +rave-sp-backlight              : Display backlight
> +rave-sp-hwmon                  : Interface to onboard hardware sensors
> +rave-sp-leds                   : Interface to onboard LEDs
> +rave-sp-input                  : Interface to onboard power button
> +
> +Example of usage:
> +
> +       rdu {
> +               compatible = "zii,rave-sp-rdu2";
> +               current-speed = <1000000>;
> +
> +               watchdog {
> +                       compatible = "zii,rave-sp-watchdog";
> +               };
> +       };
> +
> --
> 2.13.3
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
