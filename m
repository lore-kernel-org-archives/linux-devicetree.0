From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/6] leds: add device tree bindings for syscon LEDs
Date: Fri, 25 Jul 2014 09:07:02 -0500
Message-ID: <CAL_Jsq+-G68wjBLDbELHRDFcGYRa65-Hx9WoD6HypXNjJKVDvA@mail.gmail.com>
References: <1406294628-16079-1-git-send-email-linus.walleij@linaro.org> <1406294628-16079-3-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406294628-16079-3-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 25, 2014 at 8:23 AM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> This adds the device tree bindings used by syscon-based LEDs.
>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  .../devicetree/bindings/leds/leds-syscon.txt       | 83 ++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-syscon.txt
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-syscon.txt b/Documentation/devicetree/bindings/leds/leds-syscon.txt
> new file mode 100644
> index 000000000000..460b9c3d1bd3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-syscon.txt
> @@ -0,0 +1,83 @@
> +Device Tree Bindings for Syscon LEDs
> +
> +Required properties:
> +- compatible : must be "syscon-leds".

Not really happy with the name... More below.

> +- regmap : a phandle to a syscon node containing a regmap
> +
> +Each LED is represented as a sub-node of the syscon-leds device. Each
> +node's name represents the name of the corresponding LED.
> +
> +LED sub-node properties:
> +- offset : register offset to the register controlling this LED
> +- mask : bit mask for the bit controlling this LED in the register
> +  typically 0x01, 0x02, 0x04 ...

This would be a single bit, right? What about inverted bits (i.e. 0 is
on or 1 is on)?

> +- label : (optional)

Please group all required and optional properties under those headings.

> +  see Documentation/devicetree/bindings/leds/common.txt
> +- linux,default-trigger : (optional)
> +  see Documentation/devicetree/bindings/leds/common.txt
> +- default-state: (optional) The initial state of the LED. Valid
> +  values are "on", "off", and "keep". If the LED is already on or off
> +  and the default-state property is set the to same value, then no
> +  glitch should be produced where the LED momentarily turns off (or
> +  on). The "keep" setting will keep the LED at whatever its current
> +  state is, without producing a glitch.  The default is off if this
> +  property is not present.
> +
> +Example:
> +
> +leds: leds@08 {
> +       compatible = "syscon-leds";
> +       regmap = <&syscon>;
> +
> +       led@bit0 {

Perhaps we can define a way to express unit address as offset+bit like
<offset>_<bit> or <offset>.<bit>.

I think we should get rid of the leds node and put this within the
syscon device node and each node here should have a compatible
property. I think the compatible should be something like
"register-bit-led" (perhaps someone has a better name) as syscon is
somewhat linux specific term and you could use this binding for any
LEDs that have a single register bit control.

Rob

> +               offset = <0x08>;
> +               mask = <0x01>;
> +               label = "versatile:0";
> +               linux,default-trigger = "heartbeat";
> +               default-state = "on";
> +       };
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
